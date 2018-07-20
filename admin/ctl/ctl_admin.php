<?php

class ctl_admin
{
    public function userlist()
    {

        $page = pages::make(100,10);
        p($page);
        exit;
        //sfdasfdas
        $data = db::select('*')->from('admin_user')->execute();

        view::assign('list',NOW_URL);
        view::assign('getlisturl','?ct='.SE_CT.'&ac=userlist_json');
        view::assign('addurl','?ct='.SE_CT.'&ac=adduser');

        view::display('admin.userlist');
    }
    public function userlist_json()
    {

        $data = db::select('*')->from('admin_user')->execute();
        $list = [
              "code"  => 0,
              "msg"   => "",
              "count" => 3,
              "data"  => $data
            ];
        echo json_encode($list);
    }

    public function adduser()
    {

        view::assign('add_save_url','?ct='.SE_CT.'&ac=saveuser');
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

}