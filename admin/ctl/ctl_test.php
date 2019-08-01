<?php
namespace admin\ctl;

use sephp\core\log;
use sephp\core\req;
use sephp\func;

class ctl_test
{

    public function index()
    {

        log::info(var_export(req::server(), 1));
        log::error(var_export(req::$forms, 1));
        log::error(var_export(req::$forms, 1));
        log::error(var_export(req::$forms, 1));


        //var_dump(log::save());

        var_dump(111111);
    }


}