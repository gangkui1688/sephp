<?php

/**
 * 页面跳转和重定向
 */
class show_msg
{

    /**
     * 重定向
     */
    public static function redirect()
    {

    }

    public static function success($message = '',$url = '',$time = '',$title = '')
    {
        $message = empty($message)?'操作失败':$message;
        self::get_return_html($title,$message,$url,'success',$time);
    }


    public static function error($message = '',$url = '',$time = '' ,$title = '')
    {
        $message = empty($message)?'操作成功':$message;
        self::get_return_html($title,$message,$url,'error',$time);
    }

    public static function get_return_html($title,$message,$gourl = '',$type,$time = '')
    {
        $title = empty($title)?'系统提示':$title;
        $time = empty($time)?3000:$time * 1000;
        switch ($gourl)
        {
            case '-1':
                $gourl = 'javascript:window.history.go(-1)';
                $junp_settimeout = 'window.history.go(-1);';
                break;
            case '':
                $junp_settimeout = 'window.history.go(-1);';
                $gourl = 'javascript:window.history.go(-1)';
                break;
            default:
                //$url = explode('/',$gourl);
                //$gourl = '?ct=';

                $junp_settimeout = "location.href= '{$gourl}';";
        }
        view::assign('junp_settimeout',$junp_settimeout);
        view::assign('type',$type);
        view::assign('title',$title);
        view::assign('message',$message);
        view::assign('jump_url',$gourl);
        view::assign('jump_time',$time);
        echo view::fetch('system/jump');
        exit();
    }
}