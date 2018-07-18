<?php

class session
{
    protected static $prefix = '';
    protected static $init   = null;

    /**
     * 设置或者获取session作用域（前缀）
     * @param string $prefix
     * @return string|void
     */
    public static function prefix($prefix = '')
    {
        empty(self::$init) && self::boot();
        if (empty($prefix) && null !== $prefix) {
            return self::$prefix;
        } else {
            self::$prefix = $prefix;
        }
    }

    /**
     * session初始化
     * @param array $config
     * @return void
     */
    public static function init(array $config = [])
    {
        if (empty($config)) {
            $config = isset($GLOBALS['config']['session'])?$GLOBALS['config']['session']:null;
        }

        if (isset($config['prefix'])) {
            self::$prefix = $config['prefix'];
        }


        if(session_status() == PHP_SESSION_ACTIVE){
            self::$init = true;
            return true;
        }

        if (!$config['auto_start']) {
            self::$init = false;
            return false;
        }

        if (isset($config['path'])) {
            session_save_path($config['path']);
        }

        if (isset($config['expire'])) {
            //Session数据在服务器端储存的时间
            ini_set('session.gc_maxlifetime', $config['expire']);
            //SessionID在客户端Cookie储存的时间
            ini_set('session.cookie_lifetime', $config['expire']);
        }
        if (isset($config['secure'])) {
            //session.cookie_secure设置为true意味着它只会通过安全连接（SSL）发送会话cookie，
            ini_set('session.cookie_secure', $config['secure']);
        }
        //不能通过客户端脚本访问，则为 true
        ini_set('session.cookie_httponly', true);

        if (isset($config['use_cookies'])) {
            ////是否使用cookies(默认值为1)
            ini_set('session.use_cookies', $config['use_cookies'] ? 1 : 0);
        }
        if (isset($config['cache_limiter'])) {
            //session在客户端的缓存方式，有nocache,private,private_no_expire,publice主这几种
            session_cache_limiter($config['cache_limiter']);
        }
        if (isset($config['cache_expire'])) {
            session_cache_expire($config['cache_expire']);
        }

        // 启动session
        if ($config['auto_start']) {
            ini_set('session.auto_start', 0);
            session_start();
            self::$init = true;
        } else {
            self::$init = false;
        }
    }


    /**
     * session设置
     * @param string        $name session名称
     * @param mixed         $value session值
     * @param string|null   $prefix 作用域（前缀）
     * @return void
     */
    public static function set($name, $value = '', $prefix = null)
    {
        if(!self::$init) self::init();
        $prefix = !is_null($prefix) ? $prefix : self::$prefix;
        if (strpos($name, '.')) {
            // 二维数组赋值
            list($name1, $name2) = explode('.', $name);
            if ($prefix) {
                $_SESSION[$prefix][$name1][$name2] = $value;
            } else {
                $_SESSION[$name1][$name2] = $value;
            }
        } elseif ($prefix) {
            $_SESSION[$prefix][$name] = $value;
        } else {
            $_SESSION[$name] = $value;
        }
    }

    /**
     * session获取
     * @param string        $name session名称
     * @param string|null   $prefix 作用域（前缀）
     * @return mixed
     */
    public static function get($name = '', $prefix = null)
    {
        empty(self::$init) && self::init();
        $prefix = !is_null($prefix) ? $prefix : self::$prefix;
        if ('' == $name) {
            // 获取全部的session
            $value = $prefix ? (!empty($_SESSION[$prefix]) ? $_SESSION[$prefix] : null) : $_SESSION;
        } elseif ($prefix) {
            // 获取session
            if (strpos($name, '.')) {
                list($name1, $name2) = explode('.', $name);
                $value               = isset($_SESSION[$prefix][$name1][$name2]) ? $_SESSION[$prefix][$name1][$name2] : null;
            } else {
                $value = isset($_SESSION[$prefix][$name]) ? $_SESSION[$prefix][$name] : null;
            }
        } else {
            if (strpos($name, '.')) {
                list($name1, $name2) = explode('.', $name);
                $value               = isset($_SESSION[$name1][$name2]) ? $_SESSION[$name1][$name2] : null;
            } else {
                $value = isset($_SESSION[$name]) ? $_SESSION[$name] : null;
            }
        }
        return $value;
    }


    /**
     * session设置 下一次请求有效
     * @param string        $name session名称
     * @param mixed         $value session值
     * @param string|null   $prefix 作用域（前缀）
     * @return void
     */
    public static function flash($name, $value)
    {
        self::set($name, $value);
        if (!self::has('__flash__.__time__')) {
            self::set('__flash__.__time__', $_SERVER['REQUEST_TIME_FLOAT']);
        }
        self::push('__flash__', $name);
    }

    /**
     * 清空当前请求的session数据
     * @return void
     */
    public static function flush()
    {
        if (self::$init) {
            $item = self::get('__flash__');

            if (!empty($item)) {
                $time = $item['__time__'];
                if ($_SERVER['REQUEST_TIME_FLOAT'] > $time) {
                    unset($item['__time__']);
                    self::delete($item);
                    self::set('__flash__', []);
                }
            }
        }
    }

    /**
     * 删除session数据
     * @param string|array  $name session名称
     * @param string|null   $prefix 作用域（前缀）
     * @return void
     */
    public static function delete($name = null, $prefix = null)
    {
        empty(self::$init) && self::init();
        if(empty($name))
        {
            session_unset();//释放内存
            session_destroy();//删除当前会话
            return true;
        }
        $prefix = !is_null($prefix) ? $prefix : self::$prefix;

        if (is_array($name)) {
            foreach ($name as $key) {
                if ($prefix) {
                    session_unset($_SESSION[$prefix][$key]);
                } else {
                    session_unset($_SESSION[$key]);
                }
            }
        } elseif (strpos($name, '.')) {
            list($name1, $name2) = explode('.', $name);
            if ($prefix) {
                session_unset($_SESSION[$prefix][$name1][$name2]);
            } else {
                session_unset($_SESSION[$name1][$name2]);
            }
        } else {
            if ($prefix) {
                session_unset($_SESSION[$prefix][$name]);
            } else {
                session_unset($_SESSION[$name]);
            }
        }
    }

    /**
     * 清空session数据
     * @param string|null   $prefix 作用域（前缀）
     * @return void
     */
    public static function clear($prefix = null)
    {
        self::delete($prefix);
    }

    /**
     * 判断session数据
     * @param string        $name session名称
     * @param string|null   $prefix
     * @return bool
     */
    public static function has($name, $prefix = null)
    {
        empty(self::$init) && self::init();
        $prefix = !is_null($prefix) ? $prefix : self::$prefix;
        if (strpos($name, '.')) {
            // 支持数组
            list($name1, $name2) = explode('.', $name);
            return $prefix ? isset($_SESSION[$prefix][$name1][$name2]) : isset($_SESSION[$name1][$name2]);
        } else {
            return $prefix ? isset($_SESSION[$prefix][$name]) : isset($_SESSION[$name]);
        }
    }

    /**
     * 添加数据到一个session数组
     * @param  string  $key
     * @param  mixed   $value
     * @return void
     */
    public static function push($key, $value)
    {
        $array = self::get($key);
        if (is_null($array)) {
            $array = [];
        }
        $array[] = $value;
        self::set($key, $array);
    }

    /**
     * 启动session
     * @return void
     */
    public static function start()
    {
        session_start();
        self::$init = true;
    }

    /**
     * 销毁session
     * @return void
     */
    public static function destroy()
    {
        if (!empty($_SESSION)) {
            $_SESSION = [];
        }
        session_unset();
        session_destroy();
        self::$init = null;
    }

    /**
     * 重新生成session_id
     * @param bool $delete 是否删除关联会话文件
     * @return void
     */
    public static function regenerate($delete = false)
    {
        session_regenerate_id($delete);
    }

    /**
     * 暂停session
     * @return void
     */
    public static function pause()
    {
        // 暂停session
        session_write_close();
        self::$init = false;
    }
}
