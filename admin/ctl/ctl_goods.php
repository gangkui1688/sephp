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


/**
 * Class ctl_index
 */
class ctl_goods
{
    /**
     *  商品列表
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @return   [type]     [description]
     */
    public function index()
    {
        $list = pub_mod_goods::getlist([
            'limit' => req::item('page_num', 20),
            'total' => true,
        ]);

        view::assign('add_url', '?ct=goods&ac=add');
        view::assign('edit_url', '?ct=goods&ac=edit&goods_id=');
        view::assign('keywords', req::item('keywords', ''));
        view::assign('list', $list['data']);
        view::assign('pages', $list['pages']);
        view::display();

    }

    /**
     * 添加商品
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @param    integer    $goods_id [description]
     */
    public function add($goods_id = 0)
    {
        $data = [];
        if(!empty(req::$posts))
        {
            $this->save();
            exit();
        }
        if(0 < $goods_id)
        {
            $data = pub_mod_goods::getdatabyid($goods_id);
        }

        view::assign('data', $data);
        view::assign('back_url', '?ct=goods&ac=index');
        view::display();
    }

    /**
     * 编辑商品
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @return   [type]     [description]
     */
    public function edit()
    {
        $this->add(req::item('goods_id', 0));
    }

    /**
     * 商品保存
     * @Author   GangKui
     * @DateTime 2019-10-22
     * @return   [type]     [description]
     */
    public function save()
    {
        $filter_config = pub_mod_goods::$_fields;
        if(empty(req::$posts['goods_sn']))
        {
            req::$posts['goods_sn'] = pub_mod_goods::create_sn();
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
        foreach(pub_mod_goods::$_fields as $f => $conf)
        {
            //跟新不能修改状态和新增时间
            if(in_array($f, ['addtime','adduser', 'goods_id', 'goods_sn']))
            {
                continue;
            }
            $dups[$f] = " VALUES(`{$f}`) ";
        }

        if(false === pub_mod_goods::insert($posts, ['dups' => $dups]))
        {
            show_msg::error('保存失败');
        }
        show_msg::error('保存成功', '?ct=goods&ac=index');
    }


    /**
     * 品牌列表
     * @Author   GangKui
     * @DateTime 2019-10-12
     * @return   [type]     [description]
     */
    public function brand_index()
    {
        $list = pub_mod_goods_brand::getlist([
            'limit' => req::item('page_num', 1),
            'total' => true,
        ]);

        view::assign('add_url', '?ct=goods&ac=brand_add');
        view::assign('edit_url', '?ct=goods&ac=brand_edit&brand_id=');
        view::assign('keywords', req::item('keywords', ''));
        view::assign('list', $list['data']);
        view::assign('pages', $list['pages']);
        view::display();
    }

    /**
     * 添加品牌
     * @Author   GangKui
     * @DateTime 2019-10-12
     * @return   [type]     [description]
     */
    public function brand_add($brand_id = 0)
    {
        $data = [];
        if(!empty(req::$posts))
        {
            $this->brand_save();
            exit();
        }

        if(0 < $brand_id)
        {
            $data = pub_mod_goods_brand::getdump([
                'where' => [
                    pub_mod_goods_brand::$_pk => $brand_id,
                ]
            ]);
        }

        view::assign('data', $data);
        view::assign('back_url', '?ct=goods&ac=brand_index');
        view::display();
    }

    /**
     * 品牌编辑
     * @Author   GangKui
     * @DateTime 2019-10-12
     * @return   [type]     [description]
     */
    public function brand_edit()
    {
        $this->brand_add(req::item('brand_id', 0));
    }

    /**
     * 品牌数据保存
     * @Author   GangKui
     * @DateTime 2019-10-12
     * @return   [type]     [description]
     */
    private function brand_save()
    {
        $filter_config = pub_mod_goods_brand::$_fields;
        $posts = func::data_filter($filter_config, req::$posts);
        if(!is_array($posts))
        {
            show_msg::error("参数错误:{$post}");
        }

        $posts['brand_logo'] = func::get_value($posts, 'brand_logo/0', '');
        $posts['adduser'] = sephp::$_uid;
        $posts['addtime'] = TIME_SEPHP;

        $dups = [
            'uptime' => TIME_SEPHP,
            'upuser' => sephp::$_uid,
        ];
        foreach(pub_mod_goods_brand::$_fields as $f => $conf)
        {
            //跟新不能修改状态和新增时间
            if(in_array($f, ['addtime','adduser']))
            {
                continue;
            }
            $dups[$f] = " VALUES(`{$f}`) ";
        }

        if(false === pub_mod_goods_brand::insert($posts, ['dups' => $dups]))
        {
            show_msg::error('保存失败');
        }
        show_msg::error('保存成功', '?ct=goods&ac=brand_index');
    }

}
