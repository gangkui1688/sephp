<?php
namespace api_check\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\db;


class ctl_index extends ctl_base
{

    public function index()
    {

        echo phpinfo();
    }

    public function check()
    {

        echo 1111111;
    }

}
