<?php
namespace common\model;

use sephp\sephp;
use sephp\core\db;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\cache;
use sephp\core\config;
use sephp\core\lib\pages;

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
     * 是否关闭从库
     * @var boolean
     */
    public static $enable_slave = false;

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
    public static function getlist($conds = [])
    {
        $data_filter = func::data_filter([
            'where'     => ['type' => 'text', 'default' => []],
            'field'     => ['type' => 'text', 'default' => []],
            'joins'     => ['type' => 'text', 'default' => []],
            'order_by'  => ['type' => 'text', 'default' => []],
            'group_by'  => ['type' => 'text', 'default' => []],
            'offset'    => ['type' => 'int', 'default' => 0],
            'limit'     => ['type' => 'int', 'default' => 20],
            'total'     => ['type' => 'text', 'default' => false],
        ], $conds);

        if(empty($data_filter['field']))
        {
            foreach (static::$_field as $f)
            {
                $data_filter['field'][] = static::$_table.'.'.$f;
            }
        }

        if ($data_filter['total'])
        {
            $total_num  = static::count($data_filter['where'], $data_filter['joins']);
            $pages = pages::instance($total_num, $data_filter['limit']);
        }

        if (static::$_cache_use)
        {
            $cache_key = serialize($data_filter) . __CLASS__;
            $data      = cache::get($cache_key);
            if (!empty($data))
            {
                return json_decode($data, true);
            }
        }

        $query = db::select($data_filter['field'])->from(static::$_table);

        self::_complate_sql($query, $data_filter['where'], $data_filter['joins'], $data_filter['order_by']);

        if($data_filter['total'])
        {
            $query->offset($pages['offset'])->limit($data_filter['limit']);
        }

        $data = $query->execute();

        /**
         *  自动格式化查询数据
         */
        if(!empty($data) && method_exists(new static() , 'data_format'))
        {
            $data = static::data_format($data);
        }

        $data = $data_filter['total'] ? ['data' => $data, 'pages' => $pages['show']] : $data;

        if (static::$_cache_use)
        {
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
        foreach (['where', 'fields', 'join', 'order_by'] as $f)
        {
            $$f = empty($conds[$f]) ? [] : $conds[$f];
        }

        $field = empty($field) ? static::$_field : $field;

        if(static::$_cache_use)
        {
            $cache_key = serialize($conds) . serialize($field) . __CLASS__ ;
            $data = cache::get($cache_key);
            if (!empty($data))
            {
                return unserialize($data);
            }
        }

        $query  = db::select($field)->from(static::$_table);

        static::_complate_sql($query, $where, $join, $order_by);

        $data = $query->as_row()->execute();

        if(!empty($data) && method_exists(new static() , 'data_format'))
        {
            $data = static::data_format($data);
        }

        if(!empty($data) && static::$_cache_use)
        {
            cache::set($cache_key, serialize($data), static::$_cache_time);
        }

        return $data;
    }

    /**
     * 获取某个字段等值
     * @param $where
     * @param $field
     * @param array $join
     * @return mixed
     */
    public static function getfiled($where, $field, $join = [])
    {
        if(static::$_cache_use)
        {
            $cache_key = serialize($where) . serialize($field) . serialize($join) . __CLASS__ ;
            $data = cache::get($cache_key);
            if (!empty($data))
            {
                return unserialize($data);
            }
        }

        $query = db::select($field)->from(static::$_table);

        static::_complate_sql($query, $where, $join);

        $data = $query->as_field()->execute();

        if(static::$_cache_use)
        {
            cache::set($cache_key, serialize($data), static::$_cache_time);
        }

        return $data;
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
        $table = empty($table) ? static::$_table : $table;
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

        if(empty($where) && !empty($data[static::$_pk]))
        {
            $where = [static::$_pk, '=', $data[static::$_pk]];
        }

        $table = empty($table) ? static::$_table : $table;
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
        $query = db::select('COUNT(*) AS total')
            ->from(static::$_table);

        static::_complate_sql($query, $where, $join);

        return $query->as_field()->execute();
    }

    private static function _complate_sql(&$query, $where = [], $join = [], $order = [])
    {
        if (!empty($where) || !empty($where['and']))
        {
            $where = empty($where) ? $where['and'] : $where;
            if(is_array(reset($where)))
            {
                $query = $query->where($where);
            }
            else
            {
                $query = $query->where($where[0], $where[1], $where[2]);
            }
        }

        if (!empty($where['or']))
        {
            $query->or_where($where['or']);

        }

        if (!empty($join) && empty($join[0]))
        {
            $query = $query->join($join['table'], $join['type'])
                           ->on($join['where'][0], $join['where'][1], $join['where'][2]);
        }
        elseif (!empty($join) && is_array($join[0]))
        {
            foreach ($join as $j) {
                $query = $query->join($j['table'], $j['type'])
                               ->on($j['where'][0], $j['where'][1], $j['where'][2]);
            }
        }

        if (empty($order) && !empty(static::$_pk))
        {
            $query->order_by(static::$_table.'.'.static::$_pk, 'desc');
        }
        elseif (is_string($order[0]))
        {
            $query->order_by($order[0], $order[1]);
        }
        elseif (is_array($order[0]))
        {
            foreach ($order as $o) {
                $query->order_by($o[0], $o[1]);
            }

        }
    }

    /**
     * 开启事物
     * @Author han
     * @param  boolean $enable_slave 是否允许从库
     * @return void
     */
    public static function db_start($enable_slave = false)
    {
        db::enable_slave($enable_slave);
        empty($enable_slave) && self::$enable_slave = true;

        return db::start();
    }

    /**
     * 结束事务
     * @Author han
     * @return void
     */
    public static function db_end()
    {
        if( self::$enable_slave )
        {
            db::enable_slave(true);
        }

        return db::end();
    }

    /**
     * 为了方便发送统计日志，封装一个commit的函数，在commit的时候自动发送
     * 所以模型内如果涉及发送进程结束后发送日志的，commit需要用这个，否则不会发送
     * @Author han
     * @return void
     */
    public static function db_commit()
    {

        return db::commit();
    }

    /**
     * 清空缓存中的统计数据
     * @Author han
     * @return [type] [description]
     */
    public static function db_rollback()
    {
        return db::rollback();
    }

}
