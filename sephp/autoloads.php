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
     * 导入所需的类库 同 Java 的 Import 本函数有缓存功能
     * @access public
     * @param  string $class   类库命名空间字符串
     * @param  string $baseUrl 起始路径
     * @param  string $ext     导入的文件扩展名
     * @return bool
     */
    public static function import($class, $baseUrl = '', $ext = EXT)
    {
        static $_file = [];
        $key          = $class . $baseUrl;
        $class        = str_replace(['.', '#'], [DS, '.'], $class);

        if (isset($_file[$key])) {
            return true;
        }

        if (empty($baseUrl)) {
            list($name, $class) = explode(DS, $class, 2);

            if (isset(self::$prefixDirsPsr4[$name . '\\'])) {
                // 注册的命名空间
                $baseUrl = self::$prefixDirsPsr4[$name . '\\'];
            } elseif ('@' == $name) {
                // 加载当前模块应用类库
                $baseUrl = App::$modulePath;
            } elseif (is_dir(EXTEND_PATH . $name)) {
                $baseUrl = EXTEND_PATH . $name . DS;
            } else {
                // 加载其它模块的类库
                $baseUrl = APP_PATH . $name . DS;
            }
        } elseif (substr($baseUrl, -1) != DS) {
            $baseUrl .= DS;
        }

        // 如果类存在则导入类库文件
        if (is_array($baseUrl)) {
            foreach ($baseUrl as $path) {
                if (is_file($filename = $path . DS . $class . $ext)) {
                    break;
                }
            }
        } else {
            $filename = $baseUrl . $class . $ext;
        }

        if (!empty($filename) &&
            is_file($filename) &&
            (!IS_WIN || pathinfo($filename, PATHINFO_FILENAME) == pathinfo(realpath($filename), PATHINFO_FILENAME))
        ) {
            __include_file($filename);
            $_file[$key] = true;

            return true;
        }

        return false;
    }

    /**
     * 实例化（分层）模型
     * @access public
     * @param  string $name         Model名称
     * @param  string $layer        业务层名称
     * @param  bool   $appendSuffix 是否添加类名后缀
     * @param  string $common       公共模块名
     * @return object
     * @throws ClassNotFoundException
     */
    public static function model($name = '')
    {
        $file = APP_PATH.'mod/'.$name.'.php';
        if(file_exists($file))
        {
            require $file;
        }
        else{
            exceptions::throw_debug("class {$name} is not exists!");
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
                if( file_exists( self::$autoloadFiles ) )
                {
                     require self::$autoloadFiles;
                }
                break;
            case 'mod_':
                self::model($name);
                break;
            default:
                self::$autoloadFiles = SEPHP_LIB.$name.'.php';
                //p(self::$autoloadFiles,file_exists(self::$autoloadFiles));
                if( file_exists( self::$autoloadFiles ) )
                {
                    require self::$autoloadFiles;
                }
                else
                {
                    exceptions::throw_debug("The file {$name} is not exists!");
                }
                break;
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

// 作用范围隔离

/**
 * include
 * @param  string $file 文件路径
 * @return mixed
 */
function __include_file($file)
{
    return include $file;
}

/**
 * require
 * @param  string $file 文件路径
 * @return mixed
 */
function __require_file($file)
{
    return require $file;
}
