<?php
namespace admin\ctl;
use sephp\sephp;
use sephp\core\req;
use sephp\core\log;
use sephp\core\view;
use sephp\lib\power;
use sephp\lib\pages;
use sephp\core\db;
use sephp\core\upload;
use sephp\core\show_msg;
use sephp\core\session;
use sephp\core\config;

/**
 * 会员 卡劵管理  充值卡和优惠卷
 * Class ctl_coupons
 *
 */
class ctl_coupons
{
    private $_pk = 'cpns_id';
    private $_table = '#PB#_coupons';
    private $_field = [
        'cpns_id','cpns_code','cpns_prefix','cpns_status','cpns_key','cpns_limit','create_time','cpns_type','create_user','expire_time'
    ];

    public function __construct()
    {
        view::assign('back_url',req::cookie('coupons_back_url','javascript:history.go(-1);'));
    }

    //卡劵列表
    public function coupons_list()
    {
        setcookie('coupons_back_url',func::get_cururl());
        $cpns_status = req::item('cpns_status','');
        view::assign('cpns_status',$cpns_status);
        if(!empty($cpns_status))
        {
            $where[] = ['cpns_status','=',$cpns_status];
        }

        $keywords = req::item('keywords','');
        view::assign('keywords',$keywords);
        if(!empty($keywords))
        {
            $where[] = ['cpns_code','like',"{$keywords}%"];
        }


        $where[] = [$this->_table . '.delete_user', '=', '0'];
        $count = db::select("count({$this->_pk}) as  count")
            ->from($this->_table)
            ->where($where)
            ->as_row()
            ->execute();

        $pages = pages::instance($count['count'],req::item('page_num',20));

        $list = db::select($this->_field)
            ->from($this->_table)
            ->where($where)
            ->offset($pages->firstRow)
            ->limit($pages->listRows)
            ->order_by($this->_pk,'DESC')
            ->execute();


        view::assign('list',$list);
        view::assign('pages',$pages->show());
        view::display('coupons.coupons_list');
    }

    //创建卡劵
    public function coupons_add()
    {
        if(empty(req::$posts))
        {
            view::display();
            exit();
        }
        $number = req::$posts['number'];
        if(empty($number))
        {
            show_msg::error('生成卡劵数量不能为空，最少一张');
        }

        $data['cpns_prefix'] = req::$posts['cpns_prefix'];
        $data['cpns_type'] = req::$posts['cpns_type'];
        $data['cpns_status'] = 1;//,1未使用，2已使用
        $data['cpns_limit'] = $data['cpns_status'] == 1 ? req::$posts['cpns_limit'] : 0;//卡券额度
        $data['create_time'] = time();
        $data['create_user'] = power::instance()->_uid;
        $data['expire_time'] = req::$posts['expire_time'];
        $fail_num = 0;
        for($i = 0 ; $i < $number; $i++)
        {
            $data['cpns_code'] = $this->create_uuid($data['cpns_prefix']);
            list($id,$rows) = db::insert($this->_table)->set($data)->execute();
            empty($id) ? log::error('新增卡劵失败，data：'.var_export($data,1).$fail_num++) : null;
        }
        log::info('新增卡劵'.$number-$fail_num.'张');
        show_msg::success();
    }

    //使用卡劵
    public function coupons_use()
    {
        if(empty(req::$posts))
        {

            view::display();
            exit;
        }
    }

    //生成卡劵号码
    private function create_uuid($cpns_prefix = '')
    {
        mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
        $charid = strtoupper(md5(uniqid(mt_rand(), true)));
        $hyphen = chr(45);// "-"
        $uuid = substr($charid,mt_rand(0,16),16);
//        $uuid = substr($uuid, 0, 4).$hyphen
//            .substr($uuid, 4, 4).$hyphen
//            .substr($uuid,8, 4).$hyphen
//            .substr($uuid,12, 4);
        if(empty($this->check_repeart($uuid,$cpns_prefix)))
        {
            return $uuid;
        }
        else
        {
            $this->create_uuid();
        }
    }

    //检测卡劵重复
    private function check_repeart($code,$cpns_prefix = '')
    {
        return $result = db::select($this->_pk)
            ->from($this->_table)
            ->where('cpns_code',$code)
            ->and_where('cpns_prefix','=',$cpns_prefix)
            ->and_where('delete_user','=','0')
            ->and_where('cpns_status','=','1')
            ->execute();
    }
}