<?php
namespace sephp;

use sephp\autoloads;
use sephp\core\config;
use sephp\core\session;
use sephp\lib\power;
use sephp\core\error;
use sephp\core\log;
use sephp\core\req;
use sephp\core\route;

class sephp
{

    /**
     * 当前对象
     * @var null
     */
	public static $_instance = null;

    /**
     * 当前rul地址
     * @var null
     */
	public static $_now_url  = null;

    /**
     * 当前控制器名称
     * @var string
     */
	public static $_ct       = 'index';

    /**
     * 当前控制器方法名称
     * @var string
     */
	public static $_ac       = 'index';

    /**
     * 是否是ajax 请求
     * @var bool
     */
	public static $is_ajax   = false;

    /**
     * 是否是命令行模式
     * @var bool
     */
	public static $is_cli =  false;

    /**
     * 当前读取的配置
     * @var array|mixed
     */
	public static $_config   = [];


    /**
     * 初始化框架
     * start constructor.
     * @param array $_authority
     */
	public function __construct($_authority = [])
    {
        sephp::$_config['_authority'] = $_authority;

        $this->check_environment();

        //自动注册类库
        spl_autoload_register("sephp\autoloads::autoload", true, true);

        config::get(null, 'file');

		self::$_now_url = $_SERVER['REQUEST_URI'];

		//注册一个会在php中止时执行的函数
        register_shutdown_function(['sephp\core\error', 'shutdown_handler']);
        //自定义错误处理
        set_error_handler(['sephp\core\error', 'error_handler'], E_ALL);
        //异常捕获
        set_exception_handler(['sephp\core\error', 'exception_handler']);

        //设置一个结束执行函数，执行写入日志操作
        func::set_shutdown_func('sephp\core\log', 'save');

        //引入所有自定义函数
		autoloads::register_function();

		//初始化session
		session::start();

		$this->_get_ap_ct_ac();

		//页面静态缓存
		empty(sephp::$_config['web']['static_page']) ? :$this->_static_page();


		//p($_REQUEST,$_GET);
		//GET.POST.COOKIE 参数过滤
		req::init();

		//权限控制
		power::instance()->check_in();

		//执行方法
		$this->run();


	}

    /**
     * 执行控制器文件代码
     */
	public function run() {

		$ctl_file = PATH_APP.'ctl/ctl_'.self::$_ct.'.php';

		if (file_exists($ctl_file)) {
			require_once $ctl_file;
		} else {
			throw new \Exception("controler file[".$ctl_file."]is not exists!", 100);
		}

		$class_name = '\\'.APP_NAME.'\ctl\ctl_'.self::$_ct;
        if (class_exists($class_name, false)) {
			self::$_instance = new $class_name();
		} else {
			throw new \Exception("class ".self::$_ct."() is not exists!", 100);
		}

		if (method_exists(self::$_instance, self::$_ac) === true) {
			$acton_name = self::$_ac;
			self::$_instance->$acton_name();
		} else {
			throw new \Exception("The class [ctl_".self::$_ct .'] has not found this method ['.self::$_ac."()]", 100);
		}

	}

    /**
     * 解析url地址
     */
	protected function _get_ap_ct_ac()
    {
        //路由解析
        empty(self::$_config['route']['url_route_on']) ? : route::instance();

		self::$_ct = empty($_GET['ct'])?'index':$_GET['ct'];
		self::$_ac = empty($_GET['ac'])?'index':$_GET['ac'];

		define('ACTION_NAME', self::$_ac);
		define('CONTROLLER_NAME', self::$_ct);

        self::$is_ajax = func::is_ajax();
        self::$is_cli = func::is_cli();

	}

    /**
     * 缓存静态页
     */
	protected function _static_page()
    {
		if (in_array(APP_NAME, sephp::$_config['web']['static_page'])) {
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
        if (!defined('APP_NAME') || !defined('PATH_APP'))
        {
            exit('APP_NAME or PATH_APP is not defind!');
        }

        //定义常量
        $this->define();

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

        require_once PATH_SEPHP . 'autoloads.php';
        require_once PATH_SEPHP . 'function.php';
    }


    /**
     * 定义常量
     */
    protected function define()
    {
        //网站URL地址
        define('URL_ROOT', 'http://'.$_SERVER['HTTP_HOST']);
        //项目URL地址
        define('URL_APP', 'http://'.$_SERVER['HTTP_HOST'].'/'.APP_NAME);

        //代码开始执行时间
        define('SE_START_TIME', microtime(true));
        define('PATH_SEPHP', __DIR__ .'/');        //框架目录
        define('PATH_ROOT', __DIR__ .'/../');        //网站根目录
        define('PATH_LIB', __DIR__ .'/core/library/');
        define('PATH_RUNTIME', PATH_ROOT.'runtime/');
        define('PATH_UPLOAD', PATH_ROOT.'upload/');
        define('PATH_VIEW', PATH_APP.'view/');
    }

}
