<?php
header('Content-Type: text/html; charset=utf-8');

require_once __DIR__ . '/../sephp/sephp.php';

define('PATH_APP',__DIR__.'/');
define('APP_NAME','api_check');
define('APP_DEBUG',true);



/**
 * 登陆和验证配置
 */
$_authority = [
    'need_login' => true,
    'not_login'  => [
        'index' =>
            ['login', 'logout']
        ],
    'login_url'  => '?ct=index&ac=login',
    'user_type'  => 'admin',
    'login_type' => 'token',
    'power_check'=> true,
];

new \sephp\sephp($_authority);
