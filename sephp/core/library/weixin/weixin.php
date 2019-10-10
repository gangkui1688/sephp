<?php
namespace sephp\core\lib\weixin;
use sephp\sephp;
use sephp\core\lib\curl;
use sephp\core\config;
use sephp\func;

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


	public function __construct($config = [])
	{
        $config = empty($config) ? config::get('weixin') : [];
        $this->app_id = func::get_value($config, 'app_id', '');
        $this->appsecret = func::get_value($config, 'appsecret', '');
	}

    /**
     * access_token是公众号的全局唯一接口调用凭据，公众号调用各接口时都需使用access_token。开发者需要进行妥善保存
     * @Author   GangKui
     * @DateTime 2019-10-10
     * @return   [type]     [description]
     */
	public function get_access_token()
	{
		$url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$this->app_id.'&secret=' . $this->appsecret;

        $data = curl::get($url);

        var_dump($data);
	}
}
