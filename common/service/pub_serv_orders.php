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
            if(empty($data['goods']) || !is_array($data['goods']))
            {
                $result = -10001;
                break;
            }

            $goods_ids = array_column($data['goods'], 'goods_id', 'goods_id');

            $data['qrcode']   = pub_mod_order::create_qrcode();
            $data['order_id'] = func::make_uniqid();

            //订单主表数据
            $order_post = func::data_filter(pub_mod_order::$_fields, $data);

            if(!is_array($order_post))
            {
                $result = -10002;
                break;
            }

            $goods_info = pub_mod_goods::getlist([
                'where' => [
                    [pub_mod_goods::$_pk, 'in' , array_values($goods_ids)]
                ]
            ]);
            $goods_info = array_column($goods_info, null, 'goods_id');



            $order_item = [];
            foreach ($data['goods'] as $goods)
            {
                print_r($goods);exit;
                $order_item['order_id']  = [
                    'order_id'      => $order_post['order_id'],
                    'goods_id'      => $goods['goods_id'],
                    'price'         => $goods['price'],
                    'nums'          => $goods['member_buy_num'],
                    'price'         => $goods['price'],
                    'amount'        => $goods['price'] * $goods['member_buy_num'],
                    'price'         => $goods['price'],
                    'goods_params'  => $goods_info[$goods['goods_id']],
                    'goods_name'    => $goods_info[$goods['goods_id']]['name'],
                    'goods_sn'      => $goods_info[$goods['goods_id']]['goods_sn'],
                    'cost'          => $goods_info[$goods['goods_id']]['cost'],
                    'adduser'       => 0,
                    'addtime'       => TIME_SEPHP,
                    'upuser'        => 0,
                    'uptime'        => TIME_SEPHP
                ];

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



    public static function check_order($num)
    {
        $result = 0;
        pub_mod_order::db_start();

        do{
            if(32 !== strlen($num))
            {
                $result = -11000;
                break;
            }






        }while(false);

        0 > $result ? pub_mod_order::db_rollback() : pub_mod_order::db_commit();
        pub_mod_order::db_end();

        return $result;
    }

}
