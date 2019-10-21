<?php
namespace common\model;

use sephp\sephp;
use sephp\func;
use sephp\core\log;
use sephp\core\db;
use sephp\core\cache;
use sephp\core\config;


class pub_mod_image extends pub_mod_model
{
    public static $_table = '#PB#_image',
    $_pk                  = 'image_id',
    $_cache_use           = true,
    $_cache_time          = 3600,
    $_error_msg           = null,
    $_transaction         = true,
    $_rule_field          = [
            'image_id'      => ['type' => 'text', 'required' => true, 'comment' => '商品ID'], //订单号
            'image_name'    => ['type' => 'text', 'required' => false, 'comment' => '图片名称'], //服务id
            'storage'       => ['type' => 'text', 'default' => 'file', 'comment' => '存储引擎'], //申请人
            'url'           => ['type' => 'text', 'default' => 0, 'comment' => '网址'], //
            'l_url'         => ['type' => 'text', 'default' => 0, 'comment' => '大图'], //
            'm_url'         => ['type' => 'text', 'default' => 0, 'comment' => '中图'], //
            's_url'         => ['type' => 'text', 'default' => 0, 'comment' => '小图'], //
            'height'        => ['type' => 'text', 'default' => 0, 'comment' => '高'], //
            'width'         => ['type' => 'text', 'default' => 0, 'comment' => '宽'], //
            'watermark'     => ['type' => 'text', 'default' => 0, 'comment' => '是否有水印'], //
            'addtime'       => ['type' => 'text', 'default' => time(), 'comment' => '添加时间'], //
            'uptime'        => ['type' => 'text', 'default' => time(), 'comment' => '更新时间'], //
        ];

    public static $storage = [
        'file'  => '本地文件存储',
        'url'   => '网络url引用',
        'ftp'   => '',
    ];


    /**
     * 获取图片地址
     * @Author   GangKui
     * @DateTime 2019-10-17
     * @param    [type]     $image_id [description]
     * @param    string     $type     [description]
     * @return   [type]               [description]
     */
    public static function get_url($image_id, $type = '')
    {
        if(self::$_cache_use)
        {
            $cache_key = __CLASS__ . __METHOD__ . $image_id . $type ;
            $data = cache::get($cache_key);
            if(!empty($data))
            {
                return $data;
            }
        }

        switch ($type)
        {
            case 'l':
                $field = 'l_url';
                // code...
                break;
            case 'm':
                $field = 'm_url';
                // code...
                break;
            case 's':
                $field = 's_url';
                // code...
                break;

            default:
                // code...
                $field = 'url';
                break;
        }

        $info = self::getdump([
            'field' => $field,
            'where' => [
                self::$pk => $image_id,
            ]
        ]);

        $data = empty($info[$field]) ? false : $info[$field];

        if(self::$_cache_use)
        {
            cache::set($cache_key, $data, self::$_cache_time);
        }

        return $data;
    }

}
