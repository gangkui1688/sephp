<?php

/**
 * Class sys_power
 * 用户权限检测 以及 登陆检测
 *
 */
class sys_power
{
    //用户session标示
    public $_user_marking = 'admin_info';
    /**
     * @var array 登陆用户信息
     */
    public  $_info = [];
    //用户ID
    public $_uid = 0;
    //登陆配置
    public $config = [];

    public $login_where = [];



    public static $instance = null;

    public static function instanc()
    {
        if(empty(self::$instance))
        {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function __construct()
    {
        $this->_info = session::get($this->_user_marking);
        $this->_uid = empty($this->_info) ? 0 : $this->_info['admin_id'];
        $this->config = $GLOBALS['config']['_authority'];

        $this->is_login();
    }

    //判断是否登陆
    public function is_login()
    {
        if(!empty($this->_uid) && $this->config['login_url'] == '?ct='.CT_NAME.'&ac='.AC_NAME)
        {
            show_msg::error('您已经登陆','?ct=index&ac=index');
        }
        if(isset($this->config['need_login']) && $this->config['need_login'] == true &&
            in_array(CT_NAME,$this->config['not_login']))
        {
            return true;
        }
        if(empty($this->_uid))
        {
            show_msg::error('您还没有登陆',$this->config['login_url']);
        }
        return true;
    }

    //权限校验
    public function check_in()
    {
        if(!in_array('?ct='.CT_NAME.'&ac='.AC_NAME,$this->_info['powerlist']))
        {
            //show_msg::error('抱歉！您无权限查看该页面','?ct=index&ac=index');
        }
    }

    //登陆操作
    public function login_check($where = [])
    {
        if(empty($where))
        {
            log::write('没有登陆条件');
            return false;
        }
        $info = db::select()
            ->from('admin_user')
            ->where($where)
            ->as_row()
            ->execute();
        if(empty($info))
        {
            log::write('登陆失败');
            return false;
        }
        //获取用户权限
        if($info['group_id'] > 0)
        {
            $power = db::select()
                ->from('admin_group')
                ->where('group_id',$info['group_id'])
                ->as_row()
                ->execute();
        }
        $info['powerlist'] = empty($power) ? [] : json_decode($power['powerlist'],true);
        log::write('用户【ID:'.$info['admin_id'].'】登陆成功');
        session::set($this->_user_marking,$info);
        return true;
    }




}