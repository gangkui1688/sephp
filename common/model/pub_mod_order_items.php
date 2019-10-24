<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;

/**
 * 订单明细
 * @ClassName: pub_mod_goods
 * @Author: Gangkui
 * @Date: 2019-02-20 14:09:02
 */

class pub_mod_order_items extends pub_mod_model
{
    public static
        $_table  = '#PB#_order_items',
        $_pk     = 'item_id',
        $_fields = [
            'item_id'       => ['type' => 'int',  'required' => true, 'comment' => '订单明细ID'],
            'order_id'      => ['type' => 'text', 'required' => true, 'comment' => '订单ID'],
            'goods_id'      => ['type' => 'text', 'default' => 0, 'comment' => '商品ID'],
            'goods_params'  => ['type' => 'text', 'default' => null, 'comment' => '订单对应的商品json数据'],
            'type_id'       => ['type' => 'text', 'default' => null, 'comment' => '商品类型ID'],
            'bn'            => ['type' => 'text', 'default' => null, 'comment' => '明细商品的品牌名'],
            'goods_name'    => ['type' => 'text', 'default' => null, 'comment' => '明细商品的名称'],
            'cost'          => ['type' => 'text', 'default' => null, 'comment' => '明细商品的成本'],
            'price'         => ['type' => 'text', 'default' => null, 'comment' => '明细商品的销售价(购入价)'],
            'g_price'       => ['type' => 'text', 'default' => null, 'comment' => '明细商品的会员价原价'],
            'score'         => ['type' => 'text', 'default' => null, 'comment' => '明细商品积分'],
            'weight'        => ['type' => 'int', 'default' => 0, 'comment' => '明细商品重量'],
            'nums'          => ['type' => 'int', 'default' => 0, 'comment' => '明细商品购买数量'],
            'sendnum'       => ['type' => 'text', 'default' => 0, 'comment' => '明细商品发货数量'],
            'addon'         => ['type' => 'text', 'default' => 0, 'comment' => '明细商品的规格属性'],
            'amount'        => ['type' => 'text', 'default' => null, 'comment' => '明细商品总额'],
            'adduser'       => ['type' => 'text', 'required' => false, 'default' => '', 'comment' => '添加人'],
            'addtime'       => ['type' => 'int', 'required' => false, 'default' => '', 'comment' => '添加时间'],
            'upuser'        => ['type' => 'text', 'default' => 0, 'comment' => '更新人'],
            'uptime'        => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'],
            'deltime'       => ['type' => 'int', 'default' => 0, 'comment' => '删除时间'],
            'deluser'       => ['type' => 'int', 'default' => 0, 'comment' => '删除人'],
        ];

}
