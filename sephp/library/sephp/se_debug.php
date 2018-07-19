<?php
class se_debug
{
    public static $html = '<script language=\'javascript\'>function debug_hidden_all() {document.getElementById(\'debug_errdiv\').style.display=\'none\';}function debug_close_all() {debug_hidden_all();document.getElementById(\'debug_ctl\').style.display=\'none\';}</script><div id="debug_ctl" style="background: #cc3a3a;width:100px;line-height:18px;position:absolute;top:2px;left:2px;border:1px solid #ccc; padding:1px;text-align:center">
<a href="javascript:;" onclick="javascript:document.getElementById(\'debug_errdiv\').style.display=\'block\';" style="font-size:12px;">[打开调试信息]</a>
</div><div id="debug_errdiv" style="z-index:9999;width:80%;position:absolute;top:10px;left:8px;border:2px solid #ccc; background: #fff; padding:8px;display:none"><div style="line-height:24px; background: #FBFEEF;;"><div style="float:left"><strong>错误/警告信息追踪：</strong></div><div style="float:right"><a href="javascript:;" onclick="javascript:debug_close_all();" style="font-size:12px;">[关闭]</a><a href="javascript:;" onclick="javascript:debug_hidden_all();" style="font-size:12px;">[收起]</a></div><br style="clear:both"/></div>';




    public static function show($code, $msg, $filename, $line, $backtrace)
    {
        log::write($msg);
        $codes = file($filename);
        //p($codes[$line-1]);
        self::$html  .= '<div style=\'font-size:14px;line-height:160%;border-bottom:1px dashed #ccc;margin-top:8px;\'>';
        self::$html .= "发生环境：" . date("Y-m-d H:i:s", time()).'::' .SE_URL. "<br />\n";
        self::$html .= "错误类型：" . $code . "<br />\n";
        self::$html .= "出错原因：<font color='#3F7640'>" . $msg . "</font><br />\n";
        self::$html .= "提示位置：" . $filename . " 第 {$line} 行<br />\n";
        self::$html .= "断点源码：<font color='#747267'>{$codes[$line-1]}</font><br />\n";
        self::$html .= "详细跟踪：<br />\n";

        $debug_backtrace = debug_backtrace();
        array_shift($backtrace);
        $narr = array('class', 'type', 'function', 'file', 'line');
        foreach($backtrace as $i => $l)
        {
            foreach($narr as $k)
            {
                if( !isset($l[$k]) ) $l[$k] = '';
            }
            self::$html .= "<font color='#747267'>[$i] in function {$l['class']}{$l['type']}{$l['function']} ";
            if($l['file']) self::$html .= " in {$l['file']} ";
            if($l['line']) self::$html .= " on line {$l['line']} ";
            self::$html .= "</font><br />\n";
        }

        //p($debug_backtrace);
        self::$html .= '</div><br style="clear:both"/></div>';


       echo self::$html;

    }

    public static function get_line_code($filename,$line)
    {

    }




}