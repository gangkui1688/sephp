<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;

/**
 * 商品model
 * @ClassName: pub_mod_goods
 * @Author: Gangkui
 * @Date: 2019-02-20 14:09:02
 */

class pub_mod_order extends pub_mod_model
{
    public static
        $_table  = '#PB#_order',
        $_pk     = 'order_id',
        $_fields = [
            'order_id'      => ['type' => 'int',  'required' => true, 'comment' => '品牌ID'], //订单号
            'order_sn'      => ['type' => 'text', 'required' => true, 'comment' => '品牌名称'], //服务id
            'num'           => ['type' => 'text', 'default' => 0, 'comment' => '数量'], //申请金额
            'price'         => ['type' => 'text', 'default' => 0, 'comment' => '单价'], //申请金额
            'total_money'   => ['type' => 'text', 'default' => 0, 'comment' => '总价'], //申请金额
            'discount'       => ['type' => 'text', 'default' => 0, 'comment' => '折扣价格'], //申请金额
            'status'       => ['type' => 'int', 'default' => 1, 'comment' => '排序'], //申请金额
            'remark'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //申请金额
            'adduser'        => ['type' => 'text', 'required' => false, 'default' => '', 'comment' => '添加人'], //申请金额
            'addtime'        => ['type' => 'int', 'required' => false, 'default' => '', 'comment' => '添加时间'], //申请金额
            'upuser'         => ['type' => 'text', 'default' => 0, 'comment' => '更新人'], //申请金额
            'uptime'         => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'], //申请金额
        ],
        $status = [
            '1' => '准备中',
            '2' => '已确认',
            '3' => '待付款',
            '4' => '已付款',
            '5' => '付款失败',
            '6' => '已退款',
            '7' => '过期未支付',
            '8' => '已完成',//已消费
            '9' => '已退款',
            '10' => '过期未支付',
            '15' => '异常订单',
        ],
        $disabled = [
            '1' => '启用',
            '2' => '禁用',
        ];


    const STATUS_READY          = 1;
    const STATUS_CANCEL         = 2;
    const STATUS_PAY_WAIT       = 3;
    const STATUS_PAY_FAIL       = 4;
    const STATUS_PAY_SUCCESS    = 5;
    const STATUS_REFUND_WAIT    = 6;
    const STATUS_REFUND_FAIL    = 7;
    const STATUS_REFUND_SUCCESS = 8;
    const STATUS_TIME_OUT       = 9;
    const STATUS_EXCEPTION      = 20;



}
