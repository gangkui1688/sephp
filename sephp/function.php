<?php

function p($arg = null,$arg1 = null,$arg2 = null,$arg3 = null)
{
    echo '<pre>';
    var_dump($arg);
    empty($arg1)?'':var_dump($arg1);
    empty($arg2)?'':var_dump($arg2);
    empty($arg3)?'':var_dump($arg3);
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

function session_start()
{


}