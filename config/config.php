<?php

$GLOBALS['config']['session'] = [
    'auto_start'=>true,
    'prefix'=>'_sephp_',
    'path'=> SE_RUNTIME.'session/',
    'expire'=>1440,
];


$GLOBALS['config']['db'] = [
    'host'=>'127.0.0.1',
    'port'=>'3306',
    'root'=>'root',
    'pass'=>'admin999',
    'dbname'=>'sephp',
    'prefix'=>'se_',
    'charset'=>'utf-8'
];