<?php

class ctl_content
{
    private $_cont_table = 'content';
    private $_cont_pk = 'id';
    private $_cate_table = 'content_cate';
    private $_cate_pk = 'cate_id';

    public function __construct()
    {
        view::assign('back_url',req::cookie('content_back_url','javascript:history.go(-1);'));
    }

    //文章列表
    public function content_index()
    {
        $list = [];
        setcookie('content_back_url',NOW_URL);
        view::assign('list',$list);
        view::assign('add_url','?ct=content&ac=content_add');
        view::assign('edit_url','?ct=content&ac=content_edit');
        view::display();
    }

    //添加文章
    public function content_add()
    {
        log::info($_SERVER);
        log::error(req::$gets);



        view::assign('cates',$this->get_cates());
        view::display();
    }

    //分类列表
    public function cate_index()
    {
        setcookie('content_back_url',NOW_URL);
        view::assign('list',$this->get_cates());
        view::assign('add_url','?ct=content&ac=cate_add');
        view::assign('edit_url','?ct=content&ac=cate_edit');
        view::display();
    }
    //编辑分类
    public function cate_edit()
    {
        if(!empty(req::$posts))
        {
            $data = req::$posts;
            if($data[$this->_cate_pk] > 0)
            {
                if(db::update($this->_cate_table)->set($data)->where($this->_cate_pk,$data[$this->_cate_pk])->execute() === false)
                {
                    show_msg::error();
                }
                show_msg::success();
            }
        }
        $cate_id = req::item('cate_id',0);
        if(empty($cate_id))
        {
            show_msg::error('分类不存在');
        }
        $info = db::select()
            ->from($this->_cate_table)
            ->where($this->_cate_pk,$cate_id)
            ->as_row()
            ->execute();
        view::assign('data',$info);
        view::assign('cates',$this->get_cates());
        view::assign('pk',$this->_cate_pk);
        view::display('content.cate_add');
    }

    //添加分类
    public function cate_add()
    {
        if(empty(req::$posts))
        {
            view::assign('cates',$this->get_cates());
            view::assign('pk',$this->_cate_pk);
            view::display();
            exit();
        }

        $data = req::$posts;

        if($data['parent_id'] > 0)
        {
            $parent_info = db::select()->from($this->_cate_table)->where($this->_cate_pk,$data['parent_id'])->as_row()->execute();
            $data['path'] = $parent_info['path'] . '-' . $parent_info[$this->_cate_pk];
            $data['level'] = $parent_info['level'] + 1;
            db::query("update {$this->_cate_table} set child_num = child_num + 1")->execute();
        }
        else
        {
            $data['level'] = 1;
        }
        $data['create_time'] = time();
        $data['create_user'] = sys_power::instanc()->_uid;
        //p($data);exit;
        list($res,$id) = db::insert($this->_cate_table)->set($data)->execute();
        if($res)
        {
            show_msg::success('',NOW_URL);
        }
        show_msg::error();
    }


    public function get_children_cate($parent_id = 0)
    {
        if(empty($parent_id))
        {
            $data = db::select()
                ->from($this->_cate_table)
                ->where('status','1')
                ->and_where('level',1)
                ->execute();
            if(empty($data))
            {
                return $data;
            }
            else
            {

            }
        }
    }


    protected function get_cates()
    {
        $sql = "select cate_id,parent_id,name,`level`,child_num,is_show,status,sort_num,concat(path,'-',cate_id) as bpath from se_content_cate order by bpath";
        return db::query($sql)->execute();
    }
}