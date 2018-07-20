<?php


class exceptions extends Exception
{
    public static $_error_msg = null;
    public static $_error_file = null;


    public static function throw_debug($message = "", $error_data = '',$code = '')
    {
        if(isset($error_data[0]['file']))
        {
            se_debug::$error_file = $error_data[0]['file'];
            se_debug::$error_line = $error_data[0]['line'];
        }
        se_debug::$error_code = $code;
        throw new self($message);
    }
}