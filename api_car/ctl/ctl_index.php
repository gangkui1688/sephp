<?php
namespace api_check\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\config;
use sephp\core\req;
use sephp\core\log;
use sephp\core\db;
use sephp\core\lib\power;


class ctl_index extends ctl_base
{

    public function index()
    {

        echo phpinfo();
    }

    public function check()
    {

        echo 1111111;
    }


    public function login()
    {
        try{

            $data_filter = func::data_filter([
                'username' => ['type' => 'text', 'require' => true],
                'password' => ['type' => 'text', 'require' => true],
            ], req::$forms);


            if(!is_array($data_filter))
            {
                $this->error('参数错误');
            }

            if(false === power::instance()->login_check($data_filter, $info))
            {
                $this->error('用户名或密码错误');
            }

            $this->member_id = power::instance()->_uid;

            //必须是64位的
            $this->token = power::make_token($this->member_id);

            if(false === power::instance()->add_login_log(['token' => $this->token]))
            {
                $this->error('登陆失败，请重新登录');
            }

            power::instance()->_info['token'] = $this->token;
            $this->success('登陆成功', '', power::instance()->_info);
        }
        catch (\Exception $e)
        {
            if($e->getCode() >= 0)
            {
                $this->error("unkonw error(code:{$e->getCode()}, msg:{$e->getMessage()})", -99);
            }
            else
            {
                $this->error($e->getMessage(), $e->getCode());
            }
        }
    }

}
