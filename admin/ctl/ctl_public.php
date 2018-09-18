<?php

class ctl_public
{
    //上传方法
    public function upload()
    {
        if(!empty($_FILES)){
            sys_upload::web_upload();
        }
        show_msg::redirect('?ct=index&ac=index');
    }

    //上传自动保存file表
    public function upload_save()
    {
        if(!empty($_FILES)){
            sys_upload::web_upload('save');
        }
        show_msg::redirect('?ct=index&ac=index');
    }


    public function index()
    {

        session::set('admin_001',['ghjklasdfghjkl']);
        session::set('admin_002',['tttttttttttttt']);
        p(session::get());
        unset($_SESSION['_sephp.a.com']['admin_001']);
        p(session::get());

    }


    //验证码
    public function verify()
    {
        $config = [
            'length' => req::item('length',4),
            'expire' => req::item('expire',300),
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
                show_msg::error('验证码错误');
            }

            $admin_user = req::$posts['username'];
            $admin_pass = md5(req::$posts['password']);
            $where = [
                ['username','=',$admin_user],
                ['password','=',$admin_pass],
                ['status','=',1],
            ];
            if(sys_power::instanc()->login_check($where))
            {
                show_msg::success('登陆成功','?ct=index&ac=index');
            }
            show_msg::error('登陆失败,用户名或密码错误');
        }

        view::assign('verify_url','?ct=public&ac=verify&length=7');
        view::display('system/login');
    }


    public function add_file()
    {
        view::display('system/add_file');
    }

    public function page_500()
    {
        view::display('system/500');
    }

    public function page_404()
    {
        view::display('system/404');
    }
}