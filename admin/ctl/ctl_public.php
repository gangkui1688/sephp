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
        echo sysVerifiy_::instance($config)->show();
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
            if(start::$_config['web']['verify_open'] && !sysVerifiy_::instance()->check(req::$posts['verify']))
            {
                show_msg::error('验证码错误');
            }

//            if(start::$_config['web']['google_auth'] && !sys_google_auth::instance()->verify_code(req::$posts['verify'],2))
//            {
//                //show_msg::error('验证码错误');
//            }

            $admin_user = req::$posts['username'];
            $admin_pass = md5(req::$posts['password']);
            $where = [
                ['username','=',$admin_user],
                ['password','=',$admin_pass],
                ['status','=',1],
            ];
            if(sys_power::instanc()->login_check($where))
            {
                if(empty(start::$_config['web']['google_auth']))
                {
                    show_msg::success('登陆成功','?ct=index&ac=index');
                }
                elseif(empty(session::get('admin_info')['auth_secert']))
                {
                    //第一次绑定secert
                    show_msg::redirect();
                }
                else
                {
                    //输入code
                    show_msg::redirect();
                }
            }
            show_msg::error('登陆失败,用户名或密码错误');

        }

        if(!empty(start::$_config['web']['google_auth']))
        {
            //把本次的"安全密匙SecretKey" 入库,和账户关系绑定,客户端也是绑定这同一个"安全密匙SecretKey"
            $secret = sys_google_auth::instance(6)->create_secret();
            session::set('googel_auth_secret', $secret);
            //第一个参数是"标识",第二个参数为"安全密匙SecretKey" 生成二维码信息
            $qr_code_url = sys_google_auth::instance()->get_qr_code_url(APP_NAME, $secret);
            view::assign('qr_code_url', $qr_code_url);
        }


        if(!empty(start::$_config['web']['verify_open']))
        {
            view::assign('verify_url','?ct=public&ac=verify&length=7');
        }
        view::display('system/login');
    }
    /**
     * google auth验证 第一步 验证身份
     */
    public function auth_first_username()
    {
        view::assign('username', session::get('admin_info')['username']);
        view::display('system/auto_first');
    }

    /**
     * google auth验证 第二步 安装app
     */
    public function auth_second_install_app()
    {

        view::display('system/auto_second');
    }

    /**
     * google auth验证 第三部 绑定的secert密钥
     */
    public function auth_third_bind_secert()
    {
        //把本次的"安全密匙SecretKey" 入库,和账户关系绑定,客户端也是绑定这同一个"安全密匙SecretKey"
        $secret = sys_google_auth::instance(6)->create_secret();
        session::set('googel_auth_secret', $secret);
        //第一个参数是"标识",第二个参数为"安全密匙SecretKey" 生成二维码信息
        $qr_code_url = sys_google_auth::instance()->get_qr_code_url('放大说到发送', $secret, '');

        show_msg::ajax('', 200, ['qr_code_url'=>$qr_code_url]);
        //view::display('system/auto_third');
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