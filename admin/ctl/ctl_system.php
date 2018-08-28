<?php

class ctl_system
{

    public function index()
    {
    }

    /**
     * 菜单配置
     */
    public function menus()
    {
        $menus = req::item('menus','');
        $file = SEPHP . '../config/menu.xml';
        if(empty($menus))
        {
            view::assign('menus',file_get_contents($file));
            view::display();
            exit;
        }

        if(file_put_contents($file,html_entity_decode($menus)) > 0)
        {
            show_msg::success();
        }
        show_msg::error();

    }
}