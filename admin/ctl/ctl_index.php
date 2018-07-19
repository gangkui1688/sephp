<?php

class ctl_index
{


    public function index()
    {

        //show_msg::error('缺少必要参数','?ct=index&ac=main',100);


        view::assign('menuTitle','menuTitle');
        //$menus = mod_system::parseMenu();
        //view::assign('menus',$menus);
        //$menuHtml = view::fetch('system.menu');
        //view::assign('menuHtml',$menuHtml);

        view::assign('top_menus',$this->json_menus('top_menu'));
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

    public function json_menus($id_name = '')
    {
        $id_name = req::item('id_name',$id_name);
        $file = SEPHP . '../config/menu.xml';
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        $xml = file_get_contents($file);
        $array = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        if (empty($array)) {
            show_msg::error('没有添加菜单数据', '-1');
        }
        if ($id_name == 'top_menu') {
            $top_menu = '';
            foreach ($array['menu'] as $menu) {
                $top_menu[$menu['@attributes']['id']] = [
                    'title' => $menu['@attributes']['name'],
                    'icon' => $menu['@attributes']['icon'],
                    'href' => empty($menu['@attributes']['href']) ? '' : $menu['@attributes']['href'],
                    'spread' => empty($menu['@attributes']['spread']) ? false : $menu['@attributes']['spread']
                ];
            }
            return $top_menu;
        } else {
            echo mod_system::parseMenu($array['menu'],$id_name);
        }
    }
}

