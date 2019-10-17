<?php
namespace common\model;

use sephp\sephp;
use sephp\core\db;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\config;

/**
 * model层基类，必须继承
 */
class pub_mod_model
{
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
    public static $_cache_use = false;

    /**
     * @var integer 缓存时间
     */
    public static $_cache_time = 3600;

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
     * insert数据验证方法
     * @param $data
     * @return bool
     */
    public static function _field_verify($data) {
        if (empty(static::$_rule_field))
        {
            return true;
        }

        if(empty($data) || !is_array($data))
        {
            return false;
        }

        $data = !is_array(reset($data)) ? [$data] : $data;

        foreach ($data as $key => $val)
        {
            $result = func::date_filter(static::$_rule_field, $val);
            if(!is_array($result))
            {
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

        if ($total)
        {
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
    public static function getdump($conds = [])
    {
        foreach (['where', 'fields', 'join'] as $f)
        {
            $$f = empty($conds[$f]) ? [] $conds[$f];
        }

        $field = empty($field) ? static::$_field : $field;

        $query  = db::select($field)->from(static::$_table);

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
     * @param array. 添加的数组
     * @param 表名
     * @return int
     */
    public static function insert(array $data, $table = '', $ignore = false)
    {
        if( empty($data) )
        {
            return false;
        }

        $extr  = []; //扩展属性

        //如果table为数组有可能带有其他参数
        if( is_array($table) )
        {
            $extr   = $table;
            $table  = isset($table['table']) ? $table['table'] : '';
            $ignore = isset($table['ignore']) ? $table['ignore'] : $ignore;
        }

        //判断是否为批量插入
        $mutipule = is_array(reset($data)) ? true : false;
        $table = empty($table) ? static::$table : $table;
        if( empty($table) ) return false;

        $query =  db::insert($table)->ignore($ignore);
        if( !empty($mutipule) ) //批量插入
        {
            $query->values($data)->columns(array_keys(current($data)));
        }
        else //单条插入
        {
            $query->set($data);
        }

        //批量更新（遇到重复主键更新，否则插入）
        if( !empty($extr['dups']) )
        {
            $query->dup($extr['dups']);
        }

        return $query->execute();
    }

    /**
     * @param array. 更新的数组
     * @param array 更新条件
     * @param 表名
     * @param update ignore
     * @return int
     */
    public static function update(array $data, array $where, $table = '', $ignore = false)
    {
        if( empty($data) || empty($where) ) return false;
        $table = empty($table) ? static::$table : $table;
        if( empty($table) ) return false;

        $query = db::update($table)
            ->set($data)
            ->ignore($ignore);

        $result = false;
        static::_complate_sql($query, $where, $join);

        return $query->execute();

    }

    /**
     * 获取总数
     * @param array $where
     * @param array $join
     * @return mixed
     */
    public static function count($where = [], $join = [])
    {
        $query = db::select('COUNT('.str_replace('#PB#', 'sp', static::$_table).'.*) AS total')
            ->from(static::$_table);

        static::_complate_sql($query, $where, $join);

        return $query->as_field()->execute();
    }

    private static function _complate_sql(&$query, $where = [], $join = [], $order = []) {
        if (!empty($where) || !empty($where['and']))
        {
            $where = empty($where)?$where['and']:$where;
            $query = $query->where($where);
        } elseif (!empty($where['or'])) {
            $query->or_where($where['or']);

        }

        if (!empty($join) && empty($join[0]))
        {
            $query = $query->join($join['table'], $join['type'])
                           ->on($join['where'][0], $join['where'][1], $join['where'][2]);
        } elseif (!empty($join) && is_array($join[0])) {
            foreach ($join as $j) {
                $query = $query->join($j['table'], $j['type'])
                               ->on($j['where'][0], $j['where'][1], $j['where'][2]);
            }
        }

        if (empty($order))
        {
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
