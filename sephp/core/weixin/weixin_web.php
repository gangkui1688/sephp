<?php
namespace sephp\core;
use sephp\sephp;
/**
 *
 */
class weixin_web
{

	public static $instance = null;

	public $app_id = 'wxfe9ce66e58973b5c';
	public $appsecret = '6201972c713e2a8cc3988d980227dd4b';

	public static function instance()
	{
		if(empty(self::$instance))
		{
			self::$instance = new self();
		}

		return self::$instance;
	}

	function __construct(argument)
	{
		# code...
	}


	public function get_code($redirect_uri, $state = 0)
	{
		$url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->app_id.'&redirect_uri='.$redirect_uri.'&response_type=code&scope=snsapi_userinfo&state='.$state.'#wechat_redirect';
	}

	public function get_access_token($code)
	{
		$url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$this->app_id.'&secret='.$this->appsecret.'&code='.$code.'&grant_type=authorization_code';

	}

	public function refresh_token()
	{
		$url = 'https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN'

	}

	public function get_userinfo()
	{
		$url = 'https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN';
	}

	public function check_access_token()
	{
		$url = 'https://api.weixin.qq.com/sns/auth?access_token=ACCESS_TOKEN&openid=OPENID';


	}


}