<?php

class sys_upload
{
    public static function web_upload()
    {
        // Make sure file is not cached (as it happens for example on iOS devices)
        header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");

        if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
            header("HTTP/1.0 500 Method Type Error");
            exit();
        }
        //PHP执行时间五分钟
        @set_time_limit(300);

        $maxFileAge = 5 * 3600; // Temp file age in seconds

        $targetDir = WWW_ROOT . 'upload/temp';
        $uploadDir = WWW_ROOT . 'upload/file';

        if (!file_exists($targetDir)) {
            @mkdir($targetDir, '0777', true);
        }

        if (!file_exists($uploadDir)) {
            @mkdir($uploadDir, '0777', true);
        }

        $fileName = sys_create::instance()->id() .'.'. pathinfo(req::$forms['name'],PATHINFO_EXTENSION);

        $filePath = $targetDir . '/' . $fileName;
        $uploadPath = $uploadDir . '/' . $fileName;

        $chunk = isset(req::$forms["chunk"]) ? intval(req::$forms["chunk"]) : 0;
        $chunks = isset(req::$forms["chunks"]) ? intval(req::$forms["chunks"]) : 0;

        if (!is_dir($targetDir) || !$dir = opendir($targetDir)) {
            show_msg::ajax('Failed to open temp directory', '100');
        }

        while (($file = readdir($dir)) !== false)
        {
            $tmpfilePath = $targetDir . '/' . $file;

            // If temp file is current file proceed to the next
            if ($tmpfilePath == "{$filePath}.part") {
                continue;
            }

            // Remove temp file if it is older than the max age and is not the current file
            if (preg_match('/\.part$/', $file) && (filemtime($tmpfilePath) < time() - $maxFileAge)) {
                @unlink($tmpfilePath);
            }
        }
        closedir($dir);

        if (!$out = fopen("{$filePath}.part", $chunks ? "ab" : "wb"))
        {
            show_msg::ajax('Failed to open output stream.', '102');
        }

        if (!empty($_FILES)) {
            if ($_FILES["file"]["error"] || !is_uploaded_file($_FILES["file"]["tmp_name"])) {
                show_msg::ajax('Failed to move uploaded file.', 103);
            }

            // Read binary input stream and append it to temp file
            if (!$in = fopen($_FILES["file"]["tmp_name"], "rb")) {
                show_msg::ajax('Failed to open input stream.', 101);
            }
        } else {
            if (!$in = fopen("php://input", "rb")) {
                show_msg::ajax('Failed to open input stream.', 101);
            }
        }

        while ($buff = fread($in, 4096)) {
            fwrite($out, $buff);
        }
        fclose($out);fclose($in);

        $name = md5(req::$forms['name']);
        session::push($name,"{$filePath}.part");

        // Check if file has been uploaded
        if (!$chunks || $chunk == $chunks - 1) {
            $parts = session::get($name);
            foreach ($parts as $fp)
            {
                $upload_handle = fopen($uploadPath,'ab');
                if(fwrite($upload_handle,file_get_contents($fp)) === false)
                {
                    show_msg::ajax('Failed to merge file',105);
                }
                unlink($fp);
            }
        }
        else
        {
            show_msg::ajax('part success', 200, ['chunks'=>req::$forms['chunks'],'chunk'=>req::$forms['chunk']]);
        }
        //上传完成
        session::delete($name);
        $result['realname'] = req::$forms['name'];
        $result['name'] = $fileName;
        $result['size'] = req::$forms['size'];
        $result['type'] = req::$forms['type'];
        self::save_file($result);
        show_msg::ajax('success', 200,$result);
    }

    public static function save_file($data = [])
    {
        if(empty($data) || empty($data['realname']) || empty($data['type']))
        {
            log::info('文件保存失败，数据确实.data:'.var_export($data,1));
            return false;
        }

    }

    public static function del_file()
    {

    }
}