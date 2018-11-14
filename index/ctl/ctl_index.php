<?php

class ctl_index {
	protected $page_title       = null;
	protected $page_description = null;
	protected $page_keywords    = null;

	public function __construct() {
		$site_info = config::get('base_config');
		view::assign('site_info', $site_info);
		$this->page_keywords    = $site_info['page_keywords'];
		$this->page_description = $site_info['page_description'];
		$this->page_title       = $site_info['page_title'];

		//friend link
		$links = config::get('friend_link');
    array_multisort(array_column($links,'sort_id'), )
		var_dump($links);

		view::assign('page_title', $this->page_title);
		view::assign('page_description', $this->page_description);
		view::assign('page_keywords', $this->page_keywords);

		var_dump($site_info);
	}
	//首页
	public function index() {

		view::display('index');
	}

	//申请合作
	public function cooperate() {
		view::display('cooperate');
	}

	//产品服务
	public function product() {

		view::display('product');
	}

	public function test() {

		p(req::$forms, mt_rand(0, 99999999999999));
		view::display();
	}

	public function getList_json() {
		echo '{
          "code": 0
          ,"msg": ""
          ,"data": {
            "mine": {
              "username": "纸飞机"
              ,"id": "100000"
              ,"status": "online"
              ,"sign": "在深邃的编码世界，做一枚轻盈的纸飞机"
              ,"avatar": "//res.layui.com/images/fly/avatar/00.jpg"
            }
            ,"friend": [{
              "groupname": "知名人物"
              ,"id": 0
              ,"list": [{
                "username": "贤心"
                ,"id": "100001"
                ,"avatar": "//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
                ,"sign": "这些都是测试数据，实际使用请严格按照该格式返回"
                ,"status": "online"
              },{
                "username": "刘小涛"
                ,"id": "100001222"
                ,"sign": "如约而至，不负姊妹欢乐颂"
                ,"avatar": "//tva4.sinaimg.cn/crop.0.1.1125.1125.180/475bb144jw8f9nwebnuhkj20v90vbwh9.jpg"
              },{
                "username": "谢小楠"
                ,"id": "10034001"
                ,"avatar": "//tva2.sinaimg.cn/crop.1.0.747.747.180/633f068fjw8f9h040n951j20ku0kr74t.jpg"
                ,"sign": ""
              },{
                "username": "马小云"
                ,"id": "168168"
                ,"avatar": "//tva1.sinaimg.cn/crop.0.0.180.180.180/7fde8b93jw1e8qgp5bmzyj2050050aa8.jpg"
                ,"sign": "让天下没有难写的代码"
              },{
                "username": "徐小峥"
                ,"id": "666666"
                ,"avatar": "//tva1.sinaimg.cn/crop.0.0.512.512.180/6a4acad5jw8eqi6yaholjj20e80e8t9f.jpg"
                ,"sign": "代码在囧途，也要写到底"
              }]
            },{
              "groupname": "网红声优"
              ,"id": 1
              ,"list": [{
                "username": "罗小凤"
                ,"id": "121286"
                ,"avatar": "//tva4.sinaimg.cn/crop.0.0.640.640.180/4a02849cjw8fc8vn18vktj20hs0hs75v.jpg"
                ,"sign": "在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱"
              },{
                "username": "Z_子晴"
                ,"id": "108101"
                ,"avatar": "//tva1.sinaimg.cn/crop.0.23.1242.1242.180/8693225ajw8fbimjimpjwj20yi0zs77l.jpg"
                ,"sign": "微电商达人"
              },{
                "username": "大鱼_MsYuyu"
                ,"id": "12123454"
                ,"avatar": "//tva2.sinaimg.cn/crop.0.0.512.512.180/005LMAegjw8f2bp9qg4mrj30e80e8dg5.jpg"
                ,"sign": "我瘋了！這也太準了吧  超級笑點低"
              },{
                "username": "醋醋cucu"
                ,"id": "102101"
                ,"avatar": "//tva2.sinaimg.cn/crop.0.0.640.640.180/648fbe5ejw8ethmg0u9egj20hs0ht0tn.jpg"
                ,"sign": ""
              },{
                "username": "柏雪近在它香"
                ,"id": "3435343"
                ,"avatar": "//tva2.sinaimg.cn/crop.0.8.751.751.180/961a9be5jw8fczq7q98i7j20kv0lcwfn.jpg"
                ,"sign": ""
              }]
            },{
              "groupname": "女神艺人"
              ,"id": 2
              ,"list": [{
                "username": "王小贤"
                ,"id": "76543"
                ,"avatar": "//wx2.sinaimg.cn/mw690/5db11ff4gy1flxmew7edlj203d03wt8n.jpg"
                ,"sign": "我爱贤心"
              },{
                "username": "佟小娅"
                ,"id": "4803920"
                ,"avatar": "//tva3.sinaimg.cn/crop.0.0.750.750.180/5033b6dbjw8etqysyifpkj20ku0kuwfw.jpg"
                ,"sign": "我也爱贤心吖吖啊"
              }]
            }]
            ,"group": [{
              "groupname": "前端群"
              ,"id": "101"
              ,"avatar": "//tva1.sinaimg.cn/crop.0.0.200.200.50/006q8Q6bjw8f20zsdem2mj305k05kdfw.jpg"
            },{
              "groupname": "Fly社区官方群"
              ,"id": "102"
              ,"avatar": "//tva2.sinaimg.cn/crop.0.0.199.199.180/005Zseqhjw1eplix1brxxj305k05kjrf.jpg"
            }]
          }
        }';
	}
}