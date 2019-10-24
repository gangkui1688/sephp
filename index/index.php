<?php
header('Content-Type: text/html; charset=utf-8');

require_once __DIR__ . '/../sephp/sephp.php';

define('PATH_APP',__DIR__.'/');
define('APP_NAME','index');
define('APP_DEBUG',true);


/**
 * 配置载入
 */
$_authority = [
    'need_login' => false,
    'not_login'  => ['index'],
    'login_url'  => '?ct=index&ac=login',
    'user_type'  => 'member',
];


new \sephp\sephp($_authority);