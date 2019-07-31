<?php
namespace sephp;
use \sephp\core\session;
use \sephp\lib\power;
use \sephp\sys\sys_debug;

class start {

	public static $_instance = null;
	public static $_now_url  = null;
	public static $_ct       = '';
	public static $_ac       = '';
	public static $_config   = [];

    /**
     * 初始化框架
     * start constructor.
     * @param array $_authority
     */
	public function __construct($_authority = []){

        $this->check_environment();

        $GLOBALS['config']               = include PATH_ROOT.'/config/config.php';
		$GLOBALS['config']['_authority'] = $_authority;
		self::$_config                   = $GLOBALS['config'];

		self::$_now_url = $_SERVER['REQUEST_URI'];

		//自动注册类库
		//spl_autoload_register("autoloads::autoload", true, true);

		//异常捕获
		//set_exception_handler('\sephp\sys\sys_debug::exception');
		//引入所有自定义函数
		autoloads::register_function();

		//初始化session
		session::start();
		//注册一个会在php中止时执行的函数
		register_shutdown_function('_shutdown_function', ['_start_time' => SE_START_TIME]);
		//路由解析
		empty(self::$_config['route']['url_route_on'])?null:sys_route::instance();

		$this->_get_ap_ct_ac();
		//页面静态缓存
		empty($GLOBALS['config']['web']['static_page'])?'':$this->_static_page();
		//p($_REQUEST,$_GET);
		//GET.POST.COOKIE 参数过滤
		req::init();
		//权限控制
		sys_power::instance()->check_in();
		//执行方法
		$this->run();


	}

    /**
     * 执行控制器文件代码
     */
	public function run() {

		$ctl_file = PATH_APP.'ctl/ctl_'.self::$_ct.'.php';

		if (file_exists($ctl_file)) {
			require $ctl_file;
		} else {
			throw new Exception("controler file[".$ctl_file."]is not exists!", 100);
		}

		$class_name = 'ctl_'.self::$_ct;

		if (class_exists($class_name, false)) {
			self::$_instance = new $class_name();
		} else {
			throw new Exception("class ".self::$_ct."() is not exists!", 100);
		}

		if (method_exists(self::$_instance, self::$_ac) === true) {
			$acton_name = self::$_ac;
			self::$_instance->$acton_name();
		} else {
			throw new Exception("the action ctl_".self::$_ct."->".self::$_ac."() is not exists!", 100);
		}

	}

    /**
     * 解析url地址
     */
	protected function _get_ap_ct_ac()
    {
		self::$_ct = empty($_GET['ct'])?'index':$_GET['ct'];
		self::$_ac = empty($_GET['ac'])?'index':$_GET['ac'];
		define('AC_NAME', self::$_ac);
		define('CT_NAME', self::$_ct);

		define('WWW_URL', 'http://'.$_SERVER['SERVER_NAME']);
	}

    /**
     * 缓存静态页
     */
	protected function _static_page()
    {
		if (in_array(APP_NAME, $GLOBALS['config']['web']['static_page'])) {
			$name = null;
			foreach ($_REQUEST as $k => $v) {
				$name .= $k.'-'.$v.'_';
			}
			$html_file_name = PATH_RUNTIME.'cache/html/'.APP_NAME.'/'.rtrim($name, '_').'.html';
			if (file_exists($html_file_name)) {
				$html = file_get_contents($html_file_name);
				exit($html);
			}
		}
	}

    /**
     * 检查框架执行环境
     */
	protected function check_environment()
    {
        if (!defined('APP_NAME') || !defined('PATH_APP')) {
            exit('APP_NAME or PATH_APP is not defind!');
        }

        //代码开始执行时间
        define('SE_START_TIME', microtime(true));

        define('PATH_SE', __DIR__ .'/');
        define('PATH_ROOT', __DIR__ .'/../');
        define('PATH_LIB', __DIR__ .'/library/');
        define('PATH_RUNTIME', PATH_ROOT.'runtime/');
        define('PATH_UPLOAD', PATH_ROOT.'upload/');
        define('PATH_VIEW', PATH_APP.'view/');

        define('URL_ROOT', 'http://'.$_SERVER['HTTP_HOST'].'/'.APP_NAME);

        if (!defined('APP_DEBUG') || !APP_DEBUG) {
            //禁用错误报告
            error_reporting(0);
            ini_set('display_errors', 0);
        } else {
            //可以抛出任何非注意的错误报告 E_ERROR | E_PARSE | E_CORE_ERROR | E_NOTICE
            error_reporting(E_ALL);
            //该指令开启如果有错误报告才能输出
            ini_set('display_errors', 1);
        }
    }

}
