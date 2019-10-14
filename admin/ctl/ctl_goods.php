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

use admin\model\mod_content;
use common\model\pub_mod_goods_brand;

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
        $data = [
            pub_mod_goods_brand::$pk => 0,
        ];
        if(!empty(req::$posts))
        {
            $this->brand_save();
            exit();
        }

        if(0 < req::item('id', 0))
        {
            $data = pub_mod_goods_brand::getdump([
                'where' => [
                    pub_mod_goods_brand::$pk => $id,
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
