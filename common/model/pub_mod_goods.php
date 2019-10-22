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

class pub_mod_goods extends pub_mod_model
{
    public static
        $table        = '#PB#_goods',
        $pk           = 'goods_id',
        $cache_use    = false,
        $cache_time   = 3600,
        $error_msg    = null,
        $transaction  = true,
        $fields       = [
                'goods_id'      => ['type' => 'text', 'required' => true, 'comment' => '商品ID'], //订单号
                'goods_sn'      => ['type' => 'int', 'required' => true, 'comment' => '商品编号'], //服务id
                'name'          => ['type' => 'text', 'default' => '', 'comment' => '商品名称'], //申请人
                'brand_id'      => ['type' => 'int', 'default' => 0, 'comment' => '商品品牌'], //申请人
                'cate_id'        => ['type' => 'int', 'default' => 0, 'comment' => '商品分类'], //申请人
                'type_id'        => ['type' => 'int', 'default' => 0, 'comment' => '商品类型'], //申请人
                'marketable'    => ['type' => 'int', 'default' => 1, 'comment' => '上下架'], //申请金额
                'store'         => ['type' => 'int', 'default' => 0, 'comment' => '库存'], //
                'p_order'         => ['type' => 'int', 'default' => 0, 'comment' => '排序'], //
                'cost'             => ['type' => 'text', 'default' => 0, 'comment' => '成本价'], //
                'mktprice'         => ['type' => 'text', 'default' => 0, 'comment' => '市场价'], //
                'weight'           => ['type' => 'text', 'default' => 0, 'comment' => '重量'], //
                'unit'             => ['type' => 'text', 'default' => 0, 'comment' => '单位'], //
                'brief'            => ['type' => 'text', 'default' => 0, 'comment' => '商品简介'], //
                'image_default_id' => ['type' => 'text', 'default' => 0, 'comment' => '默认图片'], //
                'min_buy'          => ['type' => 'text', 'default' => 0, 'comment' => '起定量'], //
                'store_place'      => ['type' => 'text', 'default' => 0, 'comment' => '库位'], //
                'goods_setting'    => ['type' => 'text', 'default' => 0, 'comment' => '商品设置'], //
                'big_pic'          => ['type' => 'text', 'default' => 0, 'comment' => '大图'], //
                'small_pic'        => ['type' => 'text', 'default' => 0, 'comment' => '小图'], //
                'intro'            => ['type' => 'text', 'default' => 0, 'comment' => '详细介绍'], //
                'nostore_sell'     => ['type' => 'text', 'default' => 0, 'comment' => '是否开启无库存销售'], //
                'comments_count'   => ['type' => 'text', 'default' => 0, 'comment' => '评论次数'], //申请金额
                'view_count'       => ['type' => 'text', 'default' => 0, 'comment' => '浏览次数'], //申请金额
                'buy_count'        => ['type' => 'text', 'default' => 0, 'comment' => '购买次数'], //申请金额
                'adduser'          => ['type' => 'text', 'required' => false, 'default' => '', 'comment' => '添加人'],
                'addtime'          => ['type' => 'int', 'required' => false, 'default' => '', 'comment' => '添加时间'],
                'upuser'           => ['type' => 'text', 'default' => 0, 'comment' => '更新人'],
                'uptime'           => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'],
            ],
        $marketable = [
            '1' => '上架',
            '2' => '下架',
        ];


    /**
     * @var int 订单过期时间
     */
    public static $status_expire_time = 300;

    /**
     * 订单 对应的 queue_id 缓存
     */
    const ORDER_QUEUE_CACHE = 'order_queue_cache_v1_';



    /**
     * 创建商品编号
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @return   [type]     [description]
     */
    public static function create_sn()
    {
        return date("ymdHis") . func::random('distinct', 5);
    }
}
