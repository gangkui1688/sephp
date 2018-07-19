<?php

class ctl_admin
{
    public function userlist()
    {

        $data = db::select('*')->from('')->where()->execute();
        view::assign('list',$data);
        view::display('admin.userlist');
    }
}