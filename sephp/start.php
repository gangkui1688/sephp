<?php
if( !defined('APP_NAME') ) exit('APP_NAME is not defind!');

if(!defined('APP_DEBUG') || !APP_DEBUG)
{
    error_reporting(0);//设置为0会完全关闭错误报告
    ini_set('display_errors',0);
}
else
{
    //可以抛出任何非注意的错误报告 E_ERROR | E_PARSE | E_CORE_ERROR | E_NOTICE
    error_reporting (E_ALL);
    //该指令开启如果有错误报告才能输出
    ini_set('display_errors',1);
}
$_start_time = microtime(true);
session_start();
define('SE_START_TIME',$_start_time);
define('SEPHP',__DIR__.'/');
define('WWW_ROOT',__DIR__.'/../');
define('SE_VIEW',__DIR__.'/../view/');
define('SE_LIB',__DIR__.'/library/sephp/');
define('SE_RUNTIME',__DIR__.'/../runtime/');

include_once SEPHP . 'sys_function.php';
include_once SEPHP . 'autoloads.php';


class start
{
    public static $_instance = null;
    public static $_now_url = null;
    public static $_ct = '';
    public static $_ac = '';

    public function __construct($config = '')
    {
        $GLOBALS['config'] = include(WWW_ROOT . '/config/config.php');
        //自动注册类库
        spl_autoload_register(  "autoloads::autoload", true, true);
        //异常捕获
        set_exception_handler('_exception_handler');
        //找类库
        autoloads::register();
        //注册一个会在php中止时执行的函数
        register_shutdown_function('_shutdown_function',['_start_time'=>SE_START_TIME]);
        $this->_get_ap_ct_ac();
        self::$_now_url =  $_SERVER['REQUEST_URI'];
        //权限控制
        admin_user::check($config);

        req::init();
        define('NOW_URL',self::$_now_url);
        define('WWW_URL','http://'.$_SERVER['SERVER_NAME']);
        $this->run();
    }

    public function run()
    {
        $ctl_file = APP_PATH.'ctl/ctl_'.self::$_ct.'.php';

        if( file_exists( $ctl_file ) )
        {
            require $ctl_file;
        }
        else
        {
            exceptions::throw_debug("controler file[".$ctl_file."]is not exists!",debug_backtrace());
        }

        $class_name = 'ctl_'.self::$_ct;
        if(class_exists($class_name,false))
        {
            self::$_instance = new $class_name();
        }
        else
        {
            exceptions::throw_debug("class ".self::$_ct."() is not exists!",debug_backtrace(),'类不存在');
        }


        if( method_exists (self::$_instance , self::$_ac ) === true )
        {
            $acton_name = self::$_ac;
            self::$_instance->$acton_name();
        }
        else
        {
            exceptions::throw_debug("the action ctl_".self::$_ct."->".self::$_ac."() is not exists!",debug_backtrace(),'方法不存在');
        }

    }

    protected function _get_ap_ct_ac()
    {
        self::$_ct = empty($_GET['ct'])? 'index' :$_GET['ct'];
        self::$_ac = empty($_GET['ac'])? 'index' :$_GET['ac'];
        define('AC_NAME',self::$_ac);
        define('CT_NAME',self::$_ct);

    }
}