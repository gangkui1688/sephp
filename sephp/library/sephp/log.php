<?php

/**
 * @method void log($msg) static 记录一般日志
 * @method void error($msg) static 记录错误日志
 * @method void info($msg) static 记录一般信息日志
 * @method void sql($msg) static 记录 SQL 查询日志
 * @method void notice($msg) static 记录提示日志
 * @method void alert($msg) static 记录报警日志
 */
class Log
{
    const LOG    = 'log';
    const ERROR  = 'error';
    const INFO   = 'info';
    const SQL    = 'sql';
    const NOTICE = 'notice';
    const ALERT  = 'alert';
    const DEBUG  = 'debug';

    /**
     * @var array 日志信息
     */
    protected static $log = [];

    /**
     * @var array 配置参数
     */
    protected static $config = [];

    /**
     * @var array 日志类型
     */
    protected static $type = ['log', 'error', 'info', 'sql', 'notice', 'alert', 'debug'];

    /**
     * @var log\driver\File|log\driver\Test|log\driver\Socket 日志写入驱动
     */
    protected static $driver;

    /**
     * @var string 当前日志授权 key
     */
    protected static $key;

    /**
     * 日志初始化
     * @access public
     * @param  array $config 配置参数
     * @return void
     */
    public static function init($config = [])
    {
        self::$config = $GLOBALS['config']['log'];
        $type  = isset(self::$config['type']) ? self::$config['type'] : 'file';
        include_once(SE_LIB.'log/'.$type.'.php');
        $class = strtolower($type);

        if (class_exists($class)) {
            self::$driver = new $class(self::$config);
        } else {
            exceptions::throw_debug("log日志的类型配置错误:".$type ,debug_backtrace());
        }
    }

    /**
     * 获取日志信息
     * @access public
     * @param  string $type 信息类型
     * @return array|string
     */
    public static function getLog($type = '')
    {
        return $type ? self::$log[$type] : self::$log;
    }

    /**
     * 记录调试信息
     * @access public
     * @param  mixed  $msg  调试信息
     * @param  string $type 信息类型
     * @return void
     */
    public static function record($msg, $type = 'log')
    {
        self::$log[$type][] = $msg;

        // 命令行下面日志写入改进
        IS_CLI && self::save();
    }

    /**
     * 清空日志信息
     * @access public
     * @return void
     */
    public static function clear()
    {
        self::$log = [];
    }

    /**
     * 设置当前日志记录的授权 key
     * @access public
     * @param  string $key 授权 key
     * @return void
     */
    public static function key($key)
    {
        self::$key = $key;
    }

    /**
     * 检查日志写入权限
     * @access public
     * @param  array $config 当前日志配置参数
     * @return bool
     */
    public static function check($config)
    {
        return !self::$key || empty($config['allow_key']) || in_array(self::$key, $config['allow_key']);
    }

    /**
     * 保存调试信息
     * @access public
     * @return bool
     */
    public static function save()
    {
        // 没有需要保存的记录则直接返回
        if (empty(self::$log)) {
            return true;
        }

        is_null(self::$driver) && self::init(Config::get('log'));

        // 检测日志写入权限
        if (!self::check(self::$config)) {
            return false;
        }

        if (empty(self::$config['level'])) {
            // 获取全部日志
            $log = self::$log;
            if (!App::$debug && isset($log['debug'])) {
                unset($log['debug']);
            }
        } else {
            // 记录允许级别
            $log = [];
            foreach (self::$config['level'] as $level) {
                if (isset(self::$log[$level])) {
                    $log[$level] = self::$log[$level];
                }
            }
        }

        if ($result = self::$driver->save($log)) {
            self::$log = [];
        }

        Hook::listen('log_write_done', $log);

        return $result;
    }

    /**
     * 实时写入日志信息 并支持行为
     * @access public
     * @param  mixed  $msg   调试信息
     * @param  string $type  信息类型
     * @param  bool   $force 是否强制写入
     * @return bool
     */
    public static function write($msg, $type = 'log')
    {
        $log = self::$log;

        // 封装日志信息
        $log[$type][] = $msg;

        // 监听 log_write
        //Hook::listen('log_write', $log);

        is_null(self::$driver) && self::init(Config::get('log'));

        // 写入日志
        if ($result = self::$driver->save($log)) {
            self::$log = [];
        }

        return $result;
    }

}
