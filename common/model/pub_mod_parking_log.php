<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;
use sephp\core\pub_mod_parking_setting;

/**
 * 商品model
 * @ClassName: pub_mod_goods
 * @Author: Gangkui
 * @Date: 2019-02-20 14:09:02
 */
class pub_mod_parking_log extends pub_mod_model
{
    public static
        $_table        = '#PB#_parking_log',
        $_pk           = 'parking_log_id',
        $_fields       = [
                'parking_log_id'=> ['type' => 'int','required' => false, 'comment' => '商品ID'],
                'member_id'     => ['type' => 'text', 'required' => true, 'comment' => '停车场所属人'],
                'car_num'      => ['type' => 'text', 'required' => true, 'comment' => '车牌号码'],
                'come_in_time'  => ['type' => 'text', 'required' => true, 'comment' => '停车时间'],
                'come_out_time' => ['type' => 'int', 'default' => 0, 'comment' => '离开时间'],
                'status'        => ['type' => 'int', 'default' => 0, 'comment' => '状态'],
                'amount'        => ['type' => 'int', 'default' => 0, 'comment' => '停车总价'],
                'amount_formula'=> ['type' => 'int', 'default' => 1, 'comment' => '价格公式'],
                'setting_id'    => ['type' => 'int', 'default' => 1, 'comment' => '停车场设置ID'],
                'adduser'       => ['type' => 'text', 'required' => false, 'default' => '', 'comment' => '添加人'],
                'addtime'       => ['type' => 'int', 'required' => false, 'default' => '', 'comment' => '添加时间'],
                'upuser'        => ['type' => 'text', 'default' => 0, 'comment' => '更新人'],
                'uptime'        => ['type' => 'int', 'default' => 0, 'comment' => '更新时间'],
                'deltime'       => ['type' => 'int', 'default' => 0, 'comment' => '删除时间'],
                'deluser'       => ['type' => 'text', 'default' => 0, 'comment' => '删除人'],
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
    public static function add($conds, &$parking_log_id = 0)
    {
        $conds['addtime'] = TIME_SEPHP;
        $conds['status']  = 1;
        $conds['adduser'] = empty(sephp::$_uid) ? 0 : sephp::$_uid;
        $data_filter = func::data_filter(self::$_fields, $conds);

        $result = 0;

        do{
            if(!is_array($data_filter))
            {
                $result = -1;
                break;
            }
            $data_filter[pub_mod_parking_setting::$_pk] =
                pub_mod_parking_setting::getdata_by_member_id($data_filter['member_id'], pub_mod_parking_setting::$_pk);


            if(false === list(,$parking_log_id) = self::insert($data_filter))
            {
                $result = -2;
                break;
            }

        }while(false);


        return $result;
    }


    /**
     * 新增
     * @Author   GangKui
     * @DateTime 2019-11-14
     * @param    [type]     $conds [description]
     */
    public static function up($conds, &$parking_id = 0)
    {
        $conds['uptime'] = TIME_SEPHP;
        $conds['upuser'] = empty(sephp::$_uid) ? 0 : sephp::$_uid;
        $conds['status'] = 2;

        $data_filter = func::data_filter(self::$_fields, $conds);

        $result = 0;

        do{
            if(!is_array($data_filter))
            {
                $result = -1;
                break;
            }

            foreach ([pub_mod_parking_setting::$_pk, 'car_num', 'member_id'] as $f)
            {
                if(empty($data_filter[$f]))
                {
                    $result = -2;
                    break 2;
                }
                $where[$f] = $data_filter[$f];
            }

            if(false === self::update($data_filter,$where))
            {
                $result = -3;
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
    public static function getdatabyid($member_id)
    {
        return self::getdump([
            'where'    => ['member_id', '=', $member_id]
        ]);
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
