<?php

/**
 * 后台用户
 * Class admin_user
 */
class admin_user
{
    /**
     * @var array 登陆用户信息
     */
    public static $info = [];

    /**
     * @var int 登陆用户ID
     */
    public static $id = 0;

    /**
     *  初始化用户数据
     */
    public static function init($config = [])
    {
        self::$info = session::get('admin_info');
        if(empty(self::$info))
        {
            show_msg::error('您还没有登陆',$config['login_url']);
        }
        self::$id = self::$info['admin_id'];
    }

    public static function set()
    {

    }

    //登陆检测
    public static function check($config = [])
    {
        if(!in_array(CT_NAME,$config['not_login']) && isset($config['need_login']) && $config['need_login'] === true)
        {
            self::init($config);
        }

    }
}