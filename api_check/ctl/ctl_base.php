<?php
namespace api_check\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\config;
use sephp\core\req;
use sephp\core\log;
use sephp\core\db;
use sephp\core\show_msg;
use common\model\pub_mod_member_pam;

class ctl_base
{


    public
        $uid     = 0,
        $os      = null,
        $version = 1,
        $req_time= 1,
        $sign    = null,
        $token   = null;

    private $app_key = null;

    public function __construct()
    {
        //用户没搞好，暂时不理token
        $this->uid     = req::item('uid', 0);
        $this->token   = req::item('token', '');
        $this->os      = req::item('os', '');
        $this->sign    = req::item('sign', '');
        $this->version = req::item('version', '');

        $app_setting   = config::get('app_order_check_base_setting', 'mysql');
        $this->app_key = $app_setting['app_token'];

        if($this->req_time > TIME_SEPHP || $this->req_time < (TIME_SEPHP - 600))
        {
            //$this->error('请求已超时');
        }

        if(empty($this->sign) || !$this->check_sign())
        {
            //$this->error('sign错误');
        }

    }


    protected function get_token()
    {
        $token  = req::item('_token', '');
        $token  = empty($token) && ! empty($_SERVER['HTTP_AUTHORIZATION']) ? $_SERVER['HTTP_AUTHORIZATION'] : $token;
        return $token;
    }

    protected function success($msg='success', $code=0, $data=[])
    {
        show_msg::ajax($msg, $code, $data, $this->make_sign());
    }

    // 返回失败json数据
    protected function error($msg='error', $code=-1, $data=[])
    {
        show_msg::ajax($msg, $code, $data, $this->make_sign());
    }

    /**
     * 生成签名
     * @Author   GangKui
     * @DateTime 2019-11-09
     * @param    array      $data [description]
     * @return   [type]           [description]
     */
    public function make_sign($data = [])
    {
        $data = ['data' => json_encode($data, JSON_UNESCAPED_UNICODE)];
        return func::sign($data, $this->app_key);
    }

    /**
     * 检验sign的合法性
     * @Author   GangKui
     * @DateTime 2019-11-05
     * @return   [type]     [description]
     */
    protected function check_sign($post = [])
    {
        $data = empty($post) ? req::$forms : $post;
        $data = ['data' => json_encode($data, JSON_UNESCAPED_UNICODE)];
        $sign = func::sign($data, $this->app_key);
        if($this->sign === $sign)
        {
            return true;
        }
        return false;
    }

}
