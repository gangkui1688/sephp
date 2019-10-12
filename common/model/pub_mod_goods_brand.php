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
 品牌lassName: pub_mod_goods
 * @Author: Gangkui
 * @Date: 2019-02-20 14:09:02
 */

class pub_mod_goods_brand extends pub_mod_model
{
    public static
        $table  = '#PB#_goods_brand',
        $pk     = 'brand_id',
        $fields = [
            'brand_id'       => ['type' => 'int',  'required' => true, 'comment' => '品牌ID'], //订单号
            'brand_name'     => ['type' => 'text', 'required' => true, 'comment' => '品牌名称'], //服务id
            'brand_url'      => ['type' => 'text', 'default' => null, 'comment' => '品牌URL地址'], //申请人
            'brand_desc'     => ['type' => 'text', 'default' => null, 'comment' => '品牌描述'], //申请金额
            'brand_logo'     => ['type' => 'text', 'default' => null, 'comment' => '品牌LOG'], //申请金额
            'brand_keywords' => ['type' => 'text', 'default' => null, 'comment' => '品牌关键字'], //申请金额
            'brand_setting'  => ['type' => 'text', 'default' => null, 'comment' => '品牌设置'], //申请金额
            'disabled'       => ['type' => 'text', 'default' => 1, 'comment' => '开关'], //申请金额
            'ordernum'       => ['type' => 'text', 'default' => null, 'comment' => '排序'], //申请金额
            'adduser'         => ['type' => 'text', 'required' => true, 'default' => null, 'comment' => '添加人'], //申请金额
            'addtime'        => ['type' => 'text', 'required' => true, 'default' => null, 'comment' => '添加时间'], //申请金额
            'upuser'         => ['type' => 'text', 'default' => 0, 'comment' => '更新人'], //申请金额
            'uptime'         => ['type' => 'text', 'default' => 0, 'comment' => '更新时间'], //申请金额
        ],

        $disabled = [
            '1' => '启用',
            '2' => '禁用',
        ];
}
