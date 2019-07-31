<?php
namespace sephp\core;
/**
 * Class log
 * 日志类型 type => info sql error
 */
class log
{
    public static $instance = null;

    /**
     * @var array 日志信息
     */
    protected static $log = [];

    /**
     * @var array 配置参数
     */
    protected $config = [
        'open'        => true,
        'single'      => false,//单个日志文件
        'file_size'   => 2097152,
        'path'        => PATH_ROOT.'runtime/log/',
        'apart_level' => ['info','error','sql'], //独立记录的类型
        'detail_info' => false, //运行的详细信息
    ];


    /**
     * 日志初始化
     * @access public
     * @param  array $config 配置参数
     * @return void
     */
    public static function init($config = [])
    {
        if(is_null(self::$instance))
        {
            self::$instance = new self();
        }

        if(!empty($GLOBALS['config']['log']))
        {
            self::$instance->config = array_merge(self::$instance->config,$GLOBALS['config']['log']);
        }

        return self::$instance;
    }


    /**
     * 实时写入日志信息 并支持行为
     * @access public
     * @param  mixed  $msg   调试信息
     * @return bool
     */
    public static function info($msg = '')
    {
        self::$log['info'][] = $msg;
    }

    public static function error($msg = '')
    {
        self::$log['error'][] = $msg;
    }

    //保存日志
    public function save()
    {
        if(!$this->config['open'])
        {
            $this->log = [];
            return true;
        }

        if ($this->config['single']) {
            $destination = $this->config['path'] . 'single.log';
        } else {
            $destination = $this->config['path'] . date('Ymd') . '.log';
        }

        $path = dirname($destination);
        !is_dir($path) && mkdir($path, 0755, true);

        $info = '';
        foreach (self::$log as $type => $val) {
            $level = '';
            foreach ($val as $msg) {
                if (!is_string($msg)) {
                    $msg = var_export($msg, true);
                }
                $level .= '[ ' . $type . ' ] ' . $msg . "\r\n";
            }

            if (in_array($type, $this->config['apart_level'])) {
                // 独立记录的日志级别
                if ($this->config['single']) {
                    $filename = $path .'/'. $type . '.log';
                } else {
                    $filename = $path .'/'. date('ymd') . '_' . $type  . '.log';
                }
                $this->write($level, $filename, true);
            } else {
                $info .= $level;
            }
        }
        if ($info) {
            return $this->write($info, $destination);
        }
        return true;
    }

    protected function write($message, $destination)
    {
        if ($this->config['detail_info']) {
            // 获取基本信息
            if (isset($_SERVER['HTTP_HOST'])) {
                $current_uri = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
            } else {
                $current_uri = "cmd:" . implode(' ', $_SERVER['argv']);
            }

            $runtime    = round(microtime(true) - SE_START_TIME, 10);
            $reqs       = $runtime > 0 ? number_format(1 / $runtime, 2) : '∞';
            $time_str   = ' [运行时间：' . number_format($runtime, 6) . 's][吞吐率：' . $reqs . 'req/s]';
            $memory_use = size_format(memory_get_usage());
            $memory_str = ' [内存消耗：' . $memory_use . 'kb]';
            $file_load  = ' [文件加载：' . count(get_included_files()) . ']';

            $message =  $time_str . $memory_str . $file_load . "\r\n" . $message;

            $now     = date('Y-m-d H:i:s');
            $ip      = get_client_ip();
            $method  = isset($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : 'CLI';
            $uri     = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : '';
            $message = "---------------------------------------------------------------\r\n[{$now}] {$ip} {$method} {$uri} " . $message;

        }
        $handle = fopen($destination,'a+');
        if (fwrite($handle, $message) === FALSE) {
            throw new Exception('日志写入失败,请检查日志文件写入权限');
            return false;
        }
        return (fclose($handle));
        //return error_log($message, 3, $destination);
    }
}
