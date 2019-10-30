<?php
namespace index\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\config;
use sephp\core\view;
use sephp\core\show_msg;
use common\model\pub_mod_member_pam;



class ctl_index
{

	protected $page_title       = null;
	protected $page_description = null;
	protected $page_keywords    = null;

	public function __construct()
    {
		$site_info = config::get('base_config','mysql');
		$this->page_keywords    = $site_info['page_keywords'];
		$this->page_description = $site_info['page_description'];
		$this->page_title       = $site_info['page_title'];
        view::assign('site_info', $site_info);
        view::assign('page_title', $this->page_title);
        view::assign('page_description', $this->page_description);
        view::assign('page_keywords', $this->page_keywords);
		//friend link
		$links = config::get('friend_link');



	}

	//首页
	public function index()
    {
		view::display();
	}

    public function login()
    {
      if(empty(req::$posts))
      {
          view::display();
          exit();
      }



    }

  public function regist()
  {
      if(!empty(req::$posts))
      {
          $insert_data = func::data_filter([
              'username' => ['type' => 'text', 'required' => true ],
              'password' => ['type' => 'text', 'required' => true ],
              'email'    => ['type' => 'text', 'default' => '' ],
              'mobile'   => ['type' => 'text', 'default' => '' ],
              'nickname' => ['type' => 'text', 'default' => '' ],
              'realname' => ['type' => 'text', 'default' => '' ],
          ], req::$posts);

          if(!is_array($insert_data))
          {
              show_msg::error('登陆名或密码不能为空');
          }

          if(0 > pub_mod_member_pam::web_regist($insert_data))
          {
              show_msg::error('注册失败');
          }

          show_msg::success('注册成功');


      }
    view::display();
  }



    //关于我们
    public function about()
    {

        //公司概况
        view::assign('company_profile', config::get('company_profile'));
        //企业文化
        view::assign('company_cultural', config::get('company_cultural'));
        //企业资质
        view::assign('company_aptitude', config::get('company_aptitude'));
        //加入我们
        view::assign('join_us', config::get('join_us'));
        //服务范围
        view::assign('service_range', config::get('service_range'));
        //我们的愿景
        view::assign('we_hope', config::get('we_hope'));

        view::display('about');
    }


    //服务范围
    public function service()
    {

        view::display('service');
    }

	//申请合作
	public function cooperate() {
		view::display('cooperate');
	}

	//成功案例
	public function cases() {

		view::display('cases');
	}

    //解决方案
    public function solutions()
    {

        view::display('solutions');
    }

    //新闻文章
    public function news()
    {

        view::display('news');
    }

    //联系我们
    public function contact()
    {

        view::display('contact');
    }

    public function send_msg()
    {
        $data['send_ip']    = func::get_client_ip();
        $data['send_time']  = time();
        $data['from_mobile'] = req::item('from_mobile', '');

        if (empty($data['from_mobile'])) {

        }



    }

}
