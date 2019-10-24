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
        $_table  = '#PB#_members',
        $_pk     = 'member_id',
        $_fields = [
            'member_id'     => ['type' => 'int',  'required' => true, 'comment' => '会员用户id'],
            'member_lv_id'  => ['type' => 'text', 'required' => true, 'comment' => '会员等级'],
            'realname'      => ['type' => 'text', 'default' => 0, 'comment' => '真实姓名'],
            'nickname'      => ['type' => 'text', 'default' => null, 'comment' => '会员昵称'],
            'point'         => ['type' => 'text', 'default' => 0, 'comment' => '积分'],
            'addr'          => ['type' => 'text', 'default' => 0, 'comment' => '地址'],
            'mobile'        => ['type' => 'text', 'default' => 0, 'comment' => '手机号码'],
            'email'         => ['type' => 'text', 'default' => null, 'comment' => '邮箱'],
            'refer_id'      => ['type' => 'text', 'default' => null, 'comment' => '来源ID'],
            'refer_url'     => ['type' => 'text', 'default' => null, 'comment' => '来源url'],
            'advance'       => ['type' => 'text', 'default' => null, 'comment' => '余额'],
            'reg_ip'        => ['type' => 'text', 'default' => null, 'comment' => '注册ip'],
            'state'         => ['type' => 'text', 'default' => null, 'comment' => '会员验证状态'],
            'status'        => ['type' => 'text', 'default' => null, 'comment' => '状态'],
            'remark'        => ['type' => 'text', 'default' => null, 'comment' => '备注'],
            'experience'    => ['type' => 'text', 'default' => null, 'comment' => '经验值'],
            'resetpwd'      => ['type' => 'text', 'default' => null, 'comment' => '找回密码唯一标示'],
            'resetpwdtime'  => ['type' => 'text', 'default' => null, 'comment' => '找回密码时间'],
            'source'        => ['type' => 'text', 'default' => null, 'comment' => '平台来源'],
            'adduser'       => ['type' => 'text', 'required' => false, 'default' => 0, 'comment' => '添加人'],
            'addtime'       => ['type' => 'int', 'required' => false, 'default' => 0, 'comment' => '添加时间'],
            'upuser'        => ['type' => 'text', 'default' => 0, 'comment' => '更新人'],
            'uptime'        => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'],
            'deltime'       => ['type' => 'int', 'default' => 0, 'comment' => '删除时间'],
            'deluser'       => ['type' => 'int', 'default' => 0, 'comment' => '删除人'],
        ],
        $state = [
            '1' => '未验证',
            '2' => '已验证',
        ],
        $status = [
            '1' => '启用',
            '2' => '禁用',
        ];


    /**
     *  订单状态
     */
    const STATUS_ACTION = 1;
    const STATUS_DEAD   = 2;
    const STATUS_FINISH = 3;


}
