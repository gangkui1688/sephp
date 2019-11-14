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
class pub_mod_parking_setting extends pub_mod_model
{
    public static
        $_table        = '#PB#_parking_setting',
        $_pk           = 'parking_id',
        $_fields       = [
                'parking_id'    => ['type' => 'int','required' => false, 'comment' => '商品ID'],
                'member_id'     => ['type' => 'text', 'required' => true, 'comment' => '停车场所属人'],
                'parking_name'  => ['type' => 'text', 'default' => '', 'comment' => '停车场名称'],
                'parking_addr'  => ['type' => 'text', 'default' => '', 'comment' => '停车场地址'],
                'pay_type'      => ['type' => 'int', 'default' => 0, 'comment' => '支付方式'],
                'max_amount'    => ['type' => 'int', 'default' => 0, 'comment' => '最高价格'],
                'min_amount'    => ['type' => 'int', 'default' => 0, 'comment' => '最低价格'],
                'hour_money'    => ['type' => 'int', 'default' => 1, 'comment' => '每小时单价'],
                'status'        => ['type' => 'int', 'default' => 1, 'comment' => '状态'],
                'adduser'       => ['type' => 'text', 'required' => false, 'default' => '', 'comment' => '添加人'],
                'addtime'       => ['type' => 'int', 'required' => false, 'default' => '', 'comment' => '添加时间'],
                'upuser'        => ['type' => 'text', 'default' => 0, 'comment' => '更新人'],
                'uptime'        => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'],
                'deltime'       => ['type' => 'int', 'default' => 0, 'comment' => '删除时间'],
                'deluser'       => ['type' => 'text', 'default' => 0, 'comment' => '删除人'],
            ],
        $pay_type = [
            '1' => '按次收费',
            '2' => '按时长计费',
        ],
        $status = [
            '1' => '启用',
            '2' => '禁用',
        ];

    /**
     * 新增
     * @Author   GangKui
     * @DateTime 2019-11-14
     * @param    [type]     $conds [description]
     */
    public static function add($conds, &$parking_id = 0)
    {
        $conds['addtime'] = TIME_SEPHP;
        $conds['adduser'] = sephp::$_uid;

        $data_filter = func::data_filter(self::$_fields, $conds);

        $result = 0;

        do{
            if(!is_array($data_filter))
            {
                $result = -1;
                break;
            }

             $dups = [
                'uptime' => TIME_SEPHP,
                'upuser' => sephp::$_uid,
            ];

            foreach(pub_mod_goods::$_fields as $f => $conf)
            {
                //跟新不能修改状态和新增时间
                if(in_array($f, ['parking_id','member_id', 'addtime', 'adduser']))
                {
                    continue;
                }
                $dups[$f] = " VALUES(`{$f}`) ";
            }

            if(false === self::insert($data_filter, ['dups' => $dups]))
            {
                $result = -2;
                break;
            }

        }while(false);


        return $result;
    }

    /**
     * 根据id获取商品信息
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @param    [type]     $goods_id [description]
     * @return   [type]               [description]
     */
    public static function getdata_by_member_id($member_id, $fields = '')
    {
        $data = self::getdump([
            'where'    => ['member_id', '=', $member_id]
        ]);

        return empty($fields) ? $data : $data[$fields];
    }

    /**
     *  数据格式化
     * @Author   GangKui
     * @DateTime 2019-10-23
     * @param    [type]     $data [description]
     * @return   [type]           [description]
     */
    public static function data_format($data)
    {
        if(!is_array($data)) return $data;
        $tmp = is_array(reset($data)) ? $data : [$data];

        foreach ($tmp as &$v)
        {
            if(isset($v['marketable']))
            {
                $v['show_marketable'] = self::$marketable[$v['marketable']];
            }

            if(isset($v['intro']))
            {
                $v['intro'] = html_entity_decode(html_entity_decode(($v['intro'])));
            }

            if(isset($v['image_default_id']) && !empty($v['image_default_id']))
            {
                $v['image_default_id'] = json_decode($v['image_default_id'], true);
                array_walk($v['image_default_id'], function(&$v){ $v = sephp::$_config['upload']['filelink'].'/image/'.$v; });
            }

            if(!empty($v['currency']))
            {
                $v['show_currency'] = self::$currency[$v['currency']];
            }

        }

        return is_array(reset($data)) ? $tmp : reset($tmp);
    }
}
