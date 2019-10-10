<?php

define('PATH_APP', __DIR__.'/index/');
define('APP_NAME', 'index');
define('APP_DEBUG', true);


$_authority = [
    'need_login' => false,
    'not_login'  => ['public'],
    'login_url'  => '?ct=public&ac=login',
];

include_once PATH_APP . '../sephp/sephp.php';

new start($_authority);