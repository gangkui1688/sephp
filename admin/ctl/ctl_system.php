<?php

class ctl_system
{
    protected $_url = '?ct=system&ac=';
    protected $_config_table = 'config';

    public function __construct()
    {
        $back_url = req::item('back_url','javascript:history.go(-1);');
        view::assign('back_url',$back_url);
    }

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
        view::assign('keywords',req::item('keywords',''));
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

    /**
     * 数据库优化
     */
    public function data_optimization()
    {

    }

    /**
     * 数据备份
     */
    public function data_backups()
    {
        if(empty(req::$posts))
        {
            $tables = db::query('show tables')->execute();
            view::assign('tables',$tables);
            view::display();
            exit();
        }
        p(req::$posts);
        switch (req::$posts['type'])
        {
            case 'all':
                sys_dbmanage::instance()->backup();

                break;
            case 'structure':

                break;
        }
    }


    /**
     * 友情链接管理
     */
    public function friend_link()
    {
        $key = 'friend_link';
        if(empty(req::$posts))
        {
            $data = config::get($key);
            view::assign('list',empty($data) ? null : $data);
            view::display();
            exit();
        }
        $data = [];
        foreach (req::$posts['title'] as $k=>$val)
        {
            if(empty($val) && empty(req::$posts[$k]['url']))
            {
                continue;
            }
            $data[$k]['sort_id'] = req::$posts['sort_id'][$k];
            $data[$k]['title'] = req::$posts['title'][$k];
            $data[$k]['url'] = req::$posts['url'][$k];
            $data[$k]['status'] = req::$posts['status'][$k];
        }
        //p($data,empty($data));exit;
        if(empty($data))
        {
            config::set($key,'');
            show_msg::success('',NOW_URL);
        }
        array_multisort(array_column($data,'sort_id'),SORT_DESC,$data);
        //p($data);exit;
        if(config::set($key,$data))
        {
            show_msg::success('',NOW_URL);
        }
        show_msg::error('',NOW_URL);
    }

    /**
     * 基础设置
     */
    public function baise_config()
    {
        $key = 'base_config';
        if(empty(req::$posts))
        {
            view::assign('data',config::get($key));
            view::assign('clear_view_cache_url',$this->_url.'clear_view_cache');
            view::assign('clear_static_page_url',$this->_url.'clear_static_page');
            view::display();
            exit;
        }
        if(config::set($key,req::$posts))
        {
            show_msg::success();
        }
        show_msg::error();
    }
    /**
     * 菜单配置
     */
    public function menus()
    {
        //p(session::get('admin_info'),pathinfo(NOW_URL));
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

    public function clear_static_page()
    {
        show_msg::success('','-1');
    }

    public function clear_view_cache()
    {
        $dir = SE_RUNTIME.'compile/';
        if(!file_exists($dir))
        {
            show_msg::success('','-1');
        }
        $file = glob($dir.'*');
        if(empty($file))
        {
            show_msg::success('','-1');
        }
        foreach ($file as $path)
        {
            if(!unlink($path))
            {
                show_msg::error('','-1');
            }
        }
        show_msg::success('','-1');
    }
}