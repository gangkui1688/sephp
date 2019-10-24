<?php
namespace common\service;

use sephp\sephp;
use sephp\func;
use common\model\pub_mod_order;
use common\model\pub_mod_order_items;
use common\model\pub_mod_goods;

/**
 * 订单服务
 * erro_no 10000 - 19999
 */
class pub_serv_orders
{
    public static
        $error_msg = null;

    /**
     * 下订单
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @param    [type]     $data       [description]
     * @param    array      $order_info [description]
     * @return   [type]                 [description]
     */
    public static function post_order($data, $order_info = [])
    {
        $result = 0;


        do{

            //订单主表数据
            $order_post = func::data_filter(pub_mod_order::$_fields, $data);

            if(!is_array($order_post))
            {
                $result = -10000;
                break;
            }

            //订单明细表数据
            $order_item_post = func::data_filter(pub_mod_order::$_fields, $data['goods']);
            if(!is_array($order_item_post))
            {
                $result = -10001;
                break;
            }


        }while(false);

        return $result;
    }

}
