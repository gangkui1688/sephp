<?php
namespace sephp\sys;

/**
 * http 操作类 访问，推送
 * Class sys_curl
 */
class sys_curl
{

    /**
     * 远程下载文件 保存服务器
     * @param $url 下载文件地址
     * @param string $path 保存地址
     * @return string
     */
    public static function downloadImage($url, $save_file = '')
    {
        $save_file = empty($save_file) ? PATH_UPLOAD . 'down_file/' .
            pathinfo($url, PATHINFO_BASENAME) : $save_file;
        if(!file_exists(pathinfo($save_file, PATHINFO_DIRNAME)) &&
            !mkdir(pathinfo($save_file, PATHINFO_DIRNAME), 0777, true))
        {
            return false;
        }

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
        $file = curl_exec($ch);
        curl_close($ch);
        $resource = fopen($save_file, 'a');
        fwrite($resource, $file);
        fclose($resource);
        return $save_file;
    }


    /**
     * @param $doc_name 源文件名
     * @param $out_name 输出的文件名
     */
    public static function down($doc_name, $out_name)
    {
        $sourceFile = $doc_name; //要下载的临时文件名
        $outFile = $out_name; //下载保存到客户端的文件名
        if (!is_file($sourceFile)) {
            die("<b>404 File not found!</b>");
        }
        $len = filesize($sourceFile); //获取文件大小
        $filename = basename($sourceFile); //获取文件名字
        $outFile_extension = strtolower(substr(strrchr($sourceFile, "."), 1)); //获取文件扩展名
        //var_dump($outFile_extension);exit();exit();

        //根据扩展名 指出输出浏览器格式
        switch ($outFile_extension) {
            case "PDF" :
                $ctype = "application/PDF";
                break;
            case "zip" :
                $ctype = "application/zip";
                break;
            case "doc" :
                $ctype = "application/doc";
                break;
            case "mp3" :
                $ctype = "audio/mpeg";
                break;
            case "mpg" :
                $ctype = "video/mpeg";
                break;
            case "avi" :
                $ctype = "video/x-msvideo";
                break;
            case "rar" :
                $ctype = "application/rar";
                break;
            case "wps" :
                $ctype = "application/wps";
                break;
            default :
                $ctype = "application/force-download";
        }
        //Begin writing headers

        header("Cache-Control:");
        header("Cache-Control: public");

        //设置输出浏览器格式
        header("Content-Type: $ctype");

        header("Content-Disposition: attachment; filename=" . $outFile);
        header("Accept-Ranges: bytes");
        $size = filesize($sourceFile);
        //如果有$_SERVER['HTTP_RANGE']参数
        if (isset ($_SERVER['HTTP_RANGE'])) {
            /*Range头域 　　Range头域可以请求实体的一个或者多个子范围。
            例如，
            表示头500个字节：bytes=0-499
            表示第二个500字节：bytes=500-999
            表示最后500个字节：bytes=-500
            表示500字节以后的范围：bytes=500- 　　
            第一个和最后一个字节：bytes=0-0,-1 　　
            同时指定几个范围：bytes=500-600,601-999 　　
            但是服务器可以忽略此请求头，如果无条件GET包含Range请求头，响应会以状态码206（PartialContent）返回而不是以200 （OK）。
            */
            // 断点后再次连接 $_SERVER['HTTP_RANGE'] 的值 bytes=4390912-
            list ($a, $range) = explode("=", $_SERVER['HTTP_RANGE']);
            //if yes, download missing part
            str_replace($range, "-", $range); //这句干什么的呢。。。。
            $size2 = $size - 1; //文件总字节数
            $new_length = $size2 - $range; //获取下次下载的长度
            header("HTTP/1.1 206 Partial Content");
            header("Content-Length: $new_length"); //输入总长
            header("Content-Range: bytes $range$size2/$size"); //Content-Range: bytes 4908618-4988927/4988928   95%的时候
        } else {
            //第一次连接
            $size2 = $size - 1;
            header("Content-Range: bytes 0-$size2/$size"); //Content-Range: bytes 0-4988927/4988928
            header("Content-Length: " . $size); //输出总长
        }
        //打开文件
        $fp = fopen("$sourceFile", "rb");
        file_put_contents("/tmp/download.log","step1\n",FILE_APPEND);
        //设置指针位置
        @fseek($fp, $range);
        //虚幻输出
        while (!feof($fp)) {
            file_put_contents("/tmp/download.log","step2\n",FILE_APPEND);
            //设置文件最长执行时间
            set_time_limit(0);
            print (fread($fp, 1024 * 8)); //输出文件
            flush(); //输出缓冲
            ob_flush();
        }
        file_put_contents("/tmp/download.log","step3\n",FILE_APPEND);
        fclose($fp);
        exit ();
    }

    /**
     * 发起post请求
     * @param $url
     * @param array $post_data
     * @param int $timeout
     * @return mixed
     */
    public static function post($url,$post_data = [],$timeout = 30)
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
    public static function get($url,$timeout = 30)
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