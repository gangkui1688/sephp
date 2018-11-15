<?php
if (!defined('APP_NAME')) {
	exit('APP_NAME is not defind!');
}

if (!defined('APP_DEBUG') || !APP_DEBUG) {
	error_reporting(0);//设置为0会完全关闭错误报告
	ini_set('display_errors', 0);
} else {
	//可以抛出任何非注意的错误报告 E_ERROR | E_PARSE | E_CORE_ERROR | E_NOTICE
	error_reporting(E_ALL);
	//该指令开启如果有错误报告才能输出
	ini_set('display_errors', 1);
}
$_start_time = microtime(true);

define('SE_START_TIME', $_start_time);
define('PATH_SEPHP', __DIR__ .'/');
define('PATH_ROOT', __DIR__ .'/../');
define('PATH_VIEW', __DIR__ .'/../view/');
define('PATH_LIB', __DIR__ .'/library/');
define('PATH_RUNTIME', __DIR__ .'/../runtime/');
define('PATH_UPLOAD', __DIR__ .'/../upload/');

include_once PATH_SEPHP.'function.php';
include_once PATH_SEPHP.'autoloads.php';

class start {
	public static $_instance = null;
	public static $_now_url  = null;
	public static $_ct       = '';
	public static $_ac       = '';
	public static $_config   = [];

	public function __construct($_authority = []) {
		$GLOBALS['config']               = include PATH_ROOT.'/config/config.php';
		$GLOBALS['config']['_authority'] = $_authority;
		self::$_config                   = $GLOBALS['config'];

		self::$_now_url = $_SERVER['REQUEST_URI'];
		define('NOW_URL', self::$_now_url);

		//自动注册类库
		spl_autoload_register("autoloads::autoload", true, true);
		//异常捕获
		set_exception_handler('sys_debug::exception');
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

	public function run() {
		$ctl_file = APP_PATH.'ctl/ctl_'.self::$_ct.'.php';

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

	protected function _get_ap_ct_ac() {
		self::$_ct = empty($_GET['ct'])?'index':$_GET['ct'];
		self::$_ac = empty($_GET['ac'])?'index':$_GET['ac'];
		define('AC_NAME', self::$_ac);
		define('CT_NAME', self::$_ct);

		define('WWW_URL', 'http://'.$_SERVER['SERVER_NAME']);
	}

	protected function _static_page() {
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

}
