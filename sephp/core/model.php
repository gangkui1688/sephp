<?php
namespace sephp\core;
use sephp\sephp;
use sephp\core\db;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\config;



class model {
	/**
	 * @var null 表名
	 */
	public static $_table = null;

	/**
	 * @var null 主键
	 */
	public static $_pk = null;

	/**
	 * @var array 数据表的字段
	 */
	public static $_field = [];

	/**
	 * @var bool 是否使用缓存
	 */
	public static $_use_cache = false;
	/**
	 * @var null 错误信息
	 */
	public static $_error_msg = null;

	/**
	 * @var array 字段验证规则
	 */
	public static $_rule_field = [];

    /**
     * @var bool 是否操作主库
     */
	public static $_is_master = false;

	/**
	 * 数据验证方法
	 * @param $data
	 * @return bool
	 */
	public static function _field_verify($data) {
		if (empty(static::$_rule_field)) {
			return true;
		}

		foreach ($data as $key => $val) {
			if (empty(static::$_rule_field[$key])) {
				continue;
			}

			if (!call_user_func(static::$_rule_field[$key]['rule'], $val)) {
				static::$_error_msg = static::$_rule_field[$key]['error_msg'];
				return false;
			}
		}

		return true;
	}

    /**
     * @param array $conds
     * [
     *      where =>
     *      field =>
     *      join  =>
     *      order =>
     *      group =>
     *      offset =>
     *      limit =>
     *      total =>
     * ]
     * @return array|mixed
     */
	public static function getlist($conds = []) {

	    foreach (['where', 'field', 'join' , 'order', 'group', 'offset', 'limit', 'total'] as $key)
        {
            $$key = empty($conds[$key]) ? [] : $conds[$key];

            if($key == 'field' && empty($$key))
            {
                foreach (static::$_field as $f)
                {
                    $field[] = static::$_table.'.'.$f;
                }
            }
        }

		if ($total) {
			$total  = static::count($where, $join);
			$pages  = cls_page::make($total, req::item('page_size', 15), '', '');
			$offset = $pages['offset'];
			$limit  = $pages['page_size'];
		}

		if (static::$_use_cache) {
			$cache_key = md5(serialize($where).serialize($fields).serialize($order).serialize($join).$offset.$limit.$total);
			$data      = cache::get($cache_key);
			if (!empty($data)) {
				return json_decode($data);
			}
		}

		$query = db::select($fields)->from(static::$_table);

		self::_complate_sql($query, $where, $join, $order);

		$data = $query->offset($offset)->limit($limit)->execute();

		$data = $total?['data' => $data, 'pages' => $pages['show']]:$data;

		if (static::$_use_cache) {
			cache::set($cache_key, json_encode($data, JSON_UNESCAPED_UNICODE));
		}

		return $data;
	}

	/**
	 * 获取单挑数据
	 * @param $where
	 * @param array $field
	 * @param array $join
	 * @return mixed
	 */
	public static function getdump($where, $field = [], $join = []) {
		$fields = empty($field)?static::$_field:$field;
		$query  = db::select($fields)->from(static::$_table);
		static::_complate_sql($query, $where, $join);
		return $query->as_row()->execute();
	}

	/**
	 * 获取某个字段等值
	 * @param $where
	 * @param $field
	 * @param array $join
	 * @return mixed
	 */
	public static function getfiled($where, $field, $join = []) {
		$query = db::select($field)->from(static::$_table);

		static::_complate_sql($query, $where, $join);

		return $query->as_field()->execute();
	}



    /**
     * 数据保存
     * @param $data
     * @param array $where
     * @return bool
     */
    public static function inset($data, $where = []) {



        $query = db::insert(static::$_table)->set($data);

        static::_complate_sql($query, $where);

        list($id, $rows) = $query->execute(static::$_is_master);

        return $id;
    }

    /**
     * 数据保存
     * @param $data
     * @param array $where
     * @return bool
     */
    public static function update($data, $where = [])
    {
        //编辑
        if (in_array('update_time', static::$_field)) {
            $data['update_time'] = time();
        }
        if (in_array('update_user', static::$_field)) {
            $data['update_user'] = kali::$auth->uid;
        }

        $query = db::update(static::$_table)->set($data)->where(static::$_pk, $data[static::$_pk]);

        static::_complate_sql($query, $where);

        return $query->execute();

    }


    /**
     * 数据保存
     * @param $data
     * @param array $where
     * @return bool
     */
    public static function save($data, $where = []) {
        if (empty($data[static::$_pk])) {
            //新增
            if (in_array('create_time', static::$_field)) {
                $data['create_time'] = time();
            }
            if (in_array('create_user', static::$_field)) {
                $data['create_user'] = kali::$auth->uid;
            }
            $query = db::insert(static::$_table)->set($data);

            static::_complate_sql($query, $where);
            list($id, $rows) = $query->execute();

            return $id;
        } elseif ($data[static::$_pk] > 0) {
            //编辑
            if (in_array('update_time', static::$_field)) {
                $data['update_time'] = time();
            }
            if (in_array('update_user', static::$_field)) {
                $data['update_user'] = kali::$auth->uid;
            }

            $query = db::update(static::$_table)->set($data)->where(static::$_pk, $data[static::$_pk]);
            static::_complate_sql($query, $where);
            if ($query->execute() === false) {
                return false;
            }
            return true;
        }
    }

	/**
	 * 获取总数
	 * @param array $where
	 * @param array $join
	 * @return mixed
	 */
	public static function count($where = [], $join = []) {
		$query = db::select('COUNT('.str_replace('#PB#', 'sp', static::$_table).'.'.static::$_pk.') AS total')
			->from(static::$_table);

		static::_complate_sql($query, $where, $join);

		return $query->as_field()->execute();
	}

	private static function _complate_sql(&$query, $where = [], $join = [], $order = []) {
		if (!empty($where) || !empty($where['and'])) {
			$where = empty($where)?$where['and']:$where;
			$query = $query->where($where);
		} elseif (!empty($where['or'])) {
			$query->or_where($where['or']);

		}

		if (!empty($join) && empty($join[0])) {
			$query = $query->join($join['table'], $join['type'])
			               ->on($join['where'][0], $join['where'][1], $join['where'][2]);
		} elseif (!empty($join) && is_array($join[0])) {
			foreach ($join as $j) {
				$query = $query->join($j['table'], $j['type'])
				               ->on($j['where'][0], $j['where'][1], $j['where'][2]);
			}
		}

		if (empty($order)) {
			$query->order_by(static::$_table.'.'.static::$_pk, 'desc');
		} elseif (is_string($order[0])) {
			$query->order_by($order[0], $order[1]);
		} elseif (is_array($order[0])) {
			foreach ($order as $o) {
				$query->order_by($o[0], $o[1]);
			}

		}
	}

}