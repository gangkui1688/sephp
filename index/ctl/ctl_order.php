<?php
namespace index\ctl;
use sephp\sephp;
use sephp\func;
use sephp\core\req;
use sephp\core\log;
use sephp\core\config;
use sephp\core\view;
use sephp\core\show_msg;
use common\model\pub_mod_goods;


class ctl_order
{
	public function __construct()
	{

	}

	  public function cart()
	  {
	    view::display();
	  }

	  public function complete_order()
	  {
	  		$goods_ids  = req::item('goods_id', []);
	  		$goods_nums = req::item('goods_num', []);
	  		if(empty($goods_nums) || empty($goods_ids))
	  		{
	  			show_msg::error('订单不存在');
	  		}

	  		$data = pub_mod_goods::getlist([
	  			'field' => ['name', 'cost', 'mktprice', 'store', 'min_buy', 'nostore_sell', 'goods_id'],
	  			'where' => [
	  				['goods_id', 'in' , $goods_ids],
	  				['marketable', '=' , 1],
	  			],
	  		]);
	  		$data = array_column($data, null, 'goods_id');
	  		foreach ($goods_ids as $key => $goods_id)
	  		{
	  			$data[$goods_id]['member_buy_num'] = $goods_nums[$key];
	  		}

			view::assign('data', $data);
	    	view::display();
	  }

}
