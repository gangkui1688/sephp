<?php
if( !defined('APP_PATH') ) exit('APP_PATH is not defind!');

define('SEPHP',__DIR__.'/');
define('SEPHP_LIB',__DIR__.'/library/sephp/');
define('SE_RUNTIME',__DIR__.'/../runtime/');

include_once SEPHP.'function.php';
include_once SEPHP . 'autoloads.php';
include_once SEPHP . '../config/config.php';

class start
{
    public static $instance = null;
    public static $now_url = null;
    public static $ct = '';
    public static $ac = '';

    public function __construct($config = '')
    {
        //自动注册类库
        spl_autoload_register(  "autoloads::autoload", true, true);
        //异常捕获
        set_exception_handler('_exception_handler');

        autoloads::register();

        self::$now_url = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
        $this->_get_ap_ct_ac();
        $this->run();


        log::write('--the opcode end--');
    }

    public function run()
    {
        $ctl_file = APP_PATH.'ctl/ctl_'.self::$ct.'.php';

        if( file_exists( $ctl_file ) )
        {
            require $ctl_file;
        }
        else
        {
            exceptions::throw_debug("controler file ctl_".self::$ct.".php is not exists!");
        }

        $class_name = 'ctl_'.self::$ct;
        if(class_exists($class_name,false))
        {
            self::$instance = new $class_name();
        }
        else
        {
            exceptions::throw_debug("class ".self::$ct."() is not exists!");
        }


        if( method_exists (self::$instance , self::$ac ) === true )
        {
            $acton_name = self::$ac;
            self::$instance->$acton_name();
        }
        else
        {
            exceptions::throw_debug("the method of action ".self::$ct."::".self::$ac."() is not exists!");
        }

    }

    protected function _get_ap_ct_ac()
    {
        self::$ct = empty($_GET['ct'])? 'index' :$_GET['ct'];
        self::$ac = empty($_GET['ac'])? 'index' :$_GET['ac'];
        define('AC_NAME',self::$ac);
        define('CT_NAME',self::$ct);
        define('URL',self::$now_url);

    }
}