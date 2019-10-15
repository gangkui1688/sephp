<?php
namespace sephp\core;
use sephp\sephp;
use sephp\func;
use sephp\core\config;
use sephp\core\log;

/**
 * 语言类
 *
 * @version $Id$
 *
 */
class lang
{
    /**
     * List of translations
     *
     * @var array
     */
    public static $language  = array();

    public static $config = [];

    /**
     * List of loaded language files
     *
     * @var array
     */
    public static $is_loaded = array();

    public static function _init($config = [])
    {
        self::$config = empty($config) ? config::get('language') : $config;
    }

    /**
     * Load a language file
     *
     * @param   mixed   $langfile   Language file name
     * @param   string  $idiom      Language name (english, etc.)
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2017-12-07 17:17
     */
    public static function load($langfile, $idiom = '')
    {
        if (is_array($langfile))
        {
            foreach ($langfile as $value)
            {
                self::load($value, $idiom);
            }

            return;
        }

        $idiom = empty($idiom) ? self::$config['type'] : $idiom;

        $langfile = str_replace('.ini', '', $langfile);
        $langfile .= '.ini';

        $idiom = empty($idiom) ? self::$config['type'] : $idiom;

        if(empty($idiom))
        {
            throw new \Exception('The language type has not definition !');
        }
        $baselang = $commonlang = $corelang = [];

        foreach (['config/lang/', '../common/config/lang/', '../config/lang/'] as $pf)
        {
            $basepath = PATH_APP.$pf.$idiom.'/'.$langfile;
            if (file_exists($basepath))
            {
                $lang = parse_ini_file($basepath);
            }
        }
        // Load the base file, so any others found can override it


        //load the common lang file
        $commonpath = PATH_ROOT . 'common/config/lang/'.$idiom.'/'.$langfile;
        if (file_exists($basepath))
        {
            $commonpath = PATH_CONFIG.'/lang/'.$idiom.'/'.$langfile;
            $commonlang = parse_ini_file($commonpath);
        }

        //load the core lang file
        $basepath = PATH_SEPHP . 'config/lang/'.$idiom.'/'.$langfile;
        if (file_exists($basepath))
        {
            $corepath = PATH_CONFIG.'/lang/'.$idiom.'/'.$langfile;
            $corelang = parse_ini_file($corepath);
        }




        if (file_exists($basepath))
        {
            //include($basepath);
            $lang = parse_ini_file($basepath);

            self::$is_loaded[$langfile] = $idiom;
            self::$language = array_merge(self::$language, $lang);
            self::$language = array_change_key_case(self::$language);

            return true;
        }

        return false;
    }

    public static function set($key, $value)
    {
        if ( empty($key) || empty($value) )
        {
            return false;
        }

        self::$language[$key] = $value;
        self::init();
    }

    /**
     * Language get
     *
     * Fetches a single line of text from the language array
     *
     * @param   string  $line       Language line key
     * @param   bool    $log_errors Whether to log an error message if the line is not found
     * @return  string  Translation
     */
    public static function get($key, $defaultvalue = null, $replace = array(), $log_errors = true)
    {
        $value = isset(self::$language[$key]) ? self::$language[$key] : null;

        // 模版中找不到变量定义
        if ( $value === null )
        {
            if ( $defaultvalue === null && $log_errors === true )
            {
                throw new Exception("Could not find the language line {$key}", E_USER_WARNING);
            }
            else
            {
                $value = $defaultvalue;
            }
        }

        if ( $replace )
        {
            $value = vsprintf($value, $replace);
        }
        return $value;
    }

    /**
     * 替换数据库中存在的语言模版
     *
     * @param mixed $array
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2017-12-07 17:17
     */
    public static function tpl_change($str)
    {
        if (empty($str))
        {
            return $str;
        }

        if ( strpos($str, '{{lang.') !== false )
        {
            if ( preg_match_all('#\{\{lang\.(.*?)\}\}#', $str, $out) )
            {
                $array = array();
                $count = count($out[0]);
                for ($i = 0; $i < $count; $i++)
                {
                    $array[] = array(
                        'old_str' => $out[0][$i],
                        'key' => $out[1][$i],
                    );
                }
                foreach ($array as $arr)
                {
                    $old_str = $arr['old_str'];
                    $key = $arr['key'];

                    $new_str = lang::get($key, null, false);
                    if ( !empty($new_str) )
                    {
                        $str = str_replace($old_str, $new_str, $str);
                    }
                }
                //var_dump($str);
                //exit;
            }
        }
        return $str;
    }
}

/* vim: set expandtab: */
