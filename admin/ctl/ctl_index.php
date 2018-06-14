<?php

class ctl_index
{
    public $table = 'ctlIndex';

    public function index()
    {
        $Verify = new verifiy_code();
        p($Verify->check('g2ltp'));



        baidu_();

        echo 'hello world!';
        view::display('baidu/add');

        p(mod_index::getlist());
    }


    public function display()
    {
        view::assign('title','this is smarty test!ś');
        view::display('index/index');
    }

    public function test()
    {
        baidu_();
        p(__CLASS__);
        new mod_index();

    }


    public function mail()
    {
        error_log('this is test for send a email!',1,'gangkui1688@icloud.com');

        log::write('i have send a email just do it !');
    }
    public function options()
    {

        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Authorization");
        $arr=['1','2'];

        echo json_encode($arr);
    }
    public function baidu()
    {

        $data = ['key'=>'key_'.mt_rand(100000,999999),'value'=>self::get_rand(9)];

        //$result = db::insert('config')->set($data)->compile();

        $result = db::select('sssss')->from('config')->select()->as_row()->execute();
        p($result,db::get_last_sql(),db::get_error());exit;


//        $result = db::update('config')->set(['value'=>'www.baidddddu.com'])->where('key','key_663839')->execute();//compile();
//        p($result);
//        p(db::get_last_sql());

        $result = db::delete('config')->where('key','key_663839')->execute();
        p($result,db::get_last_sql());



        $result = db::select()->from('config')->where('key','key_663839')->select()->execute();
        p($result);


    }


    public static function get_rand($length = 6)
    {
        $str = null;
        for ($len = 0;$len <= $length;$len++)
        {
            $str .= chr(mt_rand(33,126));
        }
        return $str;
    }

}

