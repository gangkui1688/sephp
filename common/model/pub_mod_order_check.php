<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;

/**
 * 订单核销
 * @ClassName: pub_mod_goods
 * @Author: Gangkui
 * @Date: 2019-02-20 14:09:02
 */
class pub_mod_order_check extends pub_mod_model
{
    public static
        $_table  = '#PB#_order_check_log',
        $_pk     = 'log_id',
        $_fields = [
            'log_id'        => ['type' => 'int',  'required' => false, 'comment' => '日志ID'],
            'order_id'      => ['type' => 'int',  'default' => 0, 'comment' => '订单ID'],
            'type'          => ['type' => 'int', 'required' => true, 'comment' => '类型'],
            'check_str'     => ['type' => 'text', 'required' => true, 'comment' => '核销编码'],
            'status'        => ['type' => 'int', 'required' => true, 'comment' => '核销结果'],
            'request_data'  => ['type' => 'text', 'required' => false, 'comment' => '请求数据'],
            'addip'         => ['type' => 'text', 'required' => true, 'comment' => '核销IP地址'],
            'adduser'       => ['type' => 'text', 'required' => false, 'default' => 0, 'comment' => '添加人'],
            'addtime'       => ['type' => 'int', 'required' => false, 'default' => 0, 'comment' => '添加时间'],
            'deluser'       => ['type' => 'text', 'required' => false, 'default' => 0, 'comment' => '添加人'],
            'deltime'       => ['type' => 'int', 'required' => false, 'default' => 0, 'comment' => '添加时间'],
        ],
        $status = [
            '1' => '核销成功',
            '2' => '核销失败',
        ],
        $type = [
            '1' => 'APP核销',
            '2' => '闸机核销',
            '3' => '后台核销',
            '4' => '微信核销',
        ];

    /**
     * 新增核销记录
     * @Author   GangKui
     * @DateTime 2019-11-12
     * @param    [type]     $conds [description]
     */
    public static function add($conds)
    {
        $result = 0;

        $conds['adduser'] = sephp::$_uid;
        $conds['addtime'] = TIME_SEPHP;

        $data_filter = func::data_filter(self::$_fields, $conds);
        unset($data_filter[self::$_pk]);
        do{
            if(!is_array($data_filter))
            {
                $result = -1;
                break;
            }

            if(false === self::insert($data_filter))
            {
                $result = -2;
                break;
            }

        }while(false);

        return $result;
    }


    /**
     * 获取列表
     * @Author   GangKui
     * @DateTime 2019-11-15
     * @return   [type]     [description]
     */
    public static function getlist_by_where($conds = [])
    {
        $data_filter = func::data_filter([
            'page_size' => ['type' => 'int', 'default' => 15],
            'page'      => ['type' => 'int', 'default' => 1],
            'uid'       => ['type' => 'text', 'default' => 0],
            'total'     => ['type' => 'bool', 'default' => false],
        ], $conds);

        $where[] = [self::$_table . '.deltime', '=', 0];

        if(!empty($data_filter['uid']))
        {
            $where[] = [self::$_table . '.adduser', '=', $data_filter['uid']];
        }

        $list = self::getlist([
            'page'      => $data_filter['page'],
            'page_size' => $data_filter['page_size'],
            'where'     => $where,
            'page'      => $data_filter['page'],
            'total'     => $data_filter['total']
        ]);

        return $list;
    }

    /**
     * 格式化数据
     * @Author   GangKui
     * @DateTime 2019-11-15
     * @param    [type]     $data [description]
     * @return   [type]           [description]
     */
    public static function data_format($data)
    {
        $tmp = is_array(reset($data)) ? $data : [$data];

        foreach ($tmp as &$v)
        {
            if(!empty($v['addtime']))
            {
                $v['show_addtime'] = date('Y-m-d H:i:s', $v['addtime']);
            }

            if(!empty($v['status']))
            {
                $v['show_status'] = self::$status[$v['status']];
            }
        }

        return is_array(reset($data)) ? $tmp : reset($tmp);
    }


}
