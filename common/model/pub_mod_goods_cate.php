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

class pub_mod_goods_cate extends pub_mod_model
{
    public static $table = '#PB#_goods',
    $pk                  = 'goods_id',
    $cache_use           = false,
    $cache_time          = 3600,
    $error_msg           = null,
    $transaction         = true,
    $fields              = [
            'goods_id'      => ['type' => 'text', 'required' => true, 'comment' => '商品ID'], //订单号
            'goods_sn'      => ['type' => 'int', 'required' => true, 'comment' => '商品编号'], //服务id
            'name'          => ['type' => 'text', 'default' => true, 'comment' => '商品名称'], //申请人
            'price'         => ['type' => 'text', 'default' => 0, 'comment' => '销售价格'], //申请金额
            'price'         => ['type' => 'text', 'default' => 0, 'comment' => '销售价格'], //申请金额
            'price'         => ['type' => 'text', 'default' => 0, 'comment' => '销售价格'], //申请金额
            'price'         => ['type' => 'text', 'default' => 0, 'comment' => '销售价格'], //申请金额
            'price'         => ['type' => 'text', 'default' => 0, 'comment' => '销售价格'], //申请金额
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

    public static $status = [
        '1'  => '准备中',
        '2'  => '已取消',
        '3'  => '支付中',
        '4'  => '支付失败',
        '5'  => '支付成功',
        '6'  => '退款中',
        '7'  => '退款失败',
        '8'  => '退款成功',
        '9'  => '已超时',
        '20' => '订单异常',//需要客服介入
    ];

    public static $source = [
        '1' => '客服下单',
        '2' => '自助下单',
        '3' => 'app自助下单',
    ];


    /**
     * @var int 订单过期时间
     */
    public static $status_expire_time = 300;

    /**
     * 订单 对应的 queue_id 缓存
     */
    const ORDER_QUEUE_CACHE = 'order_queue_cache_v1_';


}
