<?php
namespace sephp\core;
use sephpsephp;/**
 * 微信API 响应接口
 *
 * PHP version 5
 *
 * @category	Lib
 * @package     COM
 * @subpackage  GZNC
 * @author      zhongyiwen
 * @version     SVN: $Id: WeixinResponse.class.php 10 2013-10-08 01:34:05Z zhongyw $
 */

class WeixinResponse extends WeixinApi{
    const AS_ECHO = 'ECHO'; // ECHO消息
    const AS_EMPTY = 'EMPTY'; // 空消息
    const AS_COMMAND = 'COMMAND'; // 指令消息
    const AS_SUBSCRIBE = 'SUBSCRIBE'; // 订阅消息
    const AS_UNSUBSCRIBE = 'UNSUBSCRIBE'; // 取消订阅消息
    const AS_SCAN = 'SCAN'; // 扫描消息
    const AS_CLICK = 'CLICK'; // 点击菜单拉取消息事件
    const AS_VIEW = 'VIEW'; // 点击菜单跳转链接事件
    const AS_SCANCODE_PUSH = 'SCANCODE_PUSH'; // 扫码推事件
    const AS_SCANCODE_WAITMSG = 'AS_SCANCODE_WAITMSG'; // 扫码推事件且弹出“消息接收中”提示框
    const AS_PIC_SYSPHOTO = 'pic_sysphoto'; // 弹出系统拍照发图
    const AS_PIC_PHOTO_OR_ALBUM = 'PIC_PHOTO_OR_ALBUM'; // 弹出拍照或者相册发图
    const AS_PIC_WEIXIN = 'pic_weixin'; // 弹出微信相册发图器
    const AS_LOCATION_SELECT = 'location_select'; // 弹出地理位置选择器
    const AS_LOCATION = 'LOCATION'; // 地理位置消息
    const AS_MESSAGE = 'MESSAGE'; // 普通消息
    const AS_MASSSENDJOBFINISH = 'MASSSENDJOBFINISH'; // 群发消息
    const AS_TEMPLATESENDJOBFINISH = 'TEMPLATESENDJOBFINISH'; // 模板消息

    const AS_UNKNOWN = 'UNKNOWN'; // 未知消息

    protected $_responseType; // 响应类型，对应上面的常量
    protected $_responseKey; // 响应值，如菜单点击，值为菜单Key
    protected $_responseContent; // 响应的原始数据
    protected $_responseMessage; // 响应输出消息数据（数组）
    protected $_responseMedia; // 响应输出的媒体文件

    /**
     * 运行
     * @param object $receiveObj 接收对象
     */
    public function run($receiveObj){
        try{
            return $this->_dispatchResponse($receiveObj);
        }catch (Exception $e){
            return false;
        }
    }

    /**
     * 分发响应
     * 判断响应类型，并返回相应的响应内容
     * @param object $receiveObj 接收对象
     */
    protected function _dispatchResponse($receiveObj){
        // 可以直接判定消息类别，不需要依赖外部配置数据
        if($this->_isEcho($receiveObj)){
            $this->_responseType = WeixinResponse::AS_ECHO;
            $this->_responseKey = '';
            $this->_responseContent = $this->_responseEcho($receiveObj);
            $msgFormat = 'raw';
        }elseif($this->_isEmpty($receiveObj)){
            $this->_responseType = WeixinResponse::AS_EMPTY;
            $this->_responseKey = '';
            $this->_responseContent = $this->_responseEmpty($receiveObj);
            $msgFormat = 'raw';
        }elseif(($key=$this->_isView($receiveObj))){
            $this->_responseType = WeixinResponse::AS_VIEW;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseView($receiveObj);
            $msgFormat = 'sysXml';
        }

        // 事件，需要加载外部配置数据
        // 注意：要先判断订阅事件，避免缓存误判
        elseif(($key=$this->_isSubscribe($receiveObj))){
            $this->_responseType = WeixinResponse::AS_SUBSCRIBE;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseSubscribe($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isUnsubscribe($receiveObj))){
            $this->_responseType = WeixinResponse::AS_UNSUBSCRIBE;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseUnsubscribe($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isClick($receiveObj))){
            $this->_responseType = WeixinResponse::AS_CLICK;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseClick($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isScanCodePush($receiveObj))){
            $this->_responseType = WeixinResponse::AS_SCANCODE_PUSH;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseScancodePush($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isScanCodeWaitMsg($receiveObj))){
            $this->_responseType = WeixinResponse::AS_SCANCODE_WAITMSG;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseScanCodeWaitMsg($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isPicSysPhoto($receiveObj))){
            $this->_responseType = WeixinResponse::AS_PIC_SYSPHOTO;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responsePicSysPhoto($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isPicPhotoOrAlbum($receiveObj))){
            $this->_responseType = WeixinResponse::AS_PIC_PHOTO_OR_ALBUM;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responsePicPhotoOrAlbum($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isPicWeixin($receiveObj))){
            $this->_responseType = WeixinResponse::AS_PIC_WEIXIN;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responsePicWeixin($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isLocationSelect($receiveObj))){
            $this->_responseType = WeixinResponse::AS_LOCATION_SELECT;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseLocationSelect($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isScan($receiveObj))){
            $this->_responseType = WeixinResponse::AS_SCAN;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseScan($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isLocation($receiveObj))){
            $this->_responseType = WeixinResponse::AS_LOCATION;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseLocation($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isMassSendJobFinish($receiveObj))){
            $this->_responseType = WeixinResponse::AS_MASSSENDJOBFINISH;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseMassSendJobFinish($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isTemplateSendJobFinish($receiveObj))){
            $this->_responseType = WeixinResponse::AS_TEMPLATESENDJOBFINISH;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseTemplateSendJobFinish($receiveObj);
            $msgFormat = 'sysXml';
        }

        // 文本消息
        elseif(($key=$this->_isCommand($receiveObj))){
            $this->_responseType = WeixinResponse::AS_COMMAND;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseCommand($receiveObj);
            $msgFormat = 'sysXml';
        }elseif(($key=$this->_isMessage($receiveObj))){
            $this->_responseType = WeixinResponse::AS_MESSAGE;
            $this->_responseKey = $key===true?'':$key;
            $this->_responseContent = $this->_responseMessage($receiveObj);
            $msgFormat = 'sysXml';
        }

        // 未知，可能是新类型
        else{
            $this->_responseType = WeixinResponse::AS_UNKNOWN;
            $this->_responseKey = '';
            $this->_responseContent = $this->_responseUnknown($receiveObj);
            $msgFormat = 'raw';
        }

        if($this->_responseContent===false){
            // 出错：未配置对事件或消息的响应
            return false;
        }

        $this->_log("ResponseType: " . $this->_responseType, WXAPI_LOG_DEBUG);
        $this->_log("ResponseKey: " . $this->_responseKey, WXAPI_LOG_DEBUG);
        $this->_log("ResponseContent: " . print_r($this->_responseContent, true), WXAPI_LOG_DEBUG);

        $this->_responseMessage = $this->_createResponseMessage(
            $receiveObj,
            $this->_responseContent,
            $msgFormat
        );

        $this->_log("Generated Response Message: " . print_r($this->_responseMessage, true), WXAPI_LOG_DEBUG);

        return $this->_responseMessage['MsgContent'];
    }

    /**
     * 是否空消息
     * @param object $receiveObj 接收对象
     * @return boolean
     */
    protected function _isEmpty($receiveObj){
        // 注意：empty($receiveObj->postObj)即使非空也返回true
        // When using empty() on inaccessible object properties, the __isset() overloading method will be called, if declared.

        $postObj = $receiveObj->postObj;
        return empty($postObj)?true:false;
    }

    /**
     * 是否验证消息
     * @param object $receiveObj 接收对象
     * @return boolean
     */
    protected function _isEcho($receiveObj){
        return isset($receiveObj->getObj->echostr) && $receiveObj->getObj->echostr;
    }

    /**
     * 是否指令消息
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isCommand($receiveObj){
        $aMsgTypes = array(
            'text'
        );

        if(!in_array($receiveObj->postObj->MsgType, $aMsgTypes, false)){
            return false;
        }

        $command = trim($receiveObj->postObj->Content);
        if(($c=$this->Config->Command) && !empty($c[$command])){
            return $command;
        }else{
            return false;
        }
    }

    /**
     * 是否事件消息
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isEvent($receiveObj){
        return !strcasecmp($receiveObj->postObj->MsgType, 'event');
    }

    /**
     * 是否订阅事件
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isSubscribe($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'subscribe')){
            return isset($receiveObj->postObj->EventKey) && ($key=(string)$receiveObj->postObj->EventKey)?
                $key:true;
        }else{
            return false;
        }
    }

    /**
     * 是否取消订阅事件
     * @param object $receiveObj 接收对象
     * @return boolean
     */
    protected function _isUnsubscribe($receiveObj){
        return $this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'unsubscribe');
    }

    /**
     * 是否扫描事件
     * @param object $receiveObj 接收对象
     * @return array|false
     */
    protected function _isScan($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'scan')){
            return array(
                'EventKey' => $receiveObj->postObj->EventKey,
                'Ticket' => $receiveObj->postObj->Ticket,
            );
        }else{
            return false;
        }
    }

    /**
     * 是否地理位置消息
     * @param object $receiveObj 接收对象
     * @return array|false
     */
    protected function _isLocation($receiveObj){
        if(!strcasecmp($receiveObj->postObj->MsgType, 'location')){
            return array(
                'Latitude' => $receiveObj->postObj->Location_Y,
                'Longitude' => $receiveObj->postObj->Location_X,
                'Precision' => $receiveObj->postObj->Scale,
                'Label' => $receiveObj->postObj->Label,
            );
        }elseif($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'LOCATION')){
            return array(
                'Latitude' => $receiveObj->postObj->Latitude,
                'Longitude' => $receiveObj->postObj->Longitude,
                'Precision' => $receiveObj->postObj->Precision,
                'Label' => '',
            );
        }else{
            return false;
        }
    }

    /**
     * 是否点击菜单拉取消息事件
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isClick($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'CLICK')){
            return $receiveObj->postObj->EventKey;
        }else{
            return false;
        }
    }

    /**
     * 是否点击菜单跳转链接事件
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isView($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'VIEW')){
            return $receiveObj->postObj->EventKey;
        }else{
            return false;
        }
    }

    /**
     * 是否:扫码推事件
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isScanCodePush($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'scancode_push')){
            return $receiveObj->postObj->EventKey;
        }else{
            return false;
        }
    }

    /**
     * 是否:扫码推事件且弹出“消息接收中”提示框
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isScanCodeWaitMsg($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'scancode_waitmsg')){
            return $receiveObj->postObj->EventKey;
        }else{
            return false;
        }
    }

    /**
     * 是否:弹出系统拍照发图
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isPicSysPhoto($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'pic_sysphoto')){
            return $receiveObj->postObj->EventKey;
        }else{
            return false;
        }
    }

    /**
     * 是否:弹出拍照或者相册发图
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isPicPhotoOrAlbum($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'pic_photo_or_album')){
            return $receiveObj->postObj->EventKey;
        }else{
            return false;
        }
    }

    /**
     * 是否:弹出微信相册发图器
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isPicWeixin($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'pic_weixin')){
            return $receiveObj->postObj->EventKey;
        }else{
            return false;
        }
    }

    /**
     * 是否:弹出地理位置选择器
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isLocationSelect($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'location_select')){
            return $receiveObj->postObj->EventKey;
        }else{
            return false;
        }
    }

    /**
     * 是否普通消息
     * @param object $receiveObj 接收对象
     * @return string|false
     */
    protected function _isMessage($receiveObj){
        $aMsgTypes = array(
            'text', 'image', 'voice', 'video', 'link','shortvideo'
        );

        return in_array($receiveObj->postObj->MsgType, $aMsgTypes, false)?$receiveObj->postObj->MsgType:false;
    }

    /**
     * 是否群发消息通知事件
     * @param object $receiveObj 接收对象
     * @return string|false 返回消息id
     */
    protected function _isMassSendJobFinish($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'MASSSENDJOBFINISH')){
            return $receiveObj->postObj->MsgID;
            /*
            return array(
                    'MsgID' => $receiveObj->postObj->MsgID,
                    'Status' => $receiveObj->postObj->Status,
                    'TotalCount' => $receiveObj->postObj->TotalCount,
                    'FilterCount' => $receiveObj->postObj->FilterCount,
                    'SentCount' => $receiveObj->postObj->SentCount,
                    'ErrorCount' => $receiveObj->postObj->ErrorCount,
            );*/
        }else{
            return false;
        }
    }

    /**
     * 是否模板消息通知事件
     * @param object $receiveObj 接收对象
     * @return string|false 返回消息id
     */
    protected function _isTemplateSendJobFinish($receiveObj){
        if($this->_isEvent($receiveObj) && !strcasecmp($receiveObj->postObj->Event, 'TEMPLATESENDJOBFINISH')){
            return $receiveObj->postObj->MsgID;
        }else{
            return false;
        }
    }

    /**
     * 创建响应消息
     * @param object $receiveObj 接收对象
     * @param mixed $responseContent 原始响应内容
     * @param string $msgFormat 消息格式
     * @return array|false
     */
    protected function _createResponseMessage($receiveObj, $responseContent, $msgFormat= 'sysXml'){

        if(is_array($responseContent) && !empty($responseContent['Callback'])){
            $data = $this->_run_callback($responseContent['Callback'], array($receiveObj, $this));

            if($data===false){
                $this->_log("Run Callback : " . print_r($responseContent['Callback'], true) . " Failed", WXAPI_LOG_ERR);
                return false;
            }

            if(is_array($data)){
                $t = $data;
                $responseContent = array(
                    'MsgType' => $t['MsgType'],
                    'Content' => $t['Content'],
                );
            }else{
                $responseContent['Content'] = $data;
                if($responseContent['MsgType']=='callback'){
                    $responseContent['MsgType'] = 'text';
                }
            }
        }

        if(is_string($responseContent)){
            $responseContent = array(
                'MsgType' => 'text',
                'Content' => $responseContent,
            );
        }elseif(!$responseContent['MsgType']){
            $responseContent['MsgType'] = 'text';
        }

        if(!$responseContent['Content'] && !strlen($responseContent['Content'])
            && strcasecmp('transfer_customer_service', $responseContent['MsgType']) // 转发客服消息，允许Content为空
        ){
            return false;
        }

        // 预处理消息
        if($msgFormat== 'sysXml'){
            $responseContent = $this->_preprocessResponseMedia($responseContent);
        }

        $msgContentOutput = self::generateMessage($receiveObj->postData['FromUserName'], $receiveObj->postData['ToUserName'], $responseContent);

        // 根据加密类型生成相应响应消息
        switch($receiveObj->msgEncodingMode){
            // 兼容模式
            case WXAPI_APP_ENCODING_COMPAT:
                // 未正确解密，使用明文返回
                if(empty($receiveObj->msgEncodingKey)){
                    $msgEncoding = WXAPI_APP_ENCODING_CLEAR;

                    $this->_log("Encoding Response Msg in Clear Mode", WXAPI_LOG_DEBUG);
                    break;
                }

            // 安全模式
            case WXAPI_APP_ENCODING_SECURE:
                $msgContentOriginal = $msgContentOutput;
                $msgContentOutput = self::_encrypt_response($msgContentOutput, $receiveObj->msgEncodingKey);
                $msgEncoding = WXAPI_APP_ENCODING_SECURE;

                $this->_log("Encoding Response Msg in Secure Mode", WXAPI_LOG_DEBUG);
                break;

            // 明文模式
            case WXAPI_APP_ENCODING_CLEAR:
            default:
                $msgEncoding = WXAPI_APP_ENCODING_CLEAR;

                $this->_log("Encoding Response Msg In Clear Mode", WXAPI_LOG_DEBUG);
                break;
        }

        return array(
            'MsgType' => $responseContent['MsgType'],
            'MsgFormat' => $msgFormat,
            'MsgContent' => $msgFormat== 'sysXml' ?$msgContentOutput: $responseContent['Content'],
            'MsgOriginal' => $msgContentOriginal?$msgContentOriginal:NULL,
            'MsgEncoding' => $msgEncoding,
            'RawContent' => $responseContent['Content']
        );
    }

    /**
     * 错误响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseError($receiveObj){
        return "Error";
    }

    /**
     * 未知响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseUnknown($receiveObj){
        //return "Unknown";
    }

    /**
     * 验证响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseEcho($receiveObj){
        return $receiveObj->getObj->echostr;
    }

    /**
     * 空消息响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseEmpty($receiveObj){
        return "Empty";
    }

    /**
     * 指令响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseCommand($receiveObj){
        $command = trim($receiveObj->postObj->Content);
        $settings = $this->Config->getConfig('Command');
        if(!isset($settings[$command])){
            return $this->_throw_exception("Command {$command} not configured", WXAPI_ERR_MISS_RESPONSE, '', __FILE__, __LINE__);
        }
        $content = $settings[$command];
        return $content;
    }

    /**
     * 事件响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseEvent($receiveObj){
        $event = strtolower($receiveObj->postObj->Event);

        $settings = $this->Config->getConfig('Event');
        if(!isset($settings[$event])){
            return $this->_throw_exception("Miss resoponse for Event {$event}", WXAPI_ERR_MISS_RESPONSE, '', __FILE__, __LINE__);
        }

        if(isset($settings[$event]['MsgType'])){
            $content = $settings[$event];
        }elseif(isset($receiveObj->postObj->EventKey)){
            $eventkey = (string) $receiveObj->postObj->EventKey;
            if(!isset($settings[$event][$eventkey])){
                return $this->_throw_exception("Miss response for Event {$event}, Key {$eventkey}", WXAPI_ERR_MISS_RESPONSE, '', __FILE__, __LINE__);
            }

            $content = $settings[$event][$eventkey];
        }

        return $content;
    }

    /**
     * 订阅事件响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseSubscribe($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 取消订阅事件响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseUnsubscribe($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 扫描事件响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseScan($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 地理位置消息响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseLocation($receiveObj){
        if(!strcasecmp($receiveObj->postObj->MsgType, 'event')){
            return $this->_responseEvent($receiveObj);
        }else if(!strcasecmp($receiveObj->postObj->MsgType, 'location')){
            // 普通位置消息
            // @todo 处理接收到的普通位置消息
        }
    }

    /**
     * 点击菜单拉取消息事件响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseClick($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 点击菜单跳转链接事件响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseView($receiveObj){
        //return $this->_responseEvent($receiveObj);
    }

    /**
     * 响应：扫码推事件
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseScanCodePush($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 响应：扫码推事件且弹出“消息接收中”提示框
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseScanCodeWaitMsg($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 响应：弹出系统拍照发图
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responsePicSysPhoto($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 响应：弹出拍照或者相册发图
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responsePicPhotoOrAlbum($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 响应：弹出微信相册发图器
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responsePicWeixin($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 响应：弹出地理位置选择器
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseLocationSelect($receiveObj){
        return $this->_responseEvent($receiveObj);
    }

    /**
     * 普通消息响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseMessage($receiveObj){
        // write your code, such as save message and remind customer service

        // 通关密语
        if(($msg=$this->_responseArgot($receiveObj))!==false){
            return $msg;
        }

        // 转发客服消息到微信多客服系统
        elseif($this->Config->TransferCustomerService){
            return array(
                'MsgType' => 'transfer_customer_service',
            );
        }
    }

    /**
     * 响应暗语
     *
     * @param object $receiveObj
     * @return false|string 返回false表示非暗语处理，可以由其它逻辑处理
     */
    protected function _responseArgot($receiveObj){
        if(!isset($receiveObj->postObj->Content) || !($msg=$receiveObj->postObj->Content)){
            return false;
        }

        $msg = trim($msg);

        if(defined('WXAPI_ARGOT_WHO_AM_I') && WXAPI_ARGOT_WHO_AM_I && !strcasecmp(WXAPI_ARGOT_WHO_AM_I, $msg)){
            return "OH LORD,\nMY 4susername is " . $this->Config->AppName . ",\nAppId: " . $this->Config->AppId . ",\n Server: " . $_SERVER['HTTP_HOST'] ." .";
        }

        elseif(defined('WXAPI_ARGOT_DESTORY_SESSION') && WXAPI_ARGOT_DESTORY_SESSION && !strcasecmp(WXAPI_ARGOT_DESTORY_SESSION, $msg)){
            $openid = $receiveObj->parse_openid();
            if($openid && class_exists('WeixinUserModel') && method_exists('WeixinUserModel', 'destroy_session')){
                $oWeixinUserModel = new WeixinUserModel();
                $succ = $oWeixinUserModel->destroy_session($openid);
                return $succ?"Your session has been destoryed Successfully!":"Failed destroy your session!";
            }else{
                return false;
            }
        }

        else{
            return false;
        }
    }

    /**
     * 群发消息通知响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseMassSendJobFinish($receiveObj){
        // write your code, such as save message and remind customer service

    }

    /**
     * 模板消息通知响应
     * @param object $receiveObj 接收对象
     * @return string
     */
    protected function _responseTemplateSendJobFinish($receiveObj){
        // write your code, such as save message and remind customer service

    }

    /**
     * 预处理多媒体文件
     * 可以根据消息类型，调用微信接口，将消息中的图片、音频等多媒体文件上传到微信服务器，
     * 得到MediaId，并替换掉原来的多媒体文件
     * @param mixed $Content
     * @return mixed
     */
    protected function _preprocessResponseMedia($Content){
        if(!is_array($Content) || empty($Content['MsgType'])){
            return $Content;
        }

        $msgtype = strtolower($Content['MsgType']);
        switch ($msgtype){
            case 'image':
                $mediaField = 'MediaId';
                if(is_string($Content['Content']) && !$this->_isMediaId($Content['Content'])){
                    $mediaFile = $Content['Content'];
                    $oClient = WeixinApi::instance($this->Config->Client, $this->Config);

                    $mediaId = $oClient->upload_media($mediaFile, 'image');

                    $Content['Content'] = $mediaId;
                }else{
                    $mediaId = $Content['Content'];
                    $mediaFile = '';
                }
                $this->_responseMedia[$mediaField] = array($mediaId, 'image', $mediaFile);

                break;
            case 'voice':
                $mediaField = 'MediaId';
                if(is_string($Content['Content']) && !$this->_isMediaId($Content['Content'])){
                    $mediaFile = $Content['Content'];

                    $oClient = WeixinApi::instance($this->Config->Client, $this->Config);
                    $mediaId = $oClient->upload_media($mediaFile, 'voice');

                    $Content['Content'] = $mediaId;
                }else{
                    $mediaId = $Content['Content'];
                    $mediaFile = '';
                }
                $this->_responseMedia[$mediaField] = array($mediaId, 'voice', $mediaFile);

                break;
            case 'video':
                $mediaField = 'MediaId';
                if(!$this->_isMediaId($Content['Content']['MediaId'])){
                    $mediaFile = $Content['Content']['MediaId'];
                    $mediaField = 'MediaId';

                    $oClient = WeixinApi::instance($this->Config->Client, $this->Config);
                    $mediaId = $oClient->upload_media($mediaFile, 'video');

                    $Content['Content']['MediaId'] = $mediaId;
                }else{
                    $mediaId = $Content['Content']['MediaId'];
                    $mediaFile = '';
                }
                $this->_responseMedia[$mediaField] = array($mediaId, 'video', $mediaFile);

                $thumbMediaField = 'ThumbMediaId';
                if(!$this->_isMediaId($Content['Content']['ThumbMediaId'])){
                    $thumbMediaFile = $Content['Content']['ThumbMediaId'];

                    $oClient = WeixinApi::instance($this->Config->Client, $this->Config);
                    $thumbMediaId = $oClient->upload_media($thumbMediaFile, 'thumb');

                    $Content['Content']['ThumbMediaId'] = $thumbMediaId;

                }else{
                    $thumbMediaId = $Content['Content']['ThumbMediaId'];
                    $thumbMediaFile = '';
                }
                $this->_responseMedia[$thumbMediaField] = array($thumbMediaId, 'thumb', $thumbMediaFile);
                break;
            case 'music':
                $thumbMediaField = 'ThumbMediaId';
                if(is_array($Content['Content'])){
                    if(!$this->_isMediaId($Content['Content']['ThumbMediaId'])){
                        $thumbMediaFile = $Content['Content']['ThumbMediaId'];

                        $oClient = WeixinApi::instance($this->Config->Client, $this->Config);
                        $thumbMediaId = $oClient->upload_media($thumbMediaFile, 'thumb');

                        $Content['Content']['ThumbMediaId'] = $thumbMediaId;
                    }else{
                        $thumbMediaId = $Content['Content']['ThumbMediaId'];
                        $thumbMediaFile = '';
                    }
                }else{
                    if(!$this->_isMediaId($Content['Content'])){
                        $thumbMediaFile = $Content['Content'];
                        $oClient = WeixinApi::instance($this->Config->Client, $this->Config);
                        $thumbMediaId = $oClient->upload_media($thumbMediaFile, 'thumb');

                        $Content['Content'] = $thumbMediaId;
                    }else{
                        $thumbMediaId = $Content['Content'];
                        $thumbMediaFile = '';
                    }
                }
                $this->_responseMedia[$thumbMediaField] = array($thumbMediaId, 'thumb', $thumbMediaFile);

                break;
            default:
                // other type, do nothing
        }

        return $Content;
    }

    public function createMessage($FromUserName, $ToUserName, $Content){
        return self::generateMessage($FromUserName, $ToUserName, $Content);
    }

    /**
     * 根据消息类型，创建消息
     * @param string $FromUserName 发送者
     * @param string $ToUserName	接收者
     * @param string|array $Content 发送内容，默认为文本消息，传数组可设定消息类型，格式为：aray('MsgType' => 'image', 'Content' => '消息内容')
     * @return string 返回XML格式消息
     */
    public static function generateMessage($FromUserName, $ToUserName, $Content){
        $aMsgTypes = array(
            'text', 'image', 'voice', 'video', 'music', 'news', 'transfer_customer_service'
        );

        if(is_array($Content)){
            $type = $Content['MsgType'];
            $data = $Content['Content'];
        }else{
            $type = 'text';
            $data = $Content;
        }

        if(!in_array($type, $aMsgTypes, false)){
            return WeixinApi::throw_exception("Unknown MsgType: $type", WXAPI_ERR_CONFIG, $Content, __FILE__, __LINE__);
        }

        if(!strcasecmp($type, 'transfer_customer_service')){
            $method = 'generateTransferCustomerServiceMessage';
        }else{
            $method = 'generate' . ucfirst(strtolower($type)) . 'Message';
        }
        return self::$method($FromUserName, $ToUserName, $data);
    }

    public function createTextMessage($FromUserName, $ToUserName, $content){
        return self::generateTextMessage($FromUserName, $ToUserName, $content);
    }

    /**
     * 创建文本消息
     * @param object $object
     * @param string $content 文本内容，支持换行
     * @return string
     */
    public static function generateTextMessage($FromUserName, $ToUserName, $content)
    {
        $msgTpl = "<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[%s]]></Content>
</xml>";
        return sprintf($msgTpl, $FromUserName, $ToUserName, time(), $content);
    }

    public function createImageMessage($FromUserName, $ToUserName, $mediaId){
        return self::generateImageMessage($FromUserName, $ToUserName, $mediaId);
    }

    /**
     * 创建图片消息
     * @param object $object
     * @param string $mediaId 通过上传多媒体文件，得到的id
     * @return string
     */
    public static function generateImageMessage($FromUserName, $ToUserName, $mediaId)
    {
        $msgTpl = "<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[image]]></MsgType>
<Image>
%s
</Image>
</xml>";
        $mediaTpl = "<MediaId><![CDATA[%s]]></MediaId>";
        if(!is_array($mediaId)){
            $mediaIds = array($mediaId);
        }else{
            $mediaIds = $mediaId;
        }

        $media = '';
        foreach($mediaIds as $mediaId){
            $media .= sprintf($mediaTpl, $mediaId);
        }

        return sprintf($msgTpl, $FromUserName, $ToUserName, time(), $media);
    }

    public function createVoiceMessage($FromUserName, $ToUserName, $mediaId){
        return self::generateVoiceMessage($FromUserName, $ToUserName, $mediaId);
    }

    /**
     * 创建语音消息
     * @param object $object
     * @param string $mediaId 通过上传多媒体文件，得到的id
     * @return string
     */
    public static function generateVoiceMessage($FromUserName, $ToUserName, $mediaId)
    {
        $msgTpl = "<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[voice]]></MsgType>
<Voice>
%s
</Voice>
</xml>";
        $mediaTpl = "<MediaId><![CDATA[%s]]></MediaId>";
        if(!is_array($mediaId)){
            $mediaIds = array($mediaId);
        }else{
            $mediaIds = $mediaId;
        }

        $media = '';
        foreach($mediaIds as $mediaId){
            $media .= sprintf($mediaTpl, $mediaId);
        }

        return sprintf($msgTpl, $FromUserName, $ToUserName, time(), $media);
    }

    public function createVideoMessage($FromUserName, $ToUserName, $mediaId, $thumbMediaId=NULL){
        return self::generateVideoMessage($FromUserName, $ToUserName, $mediaId, $thumbMediaId);
    }

    /**
     * 创建视频消息
     * @param object $object
     * @param string|array $mediaId	 通过上传多媒体文件，得到的id，可以传数组：Array('MediaId'=>mediaid, 'ThumbMediaId'=>thumbMediaId)
     * @param string $thumbMediaId 缩略图的媒体id，通过上传多媒体文件，得到的id，必填字段
     * @return string
     */
    public static function generateVideoMessage($FromUserName, $ToUserName, $mediaId, $thumbMediaId=NULL)
    {
        $msgTpl = "<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[video]]></MsgType>
<Video>
%s
</Video> 
</xml>";

        if(is_array($mediaId)){
            $mediaData = array(
                'MediaId' => $mediaId['MediaId'],
                'ThumbMediaId' => $mediaId['ThumbMediaId'],
            );
        }else{
            $mediaData = array(
                'MediaId' => $mediaId,
                'ThumbMediaId' => $thumbMediaId,
            );
        }

        $media = "";
        foreach ($mediaData as $n=>$d){
            $n = ucfirst($n);
            $mediaTpl = "<{$n}><![CDATA[%s]]></{$n}>";
            $media .= sprintf($mediaTpl, $d);
        }

        return sprintf($msgTpl, $FromUserName, $ToUserName, time(), $media);
    }

    public function createMusicMessage($FromUserName, $ToUserName, $thumbMediaId, $title=NULL, $description=NULL, $musicUrl=NULL, $hqMusicUrl=NULL)
    {
        return self::generateMusicMessage($FromUserName, $ToUserName, $thumbMediaId, $title, $description, $musicUrl, $hqMusicUrl);
    }

    /**
     * 创建音乐消息
     * @param object $object
     * @param string|array $thumbMediaId 缩略图的媒体id，通过上传多媒体文件，得到的id，必填字段，传数组格式如：
     * array (
    "Title" => $title,
    "Description" => $description,
    "MusicURL" => $musicURL,
    "HQMusicUrl" => $hqMusicUrl,
    "ThumbMediaId" => $thumbMediaId,
    )
     * @param string $title 音乐标题
     * @param string $description 音乐描述
     * @param string $musicUrl 音乐链接
     * @param string $hqMusicUrl 高质量音乐链接，WIFI环境优先使用该链接播放音乐
     * @return string
     */
    public static function generateMusicMessage($FromUserName, $ToUserName, $thumbMediaId, $title=NULL, $description=NULL, $musicUrl=NULL, $hqMusicUrl=NULL)
    {
        $msgTpl = "<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[music]]></MsgType>
<Music>%s
</Music>
</xml>";

        $media = "";
        if (is_array ( $thumbMediaId )) {
            $mediaData = array (
                "Title" => $thumbMediaId['Title'],
                "Description" => $thumbMediaId['Description'],
                "MusicUrl" => $thumbMediaId['MusicUrl'],
                "HQMusicUrl" => $thumbMediaId['HQMusicUrl'],
                "ThumbMediaId" => $thumbMediaId['ThumbMediaId'],
            );
        } else {
            $mediaData = array (
                "Title" => $title,
                "Description" => $description,
                "MusicUrl" => $musicUrl,
                "HQMusicUrl" => $hqMusicUrl,
                "ThumbMediaId" => $thumbMediaId,
            );
        }
        foreach($mediaData as $n=>$d){
            if($d){
                $n = ucfirst($n);
                $mediaTpl = "<{$n}><![CDATA[%s]]></{$n}>";
                $media .= sprintf($mediaTpl, $d);
            }
        }

        return sprintf($msgTpl, $FromUserName, $ToUserName, time(), $media);
    }

    public function createNewsMessage($FromUserName, $ToUserName, $title, $description=NULL, $picUrl=NULL, $url=NULL)
    {
        return self::generateNewsMessage($FromUserName, $ToUserName, $title, $description, $picUrl, $url);
    }

    /**
     * 创建图文消息
     * @param object $object
     * @param string|array $title 图文消息标题，传数组格式如：
     * array(
    "Title" => $title,
    "Description" => $description,
    "PicUrl" => $picUrl,
    "Url" => $url,
    )
    或
    array( 0 => array(
    "Title" => $title,
    "Description" => $description,
    "PicUrl" => $picUrl,
    "Url" => $url,
    ))
     * @param string $description 图文消息描述
     * @param string $picUrl 图片链接，支持JPG、PNG格式，较好的效果为大图360*200，小图200*200
     * @param string $url 点击图文消息跳转链接
     * @return string
     */
    public static function generateNewsMessage($FromUserName, $ToUserName, $title, $description=NULL, $picUrl=NULL, $url=NULL)
    {
        $msgTpl = "<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[news]]></MsgType>
<ArticleCount>%s</ArticleCount>
<Articles>
%s
</Articles>
</xml>";

        $media = "";
        $items = array();
        if(is_array($title)){
            if(isset($title['Title']) || isset($title['Description']) || isset($title['PicUrl']) || isset($title['Url'])){
                $items[] = $title;
            }else{
                $items = $title;
            }
        }else{
            $items[] = array(
                "Title" => $title,
                "Description" => $description,
                "PicUrl" => $picUrl,
                "Url" => $url,
            );
        }

        $count = count($items);

        if($count>10){
            return WeixinApi::throw_exception("Over Max 10 news messages", WXAPI_ERR_CONFIG, array('items'=>$items), __FILE__, __LINE__);
        }

        $valid_item_tags = array('Title', 'Description', 'PicUrl', 'Url');
        foreach($items as $item){
            $media .= "<item>";
            foreach ( $item as $n => $d ) {
                if ($d && in_array($n, $valid_item_tags, true)) {
                    $n = ucfirst($n);
                    $mediaTpl = "<{$n}><![CDATA[%s]]></{$n}>";
                    $media .= sprintf ( $mediaTpl, $d );
                }
            }
            $media .= "</item>";
        }

        return sprintf($msgTpl, $FromUserName, $ToUserName, time(), $count, $media);
    }

    /**
     * 创建转发客服消息
     * @return string
     */
    public static function generateTransferCustomerServiceMessage($FromUserName, $ToUserName, $TransInfo_KfAccount=NULL)
    {
        $msgTpl = "<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[transfer_customer_service]]></MsgType>";

        if($TransInfo_KfAccount){
            $msg .= "<TransInfo>
        <KfAccount>%s</KfAccount>
    </TransInfo>";
        }

        $msgTpl .= "</xml>";

        return sprintf($msgTpl, $FromUserName, $ToUserName, time(), $TransInfo_KfAccount);
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

    /**
     * 生成签名
     * @param string $msg_encrypt
     * @param string $nonce
     * @param string $timestamp
     * @param string $token
     * @return string
     */
    public static function genearteSignature($msg_encrypt, $nonce, $timestamp, $token){
        $tmpArr = array($token, $timestamp, $nonce, $msg_encrypt);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        return sha1( $tmpStr );
    }

    /**
     * 创建加密消息
     * @param string $encrypt_content 加密内容
     * @param string $nonce 随机数
     * @param int $timestamp 时间戳
     * @param string $signature 签名
     * @return string
     */
    public static function generateEncryptMessage($encrypt_content, $nonce, $timestamp, $signature)
    {
        $msgTpl = "<xml>
<Encrypt><![CDATA[%s]]></Encrypt>
<MsgSignature><![CDATA[%s]]></MsgSignature>
<TimeStamp>%s</TimeStamp>
<Nonce><![CDATA[%s]]></Nonce>
</xml>
";
        return sprintf($msgTpl, $encrypt_content, $signature, $timestamp, $nonce);
    }

    /**
     * 加密响应消息
     * @return string
     */
    protected function _encrypt_response($msg, $encodingkey){
        $msg_encrypt = $this->_encryptMsg($msg, $encodingkey);
        $nonce = WeixinApi_Kit::gen_random_number(11);
        $timestamp = time();
        $signature = self::genearteSignature($msg_encrypt, $nonce, $timestamp, $this->Config->AppToken);

        return self::generateEncryptMessage($msg_encrypt, $nonce, $timestamp, $signature);
    }

    /**
     * 对明文进行加密
     * @param string $msg 需要加密的明文
     * @param string $encodingkey 加密私钥
     * @return string|false 加密得到的密文，失败返回flase
     */
    protected function _encryptMsg($msg, $encodingkey=NULL)
    {
        $AESKey = base64_decode(($encodingkey?$encodingkey:$this->Config->AppEncodingAESKey) . "=");

        // 获得16位随机字符串，填充到明文之前
        $random = WeixinApi_Kit::gen_random_string ( 16 );
        $msg = $random . pack ( "N", strlen ( $msg ) ) . $msg . $this->Config->AppId;
        // 网络字节序
        $size = mcrypt_get_block_size ( MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC );
        $module = mcrypt_module_open ( MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, '' );
        if(false===$module){
            return $this->_throw_exception(
                "Cann't open an encryption descriptor"
                , WXAPI_ERR_BAD_ENCRYPT
                , $msg
                , __FILE__, __LINE__
            );
        }

        $iv = substr ( $AESKey, 0, 16 );

        // 使用自定义的填充方式对明文进行补位填充
        $msg = WeixinApi_Kit::pkcs7_encode ( $msg, 32 );
        $init = mcrypt_generic_init ( $module, $AESKey, $iv );
        if(false===$init){
            return $this->_throw_exception(
                "Cann't initialize buffers for encryption"
                , WXAPI_ERR_BAD_ENCRYPT
                , array('msg' => $msg, 'mcrypt_generic_init return' => $init)
                , __FILE__, __LINE__
            );
        }elseif(-3==$init){
            return $this->_throw_exception(
                "the key length was incorrect"
                , WXAPI_ERR_BAD_ENCRYPT
                , array('msg' => $msg, 'mcrypt_generic_init return' => $init)
                , __FILE__, __LINE__
            );
        }elseif(-4==$init){
            return $this->_throw_exception(
                "there was a memory allocation problem"
                , WXAPI_ERR_BAD_ENCRYPT
                , array('msg' => $msg, 'mcrypt_generic_init return' => $init)
                , __FILE__, __LINE__
            );
        }elseif($init<0){
            return $this->_throw_exception(
                "an unknown error occurred when initialize buffers for encryption"
                , WXAPI_ERR_BAD_ENCRYPT
                , array('msg' => $msg, 'mcrypt_generic_init return' => $init)
                , __FILE__, __LINE__
            );
        }

        // 加密
        $encrypted = mcrypt_generic ( $module, $msg );
        mcrypt_generic_deinit ( $module );
        mcrypt_module_close ( $module );

        // print(base64_encode($encrypted));
        // 使用BASE64对加密后的字符串进行编码
        return base64_encode ( $encrypted );
    }
}