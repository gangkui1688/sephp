<?php
namespace common\serv;

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
    public static function add_order($data, $order_info = [])
    {
        $result = 0;
        pub_mod_order::db_start();

        do{

            //订单主表数据
            $order_post = func::data_filter(pub_mod_order::$_fields, $data);

            print_r($order_post);exit;
            if(!is_array($order_post))
            {
                $result = -10000;
                break;
            }


            foreach ($data_filter['goods'] as $goods)
            {

            }





            //订单明细表数据
            $order_item_post = func::data_filter(pub_mod_order::$_fields, $data['goods']);
            if(!is_array($order_item_post))
            {
                $result = -10001;
                break;
            }


        }while(false);

        0 > $result ? pub_mod_order::db_rollback() : pub_mod_order::db_commit();
        pub_mod_order::db_end();
        return $result;
    }

}
