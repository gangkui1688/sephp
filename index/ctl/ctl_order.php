<?php
namespace index\ctl;
use sephp\sephp;
use sephp\core\req;
use sephp\core\log;
use sephp\core\config;
use sephp\core\view;


class ctl_order
{

  public function cart()
  {
    view::display();
  }

  public function complete_order()
  {
    view::display();
  }

}
