<?php

//路由解析配置
$config['route'] = [
    'url_route_on'         => ['api_check'], //开启路由模式的项目
    'url_route_ext'        => 'html',
    'url_route_rules'      => [
        'adduser-(\w+)-(\w+)' => '?ct=admin&ac=adduser&admin_id=$1&admin=$2',
        'upload_file_list'    => '?ct=system&ac=upload_file',
        'check'               => '?ct=index&ac=check',
        'index'               => '?ct=index&ac=index',
        'about'               => '?ct=index&ac=about',
        'service'             => '?ct=index&ac=service',
        'cases'               => '?ct=index&ac=cases',
        'solutions'           => '?ct=index&ac=solutions',
        'news'                => '?ct=index&ac=news',
        'contact'             => '?ct=index&ac=contact',
        'news-(\w+)-(\w+)'    => '?ct=index&ac=news&article_id=$1&p=$2',
    ],

];

$config['api'] = [
    'app_key'         => 'U9MV4CYvtkkvMHoNwfCyYoCmv7UpOg3OlsDnpRN1rnRCXB18PFiRNkw31B4L0pDpiSHmJqlOoWwvhAFH8TEp53dPyVuA4jD5', //开启路由模式的项目
];


return $config;