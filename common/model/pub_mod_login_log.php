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

class pub_mod_login_log extends pub_mod_model
{
    public static
        $_table  = '#PB#_login_log',
        $_pk     = 'member_id',
        $_fields = [
            'id'         => ['type' => 'int',  'required' => true, 'comment' => '会员用户id'],
            'session_id' => ['type' => 'text', 'required' => true, 'comment' => '用户登陆session_id'],
            'status'     => ['type' => 'text', 'default' => 0, 'comment' => '真实姓名'],
            'login_ip'   => ['type' => 'text', 'default' => null, 'comment' => '会员昵称'],
            'username'   => ['type' => 'text', 'default' => 0, 'comment' => '积分'],
            'login_time' => ['type' => 'text', 'default' => 0, 'comment' => '地址'],
            'login_uid'  => ['type' => 'text', 'default' => 0, 'comment' => '手机号码'],
            'agent'      => ['type' => 'text', 'default' => null, 'comment' => '邮箱'],
            'user_type'  => ['type' => 'text', 'default' => null, 'comment' => '来源ID'],
            'remark'     => ['type' => 'text', 'default' => null, 'comment' => '来源url'],
        ],
        $status = [
            '1' => '登陆成功',
            '2' => '登陆失败',
        ];




        /**
         * 获取最近一条登陆信息
         * @Author   GangKui
         * @DateTime 2019-10-25
         * @param    [type]     $uid       [description]
         * @param    string     $user_type [description]
         * @return   [type]                [description]
         */
        public static function get_last_log($login_uid, $user_type = 'admin')
        {
            return self::getdump([
                'where'    => ['login_uid', '=', $login_uid],
                'limit'    => 1,
                'order_by' => ['login_time','DESC'],
            ]);

        }
}
