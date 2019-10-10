<?php
namespace admin\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\view;
use sephp\core\lib\power;
use sephp\core\lib\pages;
use sephp\core\db;
use sephp\core\upload;
use sephp\core\show_msg;
use sephp\core\session;
use sephp\core\config;
use sephp\core\lib\make_code;
use sephp\core\lib\verifiy;

class ctl_public
{

    public function test()
    {
        var_dump(make_code::barcode([
            'frame' => '3434234123123123123',
            //'outfile' => PATH_UPLOAD . time() . '.png',
        ]));
            exit;
        //var_dump(make_code::google_api(['frame' => 12312312]));
        var_dump(make_code::qrcode([
            'frame' => 12312312,
            'size'  => 10,
            'outfile' => PATH_UPLOAD . time() . '.png',
        ]));
    }

    //上传方法
    public function upload()
    {
        if(!empty(req::$forms['file'])){
            upload::web_upload();
        }
        show_msg::redirect('?ct=index&ac=index');
    }

    public function layer_add_file()
    {
        if(!empty($_FILES['file']) && is_ajax()){
            $type = req::item('save_type', '');
            $result = upload::web_upload();
            if(empty($result))
            {
                show_msg::ajax('upload_save faild',400);
            }
            else
            {
                show_msg::ajax('success','200',$result);
            }
        }
        view::display('system/add_file');
    }


    /**
     * 图片上传
     */
    public function editor_upload()
    {
        if(!empty($_FILES['file']) && is_ajax()) {
            $result = upload::web_upload();

                if(empty($result))
                {
                    show_msg::ajax('upload faild', '400');
                }
                $path_file =  '/upload/file/' . $result['name'];
                exit($path_file);

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
        echo verifiy::instance($config)->show();
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
            if(sephp::$_config['web']['verify_open'] && !verifiy::instance()->check(req::$posts['verify']))
            {
                show_msg::error('验证码错误');
            }

            $admin_user = req::$posts['username'];
            $admin_pass = req::$posts['password'];
            $where = [
                ['username','=',$admin_user],
                ['password','=',$admin_pass],
                ['status','=',1],
            ];
            if(power::instance()->login_check($admin_user, $admin_pass))
            {
                if(empty(sephp::$_config['web']['google_auth']))
                {
                    log::info('用户【ID:' . power::instance()->_info['admin_id'] . '】登陆成功');
                    power::instance()->login_log();
                    show_msg::success('登陆成功','?ct=index&ac=index');
                }
                elseif(empty(power::instance()->_info['auth_secert']))
                {
                    //第一次绑定secert
                    show_msg::redirect('?ct=public&ac=auth_first_username&username=' . $admin_user . '&password=' . $admin_pass);
                }
                else
                {
                    //输入code直接登陆
                    show_msg::redirect('?ct=public&ac=verify_google_code&username=' . $admin_user . '&password=' . $admin_pass);
                }
            }
            show_msg::error('登陆失败,用户名或密码错误');

        }

        if(!empty(sephp::$_config['web']['google_auth']))
        {
            //把本次的"安全密匙SecretKey" 入库,和账户关系绑定,客户端也是绑定这同一个"安全密匙SecretKey"
            $secret = google_auth::instance(6)->create_secret();
            session::set('googel_auth_secret', $secret);
            //第一个参数是"标识",第二个参数为"安全密匙SecretKey" 生成二维码信息
            $qr_code_url = google_auth::instance()->get_qr_code_url(APP_NAME, $secret);
            view::assign('qr_code_url', $qr_code_url);
        }


        if(!empty(sephp::$_config['web']['verify_open']))
        {
            view::assign('verify_url','?ct=public&ac=verify&length=7');
        }
        view::display('system/login');
    }

    //输入google 验证码
    public function verify_goole_code()
    {
        power::instance()->is_login();
        view::display('system/verify.gogole.code');
    }

    /**
     * google auth验证 第一步 验证身份
     */
    public function auth_first_username()
    {
        power::instance()->is_login();
        view::assign('save_url', '?ct=public&ac=auth_finish');
        view::assign('username', req::item('username',''));
        view::assign('password', req::item('password',''));
        view::display('system/auto_first');
    }

    /**
     * google auth验证 第二步 安装app
     */
    public function auth_second_install_app()
    {
        power::instance()->is_login();
        view::display('system/auto_second');
    }

    /**
     * google auth验证 第三部 绑定的secert密钥
     */
    public function auth_third_bind_secert()
    {
        power::instance()->is_login();
        //把本次的"安全密匙SecretKey" 入库,和账户关系绑定,客户端也是绑定这同一个"安全密匙SecretKey"
        $secret = google_auth::instance()->create_secret();
        session::set('googel_auth_secret', $secret);
        //第一个参数是"标识",第二个参数为"安全密匙SecretKey" 生成二维码信息
        $qr_code_url = google_auth::instance()->get_qr_code_url(
            req::item('username', ''),
            $secret,
            config::get('base_config')['web_name']);
        show_msg::ajax('', 200, ['qr_code_url'=>$qr_code_url]);
        //view::display('system/auto_third');
    }

    public function auth_finish()
    {
        power::instance()->is_login();
        $code = req::item('code','');
        $user = req::item('username', '');
        $pass = req::item('password', '');
        if(empty($code) || empty($user) || empty($pass))
        {
            show_msg::ajax('用户名,密码或验证码不能为空', 400);
        }

        if(!power::instance()->login_check($user, $pass))
        {
            show_msg::ajax('用户名或者密码错误', 400);
        }

        $secret = session::get('googel_auth_secret');

        if(google_auth::instance()->verify_code($code,$secret))
        {
            db::update(power::$_table_admin)
                ->set(['auth_secert'=>$secret])
                ->where('admin_id', power::instance()->_info['admin_id'])
                ->execute();

            power::instance()->login_log();

            show_msg::ajax('绑定成功', 200);
        }
        else
        {
            show_msg::ajax('绑定失败，验证吗错误', 400);
        }
    }

    //使用code 直接登陆
    public function verify_google_code()
    {
        power::instance()->is_login();
        if(!empty(req::$posts))
        {
            $code = req::item('code','');
            $user = req::item('username', '');
            $pass = req::item('password', '');
            if(empty($code) || empty($user) || empty($pass))
            {
                show_msg::error('用户名或者密码或验证码不能为空');
            }

            if(!power::instance()->login_check($user, $pass))
            {
                show_msg::error('用户名或者密码错误');
            }

            if(google_auth::instance()->verify_code($code, power::instance()->_info['auth_secert']))
            {
                power::instance()->login_log();
                show_msg::success('登陆成功','?ct=index&ac=index');
            }
            show_msg::error('Google验证码错误');

        }
        view::display('system/verify_google_code');
    }

    public function page_500()
    {
        view::display('system/500');
    }

    public function page_404()
    {
        //P($_SERVER);
        view::assign('not_fount_url', 'http://' . $_SERVER['HTTP_HOST'] . func::get_cururl());
        view::display('system/404');
    }
}
