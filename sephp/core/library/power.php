<?php
namespace sephp\core\lib;

use sephp\func;
use sephp\sephp;
use sephp\core\session;
use sephp\core\show_msg;
use sephp\core\db;

/**
 *
 * @ClassName: sys_power
 * @Author: Gangkui
 * @Date: 2018-11-05 21:36:29
 *  * 用户权限检测 以及 登陆检测
 */
class power
{
    public static 
        $_table_admin = '#PB#_admin_user',
        $_table_group = '#PB#_admin_group';
    //用户session标示
    public static $_mark = 'admin_info';


    /**
     * @var array 登陆用户信息
     */
    public $_info = [];
    //用户ID
    public $_uid = 0;
    //登陆配置
    public $config = [];

    public $login_where = [];



    public static $instance = null;

    public static function instance()
    {
        if(empty(self::$instance))
        {
            self::$instance = new self();
        }
        
        return self::$instance;
    }

    public function __construct()
    {
        $this->_info = empty($this->_info) ? session::get(self::$_mark) : $this->_info;
        $this->_uid = $this->_info['admin_id'];

        $this->config = empty(sephp::$_config['_authority']) ? [] : sephp::$_config['_authority'];
        $this->is_login();
    }

    //判断是否登陆
    public function is_login()
    {
        if(empty($this->config['need_login']) || in_array(CONTROLLER_NAME,$this->config['not_login']))
        {
            return true;
        }

        if(!empty($this->_uid) && $this->config['login_url'] === '?ct='.CONTROLLER_NAME.'&ac='.ACTION_NAME)
        {
            show_msg::error('您已经登陆','?ct=index&ac=index');
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

        if(!is_array($this->_info['powerlist']) || !in_array('?ct='.CONTROLLER_NAME.'&ac='.ACTION_NAME,$this->_info['powerlist']))
        {
            //show_msg::error('抱歉！您无权限查看该页面','0');
        }
    }

    //登陆操作
    public function login_check($name, $pass)
    {
        if(empty($name) || empty($pass))
        {
            log::info('登陆失败，用户名或密码不能为空');
            return false;
        }
        $info = db::select()
            ->from(self::$_table_admin)
            ->where('username', '=', $name)
            ->as_row()
            ->execute();
        //p($info, self::make_password($pass));exit;
        if(empty($info) || !password_verify($pass, $info['password']))
        {
            $data = [
                'session_id' => session_id(),
                'status' => 2,
                'login_ip' => func::get_client_ip(),
                'username' => $name,
                'login_time' => time(),
                'login_id' => 0,
                'user_type' => 'admin',
                'agent' => $_SERVER['HTTP_USER_AGENT'],
                'remark' => '用户名或者密码错误',
            ];
            db::insert('#PB#_admin_login')->set($data)->execute();
            log::info('登陆失败,用户名或者密码错误');
            return false;
        }
        //获取用户权限
        if($info['group_id'] > 0)
        {
            $power = db::select()
                ->from(self::$_table_group)
                ->where('group_id',$info['group_id'])
                ->as_row()
                ->execute();
        }
        $info['group_name'] = $power['name'];
        $info['powerlist'] = empty($power) ? [] : json_decode($power['powerlist'], true);
        $this->_info = $info;
        return empty($info) ? false : true;
    }

    /**
     * 记录登陆日志
     */
    public function login_log()
    {
        //记录登陆日志
        $data = [
            'session_id' => session_id(),
            'status' => 1,
            'login_ip' => func::get_client_ip(),
            'username' => $this->_info['username'],
            'login_time' => time(),
            'login_id' => $this->_info['admin_id'],
            'user_type' => 'admin',
            'agent' => $_SERVER['HTTP_USER_AGENT'],
        ];

        if(empty(db::insert('#PB#_admin_login')->set($data)->execute()))
        {
            log::error('用户登陆，登陆日志写入失败');
            return false;
        }

        if(db::update(self::$_table_admin)
                ->set(['session_id'=>session_id()])
                ->where('admin_id', $this->_info['admin_id'])
                ->execute() === false)
        {
            log::error('用户登陆，当前会话session_id写入失败');
            return false;
        }
        
        session::set(self::$_mark, $this->_info);
        $this->_uid = $this->_info['admin_id'];
        return true;

    }

    /**
     * 会员 生成 密码
     * @param $password
     * @param null $password_account
     * @return boolean
     */
    public static function make_password($password,$password_account = null)
    {
        //$pass = md5(substr(md5($password),8,10) . (empty($password_accout) ? '' : '_' . $password_account));
        return password_hash($password, PASSWORD_BCRYPT); 
    }

    /**
     * 检测用户名是否存在
     * @param string $login_account
     * @return mixed
     */
    public static function check_member($login_account = '')
    {
        $info = db::select()
            ->from('#PB#_member_pam')
            ->where('login_account',$login_account)
            ->as_row()
            ->execute();
        return $info;
    }

}