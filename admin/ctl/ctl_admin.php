<?php

class ctl_admin
{
    private $_admin_table = '#PB#_admin_user';
    private $_admin_id = 'admin_id';
    private $_group_table = '#PB#_admin_group';
    private $_group_id = 'group_id';

    public function __construct()
    {
        view::assign('back_url',req::cookie('back_url','javascript:history.go(-1);'));
    }

    public function userlist()
    {
        $where = [];
        $keywords = req::item('keywords','');
        view::assign('keywords',$keywords);
        if(!empty($keywords))
        {
            $where[] = ['username','like',"%{$keywords}%"];
        }
        $status = req::item('status',0);
        view::assign('status',$status);
        if(!empty($status))
        {
            $where[] = ['status','=',$status];
        }
        $query = db::select('COUNT(admin_id) as count')
            ->from($this->_admin_table);
        if($where)
        {
            $query->where($where);
        }

        $count = $query->as_row()->execute();

        $pages = sys_pages::instance($count['count'],req::item('page_num',10));

        $query = db::select('*')
            ->from($this->_admin_table);
        if($where)
        {
            $query->where($where);
        }
        $data = $query->offset($pages->firstRow)
            ->limit($pages->listRows)
            ->order_by($this->_admin_id,'desc')
            ->execute();

        setcookie('userlist_url',NOW_URL);

        view::assign('edit_fields_url','?ct=admin&ac=edit_fields');
        view::assign('get_json_list','?ct=admin&ac=userlist_json');
        view::assign('add_url','?ct=admin&ac=adduser');
        view::assign('edit_url','?ct=admin&ac=adduser');
        view::assign('save_url','?ct=admin&ac=saveuser');
        view::assign('list',$data);
        view::assign('pages',$pages->show());
        view::display('admin.userlist');
    }

    public function adduser()
    {
        if(empty(req::$posts))
        {
            if(!empty(req::item('admin_id','')))
            {
                $data = db::select('*')
                ->from($this->_admin_table)
                ->where($this->_admin_id,req::$forms[$this->_admin_id])
                ->as_row()
                ->execute();
                view::assign('data',$data);
            }
            view::assign('add_save_url','?ct='.CT_NAME.'&ac=saveuser');
            view::display('admin.adduser');
            exit;
        }
        $data['username'] = req::$posts['username'];
        $data['realname'] = req::$posts['realname'];
        $data['email'] = req::$posts['email'];
        $data['remark'] = req::$posts['remark'];

        if(req::$posts[$this->_admin_id])
        {
            if(!empty(req::$posts['password']))
            {
                $data['password'] = md5(req::$posts['password']);
            }
            if(db::update($this->_admin_table)->set($data)->where($this->_admin_id,req::$posts[$this->_admin_id])->execute() === false)
            {
                show_msg::error('编辑失败');
            }
            else
            {
                show_msg::success('编辑成功');
            }
        }

        $data['password'] = md5(req::$posts['password']);
        $data['create_time'] = time();
        if(db::insert($this->_admin_table)->set($data)->execute() > 0)
        {
            show_msg::success('新增成功','?ct='.CT_NAME.'&ac=userlist');
        }
        show_msg::error();
    }


    public function saveuser()
    {
        if(req::$forms[$this->_admin_id] > 0)
        {
            $result = db::update($this->_admin_table)
                ->set(['status'=>req::$forms['status']])
                ->where($this->_admin_id,req::$forms[$this->_admin_id])
                ->execute();
        }
        else
        {
            list($result,$rows) = db::insert($this->_admin_table)
                ->set(req::$forms)
                ->execute();
        }
        if($result !== false)
        {
            show_msg::success('',req::cookie('userlist_url','?ct=admin&ac=userlist'));
        }

    }

    public function saveuser_field()
    {

    }


    public function grouplist()
    {
        $where = [];
        $keywords = req::item('keywords','');
        view::assign('keywords',$keywords);
        if(!empty($keywords))
        {
            $where[] = ['name','like',"%{$keywords}%"];
        }
        $status = req::item('status',0);
        view::assign('status',$status);
        if(!empty($status))
        {
            $where[] = ['status','=',$status];
        }

        $query = db::select()
            ->from($this->_group_table);
        if($where)
        {
            $query->where($where);
        }
        $list = $query->execute();


        view::assign('list',$list);

        view::assign('add_url','?ct=admin&ac=groupadd');
        view::assign('edit_url','?ct=admin&ac=groupadd');
        view::assign('power_edit_url','?ct=admin&ac=groupedit_power');
        view::display();
    }

    public function groupadd()
    {
        if (empty(req::$posts))
        {
            if(!empty(req::$gets[$this->_group_id]))
            {
                $data = db::select()
                    ->from($this->_group_table)
                    ->where($this->_group_id,req::$gets[$this->_group_id])
                    ->as_row()
                    ->execute();
                view::assign('data',$data);
            }
            view::display();
            exit;
        }

        $data['name'] = req::item('name','');
        $data['remark'] = req::item('remark','');
        $data['status'] = req::item('status',1);
        if(req::$posts[$this->_group_id])
        {
            if(db::update($this->_group_table)->set($data)->where($this->_group_id,req::$posts[$this->_group_id])->execute() === false)
            {
                show_msg::error();
            }
            else
            {
                show_msg::success();
            }
        }

        $data['create_time'] = time();
        $data['create_user'] = 1;
        list($insert_id,$row) = db::insert($this->_group_table)->set($data)->execute();
        if($insert_id > 0)
        {
            show_msg::success('','?ct=admin&ac=grouplist');
        }
        show_msg::error();
    }

    public function groupedit_power()
    {
        if (empty(req::$posts)) {
            $data = db::select()
                ->from($this->_group_table)
                ->where($this->_group_id, req::$gets[$this->_group_id])
                ->as_row()
                ->execute();
            if ($data['powerlist']) {
                $data['powerlist'] = json_decode($data['powerlist'], true);
            }
            $powers = mod_system::get_menus('all');
            //p($data);exit;
            view::assign('powers', $powers);
            view::assign('data', $data);
            view::display('admin.power');
            exit();
        }

        $data['powerlist'] = req::$posts['power'];
        if (!empty($data['powerlist']))
        {
            $data['powerlist'] = array_map('html_entity_decode',$data['powerlist']);
            $data['powerlist'] = json_encode($data['powerlist'],JSON_UNESCAPED_UNICODE);
        }


        if(db::update($this->_group_table)
                ->set($data)
                ->where($this->_group_id,req::$posts[$this->_group_id])
                ->execute() === false)
        {
            show_msg::error();
        }
        show_msg::success('','?ct=admin&ac=grouplist');
    }

}