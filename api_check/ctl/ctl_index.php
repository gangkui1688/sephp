<?php
namespace api_check\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\db;


class ctl_index exten
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