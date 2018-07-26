<?php
class autoloads
{
    /**
     * @var array 实例数组
     */
    protected static $instance = [];

    /**
     * @var array 自动加载的文件
     */
    private static $autoloadFiles = [];

    /**
     * 自动加载
     * @access public
     * @param  string $class 类名
     * @return bool
     */
    public static function autoload($class)
    {
        self::getModuleAndClass($class);
    }



    /**
     * 注册 classmap
     * @access public
     * @param  string|array $class 类名
     * @param  string       $map   映射
     * @return void
     */
    public static function addClassMap($class, $map = '')
    {
        if (is_array($class)) {
            self::$map = array_merge(self::$map, $class);
        } else {
            self::$map[$class] = $map;
        }
    }


    /**
     * 注册自动加载机制
     * @access public
     * @param  callable $autoload 自动加载处理方法
     * @return void
     */
    public static function register()
    {
        // 注册自定义函数
        $func_file = APP_PATH.'function.php';
        if(file_exists($func_file))
        {
            require $func_file;
        }


    }

    /**
     * 注册 composer 自动加载
     * @access private
     * @return void
     */
    private static function registerComposerLoader()
    {
        if (is_file(VENDOR_PATH . 'composer/autoload_namespaces.php')) {
            $map = require VENDOR_PATH . 'composer/autoload_namespaces.php';
            foreach ($map as $namespace => $path) {
                self::addPsr0($namespace, $path);
            }
        }

        if (is_file(VENDOR_PATH . 'composer/autoload_psr4.php')) {
            $map = require VENDOR_PATH . 'composer/autoload_psr4.php';
            foreach ($map as $namespace => $path) {
                self::addPsr4($namespace, $path);
            }
        }

        if (is_file(VENDOR_PATH . 'composer/autoload_classmap.php')) {
            $classMap = require VENDOR_PATH . 'composer/autoload_classmap.php';
            if ($classMap) {
                self::addClassMap($classMap);
            }

        }

        if (is_file(VENDOR_PATH . 'composer/autoload_files.php')) {
            $includeFiles = require VENDOR_PATH . 'composer/autoload_files.php';
            foreach ($includeFiles as $fileIdentifier => $file) {
                if (empty(self::$autoloadFiles[$fileIdentifier])) {
                    __require_file($file);
                    self::$autoloadFiles[$fileIdentifier] = true;
                }
            }
        }
    }


    /**
     * 实例化（分层）控制器 格式：[模块名/]控制器名
     * @access public
     * @param  string $name         资源地址
     * @param  string $layer        控制层名称
     * @param  bool   $appendSuffix 是否添加类名后缀
     * @param  string $empty        空控制器名称
     * @return object
     * @throws ClassNotFoundException
     */
    public static function controller($name, $layer = 'controller', $appendSuffix = false, $empty = '')
    {
        list($module, $class) = self::getModuleAndClass($name, $layer, $appendSuffix);

        if (class_exists($class)) {
            return App::invokeClass($class);
        }

        if ($empty) {
            $emptyClass = self::parseClass($module, $layer, $empty, $appendSuffix);

            if (class_exists($emptyClass)) {
                return new $emptyClass(Request::instance());
            }
        }

        throw new ClassNotFoundException('class not exists:' . $class, $class);
    }

    /**
     * 实例化验证类 格式：[模块名/]验证器名
     * @access public
     * @param  string $name         资源地址
     * @param  string $layer        验证层名称
     * @param  bool   $appendSuffix 是否添加类名后缀
     * @param  string $common       公共模块名
     * @return object|false
     * @throws ClassNotFoundException
     */
    public static function validate($name = '', $layer = 'validate', $appendSuffix = false, $common = 'common')
    {
        $name = $name ?: Config::get('default_validate');

        if (empty($name)) {
            return new Validate;
        }

        $uid = $name . $layer;
        if (isset(self::$instance[$uid])) {
            return self::$instance[$uid];
        }

        list($module, $class) = self::getModuleAndClass($name, $layer, $appendSuffix);

        if (class_exists($class)) {
            $validate = new $class;
        } else {
            $class = str_replace('\\' . $module . '\\', '\\' . $common . '\\', $class);

            if (class_exists($class)) {
                $validate = new $class;
            } else {
                throw new ClassNotFoundException('class not exists:' . $class, $class);
            }
        }

        return self::$instance[$uid] = $validate;
    }

    /**
     * 解析模块和类名
     * @access protected
     * @param  string $name         资源地址
     * @param  string $layer        验证层名称
     * @param  bool   $appendSuffix 是否添加类名后缀
     * @return array
     */
    protected static function getModuleAndClass($name)
    {
        $prefix = substr($name,0,4);
        switch ($prefix)
        {
            case 'lib_':
                self::$autoloadFiles = APP_PATH.'/lib/'.$name.'.php';
                break;
            case 'mod_':
                self::$autoloadFiles = APP_PATH.'mod/'.$name.'.php';
                break;
            default:
                self::$autoloadFiles = SE_LIB.$name.'.php';
                break;
        }

        if( file_exists( self::$autoloadFiles ) )
        {
            require self::$autoloadFiles;
        }
        else
        {
            require $name.'.php';
        }


    }

    /**
     * 数据库初始化 并取得数据库类实例
     * @access public
     * @param  mixed       $config 数据库配置
     * @param  bool|string $name   连接标识 true 强制重新连接
     * @return \sephp\db\Connection
     */
    public static function db($config = [], $name = false)
    {
        return Db::connect($config, $name);
    }

    /**
     * 远程调用模块的操作方法 参数格式 [模块/控制器/]操作
     * @access public
     * @param  string       $url          调用地址
     * @param  string|array $vars         调用参数 支持字符串和数组
     * @param  string       $layer        要调用的控制层名称
     * @param  bool         $appendSuffix 是否添加类名后缀
     * @return mixed
     */
    public static function action($url, $vars = [], $layer = 'controller', $appendSuffix = false)
    {
        $info   = pathinfo($url);
        $action = $info['basename'];
        $module = '.' != $info['dirname'] ? $info['dirname'] : Request::instance()->controller();
        $class  = self::controller($module, $layer, $appendSuffix);

        if ($class) {
            if (is_scalar($vars)) {
                if (strpos($vars, '=')) {
                    parse_str($vars, $vars);
                } else {
                    $vars = [$vars];
                }
            }

            return App::invokeMethod([$class, $action . Config::get('action_suffix')], $vars);
        }

        return false;
    }



    /**
     * 初始化类的实例
     * @access public
     * @return void
     */
    public static function clearInstance()
    {
        self::$instance = [];
    }
}
