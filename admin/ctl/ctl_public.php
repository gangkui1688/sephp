<?php

class ctl_public
{
    //上传方法
    public function upload()
    {
        if(!empty(req::$forms['file'])){
            sys_upload::web_upload();
        }
        show_msg::redirect('?ct=index&ac=index');
    }

    //上传自动保存file表
    public function upload_save()
    {
        //var_dump(req::$forms,$_FILES);exit;
        if(!empty($_FILES['file'])){
            $result = sys_upload::web_upload('save');
            if(is_ajax())
            {
                $result === false ? show_msg::ajax('upload_save faild',400) : show_msg::ajax('success','200',$result);
            }
            return $result;
        }
        show_msg::redirect('?ct=index&ac=index');
    }

    /**
     * 编辑器图片上传
     */
    public function editor_update()
    {
        if(!empty($_FILES['file'])){
            $result = sys_upload::web_upload('save');
            if(empty($result))
            {
                show_msg::ajax('upload faild','400');
            }
            exit($result['http'] . $result['filename']);
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