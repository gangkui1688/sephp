<?php
namespace admin\ctl;
use sephp\sephp;
use sephp\core\req;


class ctl_cache
{
    public function clear()
    {
        view::display('cache.clear');
    }



}