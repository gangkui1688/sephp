<?php

$config['web'] = [
    //是否开启验证码
    'verify_open' => false,
    //是否生成静态页面
    'static_page' => true,
];

$config['log'] = [
    'open'  => true, //开启
    'file_size' => 10240,//10M
    'type'      => 'file',
    'path'      => WWW_ROOT.'data/log/',
];

//session 设置
$config['session'] = [
    'prefix'=>'_sephp.a.com',
    'auto_start'=>true,
];

//可以做读写分离的设置
$config['db'] = [
    'type'  => 'mysql',
    'host'  =>'127.0.0.1',
    'root'  =>'root',
    'pass'  =>'admin999',
    'dbname'=>'sephp',
    'port'  =>'3306',
    'prefix'=>'se_'
];

$config['redis'] = [
    'host'  => '127.0.0.1',
    'port'  => '6370',
    'user'  => '',
    'pass'  => '',
    'select'     => 0,
    'timeout'    => 0,
    'expire'     => 0,
    'persistent' => false,
    'prefix'     => '',
];

//百度的webupload 分片上传
$config['upload'] = [
    'type'  => 'thml5',
    'url'  => '?ctl=public&ac=uploads',//文件上传地址
];





















return $config;