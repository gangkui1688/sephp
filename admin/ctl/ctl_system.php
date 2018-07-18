<?php

class ctl_system
{


    public function menus()
    {
        $menus = mod_system::parseMenu();



        view::assign('menuTitle','1231231');
        view::display('setting.menu.tpl');
    }
}