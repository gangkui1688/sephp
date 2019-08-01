<?php
namespace admin\ctl;

use sephp\core\log;
use sephp\core\req;
use sephp\func;

class ctl_test
{

    public function index()
    {
        //func::set_shutdown_func('sephp\core\log', 'save');

        log::info(var_export(req::server(), 1));

        var_dump(log::save());

        var_dump(111111);
    }


}