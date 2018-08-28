<?php

class ctl_admin
{
    public function userlist()
    {

        view::assign('get_json_list','?ct=admin&ac=userlist_json');
        view::assign('addurl','?ct='.CT_NAME.'&ac=adduser');
        view::display('admin.userlist');
    }
    public function userlist_json()
    {
        $count = db::select('COUNT(admin_id) as count')->from('admin_user')->as_row()->execute();
        $data = db::select('*')->from('admin_user')->execute();

        //$pages = pages::instance($count['count'],'10')->show();
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
        $data['username'] = md5(req::$posts['password']);
        $data['email'] = md5(req::$posts['email']);
        $data['remark'] = md5(req::$posts['remark']);
        $data['create_time'] = time();
        if(db::insert('admin_user')->set(req::$posts)->execute() > 0)
        {
            show_msg::success('新增成功','?ct='.CT_NAME.'&ac=userlist');
        }
        show_msg::error();


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

}