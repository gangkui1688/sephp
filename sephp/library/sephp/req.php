<?php
/**
 * 处理外部请求变量的类
 *
 * 禁止此文件以外的文件出现 $_POST、$_GET、$_FILES变量及eval函数(用 req::myeval )
 * 以便于对主要黑客攻击进行防范
 *
 * @author seatle<seatle@foxmail.com>
 * @version 2.0
 */
class req
{
    // 用户的cookie
    public static $cookies = array();

    // 把GET、POST的变量合并一块，相当于 _REQUEST
    public static $forms = array();

    // _GET 变量
    public static $gets = array();

    // _POST 变量
    public static $posts = array();

    // 文件变量
    public static $files = array();

    /**
     * Raw input stream data
     * Holds a cache of php://input contents
     *
     * @var	string
     */
    private static $_raw_input_stream;

    /**
     * Parsed input stream data
     * Parsed from php://input at runtime
     *
     * @var	array
     */
    private $_input_stream;

    // url_rewrite
    public static $url_rewrite = false;

    // 严禁保存的文件名
    public static $filter_filename = '/\.(php|pl|sh|js)$/i';

    /**
     * 过滤器是否抛出异常
     * (只对邮箱、用户名、qq、手机类型有效)
     * 如果不抛出异常，对无效的数据修改为空字符串
     */
    public static $throw_error = false;

    /**
     * 初始化用户请求
     * 对于 post、get 的数据，会转到 selfforms 数组， 并删除原来数组
     * 对于 cookie 的数据，会转到 cookies 数组，但不删除原来数组
     */
    public static function init()
    {
        //命令行模式
        if( empty($_SERVER['REQUEST_METHOD']) )
        {
            return false;
        }
        //$magic_quotes_gpc = ini_get('magic_quotes_gpc');

        self::_to_param('get');
        self::_to_param('post');
        self::_to_param('cookie');


        //cls_security::init();
    }

    //强制要求对gpc变量进行转义处理
    public static function add_s( $str )
    {
        // Is the string an array?
        if (is_array($str))
        {
            foreach ($str as $key => &$value)
            {
                $str[$key] = self::add_s($value);
            }

            return $str;
        }

        $str = addslashes($str);
        return $str;
    }

    /**
     * 把 eval 重命名为 myeval
     */
    public static function myeval( $phpcode )
    {
        return eval( $phpcode );
    }

    /**
     * 获得指定表单值
     *
     * @param mixed $formname       表单名
     * @param string $defaultvalue  默认值
     * @param string $formattype    格式化类型
     * @return mixed $return        返回值
     * @author seatle <seatle@foxmail.com>
     * @created time :2014-12-16 10:48
     */
    public static function item( $formname = '', $defaultvalue = null, $filter_type = '' )
    {
        if( !isset(self::$forms[$formname]) || self::$forms[$formname] === '' )
        {
            return $defaultvalue;
        }
        else
        {
            filter::filter_execute(self::$forms[$formname], $filter_type, self::$throw_error);
            return self::$forms[$formname];
        }
    }

    /**
     * 获得get表单值
     */
    public static function get( $formname = '', $defaultvalue = null, $filter_type = '' )
    {
        if( !isset(self::$gets[$formname]) || self::$gets[$formname] === '' )
        {
            return $defaultvalue;
        }
        else
        {
            pub_filter::filter_execute(self::$gets[$formname], $filter_type, self::$throw_error);
            return self::$gets[$formname];
        }
    }

    /**
     * 获得post表单值
     */
    public static function post( $formname = '', $defaultvalue = null, $filter_type = '' )
    {
        if( !isset(self::$posts[$formname]) || self::$posts[$formname] === '' )
        {
            return $defaultvalue;
        }
        else
        {
            pub_filter::filter_execute(self::$posts[$formname], $filter_type, self::$throw_error);
            return self::$posts[$formname];
        }
    }

    /**
     * 获得指定cookie值
     */
    public static function cookie( $key = '', $defaultvalue = null, $filter_type = '' )
    {
        if( !isset(self::$cookies[$key]) || self::$cookies[$key] === '' )
        {
            return $defaultvalue;
        }
        else
        {
            pub_filter::filter_execute(self::$cookies[$key], $filter_type, self::$throw_error);
            return self::$cookies[$key];
        }
    }

    public static function raw_input_stream()
    {
        isset(self::$_raw_input_stream) || self::$_raw_input_stream = file_get_contents('php://input');
        return self::$_raw_input_stream;
    }

    /**
     * Fetch an item from the php://input stream
     *
     * Useful when you need to access PUT, DELETE or PATCH request data.
     *
     * @param	string	$index		Index for item to be fetched
     * @param	bool	$xss_clean	Whether to apply XSS filtering
     * @return	mixed
     */
    public function input_stream($index = '')
    {
        // Prior to PHP 5.6, the input stream can only be read once,
        // so we'll need to check if we have already done that first.
        if ( !is_array(self::$_input_stream) )
        {
            // self::_raw_input_stream will trigger __get().
            parse_str(self::$_raw_input_stream, self::$_input_stream);
            is_array(self::$_input_stream) || self::$_input_stream = array();
        }
        return self::$_input_stream[$index];
    }

    /**
     * 把指定数据转化为路由数据
     *
     * @param  $dfarr   默认数据列表 array( array(key, dfvalue)... )
     * @param  $datas   数据列表
     * @param  $method  方法
     * @return boolean
     */
    public static function assign_values(&$dfarr, &$datas, $method = 'GET')
    {
        $method = strtoupper( $method );
        foreach($dfarr as $k => $v)
        {
            if( isset($datas[$k]) )
            {
                req::$forms[ $v[0] ] = $datas[$k];
            }
            else
            {
                req::$forms[ $v[0] ] = $v[1];
            }
            //给值gets/posts
            if( $method == 'GET' )
            {
                req::$gets[ $v[0] ] = req::$forms[ $v[0] ];
            }
            else
            {
                req::$posts[ $v[0] ] = req::$forms[ $v[0] ];
            }
        }
    }

    /**
     * Fetch User Agent string
     *
     * @return	string|null	User Agent string or NULL if it doesn't exist
     */
    public static function user_agent()
    {
        return $_SERVER['HTTP_USER_AGENT'];
    }

    /**
     * 获取请求方法 POST、GET、PUT、DELETE
     *
     * @param mixed $upper
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2017-12-07 17:17
     */
    public static function method($upper = true)
    {
        return ($upper)
            ? strtoupper($_SERVER['REQUEST_METHOD'])
            : strtolower($_SERVER['REQUEST_METHOD']);
    }

    /**
     * 前页
     *
     * @param mixed $url
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2018-06-29 12:03
     */
    public static function forword($gourl = '')
    {
        $gourl = empty($_SERVER['HTTP_REFERER']) ? $gourl : $_SERVER['HTTP_REFERER'];
        return $gourl;
    }

    /**
     * 设置跳转页
     *
     * @param string $gourl
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2018-06-29 12:03
     */
    public static function set_redirect($gourl = '')
    {
        $gourl = urlencode($gourl);
        setcookie('gourl', $gourl);
    }

    /**
     * 跳转页
     *
     * @param mixed $gourl
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2018-06-29 12:03
     */
    public static function redirect($gourl = '')
    {
        $gourl = self::cookie('gourl', $gourl);
        $gourl = urldecode($gourl);
        return $gourl;
    }

    /**
     * jquery 发出 ajax 请求时，会在请求头部添加一个名为X-Requested-With的信息，信息内容为 XMLHttpRequest
     * js 需要如下处理
     * var xmlhttp=new XMLHttpRequest();
     * xmlhttp.open("GET","test.php",true);
     * xmlhttp.setRequestHeader("X-Requested-With","XMLHttpRequest");
     * xmlhttp.send();
     *
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2017-07-13 15:53
     */
    public static function is_ajax()
    {
        return isset($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest";
    }

    public static function is_html5()
    {
        $rs = true;
        if(!empty($_SERVER['HTTP_USER_AGENT']) && strpos($_SERVER['HTTP_USER_AGENT'], "MSIE"))
        {
            preg_match("#msie (\d+)#i", $_SERVER['HTTP_USER_AGENT'], $out);
            $version = empty($out[1]) ? 10 : intval($out[1]);
            if ($version < 9)
            {
                $rs = false;
            }
        }
        return $rs;
    }

    /**
     * 过滤文件相关
     */
    public static function filter_files( &$files )
    {
        self::$files = $files;
        unset($_FILES);
    }

    /**
     * 移动上传的文件
     * $item 是用于当文件表单名为数组，如 upfile[] 之类的情况, $item 表示数组的具体键值，下同
     * @return bool
     */
    public static function move_upload_file( $formname, $filename, $item = '' )
    {
        if( self::is_upload_file( $formname, $item ) )
        {
            if( preg_match(self::$filter_filename, $filename) )
            {
                return false;
            }
            else
            {
                if( $item === '' )
                {
                    if( PHP_OS == 'WINNT')
                        return copy(self::$files[$formname]['tmp_name'], $filename);
                    else
                        return move_uploaded_file(self::$files[$formname]['tmp_name'], $filename);
                }
                else
                {
                    if( PHP_OS == 'WINNT')
                        return copy(self::$files[$formname]['tmp_name'][$item], $filename);
                    else
                        return move_uploaded_file(self::$files[$formname]['tmp_name'][$item], $filename);
                }
            }
        }
    }

    /**
     * 获得指定临时文件名值
     */
    public static function get_tmp_name( $formname, $defaultvalue = '', $item = '' )
    {
        if( $item === '' )
        {
            return isset(self::$files[$formname]['tmp_name']) ? self::$files[$formname]['tmp_name'] :  $defaultvalue;
        }
        else
        {
            return isset(self::$files[$formname]['tmp_name'][$item]) ? self::$files[$formname]['tmp_name'][$item] :  $defaultvalue;
        }
    }

    /**
     * 获得文件的扩展名
     */
    public static function get_shortname( $formname, $item = '' )
    {
        if( $item === '' )
        {
            $filetype = strtolower(isset(self::$files[$formname]['type']) ? self::$files[$formname]['type'] : '');
        }
        else
        {
            $filetype = strtolower(isset(self::$files[$formname]['type'][$item]) ? self::$files[$formname]['type'][$item] : '');
        }

        $shortname = '';
        switch($filetype)
        {
            case 'image/jpeg':
                $shortname = 'jpg';
                break;
            case 'image/pjpeg':
                $shortname = 'jpg';
                break;
            case 'image/gif':
                $shortname = 'gif';
                break;
            case 'image/png':
                $shortname = 'png';
                break;
            case 'image/xpng':
                $shortname = 'png';
                break;
            case 'image/wbmp':
                $shortname = 'bmp';
                break;
            default:
                if( $item === '' )
                {
                    $filename = isset(self::$files[$formname]['name']) ? self::$files[$formname]['name'] : '';
                }
                else
                {
                    $filename = isset(self::$files[$formname]['name'][$item]) ? self::$files[$formname]['name'][$item] : '';
                }
                if( preg_match("/\./", $filename) )
                {
                    $fs = explode('.', $filename);
                    $shortname = strtolower($fs[ count($fs)-1 ]);
                }
                break;
        }
        return $shortname;
    }

    /**
     * 获得指定文件表单的文件详细信息
     */
    public static function get_file_info( $formname, $item = '' )
    {
        if( !isset( self::$files[$formname] ) )
        {
            return false;
        }
        else
        {
            if($item === '')
            {
                return self::$files[$formname];
            }
            else
            {
                if( !isset(self::$files[$formname][$item]) )
                {
                    return false;
                }
                else
                {
                    return self::$files[$formname][$item];
                }
            }
        }
    }

    /**
     * 判断是否存在上传的文件
     */
    public static function is_upload_file( $formname,  $item = '' )
    {
        if( $item === '' )
        {
            if( isset(self::$files[$formname]['error']) && self::$files[$formname]['error']==UPLOAD_ERR_OK  )
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            if( isset(self::$files[$formname]['error'][$item]) && self::$files[$formname]['error'][$item]==UPLOAD_ERR_OK  )
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    /**
     * 检查文件后缀是否为指定值
     *
     * @param  string  $subfix
     * @return boolean
     */
    public static function check_subfix($formname, $subfix = array('csv'), $item= '')
    {
        if( !in_array(self::get_shortname( $formname, $item ), $subfix) )
        {
            return false;
        }
        return true;
    }

    public static function _to_param($param_type)
    {
        switch ($param_type)
        {
            case 'get':
                $param = $_GET;
                unset($_GET);
                break;
            case 'post':
                $param = $_POST;
                unset($_POST);
                break;
            case 'cookie':
                self::$cookies = $_COOKIE;
                unset($_COOKIE);
                return true;
        }
        if(empty($param))
        {
            return true;
        }
        foreach ($param as $k=>$v)
        {
            self::$forms[$k] = $v;
        }
    }
}