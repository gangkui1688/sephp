<?php

function p($arg = null,$arg1 = null,$arg2 = null,$arg3 = null)
{
    echo '<pre>';
    print_r($arg);
    empty($arg1)?'':print_r($arg1);
    empty($arg2)?'':print_r($arg2);
    empty($arg3)?'':print_r($arg3);
    echo '</pre>';

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
    se_debug::show($code, $msg, $filename, $line, $backtrace);
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