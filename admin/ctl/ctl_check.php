<?php
namespace admin\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\view;
use sephp\core\lib\power;
use sephp\core\lib\pages;
use sephp\core\db;
use sephp\core\upload;
use sephp\core\show_msg;
use sephp\core\session;
use sephp\core\config;

use admin\model\mod_content;
use admin\model\mod_admin_user;
use common\model\pub_mod_goods;
use common\model\pub_mod_goods_brand;
use common\model\pub_mod_order_check_out;


class ctl_check
{
	/**
	 * 核销app基础参数设置
	 * @Author   GangGuoer
	 * @DateTime 2019-10-27T16:35:12+0700
	 * @version  [version]
	 * @return   [type]
	 */
    public function app()
    {

    	$key = 'check_app_base_setting';
        if(empty(req::$posts))
        {
            view::assign('data',config::get($key, 'mysql'));
            //用户列表，选择核销的用户
    		$users = mod_admin_user::get_available_list();
    		view::assign('userlist', $users);
            view::display();
            exit;
        }

        if(config::set($key,req::$posts))
        {
            show_msg::success('设置成功');
        }
        show_msg::error('保存失败');
    }

    /**
     * 核销记录
     * @Author   GangGuoer
     * @DateTime 2019-10-27T17:05:56+0700
     * @version  [version]
     * @return   [type]
     */
    public function log()
    {

    	$list = pub_mod_order_check_out::getlist();

    	view::assign('list', $list);
    	view::display();
    }

}
