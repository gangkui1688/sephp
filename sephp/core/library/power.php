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
        $_table_admin = null,
        $_table_group = null,
        $_user_type   = null,
        $_uid_field   = null,
        $_mark        = null;


    /**
     * @var array 登陆用户信息
     */
    public $_info = [];
    //用户ID
    public $_uid = 0;
    //用户昵称
    public $_nickname = null;
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
        $this->config    = empty($authority) ? sephp::$_config['_authority'] : $authority;

        if(empty($this->config['user_type']))
        {
            throw new \Exception('Authority info has does not set "user_type" field!');
        }
        self::$_user_type = $this->config['user_type'];
        self::$_uid_field = $this->config['user_type'] . '_id';
        switch (self::$_user_type)
        {
            case 'member':
                self::$_mark        = '_member_';
                self::$_table_admin = '#PB#_member_pam';
                self::$_table_group = '';
                break;
            case 'admin':
                self::$_mark        = '_admin_info_';
                self::$_table_admin = '#PB#_admin_user';
                self::$_table_group = '#PB#_admin_group';
                break;
            default:
                throw new \Exception('Authority info has wrong value for "user_type" field!');
                break;
        }

        sephp::$_user = $this->_info = session::get(self::$_mark);
        if(!empty($this->_info))
        {
            sephp::$_uid = $this->_uid = $this->_info[self::$_uid_field];
            $this->_nickname = $this->_info['nickname'] ?? $this->_info['username'];
        }

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

        //验证是否需要登陆
        if(empty($this->config['need_login']) || in_array(CONTROLLER_NAME,$this->config['not_login']))
        {
            return true;
        }

        //排除重复登录
        if(!empty($this->_uid) && $this->config['login_url'] === '?ct='.CONTROLLER_NAME.'&ac='.ACTION_NAME)
        {
            show_msg::error('您已经登陆','?ct=index&ac=index');
        }

        //检验登陆
        if(empty($this->_uid))
        {
            show_msg::error('您还没有登陆',$this->config['login_url']);
        }

        //权限检验
        $this->check_in();
    }

    /**
     * 权限检查
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @return   [type]     [description]
     */
    public function check_in()
    {
        do{
            //无需权限验证
            if(false === $this->config['power_check'])
            {
                break;
            }

            if(empty($this->_info['powerlist']))
            {
                show_msg::error('抱歉！您无权限查看该页面');
                exit();
            }

            if('*' === $this->_info['powerlist'])
            {
                break;
            }


            if(
                !is_array($this->_info['powerlist']) ||
                !in_array('?ct='.CONTROLLER_NAME.'&ac='.ACTION_NAME, $this->_info['powerlist'])
            )
            {
                show_msg::error('抱歉！您无权限查看该页面');
                exit();
            }

        }while(false);

        return true;
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

            $info = db::select('password,' . self::$_uid_field)
                ->from(self::$_table_admin)
                ->where('username', '=', $name)
                ->as_row()
                ->execute();
            if(empty($info) || !password_verify($pass, $info['password']))
            {
                $data = [
                    'session_id' => session_id(),
                    'status'     => 2,
                    'login_ip'   => func::get_client_ip(),
                    'username'   => $name,
                    'login_time' => TIME_SEPHP,
                    'login_uid'   => 0,
                    'user_type'  => self::$_user_type,
                    'agent'      => $_SERVER['HTTP_USER_AGENT'],
                    'remark'     => '用户名或者密码错误',
                ];
                db::insert('#PB#_login_log')->set($data)->execute();
                log::info('登陆失败,用户名或者密码错误');
                break;
            }

            $method_name = 'get_' . self::$_user_type . '_info';
            $this->_info = $this->$method_name($info[self::$_uid_field]);
            $this->_info['username'] = $name;


            //获取用户权限
            if(!empty(self::$_table_group) && !empty($this->_info['group_id']))
            {
                $power = db::select()
                    ->from(self::$_table_group)
                    ->where('group_id',$this->_info['group_id'])
                    ->as_row()
                    ->execute();

                $this->_info['group_name'] = $power['name'];
                $this->_info['powerlist']  = empty($power['powerlist']) ? [] :
                        ($power['powerlist'] === '*' ? '*' : json_decode($power['powerlist'], true));

            }

            $result = true;

        }while(false);

        return $result;

    }

    /**
     * 记录登陆日志
     */
    public function add_login_log()
    {
        //记录登陆日志
        $data = [
            'session_id' => session_id(),
            'status'     => 1,
            'login_ip' => func::get_client_ip(),
            'username' => $this->_info['username'],
            'login_time' => time(),
            'login_uid' => $this->_info[self::$_uid_field],
            'user_type' => 'admin',
            'agent' => $_SERVER['HTTP_USER_AGENT'],
        ];

        if(empty(db::insert('#PB#_login_log')->set($data)->execute()))
        {
            log::error('用户登陆，登陆日志写入失败');
            return false;
        }

        if(
            false === db::update(self::$_table_admin)
                ->set(['session_id' => session_id()])
                ->where(self::$_uid_field, $this->_uid)
                ->execute()
        )
        {
            log::error('用户登陆，当前会话session_id写入失败');
            return false;
        }

        session::set(self::$_mark, $this->_info);
        $this->_uid = $this->_info[self::$_uid_field];
        return true;
    }

    /**
     * 获取管理员的用户信息
     * @Author   GangKui
     * @DateTime 2019-10-25
     * @param    [type]     $admin_id [description]
     * @return   [type]               [description]
     */
    public function get_admin_info($admin_id)
    {
        return db::select(['admin_id', 'nickname', 'realname', 'email', 'mobile', 'remark', 'sex', 'username', 'group_id'])
                ->from(self::$_table_admin)
                ->where(self::$_uid_field, '=', $admin_id)
                ->as_row()
                ->execute();
    }



    /**
     * 获取会员信息
     * @Author   GangKui
     * @DateTime 2019-10-25
     * @param    [type]     $member_id [description]
     * @return   [type]                [description]
     */
    public function get_member_info($member_id)
    {
        return db::select(['member_id', 'nickname', 'realname', 'email', 'mobile', 'remark', 'group_id'])
                ->from("#PB#_members")
                ->where(self::$_uid_field, '=', $member_id)
                ->as_row()
                ->execute();
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
