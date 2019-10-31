<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;

/**
 * 订单model
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
            'order_sn'      => ['type' => 'text',  'required' => true, 'comment' => '品牌ID'], //订单号
            'qrcode'      => ['type' => 'text',  'required' => true, 'comment' => '二维码code'], //订单号
            'total_amount'      => ['type' => 'int', 'required' => true, 'comment' => '商品默认货币总值'], //商品默认货币总值
            'final_amount'           => ['type' => 'int', 'default' => 0, 'comment' => '订单货币总值, 包含支付价格,税等'],
            'cost_item'       => ['type' => 'int', 'default' => 0, 'comment' => '订单商品总价格'], //订单商品总价格
            'cost_payment'       => ['type' => 'int', 'default' => 0, 'comment' => '支付费用'], //支付费用
            'currency'       => ['type' => 'text', 'default' => 'CNY', 'comment' => '订单支付货币'], //订单支付货币
            'discount'       => ['type' => 'int', 'default' => 0, 'comment' => '订单减免'], //
            'pmt_goods'       => ['type' => 'int', 'default' => 0, 'comment' => '商品促销优惠'], //
            'pmt_order'       => ['type' => 'int', 'default' => 0, 'comment' => '订单促销优惠'], //
            'payed'       => ['type' => 'int', 'default' => 0, 'comment' => '订单支付金额'], //订单支付金额
            'cost_freight'       => ['type' => 'int', 'default' => 0, 'comment' => '配送费用'], //配送费用
            'cur_rate'       => ['type' => 'int', 'default' => 0, 'comment' => '订单支付货币汇率'], //配送费用
            'score_u'       => ['type' => 'int', 'default' => 0, 'comment' => '订单使用积分'], //配送费用
            'score_g'       => ['type' => 'int', 'default' => 0, 'comment' => '订单获得积分'], //配送费用
            'pay_status'         => ['type' => 'text', 'default' => 0, 'comment' => '单价'], //
            'ship_status'   => ['type' => 'text', 'default' => 0, 'comment' => '总价'], //
            'is_delivery'       => ['type' => 'text', 'default' => 0, 'comment' => '折扣价格'], //
            'status'       => ['type' => 'int', 'default' => 1, 'comment' => '排序'], //
            'payment'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'shipping_id'       => ['type' => 'int', 'default' => 0, 'comment' => '排序'], //x
            'shipping'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'member_id'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'confirm'       => ['type' => 'int', 'default' => 1, 'comment' => '订单确认状态'], //x
            'ship_area'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'ship_name'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'weight'       => ['type' => 'int', 'default' => 0, 'comment' => '排序'], //x
            'tostr'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'itemnum'       => ['type' => 'int', 'default' => 1, 'comment' => '排序'], //x
            'ship_addr'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'ship_zip'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'ship_tel'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'ship_email'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'ship_time'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'ship_mobile'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'is_tax'       => ['type' => 'int', 'default' => 1, 'comment' => '排序'], //x
            'tax_type'       => ['type' => 'int', 'default' => 1, 'comment' => '排序'], //x
            'tax_content'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'cost_tax'       => ['type' => 'int', 'default' => 0, 'comment' => '排序'], //x
            'tax_company'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'extend'       => ['type' => 'text', 'default' => null, 'comment' => '订单扩展'], //x
            'addon'       => ['type' => 'text', 'default' => null, 'comment' => '订单附属信息(序列化)'], //x
            'memo'       => ['type' => 'text', 'default' => null, 'comment' => '订单附言'], //x
            'mark_type'       => ['type' => 'text', 'default' => null, 'comment' => '订单备注图标'], //x
            'mark_text'       => ['type' => 'text', 'default' => null, 'comment' => '订单备注'], //x
            'disabled'       => ['type' => 'int', 'default' => 1, 'comment' => ''], //x
            'ip'            => ['type' => 'text', 'default' => null, 'comment' => '排序'], //x
            'adduser'        => ['type' => 'text', 'required' => false, 'default' => '', 'comment' => '添加人'], //
            'addtime'        => ['type' => 'int', 'required' => false, 'default' => '', 'comment' => '添加时间'], //
            'upuser'         => ['type' => 'text', 'default' => 0, 'comment' => '更新人'], //
            'uptime'         => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'], //
            'deltime'         => ['type' => 'int', 'default' => 0, 'comment' => '删除时间'], //
            'deluser'         => ['type' => 'int', 'default' => 0, 'comment' => '删除人'], //
        ],
        $status = [
            '1' => '激活中',
            '2' => '过期/作废',
            '3' => '已完成',
        ],
        $confirm = [
            '1' => '未确认',
            '2' => '已确认',
        ],
        $is_tax = [
            '1' => '不开发票',
            '2' => '需要发票',
        ],
        $tax_type = [
            '1' => '无',
            '2' => '个人',
            '3' => '公司',
        ],
        $disabled = [
            '1' => '启用',
            '2' => '禁用',
        ];


    /**
     *  订单状态
     */
    const STATUS_ACTION = 1;
    const STATUS_DEAD   = 2;
    const STATUS_FINISH = 3;


    /**
     * 利用雪花算法生成一个分布式的唯一ID
     * @Author   GangGuoer
     * @DateTime 2019-10-31T00:22:37+0700
     * @version  [version]
     * @param    integer
     * @return   [type]
     */
    public static function create_qrcode($len = 32)
    {
        $id = \sephp\core\lib\snowflake::instance(1)->id();
        return func::random('alnum', 5) . $id . func::random('alnum', 5);
    }


}
