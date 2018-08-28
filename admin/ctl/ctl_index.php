<?php

/**
 * Class ctl_index
 */
class ctl_index
{

    public function index()
    {
        view::assign('menuTitle','menuTitle');
        //$menus = mod_system::parseMenu();
        //view::assign('menus',$menus);
        //$menuHtml = view::fetch('system.menu');
        //view::assign('menuHtml',$menuHtml);
        $top_menu = mod_system::get_menus('top_menu');
        $left_menu = mod_system::get_menus('left_menu');
        view::assign('top_menu',$top_menu);
        view::assign('left_menu',json_encode($left_menu,JSON_UNESCAPED_UNICODE));

        view::assign('default_page_url','?ct=index&ac=home');

        view::display('index');
    }

    public function lockscreen()
    {
        view::display();
    }

    public function main()
    {
        view::display('main');
    }


    //默认页面
    public function home()
    {
        view::display('home');
    }
}
