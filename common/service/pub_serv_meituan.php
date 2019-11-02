<?php
namespace common\serv;

use sephp\sephp;
use sephp\func;
use common\model\pub_mod_order;
use common\model\pub_mod_order_items;
use sephp\core\lib\curl;

/**
 * 美团订接口
 * erro_no 10000 - 19999
 */
class pub_serv_meituan
{


    /**
     * 订的核销
     * @Author   GangGuoer
     * @DateTime 2019-11-02T01:37:14+0700
     * @version  [version]
     * @param    [type]
     * @return   [type]
     */
    public static function check_order($meituan_order_id)
    {
        $url = "https://openapi.dianping.com/router/book/isvconsume";
        $data = [
            'order_id' => '',//开放平台订单id
            'app_shop_id' => '',//第三方的店铺id，不提倡使用
            'open_shop_uuid' => '',//美团点评店铺id
            'session' => '',//商家授权成功后，点评到综开放平台颁发给应用的授权信息
            'order_id' => '',
        ];
    }

    /**
     * 系统授权session获取接口
     * @Author   GangGuoer
     * @DateTime 2019-11-02T01:38:20+0700
     * @version  [version]
     * @return   [type]
     */
    public static function get_session()
    {
        $url = "https://openapi.dianping.com/router/oauth/token";
        $data = [
            'app_key' => '',
            'app_secret' => '',
            'grant_type' => 'authorize_platform',
        ];

        $tmp = curl::http_request([
            'url' => $url,
            'post' => $data,
        ]);


    }


}
