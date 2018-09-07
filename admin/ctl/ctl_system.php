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
        clearstatcache();
        $path_file = WWW_ROOT.'upload/file/';
        $files = glob($path_file.'*');
        $list = [];
        if(!empty($files))
        {
            foreach ($files as $k=>$f)
            {
                $info = pathinfo($f);
                $list[$k]['filectime'] = date('Y-m-d',filectime($f));//创建时间
                $list[$k]['fileatime'] = date('Y-m-d',fileatime($f));//文件上次被访问的时间
                $list[$k]['filemtime'] = date('Y-m-d',filemtime($f));//文件内容上次的修改时间
                $list[$k]['name'] = $info['basename'];
                $list[$k]['size'] = _file_size(filesize($f));
                $list[$k]['type'] = filetype($f);
                $list[$k]['fileperms'] = substr(sprintf("%o",fileperms($f)),-4); //文件权限
            }
        }

        view::assign('add_url',$this->_url.'add_file');
        view::assign('list',$list);
        view::display();
    }

    public function add_file()
    {
        //var_dump($_SERVER,req::$forms);
        p($ab = _get_unique_id(),'<hr>',date('Y-m-d H:i:s',round(_timeFromParticle($ab)) / 1000));
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