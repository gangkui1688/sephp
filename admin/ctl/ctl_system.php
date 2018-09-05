<?php

class ctl_system
{
    private $_url = '?ct=system&ac=';

    public function index()
    {
    }

    /**
     * 网址设置
     */
    public function siteconfig()
    {
        if(empty(req::$posts))
        {
            view::display();
            exit;
        }


    }

    /**
     * 资源管理
     */
    public function file_manager()
    {
        $path_file = '';


        view::assign('add_url',$this->_url.'add_file');
        view::display();
    }

    public function add_file()
    {
        view::display();
    }
    /**
     * 菜单配置
     */
    public function menus()
    {
        p(session::get('admin_info'),pathinfo(NOW_URL));
        $menus = req::item('menus','');
        $file = SEPHP . '../config/menu.xml';
        if(empty($menus))
        {
            view::assign('menus',file_get_contents($file));
            view::display();
            exit;
        }
        //var_dump(html_entity_decode($menus,ENT_QUOTES));exit;
        if(file_put_contents($file,html_entity_decode($menus,ENT_QUOTES)) > 0)
        {
            show_msg::success();
        }
        show_msg::error();

    }
}