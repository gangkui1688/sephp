<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;
use common\model\pub_mod_member;

/**
 * 会员model
 * @ClassName: pub_mod_goods
 * @Author: Gangkui
 * @Date: 2019-02-20 14:09:02
 */

class pub_mod_member_pam extends pub_mod_model
{
    public static
        $_table  = '#PB#_member_pam',
        $_pk     = 'member_id',
        $_fields = [
            'member_id'   => ['type' => 'text',  'required' => true, 'comment' => '会员用户id'],
            'username'    => ['type' => 'text', 'required' => true, 'comment' => '登录名'],
            'password'    => ['type' => 'text', 'default' => true, 'comment' => '登录密码'],
            'password_account' => ['type' => 'text', 'default' => null, 'comment' => '加密字符串'],
            'wechat_openid'    => ['type' => 'text', 'default' => null, 'comment' => '微信openid'],
            'uptime'           => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'],
        ];



    /**
     * 会员注册
     * @Author   GangGuoer
     * @DateTime 2019-10-31T01:46:47+0700
     * @version  [version]
     * @param    [type]
     * @return   [type]
     */
    public static function web_regist($data, &$member_info = [])
    {
        $result = 0;

        $data['member_id']  = func::random('web');
        $data['source']     = 'pc';
        $data['addtime']    = TIME_SEPHP;
        $data['adduser']    = -1;
        $data['reg_ip']     = func::get_client_ip();
        $data['password']   = \sephp\core\lib\power::make_password($data['password']);

        $insert_pam = func::data_filter(self::$_fields, $data);
        $insert_members = func::data_filter(pub_mod_member::$_fields, $data);

        self::db_start();

        do{
            if(!is_array($insert_pam) || !is_array($insert_members))
            {
                $result = -1;
                break;
            }

            $info = self::getdump([
                'where' => ['username', '=', $insert_pam['username']]
            ]);

            if(!empty($info))
            {
                $result = -2;
                break;
            }

            if(false === self::insert($insert_pam))
            {
                $result = -601;
                break;
            }

            if(false === pub_mod_member::insert($insert_members))
            {
                $result = -602;
                break;
            }

        }while(false);

        if(0 > $result)
        {
            self::db_rollback();
        }
        else
        {
            self::db_commit();
            $member_info = $insert_members;
        }

        self::db_end();

        return $result;
    }

    /**
     * 验证密码
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @return   [type]     [description]
     */
    public static function check_pass($login_account, $login_password)
    {
        $info = self::getdump([
            'where' => ['username', '=', $login_account]
        ]);
        if(empty($info) || !password_verify($login_password, $info['password']))
        {
            return false;
        }

        return true;
    }

    /**
     * 验证微信openid
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @param    [type]     $openid [description]
     * @return   [type]             [description]
     */
    public static function wechat_check($openid)
    {
        $info = self::getdump(['where' => ['wechat_openid', '=', $openid]]);
        return $info ? true : false;
    }

}
