<?php

/**
 * http 操作类 访问，推送
 * Class sys_curl
 */
class sys_curl
{
    public static $instance = null;

    public static function instance()
    {
        if(empty(self::$instance))
        {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * 远程下载文件 保存服务器
     * @param $url 下载文件地址
     * @param string $path 保存地址
     */
    public function downloadImage($url, $path='')
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
        $file = curl_exec($ch);
        curl_close($ch);

        $this->saveAsImage($url, $file, $path);
    }

    /**
     * 保存文件
     * @param $url
     * @param $file
     * @param $path
     */
    private function saveAsImage($url, $file, $path = '')
    {
        $path = empty($path) ? PATH_UPLOAD . '/file/' : $path;
        $filename = pathinfo($url, PATHINFO_BASENAME);
        $resource = fopen($path . $filename, 'a');
        fwrite($resource, $file);
        fclose($resource);
    }

    /**
     * 发起post请求
     * @param $url
     * @param array $post_data
     * @param int $timeout
     * @return mixed
     */
    public function post($url,$post_data = [],$timeout = 30)
    {
        //初始化
        $curl = curl_init();
        //设置抓取的url
        curl_setopt($curl, CURLOPT_URL, $url);
        //设置头文件的信息作为数据流输出
        curl_setopt($curl, CURLOPT_HEADER, false);
        //设置获取的信息以文件流的形式返回，而不是直接输出。
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        //设置post方式提交
        curl_setopt($curl, CURLOPT_POST, 1);
        //设置post数据
        if(!empty($post_data)){
            curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
        }
        //设置 超时时间
        curl_setopt ($curl, CURLOPT_CONNECTTIMEOUT, $timeout);
        //执行命令
        $data = curl_exec($curl);
        //关闭URL请求
        curl_close($curl);
        //显示获得的数据
        return $data;
    }

    /**
     * 发起get请求
     * @param $url
     * @param int $timeout
     * @return mixed
     */
    public function get($url,$timeout = 30)
    {
        //初始化
        $curl = curl_init();
        //设置抓取的url
        curl_setopt($curl, CURLOPT_URL, $url);
        //设置头文件的信息作为数据流输出
        curl_setopt($curl, CURLOPT_HEADER, 1);
        //设置获取的信息以文件流的形式返回，而不是直接输出。
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($curl, CURLOPT_CONNECTTIMEOUT, $timeout);

        //执行命令
        $data = curl_exec($curl);
        //关闭URL请求
        curl_close($curl);
        //显示获得的数据
        return ($data);
    }


}