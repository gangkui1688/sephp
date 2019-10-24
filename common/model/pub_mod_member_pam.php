<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;

/**
 * 会员model
 * @ClassName: pub_mod_goods
 * @Author: Gangkui
 * @Date: 2019-02-20 14:09:02
 */

class pub_mod_member extends pub_mod_model
{
    public static
        $_table  = '#PB#_member_pam',
        $_pk     = 'member_id',
        $_fields = [
            'member_id'        => ['type' => 'int',  'required' => true, 'comment' => '会员用户id'],
            'username'    => ['type' => 'text', 'required' => true, 'comment' => '登录名'],
            'password'   => ['type' => 'text', 'default' => 0, 'comment' => '登录密码'],
            'password_account' => ['type' => 'text', 'default' => null, 'comment' => '加密字符串'],
            'wechat_openid'    => ['type' => 'text', 'default' => null, 'comment' => '微信openid'],
            'uptime'           => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'],
        ];



    /**
     * 验证密码
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @return   [type]     [description]
     */
    public static function check_pass($login_account, $login_password)
    {
        $info = self::getdump(['where' => ['login_account', =, $login_account]]);
        if(empty($info) || !password_verify($login_password, $info['login_password']))
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
        $info = self::getdump(['where' => ['wechat_openid', =, $openid]]);
        return $info ? true : false;
    }

}
