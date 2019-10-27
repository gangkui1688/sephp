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

class pub_mod_order_check_out extends pub_mod_model
{
    public static
        $_table  = '#PB#_order_check_out_log',
        $_pk     = 'log_id',
        $_fields = [
            'log_id'        => ['type' => 'int',  'required' => true, 'comment' => '日志ID'],
            'type'          => ['type' => 'text', 'required' => true, 'comment' => '类型'],
            'check_out_sn'  => ['type' => 'text', 'required' => true, 'comment' => '核销编码'],
            'status'      => ['type' => 'text', 'required' => true, 'comment' => '核销结果'],
            'addip'      => ['type' => 'text', 'required' => true, 'comment' => '核销IP地址'],
            'adduser'     => ['type' => 'text', 'required' => false, 'default' => 0, 'comment' => '添加人'],
            'addtime'     => ['type' => 'int', 'required' => false, 'default' => 0, 'comment' => '添加时间'],
        ],
        $status = [
            '1' => '核销成功',
            '2' => '核销失败',
        ],
        $type = [
            '1' => 'APP核销',
            '2' => '闸机核销',
            '3' => '后台核销',
        ];


    /**
     * 数据格式化
     * @Author   GangGuoer
     * @DateTime 2019-10-27T17:25:13+0700
     * @version  [version]
     * @param    [type]
     * @return   [type]
     */
    public function data_format($data)
    {
        if(isset($data['status']))
        {
            $data['show_status'] = self::$status[$data['status']];
        }

        if(isset($data['type']))
        {
            $data['show_type'] = self::$type[$data['type']];
        }

        return $data;
    }


}
