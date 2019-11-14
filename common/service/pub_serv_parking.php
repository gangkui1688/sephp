<?php
namespace common\serv;

use sephp\sephp;
use sephp\func;
use common\model\pub_mod_parking_setting;
use common\model\pub_mod_parking_log;

/**
 * 停车场
 * erro_no 20000 - 29999
 */
class pub_serv_orders
{
    public static
        $_error_msg = null;

    /**
     * 停车
     * @Author   GangKui
     * @DateTime 2019-10-24
     * @param    [type]     $data       [description]
     * @param    array      $order_info [description]
     * @return   [type]                 [description]
     */
    public static function come_in($data, $order_info = [])
    {
        $result = 0;
        pub_mod_parking_setting::db_start();

        do{



        }while(false);

        0 > $result ? pub_mod_parking_setting::db_rollback() : pub_mod_parking_setting::db_commit();
        pub_mod_parking_setting::db_end();

        return $result;
    }

    /**
     * 订单核销
     * @Author   GangKui
     * @DateTime 2019-11-11
     * @param    [type]     $qucode_str [description]
     * @return   [type]                 [description]
     */
    public static function come_out($data, &$order_info = [])
    {
        $result = 0;

        $data_filter = func::data_filter([
            'type'       => ['type' => 'int', 'require' => true],
            'qrcode_str' => ['type' => 'text', 'require' => true]
        ], $data);

        pub_mod_order::db_start();
        do{



        }while(false);

        0 > $result ?  pub_mod_order::db_rollback() : pub_mod_order::db_commit();
        pub_mod_order::db_end();

        return $result;
    }

}
