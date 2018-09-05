<?php

class sys_power
{
    public static $login_where = [];

    /**
     * @var array 登陆用户信息
     */
    public static $info = [];


    //权限校验
    public static function check_in($config = [])
    {
        if(isset($config['need_login']) && $config['need_login'] == true && in_array(CT_NAME,$config['not_login']))
        {
            return true;
        }

        self::$info = session::get('admin_info');
        if(empty(self::$info))
        {
            show_msg::error('您还没有登陆',$config['login_url']);
        }

        if(!in_array('?ct='.CT_NAME.'&ac='.AC_NAME,self::$info['powerlist']))
        {
            //show_msg::error('抱歉！您无权限查看该页面','?ct=index&ac=index');
        }

    }

    //登陆校验
    public static function login_check($where = [])
    {
        self::$login_where = empty($where) ? self::$login_where : $where;
        $info = db::select()
            ->from('admin_user')
            ->where(self::$login_where)
            ->as_row()
            ->execute();
        if(empty($info))
        {
            return false;
        }
        //获取用户权限
        if($info['group_id'] > 0)
        {
            $power = db::select()
                ->from('admin_group')
                ->where('group_id',$info['group_id'])
                ->as_row()
                ->execute();
        }
        $info['powerlist'] = empty($power) ? [] : json_decode($power['powerlist'],true);
        log::write('用户【ID:'.$info['admin_id'].'】登陆成功');
        session::set('admin_info',$info);
        return true;
    }




}