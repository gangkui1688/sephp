<?php
/**
 * 模板引擎实现类
 *
 * @author seatle<seatle@foxmail.com>
 * @version $Id$
 */
class view
{
    private static $_instance = null;

    // 自定义模版标签填充数据用
    public static $blocksdata = array();

    // 最终输出的数据
    public static $final_output;

    /**
     * Smarty 初始化
     * @return resource
     */
    public static function instance()
    {

        if (self::$_instance === null)
        {

            require_once SE_LIB . 'smarty3/Smarty.class.php';
            self::$_instance = new Smarty();
            self::$_instance->setTemplateDir(SE_VIEW . APP_NAME.'/');
            self::$_instance->setCompileDir(APP_PATH . '../runtime/compile/');
            self::$_instance->setCacheDir(APP_PATH . '../runtime/cache/');
            //self::$_instance->addPluginsDir(SE_LIB . 'smarty3/smarty_plugins');

            self::$_instance->setLeftDelimiter('<{');
            self::$_instance->setRightDelimiter('}>');
            self::$_instance->setCompileCheck(true);
            self::config();
        }
        return self::$_instance;
    }

    protected static function config ()
    {
        self::instance()->assign('_self_url', '?ct='.CT_NAME.'&ac='.AC_NAME);
        self::instance()->assign('_ct_name', CT_NAME);
        self::instance()->assign('_ac_name', AC_NAME);
        self::instance()->assign('_forms', req::$forms);
        self::instance()->assign('clear_cache', '?' . time());
    }

    public static function fetch($tpl = '')
    {
        $tpl = empty($tpl)? CT_NAME.'.'.AC_NAME : $tpl;
        return self::instance()->fetch($tpl.'.tpl');
    }

    public static function assign ($tpl_var, $value)
    {
        self::instance()->assign($tpl_var, $value);
    }

    public static function display($tpl = '')
    {
        $tpl = empty($tpl)? CT_NAME.'.'.AC_NAME : $tpl;
        self::instance()->display($tpl.'.tpl');
    }

}

/* vim: set expandtab: */

