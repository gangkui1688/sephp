<?php
namespace admin\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\view;
use sephp\core\lib\power;
use sephp\core\lib\pages;
use sephp\core\db;
use sephp\core\upload;
use sephp\core\show_msg;
use sephp\core\session;
use sephp\core\config;

use admin\model\mod_content;
use common\model\pub_mod_goods;
use common\model\pub_mod_goods_brand;
use common\model\pub_mod_order;


/**
 * Class ctl_index
 */
class ctl_order
{
    /**
     *  订单列表
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @return   [type]     [description]
     */
    public function index()
    {
        $list = pub_mod_order::getlist([
            'limit' => req::item('page_num', 20),
            'total' => true,
        ]);


        view::assign('add_url', '?ct=order&ac=add');
        view::assign('edit_url', '?ct=order&ac=edit&order_id=');
        view::assign('keywords', req::item('keywords', ''));
        view::assign('list', $list['data']);
        view::assign('pages', $list['pages']);
        view::display();

    }


    /**
     * 添加订单
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @param    integer    $order_id [description]
     */
    public function add($order_id = 0)
    {
        $data = [];
        if(!empty(req::$posts))
        {
            $this->save();
            exit();
        }
        if(0 < $order_id)
        {
            $data = pub_mod_order::getdump([
                'where' => ['order_id', '=', $order_id]
            ]);
        }

        view::assign('data', $data);
        view::assign('back_url', '?ct=goods&ac=index');
        view::display();
    }



    /**
     * 编辑订单
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @return   [type]     [description]
     */
    public function edit()
    {
        $this->add(req::item('order_id', 0));
    }

    /**
     * 订单保存
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @return   [type]     [description]
     */
    public function save()
    {
        $filter_config = pub_mod_order::$_fields;
        if(empty(req::$posts['order_sn']))
        {
            req::$posts['order_sn'] = pub_mod_order::create_sn();
        }

        $posts = func::data_filter($filter_config, req::$posts);

        if(!is_array($posts))
        {
            show_msg::error("参数错误:{$posts}");
        }

        $posts['image_default_id'] = empty($posts['image_default_id']) ? null :  json_encode($posts['image_default_id'], JSON_UNESCAPED_UNICODE);
        $posts['adduser'] = sephp::$_uid;
        $posts['addtime'] = TIME_SEPHP;

        $dups = [
            'uptime' => TIME_SEPHP,
            'upuser' => sephp::$_uid,
        ];
        foreach(pub_mod_order::$_fields as $f => $conf)
        {
            //跟新不能修改状态和新增时间
            if(in_array($f, ['addtime','adduser', 'order_id', 'order_sn']))
            {
                continue;
            }
            $dups[$f] = " VALUES(`{$f}`) ";
        }

        if(false === pub_mod_order::insert($posts, ['dups' => $dups]))
        {
            show_msg::error('保存失败');
        }
        show_msg::error('保存成功', '?ct=goods&ac=index');
    }

}
