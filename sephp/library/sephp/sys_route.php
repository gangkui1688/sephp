<?php

/**
 * 路由操作类
 * @ClassName: sys_route
 * @Author: Gangkui
 * @Date: 2018-10-27 11:50:10
 */
class sys_route
{
    public static $instance = null;

    public static function instance()
    {
        if(empty($rules = $GLOBALS['config']['route']['url_route_on']) || empty($_REQUEST['s']))
        {
            return false;
        }
        if(empty(self::$instance))
        {
            self::$instance = new self();
        }
        self::$instance->start();
    }

    public function start()
    {
        $param = $_REQUEST['s'];
        $rules = $GLOBALS['config']['route']['url_route_rules'];

        $arr = explode('/', $param);
        p(APP_NAME);

        if(empty($rules))
        {
            //路由规则空，执行默认规则

        }
        if(in_array($param, array_keys($rules)))
        {
            $url = $rules[$param];
            $arr_query = parse_url($url);

            $get = self::$instance->convertUrlQuery($arr_query['query']);
            $_GET['ac'] = $_REQUEST['ac'] = $get['ac'];
            $_GET['ct'] = $_REQUEST['ct'] = $get['ct'];
        }

        //p($_REQUEST,$_GET);exit;
    }

    public function convertUrlQuery($query)
    {
        $queryParts = explode('&', $query);
        $params = array();
        foreach ($queryParts as $param) {
            $item = explode('=', $param);
            $params[$item[0]] = $item[1];
        }
        return $params;
    }





}