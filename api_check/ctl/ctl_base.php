<?php
namespace api_check\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\db;


class ctl_base
{


    public
        $uid  = 0,
        $pid  = 0,
        $page = 1,
        $os   = null,
        $version = 1,
        $token   = null;

    public function __construct()
    {
        //如果是接口请求的
        if ( PHP_SAPI != 'cli' )
        {
            $post_data = req::item('post_data', []);
            if (!empty($post_data))
            {
                \socket\model\mod_base::init_data($post_data);
            }
            //用户没搞好，暂时不理token
            $this->uid = kali::$auth->user['uid'];
            $this->token = req::item('token', '');
            $this->os = req::item('os', '');

            //@todo: 没登陆的处理
        }

        if ( empty($this->token) || empty($this->uid) )
        {
            $this->error('参数错误',ERR_INCORRECT_PARAMATER);
        }

        $GLOBALS['APP_VERSION'] = req::item('version', '');
        $GLOBALS['APP_OS'] = strtolower($this->os);

        $this->page = req::item('page', '1');
        $this->pagesize = req::item('page_size', $this->pagesize);
        $this->offset = ($this->page - 1) * $this->pagesize;
        \common\model\pub_mod_order::log('请求了：' . req::cururl() .' : 请求参数：' . var_export(req::$forms, 1) );

    }

    protected function success($msg='success', $code=0, $data=[])
    {
        $this->json($code, $msg, $data);
    }

    // 返回失败json数据
    public function error($msg='error', $code=-1, $data=[])
    {
        $this->json($code, $msg, $data);
    }

    // 返回json数据
    protected function json($code, $msg, $data)
    {
        header('Content-Type: application/json; charset=utf-8');
        // php7.1 json_encode float精度会溢出
        if (version_compare(phpversion(), '7.1', '>=')) {
            ini_set( 'serialize_precision', -1 );
        }
        $data = [
            'code'   => (int) $code,
            'msg'    => (string) $msg,
            'data'   => empty($data) ? [] : $data,
        ];
        if(defined(SYS_DEBUG) && SYS_DEBUG)
        {
            $data['sqlnum'] = count(db::$queries);
        }
        exit(json_encode($data, JSON_UNESCAPED_UNICODE));
    }



    /**
     * 登陆
     * @Author   GangKui
     * @DateTime 2019-11-02
     * @return   [type]     [description]
     */
    public function login()
    {
        try{
            $data_filter = func::data_filter([
                'username' => ['type' => 'text', 'require' => true],
                'password' => ['type' => 'text', 'require' => true],
            ], req::$posts);

            if(!is_array($data_filter))
            {
                $this->error('参数错误');
            }

        }
        catch (\Exception $e)
        {
            if($e->getCode() >= 0)
            {
                $this->error("unkonw error(code:{$e->getCode()}, msg:{$e->getMessage()})", -99);
            }
            else
            {
                $this->error($e->getMessage(), $e->getCode());
            }
        }


    }

    /**
     * 登出
     * @Author   GangKui
     * @DateTime 2019-11-02
     * @return   [type]     [description]
     */
    public function logout()
    {


    }


}
