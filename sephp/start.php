<?php
if( !defined('APP_PATH') ) exit('APP_PATH is not defind!');

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

define('SEPHP',__DIR__.'/');
define('SE_VIEW',__DIR__.'/../');
define('SE_LIB',__DIR__.'/library/sephp/');
define('SE_RUNTIME',__DIR__.'/../runtime/');

include_once SEPHP.'function.php';
include_once SEPHP . 'autoloads.php';
include_once SEPHP . '../config/config.php';

class start
{
    public static $_instance = null;
    public static $_now_url = null;
    public static $_ct = '';
    public static $_ac = '';

    public function __construct($config = '')
    {
        //自动注册类库
        spl_autoload_register(  "autoloads::autoload", true, true);
        //异常捕获
        set_exception_handler('_exception_handler');

        autoloads::register();

        $this->_get_ap_ct_ac();
        req::init();
        self::$_now_url = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
        define('SE_URL',self::$_now_url);
        $this->run();


        log::write('--the opcode end--');
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
            exceptions::throw_debug("controler file ctl_".self::$_ct.".php is not exists!");
        }

        $class_name = 'ctl_'.self::$_ct;
        if(class_exists($class_name,false))
        {
            self::$_instance = new $class_name();
        }
        else
        {
            exceptions::throw_debug("class ".self::$_ct."() is not exists!");
        }


        if( method_exists (self::$_instance , self::$_ac ) === true )
        {
            $acton_name = self::$_ac;
            self::$_instance->$acton_name();
        }
        else
        {
            exceptions::throw_debug("the method of action ".self::$_ct."::".self::$_ac."() is not exists!");
        }

    }

    protected function _get_ap_ct_ac()
    {
        self::$_ct = empty($_GET['ct'])? 'index' :$_GET['ct'];
        self::$_ac = empty($_GET['ac'])? 'index' :$_GET['ac'];
        define('SE_AC',self::$_ac);
        define('SE_CT',self::$_ct);

    }
}