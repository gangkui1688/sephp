<?php
namespace sephp\core;
use sephp\sephp;


class db
{
    // Query types
    const SELECT =  1;
    const INSERT =  2;
    const UPDATE =  3;
    const DELETE =  4;

    public static $query_sql = [];

    public static function get_last_sql()
    {
        return array_pop(self::$query_sql);
    }

    /**
     * 数据库初始化，并取得数据库类实例
     * @access public
     * @param  mixed       $config 连接配置
     * @param  bool|string $name   连接标识 true 强制重新连接
     * @return Connection
     * @throws Exception
     */
    public static function connect($config = [], $name = false)
    {
        $path = PATH_LIB . 'sephp/db/';
        $files = glob($path . '*.php');
        foreach ($files as $file)
        {
            include_once $file;
        }
        if(function_exists('mysqli_connect'))
        {
            return db_mysqli::instance();
        }
        elseif (function_exists('mysql_connect'))
        {
            return db_mysql::instance();
        }
    }


    /**
     * 调用驱动类的方法
     * @access public
     * @param  string $method 方法名
     * @param  array  $params 参数
     * @return mixed
     */
    public static function __callStatic($method, $params)
    {
        return call_user_func_array([self::connect(), $method], $params);
    }





}