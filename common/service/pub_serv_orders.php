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
            $data['order_id'] = func::make_uniqid(true);
            $data['order_sn'] = func::random('capital', 4) . func::make_uniqid();

            $goods_info = pub_mod_goods::getlist([
                'where' => [
                    [pub_mod_goods::$_pk, 'in' , array_values($goods_ids)],
                    ['marketable', '=' , 1],
                ]
            ]);

            $goods_info = array_column($goods_info, null, 'goods_id');

            $order_item = [];
            $total_amount = 0;
            foreach ($data['goods'] as $goods)
            {
                $order_item['order_id']  = [
                    'order_id'      => $data['order_id'],
                    'goods_id'      => $goods['goods_id'],
                    'price'         => $goods['price'],
                    'nums'          => $goods['member_buy_num'],
                    'currency'      => $goods_info[$goods['goods_id']]['currency'],
                    'amount'        => $goods['price'] * $goods['member_buy_num'],
                    'price'         => $goods['price'],
                    'goods_params'  => serialize($goods_info[$goods['goods_id']]),
                    'goods_name'    => $goods_info[$goods['goods_id']]['name'],
                    'cost'          => $goods_info[$goods['goods_id']]['cost'],
                    'adduser'       => sephp::$_uid,
                    'addtime'       => TIME_SEPHP,
                    'upuser'        => sephp::$_uid,
                    'uptime'        => TIME_SEPHP
                ];

                $total_amount +=  $goods['price'] * $goods['member_buy_num'];
                $currency = $goods_info[$goods['goods_id']]['currency'];
            }
            $data['total_amount'] = $total_amount;//商品默认货币总值
            $data['cost_item'] = $total_amount;
            $data['pmt_order'] = 0;//订单优惠
            $data['pmt_goods'] = 0;//商品优惠
            $data['discount'] = 0;//订单折扣
            $data['payed'] = $total_amount;//订单支付金额
            $data['cost_payment'] = $total_amount;
            $data['currency'] = $currency;
            $data['addon'] = serialize($data['goods']);
            $data['member_id'] = sephp::$_uid;
            $data['disabled'] = 1;
            $data['ip'] = func::get_client_ip();
            $data['status'] = pub_mod_order::STATUS_ACTION;
            $data['adduser'] = sephp::$_uid;
            $data['itemnum'] = count($goods_ids);
            $data['addtime'] = TIME_SEPHP;

            //订单主表数据
            $order_post = func::data_filter(pub_mod_order::$_fields, $data);
            if(!is_array($order_post))
            {
                $result = -10002;
                break;
            }
            if(false === pub_mod_order::insert($order_post))
            {
                $result = -10003;
                break;
            }

            if(false === pub_mod_order_items::insert($order_item))
            {
                $result = -10004;
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

    /**
     * 订单核销
     * @Author   GangKui
     * @DateTime 2019-11-11
     * @param    [type]     $qucode_str [description]
     * @return   [type]                 [description]
     */
    public static function check($qucode_str)
    {
        $result = 0;
        pub_mod_order::db_start();

        do{
            //查询订单的合法

            //检验时间是否过期


            //写入核销记录


        }while(false);

        0 > $result ?  pub_mod_order::db_rollback() : pub_mod_order::db_commit();
        pub_mod_order::db_end();

        return $result;
    }

}
