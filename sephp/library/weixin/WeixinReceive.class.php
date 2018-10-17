<?php
/**
 * 微信API 接收接口
 *
 * PHP version 5
 *
 * @category	Lib
 * @package     COM
 * @subpackage  GZNC
 * @author      zhongyiwen
 * @version     SVN: $Id: WeixinReceive.class.php 10 2013-10-08 01:34:05Z zhongyw $
 */

class WeixinReceive extends WeixinApi{
    protected $_rawget = NULL;
    protected $_rawpost = NULL;

    protected $_postData = NULL;
    protected $_getData = NULL;

    protected $_postObj = NULL; // 兼容旧程序
    protected $_getObj = NULL; // 兼容旧程序

    protected $_responseMsg;
    protected $_responseObj;

    /**
     * 消息体加密模式
     * @var string
     */
    protected $_msgEncodingMode = NULL;

    /**
     * 消息加密私钥
     * @var string
     */
    protected $_msgEncodingKey = NULL;

    /**
     * 原始加密消息
     * @var string
     */
    protected $_msgEncrypt = NULL;

    /**
     * 解密后的消息原文
     * @var string
     */
    protected $_msgDecrypt = NULL;

    /**
     * 解密后的消息数组
     * @var array
     */
    protected $_msgData = NULL;



    /**
     * 检查消息签名
     * @param object $getObj
     * @return boolean 成功返回true，失败返回false
     */
    protected function _checkSignature($getData)
    {
        $signature = $getData['signature'];
        $timestamp = $getData['timestamp'];
        $nonce = $getData['nonce'];

        $token = $this->Config->AppToken;
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );

        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 判断消息加密模式
     * @param object $getObj
     * @param object $postObj
     * @return string|false
     */
    protected function _checkEncodingMode($getData, $postData){
        if(!is_null($this->_msgEncodingMode)){
            return $this->_msgEncodingMode;
        }

        if(empty($getData['encrypt_type']) || !strcasecmp($getData['encrypt_type'], 'raw')){
            $this->_msgEncodingMode = WXAPI_APP_ENCODING_CLEAR;
        }elseif(strlen($getData['msg_signature']) && !strcasecmp($getData['encrypt_type'], 'aes')){
            if(!empty($postData['MsgType']) && !empty($postData['FromUserName'])){
                $this->_msgEncodingMode =  WXAPI_APP_ENCODING_COMPAT;
            }else{
                $this->_msgEncodingMode =  WXAPI_APP_ENCODING_SECURE;
            }
        }else{
            $this->_msgEncodingMode = false;
        }

        return $this->_msgEncodingMode;
    }

    protected function _postData(){
        if(!is_null($this->_postData)){
            return $this->_postData;
        }

        $this->_rawpost = file_get_contents("php://input");

        if(!empty($this->_rawpost)){
            $postObj = simplexml_load_string(trim($this->_rawpost), 'SimpleXMLElement', LIBXML_NOCDATA);

            $this->_postData = WeixinApi_Kit::get_object_vars_final($postObj);

            // 2015.3.3 zhongyw 必须从postData转为object
            // simplexml_load_string()返回的为SimpleXMLElement Object，而不是stdClass Object,
            // 用is_string($postObj->FromUserName)判断时会返回false
            $this->_postObj = (object) $this->_postData; // 兼容旧程序
        }else{
            $this->_postData = false;
            $this->_postObj = false;
        }

        return $this->_postData;

    }

    protected function _getData(){
        if(!is_null($this->_getData)){
            return $this->_getData;
        }

        $this->_rawget = $_GET;
        if ($this->_rawget) {
            $getData = array (
                'signature' => $_GET ["signature"],
                'timestamp' => $_GET ["timestamp"],
                'nonce' => $_GET ["nonce"]
            );

            if (isset ( $_GET ['echostr'] )) { $getData ['echostr'] = $_GET ['echostr']; }
            if (isset ( $_GET ['encrypt_type'] )) { $getData ['encrypt_type'] = $_GET ['encrypt_type']; }
            if (isset ( $_GET ['msg_signature'] )) { $getData ['msg_signature'] = $_GET ['msg_signature']; }

            $this->_getData = $getData;

            // 兼容旧程序
            $this->_getObj = ( object ) $getData;
        }else{
            $this->_getData = false;

            $this->_getObj = false;
        }

        return $this->_getData;
    }

    /**
     * 运行接收
     * @param mixed $responseObj 响应对象，可以传回调函数
     */
    public function run($responseObj=NULL){
        $request_url = WeixinApi_Kit::get_request_url();
        $client_ip = WeixinApi_Kit::get_client_ip();

        $this->_log("--------------------------------------------------------");
        $this->_log("Received new request from {$client_ip}", WXAPI_LOG_INFO);
        $this->_log("Request URL: {$request_url}", WXAPI_LOG_INFO);

        $this->_log("Get: " . print_r($_GET, true), WXAPI_LOG_DEBUG);
        $this->_log("Post: " . print_r($_POST, true), WXAPI_LOG_DEBUG);

        $getData = $this->_getData();

        // 验证签名
        if(!$getData || !$this->_checkSignature($getData)){
            // invalid request
            // log it? or do other things
            $this->_log("Bad Request, Check Signature Failed!", WXAPI_LOG_ERR);
            return false;
        }

        $postData = $this->_postData();

        // 消息体是否为空？
        if(false==$postData){
            $this->_log("Msg Body is Empty!", WXAPI_LOG_ERR);
            return false;
        }

        $this->_log ( "rawPost: " . $this->_rawpost, WXAPI_LOG_DEBUG );
        $this->_log ( "postData: " . print_r ( $postData, true ), WXAPI_LOG_DEBUG );

        // 判断消息加密模式
        $encodingMode = $this->_checkEncodingMode($getData, $postData);
        if(false==$encodingMode){
            $this->_log("Check Msg Encoding Mode Failed!", WXAPI_LOG_ERR);
            return false;
        }

        $this->_log("MSG Encoding Mode is: " . $encodingMode, WXAPI_LOG_DEBUG);

        // 解密消息
        switch($encodingMode){
            case WXAPI_APP_ENCODING_SECURE:
                if(false===$this->_decodeMessage()){
                    $this->_log("Bad Request, Decode Message Failed!", WXAPI_LOG_ERR);
                    return false;
                }else{
                    $this->_log("Decode Message Succ!", WXAPI_LOG_INFO);
                }
                break;

            case WXAPI_APP_ENCODING_COMPAT:
                if(false===$this->_decodeMessage()){
                    $this->_log("Decode Message Failed!", WXAPI_LOG_ERR);
                }else{
                    $this->_log("Decode Message Succ!", WXAPI_LOG_INFO);
                }

                break;

            default:
                // DO NOTHING
                break;
        }

        if (empty ( $responseObj )) {
            $responseObj = $this->Config->Response;
        }

        // get response
        $response = $this->_responseMsg = $this->_response ( $responseObj );

        if ($response === false) {
            $this->_log ( "No Reponse Sent!", WXAPI_LOG_INFO );

            // save message
            $this->_saveMessage ();

            return false;
        }

        // echo response
        echo $response;
        flush ();

        // log
        $this->_log ( "Succ! Send Response: " . $response, WXAPI_LOG_INFO );

        // save message
        $this->_saveMessage ();

        // save response
        $this->_saveResponse ( $this->_responseObj );

        return true;
    }

    protected function _response($responseObj){
        if(is_object($responseObj)){
            $callback = array($responseObj, 'run');
        }else{
            $callback = $responseObj;
        }

        return $this->_run_callback($callback, array($this), $this->_responseObj);
    }

    /**
     * 保存消息
     * @return mixed|boolean
     */
    protected function _saveMessage(){
        if($this->Config->SaveMessage){
            return $this->_run_callback($this->Config->SaveMessage, array($this));
        }else{
            return false;
        }
    }

    /**
     * 保存回复
     * @param mixed $responseObj
     * @return mixed|boolean
     */
    protected function _saveResponse($responseObj){
        if($this->Config->SaveResponse){
            return $this->_run_callback($this->Config->SaveResponse, array($this, $responseObj));
        }else{
            return false;
        }
    }

    public function __get($c){
        if(substr($c, 0, 1)!='_'){
            if(in_array($c, array('Http'))){
                return parent::__get($c);
            }else{
                $n = '_' . $c;
                return $this->$n;
            }
        }
    }

    public function __isset($c){
        if(substr($c, 0, 1)!='_'){
            if(in_array($c, array('Http'))){
                return parent::__isset($c);
            }else{
                $n = '_' . $c;
                return isset($this->$n);
            }
        }
    }

    /**
     * 获取openid
     * @return string
     */
    public function parse_openid(){
        if(isset($this->_postObj->FromUserName) && !empty($this->_postObj->FromUserName)){
            return $this->_postObj->FromUserName;
        }else{
            return null;
        }
    }

    /**
     * 对密文消息进行解密
     * @param string $msg_encrypt 需要解密的密文
     * @param string $encodingkey 加密私钥
     * @return string|false 解密得到的明文，失败返回flase
     */
    protected function _decryptMsg($msg_encrypt, $encodingkey=NULL)
    {
        $AESKey = base64_decode(($encodingkey?$encodingkey:$this->Config->AppEncodingAESKey) . "=");

        //使用BASE64对需要解密的字符串进行解码
        $ciphertext_dec = base64_decode($msg_encrypt);

        $module = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, '');
        if(false===$module){
            return $this->_throw_exception(
                "Cann't open an encryption descriptor"
                , WXAPI_ERR_BAD_ENCRYPT
                , $msg_encrypt
                , __FILE__, __LINE__
            );
        }

        $iv = substr($AESKey, 0, 16);
        $init = mcrypt_generic_init($module, $AESKey, $iv);
        if(false===$init){
            return $this->_throw_exception(
                "Cann't initialize buffers for encryption"
                , WXAPI_ERR_BAD_ENCRYPT
                , array('msg_encrypt' => $msg_encrypt, 'mcrypt_generic_init return' => $init)
                , __FILE__, __LINE__
            );
        }elseif(-3==$init){
            return $this->_throw_exception(
                "the key length was incorrect"
                , WXAPI_ERR_BAD_ENCRYPT
                , array('msg_encrypt' => $msg_encrypt, 'mcrypt_generic_init return' => $init)
                , __FILE__, __LINE__
            );
        }elseif(-4==$init){
            return $this->_throw_exception(
                "there was a memory allocation problem"
                , WXAPI_ERR_BAD_ENCRYPT
                , array('msg_encrypt' => $msg_encrypt, 'mcrypt_generic_init return' => $init)
                , __FILE__, __LINE__
            );
        }elseif($init<0){
            return $this->_throw_exception(
                "an unknown error occurred when initialize buffers for encryption"
                , WXAPI_ERR_BAD_ENCRYPT
                , array('msg_encrypt' => $msg_encrypt, 'mcrypt_generic_init return' => $init)
                , __FILE__, __LINE__
            );
        }

        //解密
        $decrypted = mdecrypt_generic($module, $ciphertext_dec);
        mcrypt_generic_deinit($module);
        mcrypt_module_close($module);

        if(!$decrypted){
            return "";
        }

        // 去除补位字符
        $result = WeixinApi_Kit::pkcs7_decode( $decrypted, 32 );
        // 去除16位随机字符串,网络字节序和AppId
        if (strlen ( $result ) < 16){
            return "";
        }

        $content = substr ( $result, 16, strlen ( $result ) );
        $len_list = unpack ( "N", substr ( $content, 0, 4 ) );
        $xml_len = $len_list [1];
        $xml_content = substr ( $content, 4, $xml_len );

        return $xml_content;
    }

    /**
     * 返回微信发过来的加密消息
     * @return string
     */
    protected function _getMsgEncrypt(){
        if($this->_msgEncrypt){
            return $this->_msgEncrypt;
        }

        if(!empty($this->_getData['echostr'])){
            $this->_msgEncrypt = $this->_getData['echostr'];
        }else{
            $this->_msgEncrypt = $this->_postData['Encrypt'];
        }

        return $this->_msgEncrypt;
    }

    protected function _msgData() {
        if (! is_null ( $this->_msgData )) {
            return $this->_msgData;
        }

        $this->_msgData = false;

        $msg_encrypt = $this->_getMsgEncrypt ();
        if ($msg_encrypt) {
            if(!empty($this->_getData['echostr'])){
                $this->_msgData = array();
            }else{
                $xml_content = false;

                $encodingkey = $this->Config->AppEncodingAESKey;
                if($encodingkey){
                    $xml_content = $this->_decryptMsg ( $msg_encrypt, $encodingkey );
                    if($xml_content){
                        $this->_msgEncodingKey = $encodingkey;
                        $this->_log("AES Key: Decode Succ! ", WXAPI_LOG_DEBUG);
                    }else{
                        $this->_log("AES Key: Decode Failed!", WXAPI_LOG_DEBUG);
                    }
                }else{
                    $this->_log("Encoding AES Key is empty", WXAPI_LOG_DEBUG);
                }

                // 尝试旧密钥
                if(!$xml_content && ($encodingkey = $this->Config->AppEncodingOLDKey)){
                    $xml_content = $this->_decryptMsg ( $msg_encrypt, $encodingkey );

                    $this->_log("Try to apply OLD Key", WXAPI_LOG_DEBUG);

                    if($xml_content){
                        $this->_msgEncodingKey = $encodingkey;
                        $this->_log("OLD Key: Decode Succ! ", WXAPI_LOG_DEBUG);
                    }else{
                        $this->_log("OLD Key: Decode Failed!", WXAPI_LOG_DEBUG);
                    }
                }

                if($xml_content){
                    $this->_msgDecrypt = $xml_content;

                    import ( 'COM.GZNC.WeixinApi.WeixinApi_Kit' );
                    $postObj = simplexml_load_string ( $xml_content, 'SimpleXMLElement', LIBXML_NOCDATA );
                    $this->_msgData = WeixinApi_Kit::get_object_vars_final ( $postObj );

                    $this->_log('Decoded MSG XML: ' . $this->_msgDecrypt, WXAPI_LOG_DEBUG);
                    $this->_log('Decoded MSG DATA: ' . print_r($this->_msgData, true), WXAPI_LOG_DEBUG);
                }
            }
        }

        return $this->_msgData;
    }

    protected function _decodeMessage(){
        if(false===$this->_msgData()){
            return false;
        }

        // 兼容旧程序
        $this->_postData = array_merge($this->_postData, $this->_msgData);
        $this->_postObj = (object) $this->_postData;

        return true;
    }


}