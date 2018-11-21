<?php

class ctl_wechat
{
    protected $_url = '?ct=system&ac=';
    protected $_config_table = '#PB#_config';

    public function __construct()
    {
        $back_url = req::item('back_url','javascript:history.go(-1);');
        view::assign('back_url',$back_url);
    }

    public function index()
    {
    }

    public function base()
    {


        view::display();
    }

}