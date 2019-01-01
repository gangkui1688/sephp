<?php

define('PATH_APP',__DIR__.'/');
define('APP_NAME','admin');
define('APP_DEBUG',true);


$_authority = [
    'need_login' => true,
    'not_login'  => ['public'],
    'login_url'  => '?ct=public&ac=login',
];

include_once  PATH_APP.'../sephp/start.php';

new start($_authority);



