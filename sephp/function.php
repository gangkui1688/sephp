<?php
namespace sephp;
use sephp\sephp;
use sephp\core\req;
use sephp\core\log;
use sephp\core\error;

class func
{
    /**
     * 注册结束执行函数
     * @param $class_name 类名称
     * @param $method_name 方法名称
     * @param array $param 参数
     */
    public static function set_shutdown_func($class_name, $method_name,$param = [])
    {
        $array = [
            'func' => [$class_name,$method_name],
            'params' => $param,
        ];

        array_merge(error::$shutdown_func, $array);
    }

    /**
     * 获得国家代码
     * @param string $ip
     * @return void
     */
    public static function get_country($ip = '')
    {
        // 如果是通过IP来获取城市地址的
        $ip = empty($ip) ? func::get_client_ip() : $ip;

        $ip_country_file = PATH_LIB . 'assets/IP-COUNTRY-ISP.BIN';
        if (!file_exists($ip_country_file))
        {
            new Exception('file [' . $ip_country_file . '] not found');
        }

        $db = new pub_ip2location($ip_country_file, pub_ip2location::FILE_IO);
        $records = $db->lookup($ip, array(pub_ip2location::COUNTRY_CODE));
        return strtoupper($records['countryCode']);

    }

    /**
     * 获得当前的Url
     */
    public static function get_cururl()
    {
        if(!empty($_SERVER["REQUEST_URI"]))
        {
            $scriptName = $_SERVER["REQUEST_URI"];
            $nowurl = $scriptName;
        }
        else
        {
            $scriptName = $_SERVER["PHP_SELF"];
            $nowurl = empty($_SERVER["QUERY_STRING"]) ? $scriptName : $scriptName."?".$_SERVER["QUERY_STRING"];
        }
        return $nowurl;
    }

    /**
     * Return's the user agent
     *
     * @param   $default
     * @return  string
     */
    public static function user_agent($default = '')
    {
        return $_SERVER['HTTP_USER_AGENT'];
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
     * 通关ua判断是否为手机
     * @return bool
     */
    public static function is_mobile()
    {
        //正则表达式,批配不同手机浏览器UA关键词。
        $regex_match = "/(nokia|iphone|android|motorola|^mot\-|softbank|foma|docomo|kddi|up\.browser|up\.link|";
        $regex_match .= "htc|dopod|blazer|netfront|helio|hosin|huawei|novarra|CoolPad|webos|techfaith|palmsource|";
        $regex_match .= "blackberry|alcatel|amoi|ktouch|nexian|samsung|^sam\-|s[cg]h|^lge|ericsson|philips|sagem|wellcom|bunjalloo|maui|";
        $regex_match .= "symbian|smartphone|midp|wap|phone|windows ce|iemobile|^spice|^bird|^zte\-|longcos|pantech|gionee|^sie\-|portalmmm|";
        $regex_match .= "jig\s browser|hiptop|^ucweb|^benq|haier|^lct|opera\s*mobi|opera\*mini|320×320|240×320|176×220";
        $regex_match .= "|mqqbrowser|juc|iuc|ios|ipad";
        $regex_match .= ")/i";

        return isset($_SERVER['HTTP_X_WAP_PROFILE']) or isset($_SERVER['HTTP_PROFILE']) or
            preg_match($regex_match, strtolower($_SERVER['HTTP_USER_AGENT']));
    }



    public static function get_referrer($gourl = '')
    {
        $gourl = empty($_SERVER['HTTP_REFERER']) ? $gourl : $_SERVER['HTTP_REFERER'];
        return $gourl;
    }


    /**
     * 返回随机字符串,包括特殊字符
     **/
    public static function rand_str($length = 8)
    {
        $output = '';
        for ($i=0 ; $i < $length ; $i++ )
        {
            $output .= chr(mt_rand(33,126));
        }
        return $output;
    }

    /**
     * 打印调试
     * @param null $arg
     * @param null $arg1
     * @param null $arg2
     * @param null $arg3
     */
    public static function p($arg = null,$arg1 = null,$arg2 = null,$arg3 = null)
    {
        echo '<pre>';
        var_dump($arg);
        empty($arg1)?'':var_dump($arg1);
        empty($arg2)?'':var_dump($arg2);
        empty($arg3)?'':var_dump($arg3);
        echo '</pre>';

    }

    /**
     * 获取客户端当前IP地址
     * @return string
     */
    public static function get_client_ip()
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
    public static function is_post()
    {
        return isset($_SERVER['REQUEST_METHOD']) && strtoupper($_SERVER['REQUEST_METHOD'])=='POST';
    }

    /**
     *@todo: 判断是否为get
     */
    public static function is_get()
    {
        return isset($_SERVER['REQUEST_METHOD']) && strtoupper($_SERVER['REQUEST_METHOD'])=='GET';
    }

    /**
     *@todo: 判断是否为ajax
     */
    public static function is_ajax()
    {
        return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtoupper($_SERVER['HTTP_X_REQUESTED_WITH'])=='XMLHTTPREQUEST';
    }

    /**
     *@todo: 判断是否为命令行模式
     */
    public static function is_cli()
    {
        return preg_match("/cli/i", PHP_SAPI) ? true : false;
    }

    /**
     * 格式化文件大小 单位
     * @param null $filepath
     * @return bool|float|int|string
     */
    public static function size_format($size = 0)
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

    public static function _shutdown_public($start_time = 0)
    {
        $end_time = microtime(true);

        log::init()->save();
    }

}

  

