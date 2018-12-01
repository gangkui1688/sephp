<?php

define('APP_PATH', __DIR__.'/index/');
define('APP_NAME', 'index');
define('APP_DEBUG', true);


$_authority = [
    'need_login' => false,
    'not_login'  => ['public'],
    'login_url'  => '?ct=public&ac=login',
];

include_once  APP_PATH.'../sephp/start.php';

new start($_authority);