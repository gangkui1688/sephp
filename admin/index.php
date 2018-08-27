<?php

define('APP_PATH',__DIR__.'/');
define('APP_NAME','admin');
define('APP_DEBUG',true);

$_authority = [
    //'need_login' => true,
    'not_login'  => ['public'],
    'login_url'  => '?ct=public&ac=login',
];

include_once  APP_PATH.'../sephp/start.php';

new start($_authority);



