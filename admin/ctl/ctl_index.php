<?php

/**
 * Class ctl_index
 */
class ctl_index {

	public function index() {

		view::assign('menuTitle', 'menuTitle');
		//$menus = mod_system::parseMenu();
		//view::assign('menus',$menus);
		//$menuHtml = view::fetch('system.menu');
		//view::assign('meenuHtml',$menuHtml);
		$top_menu  = mod_system::get_menus('top_menu');
		$left_menu = mod_system::get_menus('left_menu');
		view::assign('top_menu', $top_menu);
		view::assign('left_menu', json_encode($left_menu, JSON_UNESCAPED_UNICODE));

		$user_info = session::get(sys_power::$_mark);

		view::assign('realname', $user_info['realname']);
		view::assign('goup_name', empty($user_info['group_name'])?'---':$user_info['group_name']);

		view::assign('default_page_url', '?ct=index&ac=home');
		view::assign('logout_url', '?ct=public&ac=logout');
		view::assign('login_url', $GLOBALS['_authority']['login_url']);
		view::display('index');
		//$content = view::fetch('index');

	}

	public function lockscreen() {
		view::display();
	}

	public function main() {
		view::display('main');
	}

	//默认页面
	public function home() {
		view::display('home');
	}
}
