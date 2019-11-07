<?php
namespace api_check\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\db;
use sephp\core\show_msg;
use common\model\pub_mod_member_pam;

class ctl_base
{


    public
        $member_id  = 0,
        $os   = null,
        $version = 1,
        $req_time = 1,
        $sign    = null,
        $token   = null;

    public function __construct()
    {

        //用户没搞好，暂时不理token
        $this->member_id = req::item('member_id', 0);
        $this->token   = req::item('token', '');
        $this->os      = req::item('os', '');
        $this->req_time= req::item('req_time', '');
        $this->sign    = req::item('sign', '');
        $this->version = req::item('version', '');

        if($this->req_time > TIME_SEPHP || $this->req_time < (TIME_SEPHP - 600))
        {
            //$this->error('请求已超时');
        }

        if(empty($this->sign) || !$this->check_sign())
        {
            //$this->error('sign错误');
        }

        if(!$this->check_token())
        {
            $this->error('请登陆', -10000);
        }
    }

    protected function success($msg='success', $code=0, $data=[])
    {
        show_msg::ajax($msg, $code, $data);
    }

    // 返回失败json数据
    public function error($msg='error', $code=-1, $data=[])
    {
        show_msg::ajax($msg, $code, $data);
    }

    /**
     * 检验sign的合法性
     * @Author   GangKui
     * @DateTime 2019-11-05
     * @return   [type]     [description]
     */
    protected function check_sign($post = [])
    {
        $post = empty($post) ? req::$forms : $post;
        $sign = func::sign($post, sephp::$_config['api']['app_key']);
        if($this->sign === $sign)
        {
            return true;
        }
        return false;
    }

    /**
     * 检验token
     * @Author   GangKui
     * @DateTime 2019-11-05
     * @return   [type]     [description]
     */
    protected function check_token()
    {
        $result = false;
        do{

            if(empty($this->token))
            {
                break;
            }

            if(64 != strlen($this->token))
            {
                break;
            }

            if($this->member_id = pub_mod_member_pam::app_check($this->token))
            {
                $result = true;
                break;
            }

        }while(false);

        return $result;
    }

    /**
     * 登陆
     * @Author   GangKui
     * @DateTime 2019-11-02
     * @return   [type]     [description]
     */
    public function login()
    {
        try{
            $data_filter = func::data_filter([
                'username' => ['type' => 'text', 'require' => true],
                'password' => ['type' => 'text', 'require' => true],
            ], req::$posts);


            if(!is_array($data_filter))
            {
                $this->error('参数错误');
            }

            if(false === pub_mod_member_pam::check_pass($data_filter['username'], $data_filter['password'], $member_id))
            {
                $this->error('用户名或密码错误');
            }

            //必须是64位的
            $this->token = func::random('alnum', 16) . md5($member_id) . func::random('alnum', 16);

            if(false === pub_mod_member_pam::update(
                ['token' => $this->token, 'uptime' => TIME_SEPHP],
                ['member_id' => $member_id]
            ))
            {
                pub_mod_login::add([
                    'status'     => 2,
                    'username'   => $data_filter['username'],
                    'login_type' => 3,
                    'user_type'  => 'member',
                ]);

                $this->error('登陆失败，请重新登录');
            }

            pub_mod_login::add([
                'status'     => 1,
                'username'   => $data_filter['username'],
                'login_type' => 3,
                'user_type'  => 'member',
                'remark'     => $this->token,
            ]);

            $this->member_id = $member_id;
            $member_info = pub_mod_member::get_member_info($member_id);
            $member_info['token'] = $this->token;
            $this->success('登陆成功', '', $member_info);
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

    /**
     * 登出
     * @Author   GangKui
     * @DateTime 2019-11-02
     * @return   [type]     [description]
     */
    public function logout()
    {


    }


}
