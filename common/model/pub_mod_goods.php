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
        $_table        = '#PB#_goods',
        $_pk           = 'goods_id',
        $_fields       = [
                'goods_id'      => ['type' => 'int','required' => true, 'comment' => '商品ID'],
                'goods_sn'      => ['type' => 'text', 'required' => true, 'comment' => '商品编号'],
                'name'          => ['type' => 'text', 'default' => '', 'comment' => '商品名称'],
                'brand_id'      => ['type' => 'int', 'default' => 0, 'comment' => '商品品牌'],
                'cate_id'        => ['type' => 'int', 'default' => 0, 'comment' => '商品分类'],
                'type_id'        => ['type' => 'int', 'default' => 0, 'comment' => '商品类型'],
                'marketable'    => ['type' => 'int', 'default' => 1, 'comment' => '上下架'],
                'store'         => ['type' => 'int', 'default' => 0, 'comment' => '库存'],
                'p_order'         => ['type' => 'int', 'default' => 0, 'comment' => '排序'],
                'cost'             => ['type' => 'text', 'default' => 0, 'comment' => '成本价'],
                'mktprice'         => ['type' => 'text', 'default' => 0, 'comment' => '市场价'],
                'score'            => ['type' => 'text', 'default' => 0, 'comment' => '积分'],
                'weight'           => ['type' => 'text', 'default' => 0, 'comment' => '重量'],
                'unit'             => ['type' => 'text', 'default' => null, 'comment' => '单位'],
                'brief'            => ['type' => 'text', 'default' => null, 'comment' => '商品简介'],
                'image_default_id' => ['type' => 'text', 'default' => null, 'comment' => '默认图片'],
                'min_buy'          => ['type' => 'text', 'default' => 0, 'comment' => '起定量'],
                'store_place'      => ['type' => 'text', 'default' => 0, 'comment' => '库位'],
                'goods_setting'    => ['type' => 'text', 'default' => null, 'comment' => '商品设置'],
                'big_pic'          => ['type' => 'text', 'default' => null, 'comment' => '大图'],
                'small_pic'        => ['type' => 'text', 'default' => null, 'comment' => '小图'],
                'intro'            => ['type' => 'text', 'default' => null, 'comment' => '详细介绍'],
                'nostore_sell'     => ['type' => 'int', 'default' => 0, 'comment' => '是否开启无库存销售'],
                'comments_count'   => ['type' => 'int', 'default' => 0, 'comment' => '评论次数'],
                'view_count'       => ['type' => 'int', 'default' => 0, 'comment' => '浏览次数'],
                'buy_count'        => ['type' => 'int', 'default' => 0, 'comment' => '购买次数'],
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
     * 创建商品编号
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @return   [type]     [description]
     */
    public static function create_sn()
    {
        return date("ymdHis") . func::random('distinct', 5);
    }


    /**
     * 根据id获取商品信息
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @param    [type]     $goods_id [description]
     * @return   [type]               [description]
     */
    public static function getdatabyid($goods_id)
    {
        $data = self::getdump([
            'where'    => [self::$_pk => $goods_id]
        ]);

        return self::data_format($data);
    }

    /**
     *  数据格式化
     * @Author   GangKui
     * @DateTime 2019-10-23
     * @param    [type]     $data [description]
     * @return   [type]           [description]
     */
    public static function data_format($data = [])
    {
        if(empty($data)) return $data;

        if(isset($data['marketable']))
        {
            $data['show_marketable'] = self::$marketable[$data['marketable']];
        }

        if(isset($data['intro']))
        {
            $data['intro'] = html_entity_decode(html_entity_decode(($data['intro'])));
        }

        if(isset($data['image_default_id']))
        {
            $data['image_default_id'] = json_decode($data['image_default_id']);
            array_walk($data['image_default_id'], function(&$v){ $v = sephp::$_config['upload']['filelink'].'/image/'.$v; });
        }
        //print_r($data);exit;
        return $data;
    }
}
