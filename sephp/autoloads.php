<?php
namespace sephp;

/**
 * 自动注册
 * @ClassName: autoloads
 * @Author: Gangkui
 * @Date: 2019-07-31 15:34:37
 */
class autoloads
{

    protected static $autoload_files = null;

    /**
     * 自动加载
     * @access public
     * @param  string $class 类名
     * @return bool
     */
    public static function autoload($class)
    {
        if(strpos('smarty',$class) !== false)
        {
            return true;
        }
        self::load_class($class);
    }



    /**
     * 注册函数
     * @access public
     * @param  callable $autoload 自动加载处理方法
     * @return void
     */
    public static function register_function()
    {
        // 注册自定义函数
        $func_file = PATH_APP . 'function.php';
        if(file_exists($func_file))
        {
            require_once $func_file;
        }
        return true;
    }



    protected static function load_class($name)
    {
        if(file_exists($name.'php'))
        {
            require self::$autoload_files;
            return true;
        }
        $prefix = substr($name,0,4);
        switch ($prefix)
        {
            case 'sys_':
                self::$autoload_files = PATH_LIB . 'sephp/' . $name.'.php';
                break;
            case 'lib_':
                self::$autoload_files = PATH_APP . '/lib/' . $name . '.php';
                break;
            case 'mod_':
                self::$autoload_files = PATH_APP . 'mod/' . $name . '.php';
                break;
            default:
                self::$autoload_files = PATH_LIB . $name . '.php';
                break;
        }

        if( file_exists( self::$autoload_files ) )
        {
            require self::$autoload_files;
        }
        else
        {
            return false;
        }


    }


}
