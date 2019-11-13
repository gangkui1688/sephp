<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;

/**
 * 会员model
 * @ClassName: pub_mod_goods
 * @Author: Gangkui
 * @Date: 2019-02-20 14:09:02
 */

class pub_mod_order_log extends pub_mod_model
{
    public static
        $_table  = '#PB#_order_log',
        $_pk     = 'log_id',
        $_fields = [
            'log_id'     => ['type' => 'int',  'required' => false, 'comment' => '日志ID'],
            'rel_id'     => ['type' => 'text', 'required' => false, 'comment' => '对象ID'],
            'op_type'     => ['type' => 'text', 'default' => 0, 'comment' => '操作方式'],
            'behavior'   => ['type' => 'text', 'default' => null, 'comment' => '操作行为'],
            'result'   => ['type' => 'text', 'default' => 0, 'comment' => '日志结果'],
            'log_text' => ['type' => 'text', 'default' => 0, 'comment' => '日志内容'],
            'addon'  => ['type' => 'text', 'default' => 0, 'comment' => '序列化数据'],
            'addip'      => ['type' => 'text', 'default' => null, 'comment' => '操作人ip'],
            'addname'      => ['type' => 'text', 'default' => null, 'comment' => '操作人名称'],
            'addtime'  => ['type' => 'text', 'default' => null, 'comment' => '操作时间'],
            'adduser'     => ['type' => 'text', 'default' => null, 'comment' => '操作人uid'],
        ],
        $op_type = [
            'order','recharge','joinfee','prepaid_recharge'
        ],
        $behavior = [
            'creates','updates','payments','refunds','delivery','reship','finish','cancel'
        ],
        $result = [
            'SUCCESS','FAILURE'
        ];

        /**
         * 新增日志
         * @Author   GangKui
         * @DateTime 2019-11-05
         * @param    [type]     $data [description]
         */
        public static function add($data)
        {
            $data['addip']   = func::get_client_ip();
            $data['addtime'] = TIME_SEPHP;
            $data['addname'] = sephp::$_user['username'];
            $data['adduser'] = sephp::$_uid;

            $insert_data = func::data_filter(self::$_fields, $data);

            if(!is_array($insert_data))
            {
                return false;
            }
            return self::insert($insert_data);
        }
}
