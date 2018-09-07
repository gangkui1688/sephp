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


    log::write('--the opcode end--');
    log::save();
}

function _get_unique_id($machineId = 0)
{
    $epoch = 1479533469598;
    $max12bit = 4095;
    $max41bit = 1099511627775;
    $pid = getmypid();
    /*
    * Time - 42 bits
    */
    $time = floor(microtime(true) * 1000);

    /*
    * Substract custom epoch from current time
    */

    /*
    * Create a base and add time to it
    */
    $base = decbin($time - $epoch + $max41bit);


    /*
    * Configured machine id - 10 bits - up to 1024 machines
    */
    $machineid = str_pad(decbin($machineId), 10, "0", STR_PAD_LEFT);


    /*
    * sequence number - 12 bits - up to 4096 random numbers per machine
    */
    $random = str_pad(decbin(mt_rand(0, $max12bit)), 12, "0", STR_PAD_LEFT);

    /*
     * pid number
     */
    $pid = str_pad(decbin(getmypid()), 12, "0", STR_PAD_LEFT);

    /*
    * Pack
    */
    $base = $base.$machineid.$random;

    /*
    * Return unique time id no
    */
    return bindec($base);

}

function _timeFromParticle($particle = 0) {
    /*
    * Return time
    */
   return bindec(substr(decbin($particle),0,41));
}