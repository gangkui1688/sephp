<?php
namespace admin\ctl;
use sephp\sephp;
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

use admin\mod\mod_content;

/**
 * Class ctl_index
 */
class ctl_goods
{
    public function index()
    {

    }


    /**
     * 品牌列表
     * @Author   GangKui
     * @DateTime 2019-10-12
     * @return   [type]     [description]
     */
    public function brand_index()
    {
        $list = [];

        view::assign('add_url', '?ct=goods&ac=brand_add');
        view::assign('keywords', req::item('keywords', ''));
        view::assign('list', $list);
        view::display();
    }

    /**
     * 添加品牌
     * @Author   GangKui
     * @DateTime 2019-10-12
     * @return   [type]     [description]
     */
    public function brand_add()
    {
        if(!empty(req::$posts))
        {
            $this->brand_save();
            exit();
        }

        if(0 < req::item('id', 0))
        {

        }


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
        $this->brand_add();
    }

    /**
     * 品牌数据保存
     * @Author   GangKui
     * @DateTime 2019-10-12
     * @return   [type]     [description]
     */
    private function brand_save()
    {

        $filter_config = pub_mod_goods_brand::$fields;
        $post = func::date_filter($filter_config, req::$posts);

        print_r($posts);
    }

}
