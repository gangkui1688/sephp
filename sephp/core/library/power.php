<?php
namespace sephp\core\lib;

use sephp\func;
use sephp\sephp;
use sephp\core\session;
use sephp\core\show_msg;
use sephp\core\db;
use sephp\core\log;

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
        $_table_group = '#PB#_admin_group',
        $_user_type   = 'admin';
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

    public static function instance($authority = [])
    {
        if(empty(self::$instance))
        {
            self::$instance = new self($authority);
        }
        return self::$instance;
    }

    /**
     * 初始化验证信息
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @param    array      $authority [description]
     */
    public function __construct($authority = [])
    {
        $this->config = empty($authority) ? sephp::$_config['_authority'] : $authority;
        if(!empty($this->config['_user_type']))
        {
            self::$_user_type   = $this->config['user_type'];
            self::$_mark        = '_member_';
            self::$_table_admin = '#PB#_member_pam';
            self::$_table_group = '';
        }
        $this->_info = empty($this->_info) ? session::get(self::$_mark) : $this->_info;
        $this->_uid = $this->_info[$this->config['user_type'] . '_id'];

        $this->is_login();
    }

    /**
     * 判断是否登陆
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @return   boolean    [true z]
     */
    public function is_login()
    {
        if(empty($this->config['need_login']) || in_array(CONTROLLER_NAME,$this->config['not_login']))
        {
            return true;
        }

        //权限校验
        if(!empty($this->_uid) && $this->config['login_url'] === '?ct='.CONTROLLER_NAME.'&ac='.ACTION_NAME)
        {
            show_msg::error('您已经登陆','?ct=index&ac=index');
        }

        if(empty($this->_uid))
        {
            show_msg::error('您还没有登陆',$this->config['login_url']);
        }

    }

    /**
     * 权限检查
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @return   [type]     [description]
     */
    public function check_in()
    {
        if(!is_array($this->_info['powerlist']) || !in_array('?ct='.CONTROLLER_NAME.'&ac='.ACTION_NAME,$this->_info['powerlist']))
        {
            //show_msg::error('抱歉！您无权限查看该页面','0');
        }

        sephp::$_uid = $this->_uid;
    }

    /**
     * 校验登陆
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @param    [type]     $name [description]
     * @param    [type]     $pass [description]
     * @return   [type]           [description]
     */
    public function login_check($name, $pass)
    {
        $result = false;
        do{
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
                    'status'     => 2,
                    'login_ip'   => func::get_client_ip(),
                    'username'   => $name,
                    'login_time' => TIME_SEPHP,
                    'login_id'   => 0,
                    'user_type'  => static::$_user_type,
                    'agent'      => $_SERVER['HTTP_USER_AGENT'],
                    'remark'     => '用户名或者密码错误',
                ];
                db::insert('#PB#_admin_login')->set($data)->execute();
                log::info('登陆失败,用户名或者密码错误');
                break;
            }

            //获取用户权限
            if(!empty(self::$_table_group) && $info['group_id'] > 0)
            {
                $power = db::select()
                    ->from(self::$_table_group)
                    ->where('group_id',$info['group_id'])
                    ->as_row()
                    ->execute();

                $info['group_name'] = $power['name'];
                $info['powerlist'] = empty($power) ? [] : json_decode($power['powerlist'], true);
            }

            unset($info['password']);
            $this->_info = $info;

            $result = true;

        }while(false);

        return $result;

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
