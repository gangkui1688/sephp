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
    public $config = null;


    public static function instance()
    {
        if(empty(start::$_config['route']['url_route_on']) || empty($_REQUEST['s']))
        {
            return false;
        }
        if(empty(self::$instance))
        {
            self::$instance = new self();
        }
        self::$instance->config = start::$_config['route'];
        self::$instance->start();
    }

    public function start()
    {
        $param = basename($_REQUEST['s'], '.html');
        if(empty($param))
        {
            $_GET['ac'] = 'index';
            $_GET['ct'] = 'index';
        }
        elseif(strpos($param, '-') === false && !in_array($param, $this->config['url_route_rules']))
        {
            $this->parse_url($param);
            //$_GET['ac'] = 'page_404';
            //$_GET['ct'] = 'public';
        }
        else
        {
            $this->parse_url($param);
        }
        return true;
    }


    //解析路由
    public function parse_url($url)
    {
        $key = preg_replace("/-\w+/",'-(\w+)', $url);
       //p($key, $this->config['url_route_rules'][$key]);
        if(isset($this->config['url_route_rules'][$key]))
        {
            $val = $this->config['url_route_rules'][$key];
            $matches = '';
            preg_match("/{$key}/", $url, $matches);
            foreach ($matches as $k=>$v)
            {
                if($k == 0)  continue;
                $val = str_replace('$' . $k, $v, $val);
            }
            if(strpos($val, '$') !== false)
            {
                log::info("路由配置错误，错误参数：url_route_rules['{$key}']");
            }
            $param = $this->convert_url($val);
            foreach ($param as $key=>$val)
            {
                $_GET[$key] = $val;
            }

        }
        return true;
    }


    /**
     * url 地址解析成数组
     * @param $query
     * @return array
     */
    public function convert_url($query)
    {
        $query = trim($query, '?');
        $queryParts = explode('&', $query);
        $params = array();
        foreach ($queryParts as $param) {
            $item = explode('=', $param);
            $params[$item[0]] = $item[1];
        }
        return $params;
    }





}