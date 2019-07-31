<?php
namespace sephp\lib;

/**
 * 微信开发类
 */
class weixin
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


	public function __construct()
	{

	}

	public function get_access_token()
	{
		$url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$this->app_id.'&secret=' . $this->appsecretl;
		http_get($url);

	}
}