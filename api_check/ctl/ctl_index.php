<?php
namespace api_check\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\config;
use sephp\core\req;
use sephp\core\log;
use sephp\core\db;
use sephp\core\lib\power;
use common\serv\pub_serv_orders;
use common\model\pub_mod_order;


class ctl_index extends ctl_base
{


    public function index()
    {
        echo pub_mod_order::create_qr_img('88a4238a0b9238203cc509a6f75849b3');

        exit();
        $qrcode = '88a4238a0b9238203cc509a6f75849b3';

        $jiami = pub_mod_order::entcry_qrcode($qrcode);

    var_dump(
        $qrcode,
        $jiami
    );



var_dump(pub_mod_order::decry_qrcode($jiami));
        echo phpinfo();
    }

    /**
     * 扫码核销
     * @Author   GangKui
     * @DateTime 2019-11-11
     * @return   [type]     [description]
     */
    public function order_check()
    {
        $scan_str = req::item('scan_str', '');

        if(empty($scan_str))
        {
            $this->error('参数错误');
        }

        if(0 > $result = pub_serv_orders::check_order([
            'qrcode_str' => $scan_str,
            'type'  => 'app',
        ]))
        {
            $this->error(pub_serv_orders::$_error_msg, $result);
        }

        $this->success('验票成功');
    }

    /**
     * 核销列表
     * @Author   GangKui
     * @DateTime 2019-11-11
     * @return   [type]     [description]
     */
    public function check_list()
    {

    }


    /**
     * 登陆
     * @Author   GangKui
     * @DateTime 2019-11-11
     * @return   [type]     [description]
     */
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

            if(false === power::instance()->add_login_log(['app_token' => $this->token]))
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
