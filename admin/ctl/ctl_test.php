<?php
namespace admin\ctl;

use sephp\core\cache;
use sephp\core\log;
use sephp\core\req;
use sephp\func;

class ctl_test
{

    public function index()
    {

        cache::set('admin', 'admin23.comsds', 1);
        cache::set('admin12312', '收到说法阿斯顿发上到发送大声点阿斯顿啊.comsds');
        cache::set('admin发送到发送的', 'admin沙发三大发说到发送的发送到手啊收到说法三大发安德森 23.comsds');
        cache::set('adminweewreqwe', 'admi 实打实的发送到发阿斯顿发阿斯顿发阿斯顿发阿斯顿发说法n23.comsds');


        var_dump(cache::get('admin'));
        exit;
        log::info(var_export(req::server(), 1));
        log::error(var_export(req::$forms, 1));
        log::error(var_export(req::$forms, 1));
        log::error(var_export(req::$forms, 1));


        //var_dump(log::save());

        var_dump(111111);
    }


}