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

class pub_mod_order_cart extends pub_mod_model
{
    public static
        $_table  = '#PB#_order_cart',
        $_pk     = 'cart_id',
        $_fields = [
            'cart_id'     => ['type' => 'int',  'required' => true, 'comment' => '品牌ID'], //订单号
            'goods_id'    => ['type' => 'text', 'required' => true, 'comment' => '商品ID'], //商品默认货币总值
            'number'      => ['type' => 'text', 'required' => true, 'comment' => '商品数量'], //商品默认货币总值
            'params'      => ['type' => 'text', 'required' => true, 'comment' => '购物车对象参数'], //商品默认货币总值
            'params'      => ['type' => 'text', 'required' => true, 'comment' => '购物车对象参数'], //商品默认货币总值
            'params'      => ['type' => 'text', 'required' => true, 'comment' => '购物车对象参数'], //商品默认货币总值
            'params'      => ['type' => 'text', 'required' => true, 'comment' => '购物车对象参数'], //商品默认货币总值
            'params'      => ['type' => 'text', 'required' => true, 'comment' => '购物车对象参数'], //商品默认货币总值

            'ip'          => ['type' => 'text', 'default' => null, 'comment' => 'ip地址'], //x
            'adduser'     => ['type' => 'text', 'required' => false, 'default' => 0, 'comment' => '添加人'], //
            'addtime'     => ['type' => 'int', 'required' => false, 'default' => 0, 'comment' => '添加时间'], //
            'upuser'      => ['type' => 'text', 'default' => 0, 'comment' => '更新人'], //
            'uptime'      => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'], //
        ],
        $status = [
            '1' => '激活中',
            '2' => '过期/作废',
            '3' => '已完成',
        ],
        $disabled = [
            '1' => '启用',
            '2' => '禁用',
        ];


    const STATUS_ACTION = 1;
    const STATUS_DEAD   = 2;
    const STATUS_FINISH = 3;



    public static function create_id()
    {
        return return date("ymdHis") . func::random('distinct', 5);
    }

}
