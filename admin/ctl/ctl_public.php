<?php

class ctl_public
{
    //上传方法
    public function upload()
    {
        

    }

    public function index()
    {
        p(session::get(),NOW_URL);
    }


    //验证码
    public function verify()
    {
        $config = [
            'length' => 4,
            'expire' => 300,
        ];
        echo verifiy_code::instance($config)->show();
    }

    //登出
    public function logout()
    {
        session::delete('admin_info');
        session_destroy();
        show_msg::success('登出成功','?ct=public&ac=login');
    }

    //登陆
    public function login()
    {
        if(!empty(req::$posts))
        {
            if($GLOBALS['config']['web']['verify_open'] && !verifiy_code::instance()->check(req::$posts['verify']))
            {
                show_msg::ajax('验证码错误','201');
            }

            $admin_user = req::$posts['username'];
            $admin_pass = md5(req::$posts['password']);
            $where = [
                ['username','=',$admin_user],
                ['password','=',$admin_pass],
                ['status','=',1],
            ];
            if(sys_power::login_check($where))
            {
                show_msg::ajax('登陆成功');
            }
            show_msg::ajax('登陆失败,用户名或密码错误','201');
        }

        view::display('system/login');
    }
}