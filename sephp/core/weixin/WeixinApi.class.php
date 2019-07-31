<?php
namespace sephp\core;
/**
 * 微信API 公用方法
 *
 * PHP version 5
 *
 * @category	Lib
 * @package     COM
 * @subpackage  GZNC
 * @author      zhongyiwen
 * @version     SVN: $Id: WeixinApi.class.php 10 2013-10-08 01:34:05Z zhongyw $
 */

/**
 * 错误代码
 */
define('WXAPI_ERR_CONFIG', 1001); // 配置错误
define('WXAPI_ERR_HTTP', 1002); // 请求失败
define('WXAPI_ERR_LOGIN', 1003); // 登录失败
define('WXAPI_ERR_FETCH_DATA', 1004); // 获取数据失败
define('WXAPI_ERR_MISS_RESPONSE', 1005); // 缺少响应
define('WXAPI_ERR_BAD_SIGNATURE', 1006); // 签名校验失败
define('WXAPI_ERR_BAD_DECRYPT', 1007); // 消息解密失败
define('WXAPI_ERR_BAD_ENCRYPT', 1008); // 消息加密失败
define('WXAPI_ERR_ACCESS_TOKEN', 1009); // access token凭证错误

/**
 * 日志级别
 */
define('WXAPI_LOG_EMERG', 'EMERG');  // 严重错误: 导致系统崩溃无法使用
define('WXAPI_LOG_ALERT', 'ALERT');  // 警戒性错误: 必须被立即修改的错误
define('WXAPI_LOG_CRIT', 'CRIT');  // 临界值错误: 超过临界值的错误，例如一天24小时，而输入的是25小时这样
define('WXAPI_LOG_ERR', 'ERR');  // 一般错误: 一般性错误
define('WXAPI_LOG_WARN', 'WARN');  // 警告性错误: 需要发出警告的错误
define('WXAPI_LOG_NOTICE', 'NOTIC');  // 通知: 程序可以运行但是还不够完美的错误
define('WXAPI_LOG_INFO', 'INFO');  // 信息: 程序输出信息
define('WXAPI_LOG_DEBUG', 'DEBUG');  // 调试: 调试信息
define('WXAPI_LOG_EXCEPTION', 'EXCEPTION'); // 异常信息

/**
 * 微信接口默认常量值
 */
define('WXAPI_ACCESS_TOKEN_EXPIRE', 7100); // access token有效时间，设置比微信默认有效时间7200秒小，避免出现过期错误
define('WXAPI_ACCESS_TOKEN_LIMIT', 2000); // access token每日限制次数
define('WXAPI_JSAPI_TICKET_EXPIRE', 7100); // jsapi ticket有效时间，单位秒
define('WXAPI_JSAPI_TICKET_LIMIT', 2000); // jsapi ticket每日限制次数
define('WXAPI_QRCODE_MIN_SCENE', 1); // 二维码场景值最小值
define('WXAPI_QRCODE_MAX_SCENE', 2147483647); // 二维码场景值最大值, 32位非0整型
define('WXAPI_QRCODE_MAX_LIMIT_SCENE', 100000); // 永久二维码场景值最大值
define('WXAPI_QRCODE_EXPIRE', 1800); // 临时二维码有效时间，单位秒
define('WXAPI_GROUP_MIN_CUSTOM_ID', 100); // 用户自定义用户组起始id值

/**
 * 微信暗语
 */
define('WXAPI_ARGOT_WHO_AM_I', 'show me your name'); // 显示当前4susername
define('WXAPI_ARGOT_DESTORY_SESSION', 'let me out'); // 清除当前用户session

class WeixinApi{
    /**
     * 实例化对象
     *
     * @var array
     */
    protected static $_instance = array();


    /**
     * 是否启用缓存
     * @var bool
     */
    protected $_cache = false;

    /**
     * 是否启用调试
     * @var bool
     */
    protected $_debug = false;

    /**
     * 配置对象实例
     * @var object
     */
    public $Config;

    /**
     * 错误信息
     * @var string
     */
    protected $_error = NULL;

    public function __construct($Config=NULL){
        $this->Config = is_object($Config)?$Config:self::instance('WeixinApi_Config');
        $this->_cache = $this->Config->Cache;
    }

    /**
     * 取得对象实例 支持调用类的静态方法
     * @param string $class 对象类名
     * @param string $method 类的静态方法名
     * @return object
     */
    public static function instance($class,$args=array()) {
        $identify   =   $class.md5(serialize($args));
        if(!isset(WeixinApi::$_instance[$identify])) {
            if(!class_exists($class)){
                require $class . ".class.php";
            }

            if(class_exists($class)){
                $arg_str = '';
                if($args && is_array($args)){
                    foreach ($args as $i=>$arg){
                        /*
                        if(is_object($arg) || is_array($arg)){
                            return WeixinApi::throw_exception(
                                    "Cann't init class $class instanse with object argument"
                                    , WXAPI_ERR_CONFIG
                                    , array('class' => $class, 'args' => $args)
                                    , __FILE__, __LINE);
                        }else{
                            $arg_str = "'" . implode("', '", array_map('addslashes', $args)) . "'";
                        }*/

                        if(is_object($arg) || is_array($arg)){
                            $arg_param_name = 'arg_param' . $i;
                            $$arg_param_name = $arg;
                            $arg_str .= ", \${$arg_param_name}";
                        }else{
                            $arg_str .= ", '" . addcslashes($arg, "'") . "'";
                        }
                    }

                    if($arg_str){
                        $arg_str = substr($arg_str, 2);
                    }

                }elseif($args && is_object($args)){
                    /*
                    return WeixinApi::throw_exception(
                            "Cann't init class $class instanse with object argument"
                            , WXAPI_ERR_CONFIG
                            , array('class' => $class, 'args' => $args)
                            , __FILE__, __LINE);
                    */
                    $arg_param_name = 'arg_param';
                    $$arg_param_name = $args;
                    $arg_str = "\${$arg_param_name}";

                }elseif($args){
                    $arg_str = "'" . addcslashes($args, "'") . "'";
                }

                $code = "return new " . $class . "(" . $arg_str . ");";
                $o = eval($code);

                if(!$o){
                    return WeixinApi::throw_exception(
                        "Cann't init class instanse: $class"
                        , WXAPI_ERR_CONFIG
                        , array('class' => $class, 'args' => $args)
                        , __FILE__, __LINE);
                }
                WeixinApi::$_instance[$identify] = $o;
            }
            else{
                return WeixinApi::throw_exception(
                    "Cann't found class: $class file."
                    , WXAPI_ERR_CONFIG
                    , array('class' => $class, 'args' => $args)
                    , __FILE__, __LINE__);
            }
        }
        return self::$_instance[$identify];
    }

    public static function throw_exception($message, $code=NULL, $data=NULL, $file=NULL, $line=NULL){
        if(!class_exists('WeixinApi_Exception')){
            require 'WeixinApi_Exception.class.php';
        }

        // 只有配置错误才再次抛出异常
        //if($code==WXAPI_ERR_CONFIG){
        throw new WeixinApi_Exception($message, $code, $data, $file, $line);
        //}else{
        //	return false;
        //}
    }

    protected function _throw_exception($message, $code=NULL, $data=NULL, $file=NULL, $line=NULL){
        try{
            WeixinApi::throw_exception($message, $code, $data, $file, $line);
        }catch(Exception $e){
            //$this->_error = $e->getMessage();
            $this->_setError($e->getMessage());
            $this->_log($e->__toString(), WXAPI_LOG_ERR);

            // 只有配置错误才再次抛出异常
            if($code==WXAPI_ERR_CONFIG){
                throw $e;
            }else{
                return false;
            }
        }
    }

    public function getError(){
        return is_array($this->_error)?implode(',', $this->_error):$this->_error;
    }

    /**
     * 设置错误信息
     * @param string $error
     */
    protected function _setError($error){
        $this->_error[] = $error;
    }

    public function __get($n){
        if(isset($this->$n)){
            return $this->$n;
        }else if(in_array($n, array('Http', 'Cache', 'Log'))){
            if('Http'==$n && !$this->Config->$n){
                return $this->_throw_exception("$n is not setted in your config"
                    , WXAPI_ERR_CONFIG
                    , array('class'=>$n)
                    , __FILE__, __LINE__
                );
            }elseif(!$this->Config->$n){
                // Do Nothing
                // Disabled Cache or Log
                return false;
            }

            if(is_object($this->Config->$n)){
                return $this->Config->$n;
            }elseif(is_array($this->Config->$n)){
                list($callback, $params) = $this->Config->$n;
                if(!is_array($params)){
                    $params = array($params);
                }
                return call_user_func_array($callback, $params);
            }else{
                return $this->$n = WeixinApi::instance($this->Config->$n);
            }
        }else{
            return false;
        }
    }

    protected function _check_http_url($url){
        if(strcasecmp('http', substr($url, 0, 4))){
            $url = $this->Config->ApiGateway . $url;
        }

        return $url;
    }

    protected function _check_http_ssl($url){
        if(!strcasecmp('https://', substr($url, 0, 8))){
            $this->Http->setSsl();

            // 指定ssl v3
            // 2014.09.05 zhongyw 微信API不能指定用ssl v3版本
            //$this->Http->setOpt(CURLOPT_SSLVERSION, 3);

            // 指定TLS
            // 2014.10.31 zhongyw
            // 微信公众平台将关闭掉SSLv2、SSLv3版本支持，不再支持部分使用SSLv2、 SSLv3或更低版本的客户端调用。请仍在使用这些版本的开发者于11月30日前尽快修复升级。
            defined('CURL_SSLVERSION_TLSv1') || define('CURL_SSLVERSION_TLSv1', 1); // 兼容PHP<=5.3
            $this->Http->setOpt(CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1);
        }

        return $url;
    }

    protected function _check_http_data($data){
        return $data;
    }

    /**
     * 发送GET请求
     *
     * @param string $url	链接
     * @param string|array $data	参数
     * @param bool $check	是否检查链接和参数
     * @return string
     */
    public function get($url, $data = null, $check=true) {
        if ($check) {
            $url = $this->_check_http_url ( $url );
            $url = $this->_check_http_ssl ( $url );
            $data = $this->_check_http_data ( $data );
        }

        if(!($return = $this->Http->get($url, $data)) && ($error=$this->Http->getError())){
            return $this->_throw_exception(
                $error
                , WXAPI_ERR_HTTP
                , array('url' => $url, 'data' => $data, 'method' => 'get', 'response' => $return)
                , __FILE__, __LINE__);
        }


        return $return;
    }

    /**
     * 发送POST请求
     *
     * @param string $url	链接
     * @param array $data	参数
     * @param bool $check	是否检查链接和参数
     * @return string
     */
    public function post($url, $data, $check=true) {
        if ($check) {
            $url = $this->_check_http_url ( $url );
            $url = $this->_check_http_ssl ( $url );
            $data = $this->_check_http_data ( $data );
        }

        // 使用plainPost
        if(!($return = $this->Http->plainPost($url, $data)) && ($error=$this->Http->getError())){
            return $this->_throw_exception(
                $error
                , WXAPI_ERR_HTTP
                , array('url' => $url, 'data' => $data, 'method' => 'post', 'response' => $return)
                , __FILE__, __LINE__);
        }

        return $return;
    }

    public function setHttpOption($opt, $val=NULL){
        if(!$opt){
            return false;
        }

        $options = array();
        if(!is_array($opt)){
            $options = array($opt=>$val);
        }else{
            $options = $opt;
        }

        foreach($options as $opt=>$val){
            $this->Http->setOpt(constant($opt), $val);
        }
    }

    /**
     * 运行回调函数
     *
     * 回调函数支持以下几种格式：
     * 1、直接函数：funcname，或带参数：array(funcname, params)
     * 2、静态方法：array(array('WeixinApi', 'methodname'), params)
     * 3、对象方法：array(Object, 'methodname') 或  array(array(Object, 'methodname'), params)
     * 4、二次回调，如：
     * array(array(
    array(array('WeixinApi', 'instance'), 'S4WeixinResponse')
    , 'run')
    , '')

    可以先调用Runder::instance()初始化S4Web实例后，再调用S4Web->apiglog_save()方法执行回调
     *
     * @param mixed $callback 回调函数
     * @param array $extra_params 回调参数
     * @return mixed
     */
    protected function _run_callback($callback, $extra_params=array(), &$callbackObject=NULL) {
        $extra_params = is_array ( $extra_params ) ? $extra_params : ($extra_params ? array (
            $extra_params
        ) : array ());

        $params = $extra_params;

        if(is_object($callback)){
            return $this->_throw_exception(
                "Object callback must set method"
                , SCRIPT_ERR_CONFIG
                , array('callback'=>$callback)
                , __FILE__, __LINE__
            );
        }
        else if (is_array ( $callback )) {
            $func = $callback [0];
            if (! empty ( $callback [1] )) {
                if (is_array ( $callback [1] )) {
                    $params = array_merge ( $extra_params, $callback [1] );
                } else {
                    $params [] = $callback [1];
                }
            }

            if (is_object ( $func )) {
                $callbackObject = $func;
                // 注意：此处不需要传$params作为参数
                return call_user_method_array ( $callback [1], $callback [0], $extra_params );
            } elseif (is_object ( $callback [0] [0] )) {
                $callbackObject = $callback [0] [0];
                return call_user_method_array ( $callback [0] [1], $callback [0] [0], $params);
            }
        } else {
            $func = $callback;
        }

        if(is_array($func) && is_array($func[0])){
            $call = call_user_func_array($func[0][0], is_array($func[0][1])?$func[0][1]:array($func[0][1]));
            if($call===false){
                return false;
            }

            $func = array($call, $func[1]);
        }

        if(is_array($func) && is_object($func[0])){
            $callbackObject = $func[0];
        }

        return call_user_func_array ( $func, $params);
    }

    /**
     * 是否缓存
     * @param bool|int $cache true = 启用缓存，false = 不缓存，-1 = 重新生成缓存，3600 = 设置缓存时间为3600秒
     * @return WeixinClient
     */
    public function cache($cache=true){
        $this->_cache = $cache;
        return $this;
    }

    public function debug($debug=true){
        $this->_debug = $debug;
        return $this;
    }

    /**
     * 写入或者获取缓存
     *
     * @param string $cache_id 缓存id
     * @param string $cache_data 缓存数据
     * @param int $cache_expire 缓存时间
     * @return mixed|boolean
     */
    protected function _cache($cache_id, $cache_data=NULL, $cache_expire=NULL){
        if($this->Config->Cache){
            // 保存缓存索引
            if($cache_id && (!is_null($cache_data) && $cache_data!==false && $cache_expire!==false)
                && $this->Config->CacheSaveIndex
                && strcasecmp($cache_id, $this->Config->CacheSaveIndex)
            ){
                $index_cache_id = $this->Config->CacheSaveIndex;
                $index_cache_expire = 315360000; // 永久保存: 3600*24*365*10

                // 取已有的缓存
                if(!($index_cache_data=$this->_cache($index_cache_id))){
                    $index_cache_data = array();
                }

                // 删除已过期索引
                $now_time = time();
                foreach($index_cache_data as $k=>$d){
                    if($d && $d['expire'] && $d['created'] && ($d['created']+$d['expire'])<$now_time){
                        unset($index_cache_data[$k]);
                    }
                }

                $index_cache_data[$cache_id] = array(
                    'created' => $now_time,
                    'expire' => $cache_expire,
                );

                //S4Web::debug_log("\$index_cache_id=$index_cache_id");
                //S4Web::debug_log("\$index_cache_data=" . print_r($index_cache_data, true));

                $succ = $this->_cache($index_cache_id, $index_cache_data, $index_cache_expire);
                $this->_log("Save cache id:  " . $cache_id . ' ' . ($succ?'Succ':'Failed') . '!', WXAPI_LOG_DEBUG);
            }

            return $this->_run_callback($this->Config->Cache, array($cache_id, $cache_data, $cache_expire));
        }else{
            return false;
        }
    }

    protected function _cache_id($url, $data = NULL, $cache = NULL) {
        if ($cache && $cache!==true && !is_numeric($cache)){
            if(is_string ( $cache )) {
                $cache_id = $cache;
            } elseif (is_array ( $cache ) && isset($cache['cache_id'])) {
                $cache_id = $cache ['cache_id'];
            } elseif (is_object ( $cache ) && isset($cache['cache_id'])) {
                $cache_id = $cache->cache_id;
            }

            // 添加缓存前缀
            /*
             注：由ThinkPHP处理缓存添加前缀：C('DATA_CACHE_PREFIX')
            if($cache_id && $this->Config->CacheBin){
                $cache_id = $this->Config->CacheBin . $cache_id;
            }*/
        }

        if (!$cache_id) {
            $param = '';
            if ($data && is_array ( $data )) {
                $param .= http_build_query ( $data );
            } else {
                $param .= $data;
            }
            $cache_id = md5 ( $this->Config->AppId . $url . $param );
            //return $cache_id;
        }

        return $cache_id;
    }

    protected function _cache_expire($url, $data=NULL, $cache=NULL){
        if(!$cache){
            return 0;
        }elseif(is_numeric($cache) && $cache>0){
            $cache_expire = $cache;
        }elseif (is_array($cache) && isset($cache['cache_expire'])){
            $cache_expire = $cache['cache_expire'];
        }elseif (is_object($cache) && isset($cache->cache_expire)){
            $cache_expire = $cache->cache_expire;
        }

        return $cache_expire?$cache_expire:$this->Config->CacheExpire;
    }

    /**
     * 判断是否强制刷新缓存
     * @param unknown $url
     * @param string $data
     * @param string $cache
     * @return bool
     */
    protected function _cache_refresh($url, $data=NULL, $cache=NULL){
        $cache_refresh = false;

        if ($cache && $cache!==true && !is_numeric($cache)){
            if (is_array ( $cache ) && isset($cache['cache_refresh'])) {
                $cache_refresh = $cache ['cache_refresh'];
            } elseif (is_object ( $cache ) && isset($cache['cache_refresh'])) {
                $cache_refresh = $cache->cache_refresh;
            }
        }

        return $cache_refresh;
    }

    /**
     * 写入日志
     * @param string $message
     * @param string $level
     * @return boolean
     */
    protected function _log($message, $level=WXAPI_LOG_INFO){
        if($this->Config->Log){
            static $aLogLevelMaps = array(
                WXAPI_LOG_EMERG => 0,
                WXAPI_LOG_ALERT => 1,
                WXAPI_LOG_CRIT => 2,
                WXAPI_LOG_ERR => 3,
                WXAPI_LOG_WARN => 4,
                WXAPI_LOG_NOTICE => 5,
                WXAPI_LOG_INFO => 6,
                WXAPI_LOG_DEBUG => 7,
            );

            if($this->Config->LogLevel && $aLogLevelMaps[$level]>$aLogLevelMaps[$this->Config->LogLevel]){
                return false;
            }

            return $this->_run_callback($this->Config->Log, array($message, $level));
        }else{
            return false;
        }
    }


    /**
     * 写入支付日志
     * @param string $message
     * @param string $level
     * @return boolean
     */
    protected function _logpay($message, $level=WXAPI_LOG_INFO){
        if($this->Config->PayLog){
            static $aLogLevelMaps = array(
                WXAPI_LOG_EMERG => 0,
                WXAPI_LOG_ALERT => 1,
                WXAPI_LOG_CRIT => 2,
                WXAPI_LOG_ERR => 3,
                WXAPI_LOG_WARN => 4,
                WXAPI_LOG_NOTICE => 5,
                WXAPI_LOG_INFO => 6,
                WXAPI_LOG_DEBUG => 7,
            );

            if($this->Config->PayLogLevel && $aLogLevelMaps[$level]>$aLogLevelMaps[$this->Config->PayLogLevel]){
                return false;
            }

            return $this->_run_callback($this->Config->PayLog, array($message, $level));
        }else{
            return false;
        }
    }

    /**
     * 判断是否微信媒体文件id
     * @param string $mediaid
     * @return boolean
     */
    protected function _isMediaId($mediaid){
        // aSeyL8Ym_0mu3u1qeHixvCe54XU-b8teahDXHdYl1tOB_1mgyUxJgj0A8CJZRNzl
        //return is_file($mediaid)?false:true;
        if(preg_match('/\.[a-z0-9]{1,4}$/i', $mediaid)){
            return false;
        }else{
            return true;
        }
    }

    /**
     * 清空微信API所有缓存数据
     *
     * @return bool
     */
    public function clearCache(){

        $this->_log("START Clear Cache...", WXAPI_LOG_INFO);
        if(!$this->Config->Cache || !$this->Config->CacheSaveIndex){
            $this->_log("Skipped, Cache or Save Cache index is disabled!", WXAPI_LOG_INFO);
            return false;
        }

        // 取缓存的索引
        $index_cache_id = $this->Config->CacheSaveIndex;
        if(!($index_cache_data=$this->_cache($index_cache_id))){
            $this->_log("Skipped, Cache Index is Empty!", WXAPI_LOG_INFO);
            return false;
        }

        $clear_succ = true;

        foreach($index_cache_data as $cache_id=>$d){
            $succ = $this->_cache($cache_id, false, false);
            $this->_log("Delete cache id: " . $cache_id . " " . ($succ?'Succ':'Failed') . '!', WXAPI_LOG_DEBUG);

            $clear_succ = $succ && $clear_succ;
        }

        // 删除索引自身
        $succ = $this->_cache($index_cache_id, false, false);
        $clear_succ = $succ && $clear_succ;

        $this->_log("Delete Index Cache Id: " . $index_cache_id . " " . ($succ?'Succ':'Failed') . '!', WXAPI_LOG_INFO);

        $this->_log("END Clear Cache, "  . ($clear_succ?'Succ':'Failed') . '!', WXAPI_LOG_INFO);

        return $clear_succ;
    }
}