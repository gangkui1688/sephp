<?php

class ctl_admin
{
    private $_admin_table = 'admin_user';
    private $_admin_id = 'admin_id';
    private $_group_table = 'admin_group';
    private $_group_id = 'group_id';


    public function userlist()
    {
        $count = db::select('COUNT(admin_id) as count')
            ->from($this->_admin_table)
            ->as_row()
            ->execute();
        $data = db::select('*')
            ->from($this->_admin_table)
            ->offset(req::item('offset',0))
            ->limit(req::item('limit',10))
            ->order_by($this->_admin_id,'desc')
            ->execute();

        $pages = pages::instance($count['count'],'10')->show();

        view::assign('edit_fields_url','?ct=admin&ac=edit_fields');
        view::assign('get_json_list','?ct=admin&ac=userlist_json');
        view::assign('add_url','?ct=admin&ac=adduser');
        view::assign('edit_url','?ct=admin&ac=edituser');
        view::assign('save_url','?ct=admin&ac=saveuser');
        view::assign('list',$data);
        view::assign('pages',$pages);
        view::display('admin.userlist');
    }
    public function userlist_json()
    {
        $count = db::select('COUNT(admin_id) as count')
            ->from($this->_admin_table)
            ->as_row()
            ->execute();
        $data = db::select('*')
            ->from($this->_admin_table)
            ->offset(req::item('offset',0))
            ->limit(req::item('limit',10))
            ->order_by($this->_admin_id,'desc')
            ->execute();

        $pages = pages::instance($count['count'],'10')->show();
        $list = [
              "total" => $count['count'],
              "rows"  => $data
            ];
        echo json_encode($list);
    }

    public function adduser()
    {
        if(empty(req::$posts))
        {
            view::assign('add_save_url','?ct='.CT_NAME.'&ac=saveuser');
            view::display('admin.adduser');
            exit;
        }

        $data['username'] = req::$posts['username'];
        $data['password'] = md5(req::$posts['password']);
        $data['email'] = req::$posts['email'];
        $data['remark'] = req::$posts['remark'];
        $data['create_time'] = time();
        if(db::insert($this->_admin_table)->set($data)->execute() > 0)
        {
            show_msg::success('新增成功','?ct='.CT_NAME.'&ac=userlist');
        }
        show_msg::error();
    }

    public function edit_fields()
    {
        if(empty(req::$posts['fields']))
        {
            exit('error');
        }
        if(db::update($this->_admin_table)->set()->where()->execute() !== false)
        {

        }
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
            show_msg::success('新增成功','?ct=admin&ac=userlist');
        }

    }

    public function saveuser_field()
    {

    }


    public function grouplist()
    {
        $list = db::select('remark,name,create_time,create_user,group_id')
            ->from($this->_group_table)
            ->offset(req::item('offset',0))
            ->limit(req::item('limit',10))
            ->execute();

        view::assign('list',$list);
        view::assign('add_url','?ct=admin&ac=groupadd');
        view::assign('edit_url','?ct=admin&ac=groupedit');
        view::assign('power_edit_url','?ct=admin&ac=groupedit_power');
        view::display();
    }

    public function groupadd()
    {
        if (empty(req::$posts))
        {
            view::display();
            exit;
        }

        $data['name'] = req::item('name','');
        $data['remark'] = req::item('remark','');
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
        if(empty(req::$posts))
        {
            $data = db::select()
                ->from($this->_group_table)
                ->where($this->_group_id,req::$gets[$this->_group_id])
                ->as_row()
                ->execute();
            $data['powerlist'] = json_decode($data['powerlist'],true);
            $powers = mod_system::get_menus('all');
            //p($data);exit;
            view::assign('powers',$powers);
            view::assign('data',$data);
            view::display('admin.power');
            exit();
        }
        $data['powerlist'] = array_filter(req::$posts['sysPower']);
        $data['powerlist'] = array_map('html_entity_decode',$data['powerlist']);
        $data['powerlist'] = json_encode($data['powerlist'],JSON_UNESCAPED_UNICODE);


        if(db::update($this->_group_table)->set($data)->where($this->_group_id,req::$posts[$this->_group_id])->execute() === false)
        {
            show_msg::error();
        }
        show_msg::success('','?ct=admin&ac=grouplist');
    }

}