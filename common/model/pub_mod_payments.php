<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;

/**
 * 支付流水model
 * @ClassName: pub_mod_payments
 * @Author: Gangkui
 * @Date: 2019-02-20 14:09:02
 */

class pub_mod_payments extends pub_mod_model
{
    public static
        $_table  = '#PB#_payments',
        $_pk     = 'payment_id',
        $_fields = [
            'payment_id'      => ['type' => 'int',  'required' => true, 'comment' => '支付单号'],
            'payment_bn'       => ['type' => 'text', 'default' => null, 'comment' => '支付单唯一编号'],
            'order_id'      => ['type' => 'int',  'required' => true, 'comment' => '订单ID'],
            'money'      => ['type' => 'text', 'required' => true, 'comment' => '支付金额'],
            'cur_money'           => ['type' => 'text', 'default' => 0, 'comment' => '支付货币金额'],
            'currency'       => ['type' => 'int', 'default' => 0, 'comment' => '货币'],
            'member_id'       => ['type' => 'text', 'default' => null, 'comment' => '会员用户名'],
            'status'       => ['type' => 'text', 'default' => null, 'comment' => '支付状态'],
            'pay_name'       => ['type' => 'text', 'default' => null, 'comment' => '支付描述名称'],
            'pay_type'       => ['type' => 'text', 'default' => null, 'comment' => '支付类型'],
            't_payed'       => ['type' => 'text', 'default' => null, 'comment' => '支付完成时间'],
            'account'       => ['type' => 'text', 'default' => null, 'comment' => '收款账号'],
            'bank'       => ['type' => 'text', 'default' => null, 'comment' => '收款银行'],
            'pay_account'       => ['type' => 'int', 'default' => 0, 'comment' => '支付账户'],
            'paycost'         => ['type' => 'text', 'default' => 0, 'comment' => '支付网关费用'],
            'pay_app_id'   => ['type' => 'text', 'default' => 0, 'comment' => '支付方式名称'],
            'pay_ver'       => ['type' => 'text', 'default' => 0, 'comment' => '支付版本号'],
            'ip'       => ['type' => 'int', 'default' => 1, 'comment' => '支付IP'],
            't_begin'       => ['type' => 'text', 'default' => null, 'comment' => '支付开始时间'],
            't_confirm'       => ['type' => 'text', 'default' => null, 'comment' => '支付确认时间'],
            'memo'       => ['type' => 'text', 'default' => null, 'comment' => '支付注释'],
            'return_url'       => ['type' => 'text', 'default' => null, 'comment' => '支付返回地址'],
            'disabled'       => ['type' => 'text', 'default' => null, 'comment' => '支付单状态'],
            'trade_no'       => ['type' => 'text', 'default' => null, 'comment' => '支付单交易编号'],
            'thirdparty_account'       => ['type' => 'text', 'default' => null, 'comment' => '第三方支付账户'],
            'adduser'        => ['type' => 'text', 'required' => false, 'default' => '', 'comment' => '添加人'],
            'addtime'        => ['type' => 'int', 'required' => false, 'default' => '', 'comment' => '添加时间'],
            'upuser'         => ['type' => 'text', 'default' => 0, 'comment' => '更新人'],
            'uptime'         => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'],
        ],
        $status = [
            '1' => '准备中',
            '2' => '成功',
            '3' => '失败',
            '4' => '已取消',
            '5' => '无效的',
            '6' => '错误',
            '9' => '支付异常',
        ],
        $disabled = [
            '1' => '启用',
            '2' => '禁用',
        ];

    /**
     * 支付状态
     */
    const STATUS_READY        = 1;
    const STATUS_SUCC         = 2;
    const STATUS_FAIL         = 3;
    const STATUS_CANCEL       = 4;
    const STATUS_INVALID      = 5;
    const STATUS_ERROR        = 6;
    const STATUS_EXCEPTION    = 9;


}
