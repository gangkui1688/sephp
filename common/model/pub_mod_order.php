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
            'order_id'      => ['type' => 'int',  'required' => true, 'comment' => '品牌ID'],
            'order_sn'      => ['type' => 'text',  'required' => true, 'comment' => '品牌ID'],
            'qrcode'      => ['type' => 'text',  'required' => true, 'comment' => '二维码code'],
            'total_amount'      => ['type' => 'int', 'required' => true, 'comment' => '订单货币总值'],
            'cost_item'      => ['type' => 'int', 'default' => 0, 'comment' => '订单商品总价格'], //订单商品总价格
            'currency'       => ['type' => 'text', 'default' => 'CNY', 'comment' => '订单支付货币'], //订单支付货币
            'discount'       => ['type' => 'int', 'default' => 0, 'comment' => '订单减免'], //
            'pmt_goods'       => ['type' => 'int', 'default' => 0, 'comment' => '商品促销优惠'], //
            'pmt_order'       => ['type' => 'int', 'default' => 0, 'comment' => '订单促销优惠'], //
            'payed'       => ['type' => 'int', 'default' => 0, 'comment' => '订单支付金额'], //订单支付金额
            'cost_freight'       => ['type' => 'int', 'default' => 0, 'comment' => '配送费用'], //配送费用
            'cur_rate'       => ['type' => 'int', 'default' => 0, 'comment' => '订单支付货币汇率'], //配送费用
            'score_u'       => ['type' => 'int', 'default' => 0, 'comment' => '订单使用积分'], //配送费用
            'score_g'       => ['type' => 'int', 'default' => 0, 'comment' => '订单获得积分'], //配送费用
            'pay_status'         => ['type' => 'text', 'default' => 0, 'comment' => '支付状态'], //
            'ship_status'   => ['type' => 'text', 'default' => 0, 'comment' => '配送状态'], //
            'is_delivery'       => ['type' => 'text', 'default' => 0, 'comment' => '折扣价格'], //
            'status'       => ['type' => 'int', 'default' => 1, 'comment' => ''], //
            'payment'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'shipping_id'       => ['type' => 'int', 'default' => 0, 'comment' => ''], //x
            'shipping'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'member_id'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'confirm'       => ['type' => 'int', 'default' => 1, 'comment' => '订单确认状态'], //x
            'ship_area'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'ship_name'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'weight'       => ['type' => 'int', 'default' => 0, 'comment' => ''], //x
            'tostr'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'itemnum'       => ['type' => 'int', 'default' => 1, 'comment' => ''], //x
            'ship_addr'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'ship_zip'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'ship_tel'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'ship_email'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'ship_time'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'ship_mobile'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'is_tax'       => ['type' => 'int', 'default' => 1, 'comment' => ''], //x
            'tax_type'       => ['type' => 'int', 'default' => 1, 'comment' => ''], //x
            'tax_content'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'cost_tax'       => ['type' => 'int', 'default' => 0, 'comment' => ''], //x
            'tax_company'       => ['type' => 'text', 'default' => null, 'comment' => ''], //x
            'extend'       => ['type' => 'text', 'default' => null, 'comment' => '订单扩展'], //x
            'addon'       => ['type' => 'text', 'default' => null, 'comment' => '订单附属信息(序列化)'], //x
            'memo'       => ['type' => 'text', 'default' => null, 'comment' => '订单附言'], //x
            'mark_type'       => ['type' => 'text', 'default' => null, 'comment' => '订单备注图标'], //x
            'mark_text'       => ['type' => 'text', 'default' => null, 'comment' => '订单备注'], //x
            'disabled'       => ['type' => 'int', 'default' => 1, 'comment' => ''], //x
            'ip'            => ['type' => 'text', 'default' => null, 'comment' => ''], //x
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


    /**
     * 格式化订单数据
     * @Author   GangKui
     * @DateTime 2019-11-05
     * @param    [type]     $data [description]
     * @return   [type]           [description]
     */
    public static function data_format($data)
    {
        if(!is_array($data)) return $data;

        $tmp = is_array(reset($data)) ? $data : [$data];

        $member_ids = array_column($tmp, 'member_id');
        if(!empty($member_ids))
        {
            $member_info = pub_mod_member::getlist([
                'where' => [pub_mod_member::$_table.'.member_id' , '=', $member_ids],
                'joins'  => [
                    'type'  => 'left',
                    'table' => pub_mod_member_pam::$_table,
                    'where' => [pub_mod_member_pam::$_table.'.member_id', '=', pub_mod_member::$_table.'.member_id']
                ],
                'field' => [pub_mod_member::$_table.'.member_id','username', 'nickname', 'realname', 'mobile'],
            ]);
            $member_info = array_column($member_info, null, 'member_id');
        }

        foreach ($tmp as &$v)
        {
            if(!empty($v['addtime']))
            {
                $v['show_addtime'] = date('Y-m-d H:i', $v['addtime']);
            }

            if(!empty($v['status']))
            {
                $v['show_status'] = self::$status[$v['status']];
            }

            if(!empty($v['pay_status']))
            {
                $v['show_pay_status'] = pub_mod_payments::$status[$v['pay_status']];
            }

            if(!empty($v['member_id']) && !empty($member_info[$v['member_id']]))
            {
                $v['member_name'] = $member_info[$v['member_id']]['username'];
                $v['mobile'] = $member_info[$v['member_id']]['mobile'];
            }

        }


        return is_array(reset($data)) ? $tmp : reset($tmp);
    }



}
