<?php

/**
 * 页面跳转和重定向
 */
class show_msg
{

    /**
     * 重定向
     * @param string $url
     */
    public static function redirect($url = '')
    {
        $url = empty($url) ? WWW_URL.'/'.APP_NAME : $url;
        header('Location: '.$url);
    }

    /**
     * ajax 放回格式。
     * @param $msg  返回提示消息
     * @param int $code 返回错误状态号 200，400
     * @param string $data
     */
    public static function ajax($msg,$code = 200,$data = '')
    {

        http_response_code($code);
        $data = [
            'code'  =>  $code,
            'msg'   =>  $msg,
            'data'  =>  $data
        ];
        exit(json_encode($data,JSON_UNESCAPED_UNICODE));
    }

    public static function flush_msg($msg,$err=false){
        $err = $err ? "<span class='err'>ERROR:</span>" : '' ;
        echo "<p class='dbDebug'>".$err . $msg."</p>";
        flush();
    }


    public static function success($message = '',$url = '',$time = '',$title = '')
    {
        $message = empty($message)?'操作成功':$message;
        self::get_return_html($title,$message,$url,'success',$time);
    }


    public static function error($message = '',$url = '',$time = '' ,$title = '')
    {
        $message = empty($message)?'操作失败':$message;
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