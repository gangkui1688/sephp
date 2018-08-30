<?php

class ctl_admin
{
    public function userlist()
    {

        view::assign('edit_fields_url','?ct=admin&ac=edit_fields');
        view::assign('get_json_list','?ct=admin&ac=userlist_json');
        view::assign('addurl','?ct='.CT_NAME.'&ac=adduser');
        view::display('admin.userlist');
    }
    public function userlist_json()
    {
        $count = db::select('COUNT(admin_id) as count')
            ->from('admin_user')
            ->as_row()
            ->execute();
        $data = db::select('*')
            ->from('admin_user')
            ->offset(req::item('offset',0))
            ->limit(req::item('limit',10))
            ->order_by('admin_id','desc')
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
        if(db::insert('admin_user')->set($data)->execute() > 0)
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
        if(db::update('admin_user')->set()->where()->execute() !== false)
        {

        }
    }

    public function saveuser()
    {
        req::$posts['password'] = md5(req::$posts['password']);
        if(db::insert('admin_user')->set(req::$posts)->execute())
        {
            show_msg::ajax('新增成功','200');
        }

    }

    public function saveuser_field()
    {

    }


    public function grouplist()
    {
        $list = db::select('remark,name,create_time,create_user,group_id')
            ->from('admin_group')
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
        list($insert_id,$row) = db::insert('admin_group')->set($data)->execute();
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
                ->from('admin_group')
                ->where('group_id',req::$gets['group_id'])
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
        $data['powerlist'] = array_filter(req::$posts['power']);
        $data['powerlist'] = array_map('html_entity_decode',$data['powerlist']);
        $data['powerlist'] = json_encode($data['powerlist'],JSON_UNESCAPED_UNICODE);


        if(db::update('admin_group')->set($data)->where('group_id',req::$posts['group_id'])->execute() === false)
        {
            show_msg::error();
        }
        show_msg::success('','?ct=admin&ac=grouplist');
    }

}