<?php
header('Content-Type: text/html; charset=utf-8');

require_once __DIR__ . '/../sephp/sephp.php';

define('PATH_APP',__DIR__.'/');
define('APP_NAME','car_aintenance_shop');
define('APP_DEBUG',true);


/**
 * 配置载入
 */
$_authority = [
    'need_login' => true,
    'login_type' => 'session',
    'not_login'  => ['public'],
    'login_url'  => '?ct=public&ac=login',
    'user_type'  => 'car_aintenance_shop',
    'power_check'=> true,
];


new \sephp\sephp($_authority);



