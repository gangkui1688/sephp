<?php

$config['web'] = [
    //是否开启验证码
    'verify_open' => false,
    //是否开启google auth 验证
    'google_auth' => false,
    //编辑器指定
    'edit_tool' => 'mvim://open/?url=file://%file%&line=%line%',
    //phpstrom 'idea://open?file=%file%&line=%line%
    //是否生成静态页面
    //'static_page' => ['index','member'],

];

$config['log'] = [
    'open'          => true, //开启
    'single'        => true, //单日志文件模式
    'file_size'     => 10240,//10M
    'type'          => 'file',
    'path'          => PATH_ROOT . 'runtime/log/',
    'detail_info'   => true,
];

//session 设置
$config['session'] = [
    'prefix' => 'sephp.a.com_',
    'auto_start' => true,
    'path' => '',
    'expire' => 14400,
    'secure' => true,
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

$config['sysRedis'] = [
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



//路由解析配置
$config['route'] = [
    'url_route_on' => ['index'], //开启路由模式的项目
    'url_route_ext' => 'html',
    'url_route_rules' => [
        'adduser-(\w+)-(\w+)' => '?ct=admin&ac=adduser&admin_id=$1&admin=$2',
        'upload_file_list' => '?ct=system&ac=upload_file',
        'help' => '?ct=index&ac=help',
        'index' => '?ct=index&ac=index',
        'about' => '?ct=index&ac=about',
        'service' => '?ct=index&ac=service',
        'cases' => '?ct=index&ac=cases',
        'solutions' => '?ct=index&ac=solutions',
        'news' => '?ct=index&ac=news',
        'contact' => '?ct=index&ac=contact',
        'news-(\w+)-(\w+)' => '?ct=index&ac=news&article_id=$1&p=$2',
    ],

];



















return $config;
