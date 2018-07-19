<?php

class mod_system
{

    public static function parseMenu($menus = '',$id_name = '')
    {
        $json_menu = '';
        foreach ($menus as $menu)
        {
            $top_menu_id_name = $menu['@attributes']['id'];
            if(empty($menu['menu']) || $top_menu_id_name != $id_name)
            {
                continue;
            }
            foreach ($menu['menu'] as $child)
            {

                if(isset($child['@attributes']['display']) && $child['@attributes']['display'] == 'none')
                {
                    continue;
                }
                $json_menu[] = [
                    'title'=>$child['@attributes']['name'],
                    'icon'=>$child['@attributes']['icon'],
                    'href'=> '?ct='.$child['@attributes']['ct'].'&ac='.$child['@attributes']['ac'],
                    'spread'=> empty($child['@attributes']['spread'])?false:$child['@attributes']['spread']
                ];
            }
            unset($top_menu_id_name);

        }
        return (json_encode($json_menu));

    }

    public static function parseMenu_old()
    {
        $file = SEPHP.'../config/menu.xml';
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        $xml = file_get_contents($file);
        $array = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);



        //print_r(($array['menu']));

        return true;

        $array = xml::xmlToArray(file_get_contents($file));
        $menus = array();
        foreach ($array['menus']['menu'] as $k => $v)
        {
            if(isset($v[0]['display']) && $v[0]['display'] == 'none') continue;
            $v[0]['url'] = '';
            if(isset($v[0]['ct']) && !empty($v[0]['ct']))
            {
                $v[0]['url'] = '?ct='.$v[0]['ct'].'&ac='.$v[0]['ac'];
            }
            $menus[$k] = $v[0];
            if(isset($v['menu']))
            {
                foreach ($v['menu'] as $val) {
                    if(isset($val[0]['display']) && $val[0]['display'] == 'none') continue;
                    $val[0]['url'] = '';
                    if(isset($val[0]['ct']) && !empty($val[0]['ct']))
                    {
                        $val[0]['url'] = '?ct='.$val[0]['ct'].'&ac='.$val[0]['ac'];
                    }
                    $menus[$k]['child'][] = $val[0];
                }

            }
        }
        return $menus;
    }
}