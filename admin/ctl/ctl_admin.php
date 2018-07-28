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

        view::assign('add_save_url','?ct='.CT_NAME.'&ac=saveuser');
        view::display('admin.adduser');
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