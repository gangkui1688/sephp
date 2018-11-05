<?php

//返回随机字符串,包括特殊字符
function rand_str($length = 8)
{
    $output = '';
    for ($i=0 ; $i < $length ; $i++ )
    {
        $output .= chr(mt_rand(33,126));
    }
    return $output;
}

function p($arg = null,$arg1 = null,$arg2 = null,$arg3 = null)
{
    echo '<pre>';
    print_r($arg);
    empty($arg1)?'':print_r($arg1);
    empty($arg2)?'':print_r($arg2);
    empty($arg3)?'':print_r($arg3);
    echo '</pre>';

}

function get_client_ip()
{
    if(!empty($_SERVER["HTTP_CLIENT_IP"]))
    {
        $cip = $_SERVER["HTTP_CLIENT_IP"];
    }
    else if(!empty($_SERVER["HTTP_X_FORWARDED_FOR"]))
    {
        $cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
    }
    else if(!empty($_SERVER["REMOTE_ADDR"]))
    {
        $cip = $_SERVER["REMOTE_ADDR"];
    }
    else
    {
        $cip = '';
    }
    //preg_match("/[\d\.]{7,15}/", $cip, $cips);
    //$cip = isset($cips[0]) ? $cips[0] : 'unknown';
    //unset($cips);
    return $cip;
}

/**
 *@todo: 判断是否为post
 */
function is_post()
{
    return isset($_SERVER['REQUEST_METHOD']) && strtoupper($_SERVER['REQUEST_METHOD'])=='POST';
}

/**
 *@todo: 判断是否为get
 */
function is_get()
{
    return isset($_SERVER['REQUEST_METHOD']) && strtoupper($_SERVER['REQUEST_METHOD'])=='GET';
}

/**
 *@todo: 判断是否为ajax
 */
function is_ajax()
{
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtoupper($_SERVER['HTTP_X_REQUESTED_WITH'])=='XMLHTTPREQUEST';
}

/**
 *@todo: 判断是否为命令行模式
 */
function is_cli()
{
    return (PHP_SAPI === 'cli' OR defined('STDIN'));
}

/**
 * @param $e 异常回掉函数
 */
function _exception_handler($e)
{
    $code     = $e->getCode();
    $msg    = $e->getMessage();
    $line   = $e->getLine();
    $filename  = $e->getFile();
    $backtrace = $e->getTrace();
    sys_debug::show($code, $msg, $filename, $line, $backtrace);
}

/**
 * 生产url 参数链接
 * @param array $param
 * @return string
 */
function _make_url($param = [])
{
    if(empty($param))
    {
        return '';
    }
    $url = '';
    foreach ($param as $k=>$v)
    {
        $url .= '&'.$k.'='.$v;
    }
    return $url;
}

/**
 * 格式化文件大小 单位
 * @param null $filepath
 * @return bool|float|int|string
 */
function _file_size($size = 0)
{
    $arBytes = array(
        0 => array(
            "UNIT" => "TB",
            "VALUE" => pow(1024, 4)
        ),
        1 => array(
            "UNIT" => "GB",
            "VALUE" => pow(1024, 3)
        ),
        2 => array(
            "UNIT" => "MB",
            "VALUE" => pow(1024, 2)
        ),
        3 => array(
            "UNIT" => "KB",
            "VALUE" => 1024
        ),
        4 => array(
            "UNIT" => "B",
            "VALUE" => 1
        ),
    );

    foreach($arBytes as $arItem)
    {
        if($size >= $arItem["VALUE"])
        {
            $result = $size / $arItem["VALUE"];
            $result = str_replace(".", "." , strval(round($result, 2)))." ".$arItem["UNIT"];
            break;
        }
    }
    return empty($result) ? $size : $result;
}

function _shutdown_function($start_time = 0)
{
    $end_time = microtime(true);

    log::init()->save();
}

