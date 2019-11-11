<?php
header('Content-Type: text/html; charset=utf-8');

require_once __DIR__ . '/../sephp/sephp.php';

define('PATH_APP',__DIR__.'/');
define('APP_NAME','api_check');
define('APP_DEBUG',true);
//访问方式
define('REQUEST_TYPE', 'ajax');


/**
 * 配置载入
 */
$_authority = [
    'need_login' => true,
    'not_login'  => [
        'index' =>
            ['login', 'logout']
        ],
    'login_url'  => '?ct=index&ac=login',
    'user_type'  => 'admin',
    'power_check'=> true,
];

new \sephp\sephp($_authority);
