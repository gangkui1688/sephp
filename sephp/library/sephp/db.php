<?php

class db
{
    // Query types
    const SELECT =  1;
    const INSERT =  2;
    const UPDATE =  3;
    const DELETE =  4;

    public static $query_sql = [];
    protected static $db_config = [];
    public static $links = null;

    private static $operation = ['select','insert','update','delete','get_compiled_sql'];

    public static function _start_mysql($operation,$param = null)
    {
        return db_build::instance()->$operation($param);
    }

    public static function _init()
    {
        $db_config = $GLOBALS['config']['db'];
        // 创建连接
        if (empty(self::$links)) {
            try {
                self::$links = mysqli_connect($db_config['host'], $db_config['root'], $db_config['pass'], $db_config['dbname'], $db_config['port']);
                // 让int、float 返回正确的类型，而不是返回string
                mysqli_options(self::$links, MYSQLI_OPT_INT_AND_FLOAT_NATIVE, true);
                // 查询编码
                $charset = isset($db_config['charset'])? str_replace('-', '', strtolower($db_config['charset'])) : 'uft8';
                mysqli_query(self::$links, " SET character_set_connection=" . $charset . ", character_set_results=" . $charset . ", character_set_client=binary, sql_mode='' ");

            } catch (Exception $e) {
                exceptions::throw_dexbug(mysqli_error(self::$links),mysqli_sqlstate(self::$links));
            }
        }
        return self::$links;
    }


    public static function autocommit($mode = false)
    {
        self::$links = self::_init(true);
        return mysqli_autocommit(self::$links, $mode);
    }

    public static function commit()
    {
        return mysqli_commit(self::$links);
    }

    public static function rollback()
    {
        return mysqli_rollback(self::$links);
    }

    public static function get_error()
    {
        return mysqli_error(self::$links);
    }

    public static function get_last_sql()
    {
        return end(self::$query_sql);
    }

    public static function query($sql, $type = null)
    {
        return self::_start_mysql('query',$sql);
    }

    public static function select($select = '*')
    {
        return self::_start_mysql('select',$select);
    }

    public static function insert($table = null, array $columns = null)
    {
        return self::_start_mysql('insert',$table);
    }

    public static function update($table = null)
    {
        return self::_start_mysql('update',$table);
    }

    public static function delete($table = null)
    {
        return self::_start_mysql('delete',$table);
    }
}