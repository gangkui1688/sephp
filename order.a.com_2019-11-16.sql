# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.01 (MySQL 5.7.20-log)
# Database: order.a.com
# Generation Time: 2019-11-16 02:58:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table order_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_admin`;

CREATE TABLE `order_admin` (
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '管理id',
  `pools` varchar(20) DEFAULT NULL COMMENT '权限池',
  `groups` varchar(1000) NOT NULL DEFAULT '' COMMENT '权限组',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` char(100) DEFAULT NULL COMMENT '用户密码',
  `fake_password` char(100) DEFAULT NULL COMMENT '伪造密码',
  `onetime_password` char(32) DEFAULT NULL COMMENT '一次性密码',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `potato` varchar(20) DEFAULT NULL COMMENT 'Potato',
  `safe_ips` varchar(200) DEFAULT NULL COMMENT '登陆IP限制',
  `is_first_login` tinyint(1) DEFAULT '1' COMMENT '是否首次登录',
  `date_expired` datetime DEFAULT NULL COMMENT '失效日期时间',
  `otp_auth` tinyint(1) DEFAULT '0' COMMENT 'MFA认证等级 0:禁用  1:启用  2:强制启用 [未使用]',
  `otp_authcode` char(16) DEFAULT '' COMMENT 'MFA验证码',
  `need_audit` tinyint(1) DEFAULT '0' COMMENT '登陆是否需要后台进行人工审核 0: 不需要 1:需要',
  `session_id` char(26) DEFAULT '' COMMENT '登陆时session_id',
  `session_expire` int(11) DEFAULT '999999999' COMMENT 'SESSION有效期，默认24分钟',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '帐号状态 1:正常 0:禁止登陆',
  `regtime` int(11) NOT NULL COMMENT '注册时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `logintime` int(10) unsigned DEFAULT '0' COMMENT '最后登录时间',
  `loginip` varchar(15) DEFAULT '0' COMMENT '最后登录IP',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userid` (`username`),
  KEY `status` (`status`),
  KEY `pools` (`pools`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `order_admin` WRITE;
/*!40000 ALTER TABLE `order_admin` DISABLE KEYS */;

INSERT INTO `order_admin` (`uid`, `pools`, `groups`, `username`, `password`, `fake_password`, `onetime_password`, `realname`, `email`, `potato`, `safe_ips`, `is_first_login`, `date_expired`, `otp_auth`, `otp_authcode`, `need_audit`, `session_id`, `session_expire`, `status`, `regtime`, `regip`, `logintime`, `loginip`)
VALUES
	('005d158f31efef188897e4ece451f4cd',NULL,'d9cc308d79c1e18880f02455843b3cd6','chenzhuo','$2y$10$qfHOYTLTrdETzW0MgeVkUOATvJjWOkSohiB7WxZ7g6rB3XgtKBfHS',NULL,NULL,'宸卓','','','',0,NULL,0,'',0,'',1440,1,1545063433,'127.0.0.1',1547092043,'192.168.83.92'),
	('00e2e34c14bfcec4fdc43e4d330cbbda',NULL,'d9cc308d79c1e18880f02455843b3cd6','yuling','$2y$10$VQWyrTqPoQ5oxS72xh0tGeO3Ip3v/BU4LkSPiBcYCojjZzrRGOZFS',NULL,NULL,'玉宁','','','',0,NULL,0,'',0,'',1440,1,1545063458,'127.0.0.1',1545967373,'192.168.83.68'),
	('1',NULL,'1','admin','$2y$10$.SGeRb1vf3VhEpDOo6OWluozRwvyYpthyYCWPBOShYrGre6K0cOb.','$2y$10$X4u0bePFZ4aBu02FmOjqe.k9a','','管理员','seatle888@gmail.com','','',0,'2088-06-08 00:00:00',0,'PKNUNEZHV57LSWE4',0,'',86400,1,1504873451,'10.10.12.25',1573825452,'127.0.0.1'),
	('119dc0dd7a8de2aad832c33a7e862649',NULL,'d9cc308d79c1e18880f02455843b3cd6','kevin','$2y$10$TPjXIC8tREYTtqD5D3wSjOhPitByoFrE/iOyhRsRk9WmepIZW4tSW',NULL,NULL,'Kevin','','','',0,NULL,0,'',0,'',1440,1,1545062971,'127.0.0.1',1546921137,'192.168.83.58'),
	('1ec88d6f31006b0fee1bd4f34d343d20',NULL,'d9cc308d79c1e18880f02455843b3cd6','jimi','$2y$10$HJMr4kxJNXovA1P4UZl/Gu6Zv4i8qmkxxPcjFNEG4asBKjCTWsfTW',NULL,NULL,'几米','','','',0,NULL,0,'',0,'',1440,1,1545063166,'127.0.0.1',1546662418,'192.168.83.66'),
	('1f90d02334f428feb1f680b3bdfc64ef',NULL,'d9cc308d79c1e18880f02455843b3cd6','hengkun','$2y$10$Rw3wuwN1PBTrkbG246LWWO4GTenOTcu8do.VYcoQPOoSPUgDZ.qqu',NULL,NULL,'恒坤','','','',0,NULL,0,'',0,'',1440,1,1545625045,'192.168.83.68',1545625163,'192.168.83.161'),
	('2d204e70cbb18aaee963d37224cfb1a2',NULL,'d9cc308d79c1e18880f02455843b3cd6','gangkui','$2y$10$FGAhNBQ6ilZtq9tAa6z.eOcb313ox.ZZ7MvV8A/pAVKXuq7Svs6Iy',NULL,NULL,'钢盔','','','',0,NULL,0,'',0,'',1440,1,1545042667,'127.0.0.1',1573825807,'127.0.0.1'),
	('379403f090c118f7e3233ca6457e81bf',NULL,'d9cc308d79c1e18880f02455843b3cd6','SiXing','$2y$10$Gkm.gLEUa9xbdYJDYpCgPuNViQS.veM.orjrUkhnQlHastdZB3Tw6',NULL,NULL,'SiXing','','','',0,NULL,0,'',0,'',1440,1,1545708896,'192.168.83.55',1547093657,'192.168.83.117'),
	('428b9a1b89ff60997a272ae9020c46b3',NULL,'d9cc308d79c1e18880f02455843b3cd6','qintian','$2y$10$lPMtP1tMz7uqYEwKxy.yn.zBmOhOSO4M.qkjNmhcrUcxMXVEL41JC',NULL,NULL,'晴天','','','',0,NULL,0,'',0,'',1440,1,1545063481,'127.0.0.1',1547093383,'192.168.83.77'),
	('505111db3ec293528268cac6ec813c02',NULL,'d9cc308d79c1e18880f02455843b3cd6','dayao','$2y$10$wvbISLP4c5c2QfPknDZNeOjGd54Rmhzv2VxyKb0Gw3dvet4X8Imzi',NULL,NULL,'大姚','','','',0,NULL,0,'',0,'',1440,1,1545204037,'127.0.0.1',1545622867,'192.168.83.79'),
	('55b5373c3fbfc42d2eb67ad8a1981cd4',NULL,'d9cc308d79c1e18880f02455843b3cd6','kern','$2y$10$jU7tnZkpf612d0DKhrDisu1V0jOI.W9wr07GUzVj5QULgWZMTcQR6',NULL,NULL,'kern','','','',0,NULL,0,'',0,'',1440,1,1545063188,'127.0.0.1',1546399639,'192.168.83.86'),
	('5c835e039058fe1819e6763e214f745c',NULL,'d9cc308d79c1e18880f02455843b3cd6','sking','$2y$10$b1KmjiiNJkIikxDXujHUD.rqkfgO0MTnpzH1Wlp9w2mpB8ci2ngES',NULL,NULL,'sking','','','',0,NULL,0,'',0,'',1440,1,1545063282,'127.0.0.1',1547176411,'192.168.83.62'),
	('649fa87e35f4a6f40229e8eb226806d1',NULL,'d9cc308d79c1e18880f02455843b3cd6','kos','$2y$10$h.MkFrnGAIhFZ.WM6V65TeFqEwMuF.0MdgDaM/dBdseMnBtuXFQIK',NULL,NULL,'kos','','','',1,NULL,0,'',0,'',1440,1,1545063307,'127.0.0.1',0,'0'),
	('76b9f68de7bbdd7ead60679cc7e232b1',NULL,'d9cc308d79c1e18880f02455843b3cd6','dingdang','$2y$10$I6LboxmtbgwXzoKqtXdHTuf3aBVA.JUjvpFHFCfwxXa/z1tbhCzBC',NULL,NULL,'叮当','','','',0,NULL,0,'',0,'',1440,1,1545062842,'127.0.0.1',1546053626,'192.168.83.89'),
	('776eea5bad241248e6c7f049162617ae',NULL,'d9cc308d79c1e18880f02455843b3cd6','meihua','$2y$10$48LGTN5heGWQWWGsTxZxtezNMbW/E9xpTB7RVbwHDD95iangtiMhC',NULL,NULL,'美华','','','',1,NULL,0,'',0,'',1440,1,1545063235,'127.0.0.1',0,'0'),
	('8878bebfbb1962508c682fd9622c616e',NULL,'d9cc308d79c1e18880f02455843b3cd6','xiaozhe','$2y$10$B2ktgcwNjekqJvTqwHxy/.2fepVGNQGylmpTNQ/G9VXw2Pg15EAV2',NULL,NULL,'小哲','','','',0,NULL,0,'',0,'',1440,1,1545063006,'127.0.0.1',1545278420,'192.168.83.61'),
	('b69962a88114d8e61dce408a473efb90',NULL,'d9cc308d79c1e18880f02455843b3cd6','Ice','$2y$10$uHSoLftRvr7hQbmxcfatg.YDyoEvO2DaLuB3iMwLYa8yawNT.ST9O',NULL,NULL,'Ice','','','',0,NULL,0,'',0,'olbfggeb1rbumlifc002goa1uf',1440,1,1545063260,'127.0.0.1',1555576449,'192.168.10.119'),
	('b7b377b5bf9da1518c4bb2c332b8dff3',NULL,'d9cc308d79c1e18880f02455843b3cd6','qicheng','$2y$10$Z6DD0K.YTsyEX2dL7J9jseLQjxdZERH4MsyMG9kxA56q6JzULTOAa',NULL,NULL,'清晨','','','',1,NULL,0,'',0,'',1440,1,1545063211,'127.0.0.1',0,'0'),
	('bbd1c2afab02b82639a652ec8f4daea0',NULL,'d9cc308d79c1e18880f02455843b3cd6,ef7a8f49b2825be4ff794625a5198179','meilin','$2y$10$QKkJKU37knV/qkYAd/sJPeX6GusnjHIkNoTsuHY6lIwKRHFe.vIYK',NULL,NULL,'美林','','','',0,NULL,0,'',0,'691vr0c3pd2uilnlg0900vvn1v',1440,1,1545063331,'127.0.0.1',1552650031,'192.168.10.233'),
	('cadd985895c05d9286051d14a36ebed0',NULL,'d9cc308d79c1e18880f02455843b3cd6','shuangxi','$2y$10$ytp3DdFC5zZ2Nd1JjDoHWOPWE.THTqCwGWjzUStcnku/DIWf/AHXC',NULL,NULL,'双喜','','','',0,NULL,0,'',0,'',1440,1,1545063137,'127.0.0.1',1546576434,'192.168.83.95'),
	('e535032ff48e32b05b551c7f5989eb6b',NULL,'d9cc308d79c1e18880f02455843b3cd6','dawai','$2y$10$7xHywnsZJZWIoam0g6usqugVoKOFehvHdFFQfJbuaqM2tsPKGnhq6',NULL,NULL,'大歪','','','',0,NULL,0,'',0,'9g0734l2qke1fb2k1bcub9vsh5',1440,1,1545709342,'192.168.83.55',1551771963,'192.168.83.119'),
	('f28c519be47c0ed1901efa5593d14c0e',NULL,'d9cc308d79c1e18880f02455843b3cd6','gufeng','$2y$10$5k2f01ByLJB/QQbShkMseuojtRLGaPkK7C/jY2yICCW3z5hE9KnFy',NULL,NULL,'古风','','','',0,NULL,0,'',0,'',1440,1,1545062943,'127.0.0.1',1547524455,'192.168.83.73'),
	('f8e0d74ba172bc3779c1d741eb1bc0bd',NULL,'b40f3d22ade1277df1afb71698d7f4ea','shucun','$2y$10$cQLhPx.IyTJ9ThoG9jc8fONUgLy0eoHW6IYOmhN54wK4vvZmUscmi',NULL,NULL,'树村','','','',0,NULL,0,'',0,'',999999999,1,1545063076,'127.0.0.1',1547438621,'192.168.83.55'),
	('fa9762f68f11fe1d4632a73fb3945707',NULL,'d9cc308d79c1e18880f02455843b3cd6','muqing','$2y$10$rYPUQPMm8Kn3TXBtenIAo.6xYaEZVwL4Qf76QcJgDMHJCiFLNKaze',NULL,NULL,'木青','','','',0,NULL,0,'',0,'',1440,1,1545063352,'127.0.0.1',1546831651,'192.168.83.90');

/*!40000 ALTER TABLE `order_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_admin_asset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_admin_asset`;

CREATE TABLE `order_admin_asset` (
  `uid` char(32) NOT NULL DEFAULT '',
  `code` varchar(300) NOT NULL DEFAULT '' COMMENT '编号',
  `name` varchar(500) NOT NULL DEFAULT '' COMMENT '名称',
  `serial_num` varchar(500) DEFAULT '' COMMENT '设备序列号',
  `serial_type` int(2) unsigned NOT NULL COMMENT '1电脑，2显示器，3手机，4打印机',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户资产表';



# Dump of table order_admin_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_admin_group`;

CREATE TABLE `order_admin_group` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `name` varchar(20) DEFAULT NULL COMMENT '用户组名称',
  `pools` varchar(20) DEFAULT NULL COMMENT '权限池',
  `purviews` text NOT NULL COMMENT '用户组权限',
  `uptime` int(10) DEFAULT NULL COMMENT '修改时间',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组表';

LOCK TABLES `order_admin_group` WRITE;
/*!40000 ALTER TABLE `order_admin_group` DISABLE KEYS */;

INSERT INTO `order_admin_group` (`id`, `name`, `pools`, `purviews`, `uptime`, `addtime`)
VALUES
	('1','超级管理员',NULL,'*',1504839424,1504839424),
	('2','普通管理员',NULL,'content-index,content-add,content-edit,content-del,category-index,category-add,category-edit,category-del,member-index,member-add,member-edit,member-del,admin-editpwd,admin-editpwd_fake,admin-mypurview,admin_group-index,admin_group-add,admin_group-edit,admin_group-del,admin-index,admin-add,admin-edit,admin-del,system-edit_menu,config-index,config-add,config-edit,config-del,admin-oplog,admin-login_log,cache-index,cache-del,cache-clear,cache-redis_keys,cache-redis_info,filemanage-index,filemanage-add,filemanage-edit,filemanage-del,crond-index,crond-add,crond-edit,crond-del',1523269932,1504839539),
	('3','测试人员',NULL,'content-index,content-add,content-edit,content-del,category-index,category-add,category-edit,category-del,member-index,member-add,member-edit,member-del,admin-editpwd,admin-editpwd_fake,admin-mypurview',1532783074,1504842647),
	('b40f3d22ade1277df1afb71698d7f4ea','沙雕村村长',NULL,'order-add,order-save,order-del,order-stop_order,order-start_order,order-notice_to_start,order-edit,order-pay_bill,order-save_order_menu,order-lunch,order-dinner,order-mt_rand,order-who,order-index,setting-index,setting-type,setting-save,setting-del,setting-edit,setting-add,shop-index,shop-add,shop-save,shop-del,shop-edit,admin-editpwd,admin-editpwd_fake,admin-mypurview,admin_group-index,admin_group-add,admin_group-edit,admin_group-del,admin-index,admin-add,admin-edit,admin-del,admin-oplog,admin-login_log,session-online,session-offline,config-index,config-add,config-edit,config-del,cache-index,cache-del,cache-clear,cache-redis_keys,cache-redis_info,filemanage-index,filemanage-add,filemanage-edit,filemanage-del,upload-upload,upload-upload_chunked,upload-upload_html5,crond-index,crond-add,crond-edit,crond-del',1573825525,1545107352),
	('d9cc308d79c1e18880f02455843b3cd6','沙雕村民',NULL,'order-add,order-save,order-del,order-notice_to_start,order-edit,order-save_order_menu,order-index,admin-editpwd,admin-editpwd_fake,admin-mypurview,filemanage-add,filemanage-edit,filemanage-del,upload-upload,upload-upload_chunked,upload-upload_html5',1573825492,1545042521),
	('ef7a8f49b2825be4ff794625a5198179','会计',NULL,'work-my_application,work-take_plane,work-to_plane,work-edit,work-del,finance-todo,finance-remind_setting,finance-info_edit,finance-edit_staff,finance-chanage_status,finance-info,admin-editpwd,admin-editpwd_fake,admin-mypurview,admin-index,admin-add,admin-edit,admin-del,admin-oplog,admin-login_log,filemanage-add,filemanage-edit,filemanage-del,upload-upload,upload-upload_chunked,upload-upload_html5',1548471685,1548133651);

/*!40000 ALTER TABLE `order_admin_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_admin_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_admin_login`;

CREATE TABLE `order_admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pools` varchar(20) NOT NULL DEFAULT 'admin' COMMENT '应用池',
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '用户ID',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `session_id` varchar(32) DEFAULT NULL COMMENT 'SESSION ID',
  `agent` varchar(500) DEFAULT NULL COMMENT '浏览器信息',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `loginip` varchar(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `logincountry` varchar(2) DEFAULT NULL COMMENT '登陆国家',
  `loginsta` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '登录时状态 1=成功，0=失败',
  `cli_hash` varchar(32) NOT NULL COMMENT '用户登录名和ip的hash',
  PRIMARY KEY (`id`),
  KEY `logintime` (`logintime`),
  KEY `cli_hash` (`cli_hash`,`loginsta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户登陆记录表';

LOCK TABLES `order_admin_login` WRITE;
/*!40000 ALTER TABLE `order_admin_login` DISABLE KEYS */;

INSERT INTO `order_admin_login` (`id`, `pools`, `uid`, `username`, `session_id`, `agent`, `logintime`, `loginip`, `logincountry`, `loginsta`, `cli_hash`)
VALUES
	(12,'admin','1','admin','5fn2r05kjls7tqssqaqha78i1p','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573815629,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(13,'admin','2d204e70cbb18aaee963d37224cfb1a2','gangkui','84i7epahhp817o06lb603oo3pf','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573815864,'127.0.0.1',NULL,0,'6e6bc2ad41cbeba4dfb073e8e36b711c'),
	(14,'admin','2d204e70cbb18aaee963d37224cfb1a2','gangkui','jnm60t97q0t0vbsv56v15avt9s','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573815869,'127.0.0.1',NULL,0,'6e6bc2ad41cbeba4dfb073e8e36b711c'),
	(15,'admin','2d204e70cbb18aaee963d37224cfb1a2','gangkui','m2r4j2ojmegeaa2h1jqiepsh3f','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573815876,'127.0.0.1',NULL,1,'6e6bc2ad41cbeba4dfb073e8e36b711c'),
	(16,'admin','1','admin','he7q96cg002ngrpijchfl6cr29','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573815923,'127.0.0.1',NULL,0,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(17,'admin','1','admin','986r1g585feg547h6cc0en9mbi','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573815928,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(18,'admin','1','admin','ihsmg93pjbl4a26enoopu6m471','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573824198,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(19,'admin','1','admin','049u8hdl1t9con7futdgvommr6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573824270,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(20,'admin','1','admin','v3teh0mmgqecueab6c2qts9lom','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573824427,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(21,'admin','1','admin','jpjob3vntn8tpqhjdlnr26isu8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573825452,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(22,'admin','2d204e70cbb18aaee963d37224cfb1a2','gangkui','7eqfssp89tliovtdddbnor3hob','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1573825807,'127.0.0.1',NULL,1,'6e6bc2ad41cbeba4dfb073e8e36b711c');

/*!40000 ALTER TABLE `order_admin_login` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_admin_oplog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_admin_oplog`;

CREATE TABLE `order_admin_oplog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '项id',
  `pools` varchar(20) DEFAULT 'admin' COMMENT '应用池',
  `uid` char(32) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `session_id` char(26) DEFAULT NULL COMMENT 'SESSION ID',
  `msg` varchar(250) NOT NULL COMMENT '消息内容',
  `do_time` int(10) unsigned NOT NULL COMMENT '发生时间',
  `do_ip` varchar(15) NOT NULL COMMENT '客户端IP',
  `do_country` char(2) NOT NULL DEFAULT '' COMMENT '国家',
  `do_url` varchar(100) NOT NULL COMMENT '操作网址',
  PRIMARY KEY (`id`),
  KEY `user_name` (`username`),
  KEY `do_time` (`do_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户操作日志';

LOCK TABLES `order_admin_oplog` WRITE;
/*!40000 ALTER TABLE `order_admin_oplog` DISABLE KEYS */;

INSERT INTO `order_admin_oplog` (`id`, `pools`, `uid`, `username`, `session_id`, `msg`, `do_time`, `do_ip`, `do_country`, `do_url`)
VALUES
	(1,'admin','1','admin','5fn2r05kjls7tqssqaqha78i1p','用户修改 2d204e70cbb18aaee963d37224cfb1a2',1573815762,'127.0.0.1','-','?ct=admin&ac=edit&id=2d204e70cbb18aaee963d37224cfb1a2'),
	(2,'admin','1','admin','jpjob3vntn8tpqhjdlnr26isu8','用户组修改 d9cc308d79c1e18880f02455843b3cd6',1573825492,'127.0.0.1','-','?ct=admin_group&ac=edit&id=d9cc308d79c1e18880f02455843b3cd6'),
	(3,'admin','1','admin','jpjob3vntn8tpqhjdlnr26isu8','用户组修改 b40f3d22ade1277df1afb71698d7f4ea',1573825525,'127.0.0.1','-','?ct=admin_group&ac=edit&id=b40f3d22ade1277df1afb71698d7f4ea');

/*!40000 ALTER TABLE `order_admin_oplog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_admin_parent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_admin_parent`;

CREATE TABLE `order_admin_parent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(32) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_admin_purview
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_admin_purview`;

CREATE TABLE `order_admin_purview` (
  `pools` varchar(20) DEFAULT 'admin',
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '管理员ID',
  `purviews` text NOT NULL COMMENT '配置字符',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限表';

LOCK TABLES `order_admin_purview` WRITE;
/*!40000 ALTER TABLE `order_admin_purview` DISABLE KEYS */;

INSERT INTO `order_admin_purview` (`pools`, `uid`, `purviews`)
VALUES
	('admin','eea83e86ad5c708bcd7b059ae6811184','content-index,category-del,member-index,member-add');

/*!40000 ALTER TABLE `order_admin_purview` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_admin_staff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_admin_staff`;

CREATE TABLE `order_admin_staff` (
  `uid` char(32) NOT NULL DEFAULT '',
  `passport_num` varchar(100) DEFAULT '' COMMENT '护照号码',
  `passport_type` varchar(100) DEFAULT 'P' COMMENT '护照类型',
  `name` varchar(100) DEFAULT NULL COMMENT '护照所属人姓名',
  `passport_country_code` varchar(100) DEFAULT NULL COMMENT '护照国家代码',
  `passport_due` int(11) unsigned DEFAULT '0' COMMENT '护照到期日期',
  `visa_time` int(11) unsigned DEFAULT '0' COMMENT '签证日期',
  `visa_due` int(11) unsigned DEFAULT '0' COMMENT '签证到期日期',
  `visa_type` tinyint(1) unsigned DEFAULT '0' COMMENT '1商务签，2旅游签',
  `sex` tinyint(1) unsigned DEFAULT '0' COMMENT '1男，2女，3未知',
  `nationality` varchar(300) DEFAULT NULL COMMENT '国籍',
  `bron` int(11) DEFAULT '0' COMMENT '出生日期',
  `company_mobile` varchar(30) DEFAULT NULL COMMENT '公司电话',
  `self_mobile` varchar(30) DEFAULT NULL COMMENT '私人电话',
  `telegram` varchar(100) DEFAULT NULL COMMENT 'telegram号码',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `order_admin_staff` WRITE;
/*!40000 ALTER TABLE `order_admin_staff` DISABLE KEYS */;

INSERT INTO `order_admin_staff` (`uid`, `passport_num`, `passport_type`, `name`, `passport_country_code`, `passport_due`, `visa_time`, `visa_due`, `visa_type`, `sex`, `nationality`, `bron`, `company_mobile`, `self_mobile`, `telegram`, `remark`)
VALUES
	('005d158f31efef188897e4ece451f4cd','asdfasdfasdfasdf','P','asdfa',NULL,0,0,0,1,0,'中国',0,'d123123123','','',''),
	('1','不知道','P','不知道',NULL,0,0,0,1,0,'中国',0,'','','',''),
	('2d204e70cbb18aaee963d37224cfb1a2','E69455204','P','王刚',NULL,1771693200,1546275600,1548090000,1,1,'中国',600282000,'345345345345','3534534534534','请问请问请问','测试数据'),
	('bbd1c2afab02b82639a652ec8f4daea0','509544711','P','509544711',NULL,0,0,0,1,2,'中国',0,'','','509544711','');

/*!40000 ALTER TABLE `order_admin_staff` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_ask_leave
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_ask_leave`;

CREATE TABLE `order_ask_leave` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text COMMENT '请假说明',
  `type` smallint(2) unsigned NOT NULL DEFAULT '1' COMMENT '1事假2病假3其他',
  `start_time` int(10) unsigned NOT NULL COMMENT '请假开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '请假截止时间',
  `image` varchar(1000) DEFAULT NULL COMMENT '图片凭证',
  `remark` text COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1批准这次请假，2不批准这次请假',
  `create_user` char(32) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL,
  `update_user` char(32) DEFAULT '0',
  `update_time` int(11) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='请假表';

LOCK TABLES `order_ask_leave` WRITE;
/*!40000 ALTER TABLE `order_ask_leave` DISABLE KEYS */;

INSERT INTO `order_ask_leave` (`id`, `text`, `type`, `start_time`, `end_time`, `image`, `remark`, `status`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,NULL,1,1548262800,1549386000,'[\"025/b517597b6ae647a82917d1cb8915483b.jpg\"]','到发 vremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremarkremark',1,'1',1548325020,'0',0,'0',0);

/*!40000 ALTER TABLE `order_ask_leave` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_category`;

CREATE TABLE `order_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类表',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `create_user` int(11) DEFAULT NULL COMMENT '创建用户',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改用户',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

LOCK TABLES `order_category` WRITE;
/*!40000 ALTER TABLE `order_category` DISABLE KEYS */;

INSERT INTO `order_category` (`id`, `name`, `sort`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'视频',2,1,1511258578,1,1516347122),
	(2,'音乐',3,1,1511258584,NULL,NULL),
	(3,'小说',4,1,1511258589,1,1535016662),
	(8,'testgggg',100,1,1541405965,NULL,NULL);

/*!40000 ALTER TABLE `order_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_comment`;

CREATE TABLE `order_comment` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级评论ID',
  `at_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '@用户ID',
  `object_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '评论对象ID，比如项目ID、日报ID',
  `object_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '评论对象类型，1=项目，2=日报',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型，1=动态，2=全部留言，3=个人留言',
  `comment` varchar(3000) DEFAULT NULL COMMENT '评论內容',
  `link` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是创建项目时的默认留言，1是 0否',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间戳',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间戳',
  `delete_user` char(32) NOT NULL DEFAULT '0',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间戳',
  PRIMARY KEY (`id`),
  KEY `index_delete_time` (`delete_time`) USING BTREE,
  KEY `index_object_id_type_pid` (`object_id`,`object_type`,`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='評論內容表';

LOCK TABLES `order_comment` WRITE;
/*!40000 ALTER TABLE `order_comment` DISABLE KEYS */;

INSERT INTO `order_comment` (`id`, `pid`, `at_id`, `object_id`, `object_type`, `type`, `comment`, `link`, `is_default`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,0,X'30',1,1,3,NULL,'',1,'1',1538023345,'0',0,'0',0),
	(2,0,X'30',1,1,1,'发布新项目：測試項目','?ct=projects&ac=mysponsor&type=create',0,'1',1538023345,'0',0,'0',0),
	(3,0,X'30',2,1,3,'创建项目时的留言','',1,'1',1538024186,'0',0,'0',0),
	(4,0,X'30',2,1,1,'发布新项目：测试项目001','?ct=projects&ac=participate&type=join',0,'1',1538024187,'0',0,'0',0),
	(5,0,X'30',2,1,1,'添加了参与者：admin','',0,'1',1538024309,'0',0,'0',0),
	(6,0,X'30',2,1,1,'删除了参与者：admin  ','',0,'1',1538024313,'0',0,'0',0),
	(7,0,X'30',3,1,3,'水淀粉','',1,'1',1538031937,'0',0,'0',0),
	(8,0,X'30',3,1,1,'发布新项目：测试项目002','?ct=projects&ac=mysponsor&type=create',0,'1',1538031938,'0',0,'0',0),
	(9,0,X'30',3,1,2,'test001进行全部留言','',0,'c8653fd1ff8cf7ba3bd2a58804185b68',1538033096,'0',0,'0',0),
	(10,9,X'6338363533666431666638636637626133626432613538383034313835623638',3,1,2,'答复','',0,'c8653fd1ff8cf7ba3bd2a58804185b68',1538033101,'0',0,'0',1538033105),
	(11,9,X'6338363533666431666638636637626133626432613538383034313835623638',3,1,2,'水淀粉','',0,'c8653fd1ff8cf7ba3bd2a58804185b68',1538033110,'0',0,'0',1538033126),
	(12,9,X'6338363533666431666638636637626133626432613538383034313835623638',3,1,2,'水淀粉答复','',0,'1',1538033119,'0',0,'0',0),
	(13,0,X'30',3,1,3,'水淀粉','',0,'1',1538033133,'0',0,'0',0),
	(14,0,X'30',4,1,3,NULL,'',1,'1',1538035408,'0',0,'0',0),
	(15,0,X'30',4,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1538035408,'0',0,'0',0),
	(16,0,X'30',5,1,3,NULL,'',1,'1',1538035428,'0',0,'0',0),
	(17,0,X'30',5,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1538035428,'0',0,'0',0),
	(18,0,X'30',6,1,3,NULL,'',1,'1',1538035613,'0',0,'0',0),
	(19,0,X'30',6,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1538035613,'0',0,'0',0),
	(20,0,X'30',6,1,1,'创建了添加子項目','',0,'1',1538035731,'0',0,'0',0),
	(21,0,X'30',7,1,1,'发布了添加子項目','',0,'1',1538035731,'0',0,'0',0),
	(22,0,X'30',8,1,3,'的','',1,'1',1538035751,'0',0,'0',0),
	(23,0,X'30',8,1,1,'发布新项目：测试项目003','?ct=projects&ac=mysponsor&type=create',0,'1',1538035751,'0',0,'0',0),
	(24,0,X'30',9,1,3,NULL,'',1,'1',1538035810,'0',0,'0',0),
	(25,0,X'30',9,1,1,'发布新项目：dvffdvd','?ct=projects&ac=index&type=execute',0,'1',1538035811,'0',0,'0',0),
	(26,0,X'30',10,1,3,NULL,'',1,'1',1538035834,'0',0,'0',0),
	(27,0,X'30',10,1,1,'发布新项目：手动方式分','?ct=projects&ac=mysponsor&type=create',0,'1',1538035834,'0',0,'0',0),
	(28,0,X'30',8,1,1,'创建了子項目','',0,'1',1538035973,'0',0,'0',0),
	(29,0,X'30',11,1,3,'','',1,'1',1538035973,'0',0,'0',0),
	(30,0,X'30',11,1,1,'发布了子項目','',0,'1',1538035973,'0',0,'0',0),
	(31,0,X'30',12,1,1,'发布新项目：测试项目005','?ct=projects&ac=mysponsor&type=create',0,'1',1538036308,'0',0,'0',0),
	(32,0,X'30',12,1,1,'添加了参与者：admin','',0,'1',1538036964,'0',0,'0',0),
	(33,0,X'30',12,1,1,'修改项目描述：答复jvdidjiodsjvo','',0,'1',1538037010,'0',0,'0',0),
	(34,0,X'30',12,1,1,'添加了参与者：azhang2','',0,'1',1538037033,'0',0,'0',0),
	(35,0,X'30',12,1,1,'修改项目名称：测试项目005rtt3tet','',0,'1',1538037078,'0',0,'0',0),
	(36,0,X'30',12,1,1,'修改留言内容为：grtgrg','',0,'1',1538037078,'0',0,'0',0),
	(37,0,X'30',12,1,1,'修改相关人员留言权限','',0,'1',1538037078,'0',0,'0',0),
	(38,0,X'30',12,1,3,'grtgrg','',1,'1',1538037078,'0',0,'0',0),
	(39,0,X'30',12,1,3,'grtgrg','',1,'1',1538037078,'0',0,'0',0),
	(40,0,X'30',12,1,3,'grtgrg','',1,'1',1538037078,'0',0,'0',0),
	(41,0,X'30',12,1,2,'vdsjsiojdjvsvvs','',0,'1',1538037352,'0',0,'0',0),
	(42,38,X'31',12,1,3,'vsfvdfvdfvdfv','',0,'1',1538037362,'0',0,'0',0),
	(43,0,X'30',105,1,1,'添加了参与者:admin,test0227','',0,'0a62896fbbdd767a7e57d103f4623eca',1538037596,'0',0,'0',0),
	(44,0,X'30',13,1,1,'发布新项目：測試項目22222','?ct=projects&ac=index&type=execute',0,'1',1538037680,'0',0,'0',0),
	(45,0,X'30',14,1,1,'发布新项目：vfdvvdfv','?ct=projects&ac=index&type=execute',0,'b3ac4d6fa016464979190d4dd1ff80b8',1538037714,'0',0,'0',0),
	(46,0,X'30',13,1,2,'vfdvdvevffevf','',0,'b3ac4d6fa016464979190d4dd1ff80b8',1538037730,'0',0,'0',1538037789),
	(47,0,X'30',13,1,2,'njdsojiosjoicdjvfijvdjivjidfvf','',0,'b3ac4d6fa016464979190d4dd1ff80b8',1538037823,'0',0,'0',0),
	(48,47,X'6233616334643666613031363436343937393139306434646431666638306238',13,1,2,'vvdvdvdf','',0,'b3ac4d6fa016464979190d4dd1ff80b8',1538037835,'0',0,'0',0),
	(49,0,X'30',15,1,1,'发布新项目：測試項目dvvfvf','?ct=projects&ac=index&type=execute',0,'1',1538037976,'0',0,'0',0),
	(50,0,X'30',16,1,1,'发布新项目：測試項目3333','?ct=projects&ac=index&type=execute',0,'1',1538038031,'0',0,'0',0),
	(51,0,X'30',17,1,1,'发布新项目：测试_Chris_20180927','?ct=projects&ac=mysponsor&type=create',0,'0a62896fbbdd767a7e57d103f4623eca',1538040286,'0',0,'0',0),
	(52,0,X'30',18,1,1,'发布新项目：测试_Chris_20180927-1','?ct=projects&ac=mysponsor&type=create',0,'0a62896fbbdd767a7e57d103f4623eca',1538041000,'0',0,'0',0),
	(53,0,X'30',19,1,1,'发布新项目：测试_Chris_20180927-1','?ct=projects&ac=mysponsor&type=create',0,'0a62896fbbdd767a7e57d103f4623eca',1538042014,'0',0,'0',0),
	(54,0,X'30',17,1,1,'修改项目类型','',0,'0a62896fbbdd767a7e57d103f4623eca',1538042045,'0',0,'0',0),
	(55,0,X'30',17,1,1,'修改相关公司','',0,'0a62896fbbdd767a7e57d103f4623eca',1538043310,'0',0,'0',0),
	(56,0,X'30',17,1,1,'修改相关公司','',0,'0a62896fbbdd767a7e57d103f4623eca',1538044322,'0',0,'0',0),
	(57,0,X'30',17,1,1,'修改相关公司','',0,'0a62896fbbdd767a7e57d103f4623eca',1538044340,'0',0,'0',0),
	(58,0,X'30',17,1,1,'删除了相关人员：chris  ','',0,'0a62896fbbdd767a7e57d103f4623eca',1538044724,'0',0,'0',0),
	(59,0,X'30',17,1,1,'删除了相关人员：admin  ，添加了相关人员：azhang2','',0,'0a62896fbbdd767a7e57d103f4623eca',1538044733,'0',0,'0',0),
	(60,0,X'30',16,1,1,'删除了相关人员：admin  ，添加了相关人员：test0227','',0,'1',1538044911,'0',0,'0',0),
	(61,0,X'30',17,1,1,'删除了相关公司：,  ，添加了相关公司：admin','',0,'0a62896fbbdd767a7e57d103f4623eca',1538107913,'0',0,'0',0),
	(62,0,X'30',17,1,1,'删除了相关公司：admin,admin  ','',0,'0a62896fbbdd767a7e57d103f4623eca',1538109262,'0',0,'0',0),
	(63,0,X'30',17,1,1,'删除了相关公司：测试公司002,测试公司002  ，添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538109367,'0',0,'0',0),
	(64,0,X'30',17,1,1,'删除了相关公司：测试公司001,测试公司001  ，添加了相关公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538109433,'0',0,'0',0),
	(65,0,X'30',17,1,1,NULL,'',0,'0a62896fbbdd767a7e57d103f4623eca',1538109807,'0',0,'0',0),
	(66,0,X'30',17,1,1,NULL,'',0,'0a62896fbbdd767a7e57d103f4623eca',1538109838,'0',0,'0',0),
	(67,0,X'30',17,1,1,'删除了相关公司：测试公司002  ，添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538110370,'0',0,'0',0),
	(68,0,X'30',17,1,1,'删除了相关公司：测试公司001  ，添加了相关公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538110540,'0',0,'0',0),
	(69,0,X'30',17,1,1,'添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120317,'0',0,'0',0),
	(70,0,X'30',17,1,1,'添加了相关公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120328,'0',0,'0',0),
	(71,0,X'30',17,1,1,'添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120393,'0',0,'0',0),
	(72,0,X'30',17,1,1,'删除了相关公司：测试公司001  ','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120400,'0',0,'0',0),
	(73,0,X'30',17,1,1,'删除了相关公司：测试公司002  ，添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120452,'0',0,'0',0),
	(74,0,X'30',16,1,1,'删除了相关公司：测试公司002  ','',0,'1',1538189945,'0',0,'0',0),
	(75,0,X'30',16,1,1,'添加了相关公司：测试公司002,请问请问请问请问123','',0,'1',1538189956,'0',0,'0',0),
	(76,0,X'30',16,1,1,'删除了相关公司：请问请问请问请问123  ，添加了相关公司：请问请问请问请问','',0,'1',1538189971,'0',0,'0',0),
	(77,0,X'30',16,1,1,'删除了相关公司：测试公司001,测试公司002  ，添加了相关公司：请问请问请问请问123','',0,'1',1538189981,'0',0,'0',0),
	(78,0,X'30',16,1,1,'修改项目类型','',0,'1',1538190003,'0',0,'0',0),
	(79,0,X'30',16,1,1,'添加了相关人员：azhang2','',0,'1',1538190025,'0',0,'0',0),
	(80,0,X'30',16,1,1,'修改项目名称：測試項目3333111','',0,'1',1538190065,'0',0,'0',0),
	(81,0,X'30',16,1,1,'修改项目描述：dsvfv2','',0,'1',1538190079,'0',0,'0',0),
	(82,0,X'30',16,1,1,'修改项目名称：測試項目333311122','',0,'1',1538190079,'0',0,'0',0),
	(83,0,X'30',16,1,1,'修改留言内容为：2','',0,'1',1538190079,'0',0,'0',0),
	(84,0,X'30',16,1,1,'修改项目类型','',0,'1',1538190079,'0',0,'0',0),
	(85,0,X'30',16,1,3,'2','',1,'1',1538190079,'0',0,'0',0),
	(86,0,X'30',16,1,1,'修改相关公司','',0,'1',1538190097,'0',0,'0',0),
	(87,0,X'30',16,1,1,'修改项目类型','',0,'1',1538190132,'0',0,'0',0),
	(88,0,X'30',16,1,1,'修改相关公司','',0,'1',1538190147,'0',0,'0',0),
	(89,0,X'30',19,1,1,'删除公司：Array, 测试公司002; 新增公司：Array, 测试公司002, 请问请问请问请问, 测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538206864,'0',0,'0',0),
	(90,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538206945,'0',0,'0',0),
	(91,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207005,'0',0,'0',0),
	(92,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207005,'0',0,'0',0),
	(93,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207062,'0',0,'0',0),
	(94,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207063,'0',0,'0',0),
	(95,0,X'30',19,1,1,'删除公司：Array, Array; 新增公司：Array, Array','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207133,'0',0,'0',0),
	(96,0,X'30',19,1,1,'删除公司：测试公司001; 新增公司：测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207153,'0',0,'0',0),
	(97,0,X'30',19,1,1,'删除公司：测试公司001; 新增公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207173,'0',0,'0',0),
	(98,0,X'30',19,1,1,'删除公司：测试公司001; 新增公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207186,'0',0,'0',0),
	(99,0,X'30',19,1,1,'删除公司：请问请问请问请问, 测试公司001; 新增公司：测试公司002, 请问请问请问请问123','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207330,'0',0,'0',0),
	(100,0,X'30',19,1,1,'删除相关人员：azhang, azhang3; 新增相关人员：admin, test0227','',0,'0a62896fbbdd767a7e57d103f4623eca',1538208028,'0',0,'0',0),
	(101,0,X'30',16,1,1,'删除相关人员：azhang2; 新增相关人员：azhang1','',0,'1',1538208247,'0',0,'0',0),
	(102,0,X'30',16,1,1,'删除公司：请问请问请问请问123; 新增公司：najkdjflkajslkdjflkajskldjlfkas','',0,'1',1538208257,'0',0,'0',0),
	(103,0,X'30',16,1,1,'新增相关人员：azhang, chris','',0,'1',1538208269,'0',0,'0',0),
	(104,0,X'30',16,1,1,'删除了相关人员：azhang1,azhang  ','',0,'1',1538208282,'0',0,'0',0),
	(105,0,X'30',16,1,1,'删除了相关公司：najkdjflkajslkdjflkajskldjlfkas  ，添加了相关公司：请问请问请问请问123','',0,'1',1538208291,'0',0,'0',0),
	(106,0,X'30',19,1,1,'新增相关人员：克里斯的biubiubiu','',0,'0a62896fbbdd767a7e57d103f4623eca',1538208505,'0',0,'0',0),
	(107,0,X'30',16,1,1,'修改项目描述：dsvfv2333','',0,'1',1538208715,'0',0,'0',0),
	(108,0,X'30',16,1,1,'修改项目名称：測試項目33331112233','',0,'1',1538208715,'0',0,'0',0),
	(109,0,X'30',16,1,1,'修改留言内容为：2333','',0,'1',1538208715,'0',0,'0',0),
	(110,0,X'30',16,1,1,'修改项目类型','',0,'1',1538208715,'0',0,'0',0),
	(111,0,X'30',16,1,1,'删除公司：请问请问请问请问, 请问请问请问请问123; 新增公司：najkdjflkajslkdjflkajskldjlfkas','',0,'1',1538208715,'0',0,'0',0),
	(112,0,X'30',16,1,1,'删除相关人员：克里斯的biubiubiu; 新增相关人员：azhang','',0,'1',1538208715,'0',0,'0',0),
	(113,0,X'30',16,1,3,'2333','',1,'1',1538208715,'0',0,'0',0),
	(114,0,X'30',16,1,1,'修改留言内容为：2333实时','',0,'1',1538208724,'0',0,'0',0),
	(115,0,X'30',16,1,1,'修改项目类型','',0,'1',1538208724,'0',0,'0',0),
	(116,0,X'30',16,1,1,'修改项目描述：dsvfv2333是的','',0,'1',1538208743,'0',0,'0',0),
	(117,0,X'30',16,1,1,'修改留言内容为：2333实时的','',0,'1',1538208743,'0',0,'0',0),
	(118,0,X'30',16,1,1,'修改项目类型','',0,'1',1538208743,'0',0,'0',0),
	(119,0,X'30',16,1,1,'删除公司：测试公司001, najkdjflkajslkdjflkajskldjlfkas; 新增公司：请问请问请问请问123','',0,'1',1538208743,'0',0,'0',0),
	(120,0,X'30',16,1,1,'删除相关人员：测试0227, azhang','',0,'1',1538208743,'0',0,'0',0),
	(121,0,X'30',16,1,3,'2333实时的','',1,'1',1538208743,'0',0,'0',0),
	(122,0,X'30',16,1,1,'添加了相关人员：azhang2,test0227','',0,'1',1538208762,'0',0,'0',0),
	(123,0,X'30',16,1,1,'添加了相关公司：测试公司001','',0,'1',1538208771,'0',0,'0',0),
	(124,0,X'30',16,1,1,'修改项目名称：測試項目','',0,'1',1538208847,'0',0,'0',0),
	(125,0,X'30',16,1,1,'修改项目名称：測試項目001','',0,'1',1538208857,'0',0,'0',0),
	(126,0,X'30',16,1,1,'新增相关人员：azhang','',0,'1',1538208867,'0',0,'0',0),
	(127,0,X'30',16,1,1,'删除相关人员：azhang','',0,'1',1538208873,'0',0,'0',0),
	(128,0,X'30',16,1,1,'删除相关人员：azhang2; 新增相关人员：克里斯的biubiubiu','',0,'1',1538208882,'0',0,'0',0),
	(129,0,X'30',16,1,1,'新增公司：请问请问请问请问','',0,'1',1538208889,'0',0,'0',0),
	(130,0,X'30',16,1,1,'删除公司：请问请问请问请问123','',0,'1',1538208909,'0',0,'0',0),
	(131,0,X'30',16,1,1,'删除公司：测试公司002; 新增公司：请问请问请问请问123','',0,'1',1538208917,'0',0,'0',0),
	(132,0,X'30',16,1,1,'修改项目类型','',0,'1',1538208924,'0',0,'0',0),
	(133,0,X'30',16,1,1,'修改项目描述：dsvfv2333是的111','',0,'1',1538208931,'0',0,'0',0),
	(134,0,X'30',16,1,3,'2333实时的','',1,'1',1538208943,'0',0,'0',0),
	(135,0,X'30',16,1,1,'修改留言内容为：2333实时的1','',0,'1',1538208947,'0',0,'0',0),
	(136,0,X'30',16,1,1,'删除了相关公司：请问请问请问请问123  ','',0,'1',1538208974,'0',0,'0',0),
	(137,0,X'30',16,1,1,'添加了相关公司：测试公司002','',0,'1',1538208981,'0',0,'0',0),
	(138,0,X'30',16,1,1,'添加相关公司：请问请问请问请问123','',0,'1',1538209264,'0',0,'0',0),
	(139,0,X'30',16,1,1,'删除相关公司：请问请问请问请问123','',0,'1',1538209273,'0',0,'0',0),
	(140,0,X'30',16,1,1,'修改任务详情：dsvfv2333是的111555','',0,'1',1538209285,'0',0,'0',0),
	(141,0,X'30',16,1,1,'修改项目类型','',0,'1',1538209285,'0',0,'0',0),
	(142,0,X'30',16,1,1,'删除相关人员：克里斯的biubiubiu','',0,'1',1538209285,'0',0,'0',0),
	(143,0,X'30',16,1,1,'修改任务详情：dsvfv2333是的111555222','',0,'1',1538209329,'0',0,'0',0),
	(144,0,X'30',16,1,1,'修改项目名称：測試項目001222','',0,'1',1538209329,'0',0,'0',0),
	(145,0,X'30',16,1,1,'修改留言内容为：2333实时的122','',0,'1',1538209329,'0',0,'0',0),
	(146,0,X'30',16,1,1,'修改项目类型','',0,'1',1538209329,'0',0,'0',0),
	(147,0,X'30',16,1,1,'添加相关公司：请问请问请问请问123','',0,'1',1538209329,'0',0,'0',0),
	(148,0,X'30',16,1,1,'添加相关人员：azhang2','',0,'1',1538209329,'0',0,'0',0),
	(149,0,X'30',16,1,3,'2333实时的122','',1,'1',1538209329,'0',0,'0',0),
	(150,0,X'30',20,1,3,'33','',1,'1',1538209351,'0',0,'0',0),
	(151,0,X'30',20,1,1,'发布新项目：測試項目001333','?ct=projects&ac=mysponsor&type=create',0,'1',1538209351,'0',0,'0',0),
	(152,0,X'30',20,1,1,'添加了相关人员：chris','',0,'1',1538209582,'0',0,'0',0),
	(153,0,X'30',20,1,1,'添加了相关人员：test0227','',0,'1',1538209589,'0',0,'0',0),
	(154,0,X'30',20,1,1,'添加了相关人员：kenji','',0,'1',1538209601,'0',0,'0',0),
	(155,0,X'30',20,1,1,'添加了相关人员：文远测试账号','',0,'1',1538209608,'0',0,'0',0),
	(156,0,X'30',20,1,1,'删除了相关人员：chris,test0227  ','',0,'1',1538209619,'0',0,'0',0),
	(157,0,X'30',20,1,1,'添加相关公司：请问请问请问请问','',0,'1',1538209630,'0',0,'0',0),
	(158,0,X'30',20,1,1,'删除相关公司：测试公司002  ','',0,'1',1538209636,'0',0,'0',0),
	(159,0,X'30',21,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1539848269,'0',0,'0',0),
	(160,0,X'30',22,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1539848475,'0',0,'0',0),
	(161,0,X'30',23,1,1,'发布新项目：testtest001','?ct=projects&ac=index&type=execute',0,'1',1539854395,'0',0,'0',0),
	(162,0,X'30',24,1,1,'发布新项目：111111','?ct=projects&ac=index&type=execute',0,'1',1539922918,'0',0,'0',0),
	(163,0,X'30',25,1,1,'发布新项目：寄一个证件','?ct=projects&ac=mysponsor&type=create',0,'1',1540367545,'0',0,'0',0),
	(164,0,X'30',26,1,1,'发布新项目：再寄一个证件','?ct=projects&ac=mysponsor&type=create',0,'1',1540367768,'0',0,'0',0),
	(165,0,X'30',25,1,2,'资料已经准备好','',0,'1',1540368807,'0',0,'0',0),
	(166,0,X'30',25,1,3,'资料新增身份证','',0,'1',1540368836,'0',0,'0',0),
	(167,165,X'31',25,1,2,'资料看缺不缺驾驶证','',0,'1',1540368853,'0',0,'0',0),
	(168,0,X'30',25,1,1,'创建了重新寄户口本','',0,'1',1540369042,'0',0,'0',0),
	(169,0,X'30',27,1,1,'发布了重新寄户口本','',0,'1',1540369042,'0',0,'0',0),
	(170,0,X'30',25,1,1,'创建了重新寄个身份证','',0,'1',1540369215,'0',0,'0',0),
	(171,0,X'30',28,1,1,'发布了重新寄个身份证','',0,'1',1540369215,'0',0,'0',0),
	(172,0,X'30',26,1,2,'測試留言','',0,'1',1540376772,'0',0,'0',0),
	(173,0,X'30',28,1,2,'接口和客家话客家话','',0,'1',1540377137,'0',0,'0',0),
	(174,0,X'30',28,1,3,'回家赶紧换个环境','',0,'1',1540377147,'0',0,'0',0),
	(175,0,X'30',1,1,3,'玩儿 vv','',0,'1',1540378133,'0',0,'0',0),
	(176,0,X'30',1,1,3,'而为而为我','',0,'1',1540378143,'0',0,'0',0),
	(177,0,X'30',26,1,2,'再次留言','',0,'1',1540435184,'0',0,'0',0),
	(178,177,X'31',26,1,2,'这样处理不好。建议怎样怎样','',0,'1',1540435206,'0',0,'0',0),
	(179,0,X'30',29,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1540435979,'0',0,'0',0),
	(180,0,X'30',30,1,1,'发布新项目：test888','?ct=projects&ac=index&type=execute',0,'1',1540784878,'0',0,'0',0),
	(181,0,X'30',30,1,3,'1111111111111111111111111111111111111111','',0,'1',1540787173,'0',0,'0',0),
	(182,181,X'31',30,1,3,'asdlfjasldfj alsdkjf lasjdf laskjdflaksdjf alsdkjf laskdjf lakjsdf','',0,'1',1540787187,'0',0,'0',0),
	(183,0,X'30',30,1,2,'test','',0,'1',1540796836,'0',0,'0',1541648227),
	(184,0,X'30',31,1,1,'发布新项目：測試項目','?ct=projects&ac=mysponsor&type=create',0,'1',1542768746,'0',0,'0',0);

/*!40000 ALTER TABLE `order_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_config`;

CREATE TABLE `order_config` (
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `value` text COMMENT '变量值',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '说明标题',
  `info` varchar(200) DEFAULT NULL COMMENT '备注',
  `group` varchar(100) NOT NULL DEFAULT '0' COMMENT '分组',
  `type` varchar(10) NOT NULL DEFAULT 'string' COMMENT '变量类型',
  PRIMARY KEY (`name`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置变量表';

LOCK TABLES `order_config` WRITE;
/*!40000 ALTER TABLE `order_config` DISABLE KEYS */;

INSERT INTO `order_config` (`sort`, `name`, `value`, `title`, `info`, `group`, `type`)
VALUES
	(4,'attachment_image','jpg|png|gif|bmp|ico','图片文件类型','','2','string'),
	(5,'attachment_media','mp3|avi|mpg|mp4|3gp|flv|rm|rmvb|wmv|swf','多媒体文件类型','','2','string'),
	(7,'attachment_size','16','最大附件大小(Mb)','','2','number'),
	(6,'attachment_soft','zip|7z|rar|gz|bz2|tar|iso|exe|dll|doc|xls|ppt|docx|xlsx|pptx|wps|pdf|psd','其它文件件类型','','2','string'),
	(6,'authorized_time','10','登录授权时间','用户登录多长时间会被踢出','1','number'),
	(0,'bron_due_remind','{\"status\":\"on\",\"day\":\"30\",\"chat_id\":\"508945721\",\"times\":\"3\"}','',NULL,'0','string'),
	(999,'confirm_order_status','{\"time\":1546918051,\"status\":\"start\"}','','','0','string'),
	(0,'CucumberVillage_bot','\"706794080:AAGCoOAy3AUnx3jI_b3HsmUHVkkB2IsQ7kk\"','',NULL,'0','string'),
	(2,'doc_auto_des','1','自动提取摘要','','3','bool'),
	(6,'doc_auto_des_len','150','自动摘要长度','','3','number'),
	(1,'doc_auto_keywords','1','自动获取关键字','','3','bool'),
	(3,'doc_auto_thumb','0','自动提取缩略图','','3','bool'),
	(7,'doc_down_remove','0','抓取远程资源','','3','bool'),
	(5,'doc_thumb_h','200','缩略图默认高度','','3','number'),
	(4,'doc_thumb_w','200','缩略图默认宽度','','3','number'),
	(0,'ip_limit','','后台登录IP限制','','0','string'),
	(1,'open_upload','1','是否允许上传文件','','2','bool'),
	(0,'passport_due_remind_confirm','{\"status\":\"on\",\"day\":\"30\",\"chat_id\":\"508945721\",\"times\":\"1\"}','',NULL,'0','string'),
	(4,'site_description','PHPCALL开发框架','当前站点摘要信息','','1','text'),
	(3,'site_keyword','PHPCALL开发框架','当前站点关键字','','1','string'),
	(1,'site_name','PHPCALL开发框架','当前站点名称','','1','string'),
	(5,'site_tj','','当前站点统计代码','','1','text'),
	(2,'site_upload_path','/uploads','附件上传目录','','2','string'),
	(3,'site_upload_url','http://uploads.phpcall.org','附件目录网址','如果不使用二级域名，此项留空','2','string'),
	(2,'site_url','http://www.phpcall.org','当前站点URL','','1','string'),
	(0,'today_select_shop_id','\"2\"','',NULL,'1','string'),
	(7,'user_guide_url',NULL,'用户向导URL','','1','string');

/*!40000 ALTER TABLE `order_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_content`;

CREATE TABLE `order_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容表',
  `catid` smallint(5) DEFAULT NULL COMMENT '分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `image` char(17) DEFAULT NULL COMMENT '图片',
  `image2` char(17) DEFAULT NULL COMMENT '图片二',
  `images` varchar(200) DEFAULT NULL COMMENT '多图',
  `images2` varchar(200) DEFAULT NULL COMMENT '多图二',
  `content` text COMMENT '内容',
  `create_user` char(32) DEFAULT '0',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容表';



# Dump of table order_crond
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_crond`;

CREATE TABLE `order_crond` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sort` smallint(5) NOT NULL COMMENT '排序',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名',
  `filename` varchar(248) NOT NULL DEFAULT '',
  `runtime_format` varchar(20) NOT NULL,
  `lasttime` int(10) unsigned NOT NULL DEFAULT '0',
  `runtime` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `uptime` int(10) DEFAULT NULL,
  `addtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='计划任务表';



# Dump of table order_currency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_currency`;

CREATE TABLE `order_currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1启用 -1停用',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '名称',
  `en_name` varchar(30) NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '英文缩写',
  `symbol` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '货币符号',
  `exg_rate` decimal(10,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '汇率:1人民币兑换其它币种的汇率',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '修改时间',
  `create_time` int(11) unsigned DEFAULT '0' COMMENT '添加时间',
  `create_user` char(32) DEFAULT '0' COMMENT '添加管理员',
  `update_user` char(32) DEFAULT '0' COMMENT '修改管理员',
  `delete_user` char(32) DEFAULT '0',
  `delete_tim` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货币种类';

LOCK TABLES `order_currency` WRITE;
/*!40000 ALTER TABLE `order_currency` DISABLE KEYS */;

INSERT INTO `order_currency` (`id`, `status`, `name`, `en_name`, `code`, `symbol`, `exg_rate`, `update_time`, `create_time`, `create_user`, `update_user`, `delete_user`, `delete_tim`)
VALUES
	(1,1,X'E7BE8EE58583','United States Dollar',X'555344',X'24',1.000000,1522746492,1522470340,'1','0','0',0),
	(7,1,X'E4BABAE6B091E5B881','Chinese Yuan',X'434E59',X'C2A5',6.878800,1522470358,1522470306,'1','0','0',0),
	(9,1,X'E6B8AFE5B881','Hong Kong Dollar',X'484B44',X'484B24',7.836150,1534302966,1534302966,'1','1','0',0),
	(10,-1,X'E88BB1E99591','uk',X'554B',X'756B',1.300000,NULL,NULL,'1','0','0',0),
	(192,1,X'E697A5E58583','Japanese Yen',X'4A5059',X'4AEFBFA5',109.419000,1534302833,1534302833,'1','1','0',0),
	(194,1,X'E58AA0E68BBFE5A4A7E58583E5B881','Canadian Dollar',X'434144',X'43616E24',1.364825,1534343789,1534343789,'1','1','0',0),
	(195,1,X'E7919EE5B094','Cambodian Riel',X'4B4852',X'E19F9B',4016.776734,1534416010,1534416010,'1','1','0',0),
	(197,-1,X'E696B0E58AA0E59DA1E58583','Singapore Dollar',X'534744',NULL,1.365920,1538034511,1538034511,'1','1','0',0),
	(199,1,X'E99FA9E58583','South Korean Won',X'4B5257',X'E282A9',1120.325000,1542269332,1542269332,'1','1','0',0);

/*!40000 ALTER TABLE `order_currency` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_diplomatic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_diplomatic`;

CREATE TABLE `order_diplomatic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` bigint(11) unsigned DEFAULT NULL COMMENT '外交时间',
  `recipient` blob COMMENT '接收人',
  `recipient_potato` blob COMMENT '接收人POTATO号码',
  `corporate_name` blob COMMENT '公司名称',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `project_team` blob COMMENT '项目组',
  `remark` blob COMMENT '备注',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL,
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_diplomatic` WRITE;
/*!40000 ALTER TABLE `order_diplomatic` DISABLE KEYS */;

INSERT INTO `order_diplomatic` (`id`, `time`, `recipient`, `recipient_potato`, `corporate_name`, `customer_id`, `project_team`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,1537977600,X'A91D9C843C362BD82CC726F15888238BDE2F9B603E1C37FC1289902873073805',X'A91D9C843C362BD82CC726F15888238B16F29FD2202DE3DDAA6682EF4C8E7ECA',X'C47E9F4B929A14E253D88235E7A3A6B4',2,X'5FF313E2AC93BDBAF0DE5CB007151A0F',X'57594D6F1ECCDF12AF3F10D254669F5E','1',1538023088,'1',1538023419,'0',0),
	(2,1537977600,X'A91D9C843C362BD82CC726F15888238B2073C61374C4A3C3B92D31ED288E31ED',X'A91D9C843C362BD82CC726F15888238B92E8EAEEA379F92BD046A8DD9A9A9ECC',X'77B41A27CC3837BF56008FA592135B2D',1,X'3584949529FE03DF14B3257FDB148C13',X'38F2E8C93ADB73EDCFADAF9474AD86A7AE0EF4B8D3D5D62B8E6BC9FA0D8D5391','0',0,'1',1539932663,'0',0),
	(3,1539100800,X'F3F68ACD9A2111DA083580FC16CB332BCC525C27A3A96D27620925129EA882CF',X'199B94C64825F21AB9C3FF905163082C',X'8070CCD1B5462BCC22B18A5336DB6C3CC39D6734E2F8E6F9007CB28F9A3F1200',12,X'2FD5D60A6E947A3ED96F91F1326F6A4993A2877954136C80E8798551D20EC85F',X'0143DB63EE66B0CDFF9F69917680151E','1',1540365963,'1',1540365963,'0',0),
	(4,1540483200,X'A91D9C843C362BD82CC726F15888238B2073C61374C4A3C3B92D31ED288E31ED',X'A91D9C843C362BD82CC726F15888238B92E8EAEEA379F92BD046A8DD9A9A9ECC',X'553CF0C62EA70170C01509583B70E3C9',13,X'3584949529FE03DF14B3257FDB148C13',X'2767231A7DD5E41558F10D4E6C5F62385B903D361ED92C2ABAD81B1B626B2BB7E45840656869D0F07DC88FB22E25BCB75B34FC360F15376DCCFB25D4DB402764300073784E3CC0E35AE6272AA68CBB25','1',1540537695,'1',1540897260,'0',0),
	(5,1540396800,X'A91D9C843C362BD82CC726F15888238BE960E339971A2A5AA7DC2A3F97E755D1',X'873E73014A4697579FB2484777492F20',NULL,14,X'3584949529FE03DF14B3257FDB148C13',X'4B5706B105BF56596D1B9EAAA7D779D4','1',1540537880,'0',0,'0',0),
	(6,1540483200,X'A91D9C843C362BD82CC726F15888238B2073C61374C4A3C3B92D31ED288E31ED',X'873E73014A4697579FB2484777492F20',X'2A0980865548409A4F505704DCABCB21',16,X'3584949529FE03DF14B3257FDB148C13',X'0143DB63EE66B0CDFF9F69917680151E','1',1540538557,'1',1540538557,'1',1540539283),
	(7,1542729600,X'A91D9C843C362BD82CC726F15888238B2073C61374C4A3C3B92D31ED288E31ED',X'48BDBED294AE781A488C99922FA5E881',X'218F88CD88249C0800B492065474778A',15,X'4E9F22DDB90C40735B6A1ABB49AAB90A',X'0143DB63EE66B0CDFF9F69917680151E','1',1542768856,'1',1542768856,'0',0);

/*!40000 ALTER TABLE `order_diplomatic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_member`;

CREATE TABLE `order_member` (
  `uid` smallint(5) unsigned NOT NULL COMMENT '管理id',
  `pools` varchar(20) DEFAULT NULL COMMENT '权限池',
  `groups` varchar(100) NOT NULL COMMENT '权限组',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` char(32) DEFAULT NULL COMMENT '用户密码',
  `fake_password` char(32) DEFAULT NULL COMMENT '伪造密码',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `potato` varchar(20) DEFAULT NULL COMMENT 'Potato',
  `safe_ips` varchar(200) DEFAULT NULL COMMENT '登陆IP限制',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '帐号状态 1:正常 0:禁止登陆',
  `regtime` int(11) NOT NULL COMMENT '注册时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '最后登录时间',
  `loginip` varchar(15) NOT NULL COMMENT '最后登录IP',
  `logincountry` char(2) DEFAULT '' COMMENT '最后登陆国家',
  `otp_auth` tinyint(1) DEFAULT '0' COMMENT 'MFA认证 0:禁用  1:启用  2:强制启用',
  `otp_authcode` char(16) DEFAULT '' COMMENT 'MFA验证码',
  `date_expired` date DEFAULT '2088-06-08' COMMENT '失效日期',
  `need_audit` tinyint(1) DEFAULT '0' COMMENT '登陆是否需要后台进行人工审核 0: 不需要 1:需要',
  `session_id` char(26) DEFAULT '' COMMENT '登陆时session_id',
  `session_expire` int(11) DEFAULT '1440' COMMENT 'SESSION有效期，默认24分钟',
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理id',
  `name` blob,
  `age` blob,
  `address` blob,
  `create_user` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`username`) USING BTREE,
  KEY `pools` (`pools`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `order_member` WRITE;
/*!40000 ALTER TABLE `order_member` DISABLE KEYS */;

INSERT INTO `order_member` (`uid`, `pools`, `groups`, `username`, `password`, `fake_password`, `realname`, `email`, `potato`, `safe_ips`, `status`, `regtime`, `regip`, `logintime`, `loginip`, `logincountry`, `otp_auth`, `otp_authcode`, `date_expired`, `need_audit`, `session_id`, `session_expire`, `id`, `name`, `age`, `address`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(0,NULL,'',NULL,NULL,NULL,NULL,'7g',NULL,NULL,1,0,'',0,'','',0,'','2088-06-08',0,'',1440,1,X'AD2917D3E309183DDB6E0C408581CE02',X'405F9C4B731BF5762A832D6DAB0616E2',X'BAD43F9D4CF2D6CEB55B5DBA0E0859D8',1,1541754398,1,1541763798),
	(0,NULL,'',NULL,NULL,NULL,NULL,'<g',NULL,NULL,1,0,'',0,'','',0,'','2088-06-08',0,'',1440,2,X'649523384676A8FF38F679E4D55FD99F',X'7285D5916C44A33B605A108BB1618C7F',X'65901FFED16C56375C75F6C76F08E366',1,1541754398,1,1541763792),
	(0,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,1,0,'',0,'','',0,'','2088-06-08',0,'',1440,3,X'9E9CE44CD9DF2B201F51947E03BCCBE2',X'52208B4F4121A25F986549A204CB8FD3',X'6F0951F345B12AB78A313B10122F4AB6',1,1541754398,1,1541763763);

/*!40000 ALTER TABLE `order_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_menu`;

CREATE TABLE `order_menu` (
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `remark` varchar(150) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '配置备注',
  `price` varchar(20) NOT NULL DEFAULT '' COMMENT '配置分组id',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '',
  `delete_user` char(1) DEFAULT '0',
  `delete_time` int(10) DEFAULT '0',
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1',
  `type_id` int(10) unsigned NOT NULL DEFAULT '1',
  `currency_id` int(10) unsigned DEFAULT '8',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设置，项目设置setting_id为1，日报设置setting_id为2，审批设置setting_id为3';

LOCK TABLES `order_menu` WRITE;
/*!40000 ALTER TABLE `order_menu` DISABLE KEYS */;

INSERT INTO `order_menu` (`name`, `remark`, `price`, `id`, `create_time`, `create_user`, `delete_user`, `delete_time`, `update_user`, `update_time`, `shop_id`, `type_id`, `currency_id`)
VALUES
	('坎坎坷坷','','1111',1,1545028521,'1','1',1545042308,'1',1545029195,1,7,1),
	('点点滴滴','','1222',2,1545029284,'1','1',1545042304,'1',1545029284,1,7,1),
	('健康的话','','2',3,1545034725,'1','1',1545042299,'1',1545034725,1,7,1),
	('绝对是','','3',4,1545034734,'1','1',1545061819,'1',1545034734,1,7,1),
	('大家积极','','8',5,1545035830,'1','1',1545061823,'1',1545035830,1,7,1),
	('简简单单','','4',6,1545035840,'1','1',1545061827,'1',1545035840,1,7,1),
	('快看看','','3',7,1545035847,'1','1',1545042294,'1',1545035847,1,7,1),
	('简简单单','','12',8,1545059804,'1','1',1545061831,'1',1545059804,1,7,1),
	('番茄炒蛋','','2.5',9,1545061614,'1','0',0,'1',1545061613,1,7,1),
	('西红柿鸡蛋面','','2',10,1545061839,'1','0',0,'1',1545061839,1,7,1),
	('麻婆豆腐','','2',11,1545061880,'1','0',0,'1',1545061880,1,7,1),
	('油焖茄子','','2',12,1545061896,'1','0',0,'1',1545061896,1,7,1),
	('手撕包菜','','2',13,1545061914,'1','0',0,'1',1545061914,1,7,1),
	('木耳炒肉片','','3',14,1545061934,'1','0',0,'1',1545061934,1,7,1),
	('蒜苔炒肉丝','','3',15,1545061949,'1','0',0,'1',1545061949,1,7,1),
	('肉末酸豆角','','3',16,1545061963,'1','0',0,'1',1545061963,1,7,1),
	('农家小炒肉','','3',17,1545061990,'1','0',0,'1',1545061978,1,7,1),
	('家常豆腐','','2.5',18,1545062039,'1','0',0,'1',1545062035,1,7,1),
	('酸辣土豆丝','','2.5',19,1545062098,'1','0',0,'1',1545062098,1,7,1),
	('茄子炒豆角','','2.5',20,1545062112,'1','0',0,'1',1545062112,1,7,1),
	('青椒肉丝','','3',21,1545062139,'1','0',0,'1',1545062139,1,7,1),
	('川香回锅肉','','3',22,1545062160,'1','0',0,'1',1545062159,1,7,1),
	('红烧牛腩','','4',23,1545062251,'1','0',0,'1',1545062251,1,7,1),
	('红烧肥肠','','4',24,1545062251,'1','0',0,'0',0,1,7,1),
	('小炒牛肉','','4',25,1545062346,'1','0',0,'1',1545062346,1,7,1),
	('鱼香肉丝','','4',30,1545062251,'1','0',0,'0',0,1,7,1),
	('酸辣鸡杂','','4',31,1545062251,'1','0',0,'0',0,1,7,1),
	('紫菜汤','','2',32,1545062251,'1','0',0,'0',0,1,7,1),
	('酸辣汤','','3',33,1545062251,'1','0',0,'0',0,1,7,1),
	('榨菜肉丝汤','','3',34,1545062251,'1','0',0,'0',0,1,7,1),
	('西虹市鸡蛋汤','','3',35,1545062616,'1','0',0,'1',1545062615,1,7,1),
	('红烧牛肉面','','3',36,1545062635,'1','0',0,'1',1545062635,1,7,1),
	('泡椒鸡杂面','','3',37,1545062662,'1','0',0,'1',1545062662,1,7,1),
	('泡菜肉丝面','','3',38,1545062689,'1','0',0,'1',1545062686,1,7,1),
	('桂林米粉','','3',39,1546402198,'1','0',0,'1',1546404733,2,4,1),
	('炒桂林米粉','','3',40,1546426188,'1','0',0,'0',0,2,4,1),
	('干捞粉','','3',41,1546426220,'1','0',0,'0',0,2,4,1),
	('猪肉炒饭','','3',42,1546426246,'1','0',0,'0',0,2,7,1),
	('鸡蛋炒饭','','2.5',43,1546426286,'1','0',0,'0',0,2,7,1),
	('炒河粉','','3',44,1546426473,'1','0',0,'0',0,2,4,1),
	('炒米粉','','3',45,1546426491,'1','0',0,'0',0,2,4,1),
	('三鲜粉','','3',46,1546426507,'1','0',0,'0',0,2,4,1),
	('酸辣粉','','3',47,1546426529,'1','0',0,'0',0,2,4,1),
	('牛腩粉','','3',48,1546442327,'1','0',0,'0',0,2,4,1),
	('煎蛋','','0.5',49,1546442448,'1','0',0,'1',1546576479,2,8,1),
	('糖醋排骨','','5',50,1546443451,'1','0',0,'0',0,2,7,1),
	('炒腊肉','','5',51,1546443472,'1','0',0,'0',0,2,7,1),
	('家常豆腐','','4',52,1546443502,'1','0',0,'0',0,2,7,1),
	('苦瓜煎蛋','','3',53,1546443538,'1','0',0,'0',0,2,7,1),
	('炒空心菜','','2',54,1546443561,'1','0',0,'1',1546443721,2,7,1),
	('炒油麦菜','','3',55,1546443602,'1','0',0,'0',0,2,7,1),
	('炒番薯叶','','3',56,1546443758,'1','0',0,'0',0,2,7,1),
	('酸炒鸡珍','','5',57,1546443799,'1','0',0,'1',1546443816,2,7,1),
	('红烧肉','','5',58,1546443836,'1','0',0,'0',0,2,7,1),
	('玉米筒骨汤','','3',59,1546443969,'1','0',0,'0',0,2,10,1),
	('番茄蛋花汤','','2',60,1546443993,'1','0',0,'0',0,2,10,1),
	('冬瓜海带筒骨汤','','3',61,1546444032,'1','0',0,'0',0,2,10,1),
	('牛排火锅','','30',62,1546444060,'1','0',0,'0',0,2,1,1);

/*!40000 ALTER TABLE `order_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_menu_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_menu_type`;

CREATE TABLE `order_menu_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `delete_time` int(11) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `disabled` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `order_menu_type` WRITE;
/*!40000 ALTER TABLE `order_menu_type` DISABLE KEYS */;

INSERT INTO `order_menu_type` (`type_id`, `name`, `delete_time`, `delete_user`, `create_time`, `create_user`, `update_user`, `update_time`, `disabled`)
VALUES
	(1,'火锅类',0,'0',1546067546,'1','0',0,1),
	(4,'米粉类',0,'0',1546067698,'1','0',0,1),
	(5,'面食类',0,'0',1546068172,'1','0',0,1),
	(6,'饮料',0,'0',1546068221,'1','0',0,1),
	(7,'米饭类',0,'0',1546068268,'1','0',0,1),
	(8,'糕点类',0,'0',1546396295,'1','0',0,1),
	(9,'冷饮咖啡',0,'0',1546396354,'1','0',0,1),
	(10,'汤类',0,'0',1546401334,'1','1',1546409092,1);

/*!40000 ALTER TABLE `order_menu_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_oauth_access_tokens`;

CREATE TABLE `order_oauth_access_tokens` (
  `access_token` char(32) NOT NULL DEFAULT '',
  `client_id` char(32) NOT NULL DEFAULT '',
  `user_id` varchar(80) DEFAULT NULL,
  `openid` char(32) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_oauth_authorization_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_oauth_authorization_codes`;

CREATE TABLE `order_oauth_authorization_codes` (
  `authorization_code` char(32) NOT NULL DEFAULT '',
  `client_id` char(32) NOT NULL DEFAULT '',
  `user_id` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  `id_token` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_oauth_clients`;

CREATE TABLE `order_oauth_clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) DEFAULT NULL COMMENT '应用名称',
  `website` varchar(200) DEFAULT NULL COMMENT '应用网站',
  `cate` tinyint(1) DEFAULT '1' COMMENT '应用分类 1、网页应用 2、客户端',
  `desc` varchar(200) DEFAULT NULL COMMENT '应用介绍',
  `domain` varchar(200) DEFAULT NULL COMMENT '域名绑定，绑定后的域名才可访问client_id',
  `ip` varchar(200) DEFAULT NULL COMMENT '信任IP，以逗号分隔，信任IP才可访问OpenAPI',
  `client_id` char(32) NOT NULL DEFAULT '' COMMENT 'App Key，只生成一次',
  `client_secret` char(32) NOT NULL DEFAULT '' COMMENT 'App Secret，后台可以重置',
  `redirect_uri` varchar(2000) NOT NULL DEFAULT '' COMMENT '授权回调页',
  `cancel_uri` varchar(2000) DEFAULT NULL COMMENT '取消授权回调页',
  `grant_types` varchar(80) DEFAULT NULL COMMENT '授权方式',
  `scope` varchar(2000) DEFAULT NULL COMMENT '授权作用域',
  `user_id` varchar(80) DEFAULT NULL COMMENT '用户ID',
  `create_user` int(11) DEFAULT NULL COMMENT '添加用户',
  `create_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改用户',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_oauth_clients` WRITE;
/*!40000 ALTER TABLE `order_oauth_clients` DISABLE KEYS */;

INSERT INTO `order_oauth_clients` (`id`, `name`, `website`, `cate`, `desc`, `domain`, `ip`, `client_id`, `client_secret`, `redirect_uri`, `cancel_uri`, `grant_types`, `scope`, `user_id`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'测试应用','http://www1.phpcall.org',1,'这是一个测试应用','www1.phpcall.org','127.0.0.1,192.168.0.46','testclient','testpass','http://www1.phpcall.org/oauth2_sdk/callback.php',NULL,'authorization_code,refresh_token,password,client_credentials','basic','user',1,1526151992,1,1528379432),
	(7,'fesfes',NULL,1,'fes','fes','fs','4396ff23eb80bbe11fabd578458b27c8','0ef64bd272146903d624a852158b9be0','http://fes','http://fes','authorization_code','basic','user',1,1526151992,1,1526152004);

/*!40000 ALTER TABLE `order_oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_oauth_jwt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_oauth_jwt`;

CREATE TABLE `order_oauth_jwt` (
  `client_id` char(32) NOT NULL DEFAULT '',
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_oauth_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_oauth_permissions`;

CREATE TABLE `order_oauth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `info` varchar(200) DEFAULT NULL COMMENT '权限说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_oauth_refresh_tokens`;

CREATE TABLE `order_oauth_refresh_tokens` (
  `refresh_token` char(32) NOT NULL DEFAULT '',
  `client_id` char(32) NOT NULL DEFAULT '',
  `user_id` varchar(80) DEFAULT NULL,
  `openid` char(32) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_oauth_scopes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_oauth_scopes`;

CREATE TABLE `order_oauth_scopes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT '授权名称',
  `scope` varchar(80) DEFAULT NULL COMMENT '授权',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  `desc` varchar(200) DEFAULT NULL COMMENT '授权说明',
  `create_user` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scope` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_oauth_scopes` WRITE;
/*!40000 ALTER TABLE `order_oauth_scopes` DISABLE KEYS */;

INSERT INTO `order_oauth_scopes` (`id`, `name`, `scope`, `is_default`, `desc`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'基础信息','basic',1,'登陆即可获取：包含userid、userinfo_basic，用户ID、姓名、头像、性别',1,1526146038,1,1528271472),
	(2,'用户信息','userinfo',0,'姓名、头像、性别、省市、Email等',1,1526146038,1,1526146038),
	(3,'用户权限','user_permissions',0,NULL,1,1526146038,1,1526146038),
	(4,'查看下级信息','child_userinfo',0,NULL,1,1526146038,1,1526146038),
	(5,'查看下级详细信息','child_userinfo_all',0,NULL,1,1526146038,1,1526146038),
	(7,'通过关键词搜索用户','search_users_keywords',0,NULL,1,1526146038,1,1526146038),
	(8,'搜索用户时的联想搜索建议','search_users',0,NULL,1,1526146038,1,1526146038),
	(10,'更改头像','update_avatar',0,NULL,1,1526146038,1,1526146038),
	(11,'更改用户资料','update_userinfo',0,NULL,1,1526146038,1,1526146038);

/*!40000 ALTER TABLE `order_oauth_scopes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_oauth_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_oauth_users`;

CREATE TABLE `order_oauth_users` (
  `userid` char(32) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(80) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `realname` varchar(80) DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(80) DEFAULT NULL COMMENT '邮箱',
  `email_verified` tinyint(1) DEFAULT '0' COMMENT '是否邮箱验证',
  `scope` varchar(2000) DEFAULT 'base' COMMENT '授权范围',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_order`;

CREATE TABLE `order_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_ids` varchar(500) DEFAULT '',
  `price` varchar(20) DEFAULT '',
  `create_user` char(32) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL,
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT '0',
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `uid` char(32) NOT NULL DEFAULT '',
  `pay_bill` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;

INSERT INTO `order_order` (`id`, `menu_ids`, `price`, `create_user`, `create_time`, `delete_user`, `delete_time`, `update_user`, `update_time`, `uid`, `pay_bill`)
VALUES
	(1,'','','1',1545032653,'1',1545060286,'1',1545032653,'1',0),
	(2,'','','1',1545035175,'1',1545060474,'1',1545035175,'1',0),
	(3,'','','1',1545035201,'1',1545060698,'1',1545035201,'1',0),
	(9,'','','1',1545035523,'1',1545060688,'1',1545035523,'1',0),
	(12,'','','1',1545035602,'0',0,'1',1545035602,'1',0),
	(14,'','','1',1545036252,'1',1545060552,'1',1545036252,'1',0),
	(15,'','','1',1545036297,'0',0,'1',1545036297,'1',0),
	(22,'','','1',1545036499,'0',0,'1',1545039770,'1',0),
	(24,'','','1',1545036564,'1',1545060484,'1',1545039793,'1',0),
	(25,'','','1',1545039694,'0',0,'1',1545039694,'1',0),
	(26,'','','1',1545039708,'0',0,'1',1545039708,'1',0),
	(27,'','','1',1545039896,'0',0,'1',1545039896,'1',0),
	(28,'','','1',1545039908,'0',0,'1',1545039908,'1',0),
	(29,'','','1',1545039914,'0',0,'1',1545039914,'1',0),
	(30,'','','1',1545039918,'0',0,'1',1545039918,'1',0),
	(31,'','','1',1545039923,'0',0,'1',1545039923,'1',0),
	(32,'','','1',1545039979,'0',0,'1',1545039979,'1',0),
	(33,'','','2d204e70cbb18aaee963d37224cfb1a2',1545043849,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1545043849,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(34,'','','1',1545044357,'1',1545060276,'1',1545044357,'1',0),
	(35,'','','2d204e70cbb18aaee963d37224cfb1a2',1545063791,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1545063791,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(36,'','','1',1545106304,'1',1545106626,'1',1545106304,'1',0),
	(37,'','','1',1545106305,'1',1545106380,'1',1545106305,'1',0),
	(38,'','','1',1545106316,'1',1545106622,'1',1545106316,'1',0),
	(39,'','','8878bebfbb1962508c682fd9622c616e',1545106318,'8878bebfbb1962508c682fd9622c616e',1545106472,'8878bebfbb1962508c682fd9622c616e',1545106318,'8878bebfbb1962508c682fd9622c616e',0),
	(40,'','','fa9762f68f11fe1d4632a73fb3945707',1545106336,'0',0,'1',1545116974,'fa9762f68f11fe1d4632a73fb3945707',1),
	(41,'','','5c835e039058fe1819e6763e214f745c',1545106365,'0',0,'1',1545116972,'5c835e039058fe1819e6763e214f745c',1),
	(42,'','','55b5373c3fbfc42d2eb67ad8a1981cd4',1545106415,'55b5373c3fbfc42d2eb67ad8a1981cd4',1545128237,'1',1545116970,'55b5373c3fbfc42d2eb67ad8a1981cd4',1),
	(43,'','','1',1545106419,'1',1545106618,'1',1545106419,'1',0),
	(44,'','','f28c519be47c0ed1901efa5593d14c0e',1545106421,'0',0,'1',1545116966,'f28c519be47c0ed1901efa5593d14c0e',1),
	(45,'','','1',1545106443,'1',1545106651,'1',1545106443,'1',0),
	(46,'','','2d204e70cbb18aaee963d37224cfb1a2',1545106449,'0',0,'1',1545116963,'2d204e70cbb18aaee963d37224cfb1a2',1),
	(47,'','','8878bebfbb1962508c682fd9622c616e',1545106465,'8878bebfbb1962508c682fd9622c616e',1545106543,'8878bebfbb1962508c682fd9622c616e',1545106465,'8878bebfbb1962508c682fd9622c616e',0),
	(48,'','','8878bebfbb1962508c682fd9622c616e',1545106566,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545139236,'8878bebfbb1962508c682fd9622c616e',1),
	(49,'','','00e2e34c14bfcec4fdc43e4d330cbbda',1545106577,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545139233,'00e2e34c14bfcec4fdc43e4d330cbbda',1),
	(50,'','','428b9a1b89ff60997a272ae9020c46b3',1545106946,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545139242,'428b9a1b89ff60997a272ae9020c46b3',1),
	(51,'','','1ec88d6f31006b0fee1bd4f34d343d20',1545106965,'1ec88d6f31006b0fee1bd4f34d343d20',1545107019,'1ec88d6f31006b0fee1bd4f34d343d20',1545106965,'1ec88d6f31006b0fee1bd4f34d343d20',0),
	(52,'','','1ec88d6f31006b0fee1bd4f34d343d20',1545107178,'1ec88d6f31006b0fee1bd4f34d343d20',1545107236,'1ec88d6f31006b0fee1bd4f34d343d20',1545107178,'1ec88d6f31006b0fee1bd4f34d343d20',0),
	(53,'','','428b9a1b89ff60997a272ae9020c46b3',1545107388,'428b9a1b89ff60997a272ae9020c46b3',1545191080,'1',1545117242,'428b9a1b89ff60997a272ae9020c46b3',1),
	(54,'','','2d204e70cbb18aaee963d37224cfb1a2',1545118627,'2d204e70cbb18aaee963d37224cfb1a2',1545119210,'2d204e70cbb18aaee963d37224cfb1a2',1545118627,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(55,'','','2d204e70cbb18aaee963d37224cfb1a2',1545118675,'2d204e70cbb18aaee963d37224cfb1a2',1545119207,'2d204e70cbb18aaee963d37224cfb1a2',1545118675,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(56,'','','2d204e70cbb18aaee963d37224cfb1a2',1545119339,'2d204e70cbb18aaee963d37224cfb1a2',1545191892,'2d204e70cbb18aaee963d37224cfb1a2',1545139117,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(57,'','','55b5373c3fbfc42d2eb67ad8a1981cd4',1545128111,'55b5373c3fbfc42d2eb67ad8a1981cd4',1545191090,'55b5373c3fbfc42d2eb67ad8a1981cd4',1545128111,'55b5373c3fbfc42d2eb67ad8a1981cd4',0),
	(58,'','','5c835e039058fe1819e6763e214f745c',1545128306,'0',0,'5c835e039058fe1819e6763e214f745c',1545128306,'5c835e039058fe1819e6763e214f745c',0),
	(59,'','','bbd1c2afab02b82639a652ec8f4daea0',1545128860,'0',0,'bbd1c2afab02b82639a652ec8f4daea0',1545128860,'bbd1c2afab02b82639a652ec8f4daea0',0),
	(60,'','','2d204e70cbb18aaee963d37224cfb1a2',1545139135,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1545139135,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(61,'','','1',1545190911,'1',1545190925,'1',1545190911,'1',0),
	(62,'','','2d204e70cbb18aaee963d37224cfb1a2',1545190939,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545196007,'2d204e70cbb18aaee963d37224cfb1a2',1),
	(63,'','','428b9a1b89ff60997a272ae9020c46b3',1545191062,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545196083,'428b9a1b89ff60997a272ae9020c46b3',1),
	(64,'','','55b5373c3fbfc42d2eb67ad8a1981cd4',1545191074,'0',0,'55b5373c3fbfc42d2eb67ad8a1981cd4',1545191074,'55b5373c3fbfc42d2eb67ad8a1981cd4',0),
	(65,'','','5c835e039058fe1819e6763e214f745c',1545191279,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545195925,'5c835e039058fe1819e6763e214f745c',1),
	(66,'','','cadd985895c05d9286051d14a36ebed0',1545191334,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545203493,'cadd985895c05d9286051d14a36ebed0',0),
	(67,'','','fa9762f68f11fe1d4632a73fb3945707',1545191409,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545203693,'fa9762f68f11fe1d4632a73fb3945707',1),
	(68,'','','005d158f31efef188897e4ece451f4cd',1545191523,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545196126,'005d158f31efef188897e4ece451f4cd',1),
	(69,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1545191630,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545195971,'f8e0d74ba172bc3779c1d741eb1bc0bd',1),
	(70,'','','8878bebfbb1962508c682fd9622c616e',1545191661,'0',0,'8878bebfbb1962508c682fd9622c616e',1545191661,'8878bebfbb1962508c682fd9622c616e',0),
	(71,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1545191729,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545192667,'f8e0d74ba172bc3779c1d741eb1bc0bd',0),
	(72,'','','1',1545192003,'1',1545192013,'1',1545192003,'1',0),
	(73,'','','f28c519be47c0ed1901efa5593d14c0e',1545192095,'0',0,'f28c519be47c0ed1901efa5593d14c0e',1545192095,'f28c519be47c0ed1901efa5593d14c0e',0),
	(74,'','','2d204e70cbb18aaee963d37224cfb1a2',1545277780,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545282648,'2d204e70cbb18aaee963d37224cfb1a2',1),
	(75,'','','55b5373c3fbfc42d2eb67ad8a1981cd4',1545278054,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545282748,'55b5373c3fbfc42d2eb67ad8a1981cd4',1),
	(76,'','','f28c519be47c0ed1901efa5593d14c0e',1545278207,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545282753,'f28c519be47c0ed1901efa5593d14c0e',1),
	(77,'','','505111db3ec293528268cac6ec813c02',1545278251,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545283527,'505111db3ec293528268cac6ec813c02',1),
	(78,'','','005d158f31efef188897e4ece451f4cd',1545278256,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545283559,'005d158f31efef188897e4ece451f4cd',1),
	(79,'','','428b9a1b89ff60997a272ae9020c46b3',1545278309,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545283612,'428b9a1b89ff60997a272ae9020c46b3',0),
	(80,'','','cadd985895c05d9286051d14a36ebed0',1545278328,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545283614,'cadd985895c05d9286051d14a36ebed0',0),
	(81,'','','b69962a88114d8e61dce408a473efb90',1545278510,'0',0,'b69962a88114d8e61dce408a473efb90',1545278510,'b69962a88114d8e61dce408a473efb90',0),
	(82,'','','8878bebfbb1962508c682fd9622c616e',1545278588,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545283604,'8878bebfbb1962508c682fd9622c616e',0),
	(83,'','','1',1545278607,'0',0,'1',1545278607,'1',0),
	(84,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1545278849,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545278849,'f8e0d74ba172bc3779c1d741eb1bc0bd',0),
	(85,'','','fa9762f68f11fe1d4632a73fb3945707',1545279036,'0',0,'fa9762f68f11fe1d4632a73fb3945707',1545279036,'fa9762f68f11fe1d4632a73fb3945707',0),
	(86,'','','76b9f68de7bbdd7ead60679cc7e232b1',1545279044,'0',0,'76b9f68de7bbdd7ead60679cc7e232b1',1545279044,'76b9f68de7bbdd7ead60679cc7e232b1',0),
	(87,'','','00e2e34c14bfcec4fdc43e4d330cbbda',1545622517,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545626945,'00e2e34c14bfcec4fdc43e4d330cbbda',1),
	(88,'','','76b9f68de7bbdd7ead60679cc7e232b1',1545622533,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545626940,'76b9f68de7bbdd7ead60679cc7e232b1',1),
	(89,'','','cadd985895c05d9286051d14a36ebed0',1545622879,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545626652,'cadd985895c05d9286051d14a36ebed0',1),
	(90,'','','505111db3ec293528268cac6ec813c02',1545622907,'0',0,'505111db3ec293528268cac6ec813c02',1545622907,'505111db3ec293528268cac6ec813c02',0),
	(91,'','','005d158f31efef188897e4ece451f4cd',1545623098,'0',0,'005d158f31efef188897e4ece451f4cd',1545623098,'005d158f31efef188897e4ece451f4cd',0),
	(92,'','','428b9a1b89ff60997a272ae9020c46b3',1545623174,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545626966,'428b9a1b89ff60997a272ae9020c46b3',1),
	(93,'','','b69962a88114d8e61dce408a473efb90',1545623593,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545626959,'b69962a88114d8e61dce408a473efb90',1),
	(94,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1545623603,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545626949,'f8e0d74ba172bc3779c1d741eb1bc0bd',1),
	(95,'','','2d204e70cbb18aaee963d37224cfb1a2',1545623726,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1545623726,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(96,'','','fa9762f68f11fe1d4632a73fb3945707',1545623899,'fa9762f68f11fe1d4632a73fb3945707',1545794187,'fa9762f68f11fe1d4632a73fb3945707',1545623899,'fa9762f68f11fe1d4632a73fb3945707',0),
	(97,'','','1',1545646147,'1',1545646307,'1',1545646147,'1',0),
	(98,'','','1',1545646721,'1',1545646739,'1',1545646721,'1',0),
	(99,'','','1',1545648637,'1',1545648733,'1',1545648637,'1',0),
	(100,'','','1',1545707895,'1',1545707919,'1',1545707895,'1',0),
	(101,'','','2d204e70cbb18aaee963d37224cfb1a2',1545708000,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545714402,'2d204e70cbb18aaee963d37224cfb1a2',1),
	(102,'','','005d158f31efef188897e4ece451f4cd',1545708018,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545714404,'005d158f31efef188897e4ece451f4cd',1),
	(103,'','','b69962a88114d8e61dce408a473efb90',1545708105,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545714398,'b69962a88114d8e61dce408a473efb90',1),
	(104,'','','cadd985895c05d9286051d14a36ebed0',1545708319,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545714381,'cadd985895c05d9286051d14a36ebed0',1),
	(105,'','','fa9762f68f11fe1d4632a73fb3945707',1545708350,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545714414,'fa9762f68f11fe1d4632a73fb3945707',1),
	(106,'','','5c835e039058fe1819e6763e214f745c',1545708436,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545714386,'5c835e039058fe1819e6763e214f745c',1),
	(107,'','','00e2e34c14bfcec4fdc43e4d330cbbda',1545708752,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545714410,'00e2e34c14bfcec4fdc43e4d330cbbda',1),
	(108,'','','f28c519be47c0ed1901efa5593d14c0e',1545709121,'0',0,'f28c519be47c0ed1901efa5593d14c0e',1545709121,'f28c519be47c0ed1901efa5593d14c0e',0),
	(109,'','','bbd1c2afab02b82639a652ec8f4daea0',1545709126,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545714717,'bbd1c2afab02b82639a652ec8f4daea0',1),
	(110,'','','379403f090c118f7e3233ca6457e81bf',1545709411,'0',0,'379403f090c118f7e3233ca6457e81bf',1545709411,'379403f090c118f7e3233ca6457e81bf',0),
	(111,'','','76b9f68de7bbdd7ead60679cc7e232b1',1545709897,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545714374,'76b9f68de7bbdd7ead60679cc7e232b1',1),
	(112,'','','428b9a1b89ff60997a272ae9020c46b3',1545710037,'0',0,'428b9a1b89ff60997a272ae9020c46b3',1545710037,'428b9a1b89ff60997a272ae9020c46b3',0),
	(113,'','','379403f090c118f7e3233ca6457e81bf',1545793647,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800756,'379403f090c118f7e3233ca6457e81bf',1),
	(114,'','','2d204e70cbb18aaee963d37224cfb1a2',1545793707,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800743,'2d204e70cbb18aaee963d37224cfb1a2',1),
	(115,'','','cadd985895c05d9286051d14a36ebed0',1545793776,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800739,'cadd985895c05d9286051d14a36ebed0',1),
	(116,'','','fa9762f68f11fe1d4632a73fb3945707',1545793891,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800660,'fa9762f68f11fe1d4632a73fb3945707',1),
	(117,'','','76b9f68de7bbdd7ead60679cc7e232b1',1545793950,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800840,'76b9f68de7bbdd7ead60679cc7e232b1',1),
	(118,'','','428b9a1b89ff60997a272ae9020c46b3',1545794045,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800838,'428b9a1b89ff60997a272ae9020c46b3',1),
	(119,'','','fa9762f68f11fe1d4632a73fb3945707',1545794065,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800655,'fa9762f68f11fe1d4632a73fb3945707',1),
	(120,'','','b69962a88114d8e61dce408a473efb90',1545794380,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800687,'b69962a88114d8e61dce408a473efb90',1),
	(121,'','','00e2e34c14bfcec4fdc43e4d330cbbda',1545794756,'0',0,'00e2e34c14bfcec4fdc43e4d330cbbda',1545794756,'00e2e34c14bfcec4fdc43e4d330cbbda',0),
	(122,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1545794954,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800845,'f8e0d74ba172bc3779c1d741eb1bc0bd',1),
	(123,'','','5c835e039058fe1819e6763e214f745c',1545795835,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545800833,'5c835e039058fe1819e6763e214f745c',1),
	(124,'','','00e2e34c14bfcec4fdc43e4d330cbbda',1545816896,'0',0,'00e2e34c14bfcec4fdc43e4d330cbbda',1545816896,'00e2e34c14bfcec4fdc43e4d330cbbda',0),
	(125,'','','2d204e70cbb18aaee963d37224cfb1a2',1545818147,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1545818147,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(126,'','','379403f090c118f7e3233ca6457e81bf',1545818182,'0',0,'379403f090c118f7e3233ca6457e81bf',1545818182,'379403f090c118f7e3233ca6457e81bf',0),
	(127,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1545818401,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545818401,'f8e0d74ba172bc3779c1d741eb1bc0bd',0),
	(128,'','','379403f090c118f7e3233ca6457e81bf',1545879827,'0',0,'379403f090c118f7e3233ca6457e81bf',1545879827,'379403f090c118f7e3233ca6457e81bf',0),
	(129,'','','fa9762f68f11fe1d4632a73fb3945707',1545880387,'0',0,'fa9762f68f11fe1d4632a73fb3945707',1545880387,'fa9762f68f11fe1d4632a73fb3945707',0),
	(130,'','','428b9a1b89ff60997a272ae9020c46b3',1545880425,'0',0,'428b9a1b89ff60997a272ae9020c46b3',1545880425,'428b9a1b89ff60997a272ae9020c46b3',0),
	(131,'','','00e2e34c14bfcec4fdc43e4d330cbbda',1545880689,'0',0,'00e2e34c14bfcec4fdc43e4d330cbbda',1545880689,'00e2e34c14bfcec4fdc43e4d330cbbda',0),
	(132,'','','cadd985895c05d9286051d14a36ebed0',1545880800,'0',0,'cadd985895c05d9286051d14a36ebed0',1545880800,'cadd985895c05d9286051d14a36ebed0',0),
	(133,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1545881100,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545881100,'f8e0d74ba172bc3779c1d741eb1bc0bd',0),
	(134,'','','fa9762f68f11fe1d4632a73fb3945707',1545881115,'0',0,'fa9762f68f11fe1d4632a73fb3945707',1545881115,'fa9762f68f11fe1d4632a73fb3945707',0),
	(135,'','','005d158f31efef188897e4ece451f4cd',1545881200,'0',0,'005d158f31efef188897e4ece451f4cd',1545881200,'005d158f31efef188897e4ece451f4cd',0),
	(136,'','','b69962a88114d8e61dce408a473efb90',1545881266,'0',0,'b69962a88114d8e61dce408a473efb90',1545881266,'b69962a88114d8e61dce408a473efb90',0),
	(137,'','','bbd1c2afab02b82639a652ec8f4daea0',1545881283,'0',0,'bbd1c2afab02b82639a652ec8f4daea0',1545881283,'bbd1c2afab02b82639a652ec8f4daea0',0),
	(138,'','','5c835e039058fe1819e6763e214f745c',1545881303,'0',0,'5c835e039058fe1819e6763e214f745c',1545881303,'5c835e039058fe1819e6763e214f745c',0),
	(139,'','','2d204e70cbb18aaee963d37224cfb1a2',1545881407,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1545881407,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(140,'','','005d158f31efef188897e4ece451f4cd',1545966990,'0',0,'005d158f31efef188897e4ece451f4cd',1545966990,'005d158f31efef188897e4ece451f4cd',0),
	(141,'','','fa9762f68f11fe1d4632a73fb3945707',1545967059,'0',0,'fa9762f68f11fe1d4632a73fb3945707',1545967059,'fa9762f68f11fe1d4632a73fb3945707',0),
	(142,'','','428b9a1b89ff60997a272ae9020c46b3',1545967125,'0',0,'428b9a1b89ff60997a272ae9020c46b3',1545967125,'428b9a1b89ff60997a272ae9020c46b3',0),
	(143,'','','b69962a88114d8e61dce408a473efb90',1545967291,'0',0,'b69962a88114d8e61dce408a473efb90',1545967291,'b69962a88114d8e61dce408a473efb90',0),
	(144,'','','00e2e34c14bfcec4fdc43e4d330cbbda',1545967425,'0',0,'00e2e34c14bfcec4fdc43e4d330cbbda',1545967425,'00e2e34c14bfcec4fdc43e4d330cbbda',0),
	(145,'','','cadd985895c05d9286051d14a36ebed0',1545967562,'0',0,'cadd985895c05d9286051d14a36ebed0',1545967562,'cadd985895c05d9286051d14a36ebed0',0),
	(146,'','','bbd1c2afab02b82639a652ec8f4daea0',1545969409,'0',0,'bbd1c2afab02b82639a652ec8f4daea0',1545969409,'bbd1c2afab02b82639a652ec8f4daea0',0),
	(147,'','','2d204e70cbb18aaee963d37224cfb1a2',1545969475,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1545969475,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(148,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1545969808,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1545969808,'f8e0d74ba172bc3779c1d741eb1bc0bd',0),
	(149,'','','5c835e039058fe1819e6763e214f745c',1545969935,'0',0,'5c835e039058fe1819e6763e214f745c',1545969935,'5c835e039058fe1819e6763e214f745c',0),
	(150,'','','005d158f31efef188897e4ece451f4cd',1546053424,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546059614,'005d158f31efef188897e4ece451f4cd',1),
	(151,'','','428b9a1b89ff60997a272ae9020c46b3',1546053450,'0',0,'428b9a1b89ff60997a272ae9020c46b3',1546053450,'428b9a1b89ff60997a272ae9020c46b3',0),
	(152,'','','76b9f68de7bbdd7ead60679cc7e232b1',1546053645,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546059617,'76b9f68de7bbdd7ead60679cc7e232b1',1),
	(153,'','','b69962a88114d8e61dce408a473efb90',1546054576,'0',0,'b69962a88114d8e61dce408a473efb90',1546054576,'b69962a88114d8e61dce408a473efb90',0),
	(154,'','','2d204e70cbb18aaee963d37224cfb1a2',1546055757,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546059884,'2d204e70cbb18aaee963d37224cfb1a2',1),
	(155,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1546055855,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546059891,'f8e0d74ba172bc3779c1d741eb1bc0bd',1),
	(156,'','','f28c519be47c0ed1901efa5593d14c0e',1546399523,'0',0,'f28c519be47c0ed1901efa5593d14c0e',1546399523,'f28c519be47c0ed1901efa5593d14c0e',0),
	(157,'','','005d158f31efef188897e4ece451f4cd',1546399553,'0',0,'005d158f31efef188897e4ece451f4cd',1546399553,'005d158f31efef188897e4ece451f4cd',0),
	(158,'','','428b9a1b89ff60997a272ae9020c46b3',1546399591,'0',0,'428b9a1b89ff60997a272ae9020c46b3',1546399591,'428b9a1b89ff60997a272ae9020c46b3',0),
	(159,'','','55b5373c3fbfc42d2eb67ad8a1981cd4',1546399689,'0',0,'55b5373c3fbfc42d2eb67ad8a1981cd4',1546399689,'55b5373c3fbfc42d2eb67ad8a1981cd4',0),
	(160,'','','b69962a88114d8e61dce408a473efb90',1546399752,'0',0,'b69962a88114d8e61dce408a473efb90',1546399752,'b69962a88114d8e61dce408a473efb90',0),
	(161,'','','1',1546419887,'0',0,'1',1546419887,'1',0),
	(162,'','','1',1546419896,'0',0,'1',1546419896,'1',0),
	(163,'','','1',1546421162,'0',0,'1',1546421162,'1',0),
	(164,'','','1',1546421746,'0',0,'1',1546421746,'1',0),
	(165,'','','1',1546422720,'0',0,'1',1546423603,'1',0),
	(166,'','','f28c519be47c0ed1901efa5593d14c0e',1546574207,'f28c519be47c0ed1901efa5593d14c0e',1546576398,'f28c519be47c0ed1901efa5593d14c0e',1546574207,'f28c519be47c0ed1901efa5593d14c0e',0),
	(167,'','','5c835e039058fe1819e6763e214f745c',1546574225,'5c835e039058fe1819e6763e214f745c',1546574714,'5c835e039058fe1819e6763e214f745c',1546574225,'5c835e039058fe1819e6763e214f745c',0),
	(168,'','','379403f090c118f7e3233ca6457e81bf',1546574537,'379403f090c118f7e3233ca6457e81bf',1546576532,'379403f090c118f7e3233ca6457e81bf',1546574537,'379403f090c118f7e3233ca6457e81bf',0),
	(169,'','','5c835e039058fe1819e6763e214f745c',1546574703,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546578622,'5c835e039058fe1819e6763e214f745c',1),
	(170,'','','f28c519be47c0ed1901efa5593d14c0e',1546576321,'0',0,'f28c519be47c0ed1901efa5593d14c0e',1546576321,'f28c519be47c0ed1901efa5593d14c0e',0),
	(171,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1546576328,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546578616,'f8e0d74ba172bc3779c1d741eb1bc0bd',1),
	(172,'','','f28c519be47c0ed1901efa5593d14c0e',1546576386,'0',0,'f28c519be47c0ed1901efa5593d14c0e',1546576386,'f28c519be47c0ed1901efa5593d14c0e',0),
	(173,'','','2d204e70cbb18aaee963d37224cfb1a2',1546576397,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546578607,'2d204e70cbb18aaee963d37224cfb1a2',1),
	(174,'','','1ec88d6f31006b0fee1bd4f34d343d20',1546576430,'0',0,'1ec88d6f31006b0fee1bd4f34d343d20',1546576430,'1ec88d6f31006b0fee1bd4f34d343d20',0),
	(175,'','','1ec88d6f31006b0fee1bd4f34d343d20',1546576450,'0',0,'1ec88d6f31006b0fee1bd4f34d343d20',1546576450,'1ec88d6f31006b0fee1bd4f34d343d20',0),
	(176,'','','cadd985895c05d9286051d14a36ebed0',1546576456,'0',0,'cadd985895c05d9286051d14a36ebed0',1546576456,'cadd985895c05d9286051d14a36ebed0',0),
	(177,'','','379403f090c118f7e3233ca6457e81bf',1546576564,'0',0,'379403f090c118f7e3233ca6457e81bf',1546576564,'379403f090c118f7e3233ca6457e81bf',0),
	(178,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1546576747,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546578613,'f8e0d74ba172bc3779c1d741eb1bc0bd',1),
	(179,'','','1ec88d6f31006b0fee1bd4f34d343d20',1546659649,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546662971,'1ec88d6f31006b0fee1bd4f34d343d20',1),
	(180,'','','1ec88d6f31006b0fee1bd4f34d343d20',1546659664,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546662968,'1ec88d6f31006b0fee1bd4f34d343d20',1),
	(181,'','','2d204e70cbb18aaee963d37224cfb1a2',1546659753,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546662962,'2d204e70cbb18aaee963d37224cfb1a2',1),
	(182,'','','119dc0dd7a8de2aad832c33a7e862649',1546659840,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546662973,'119dc0dd7a8de2aad832c33a7e862649',1),
	(183,'','','119dc0dd7a8de2aad832c33a7e862649',1546659858,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546662974,'119dc0dd7a8de2aad832c33a7e862649',1),
	(184,'','','5c835e039058fe1819e6763e214f745c',1546659890,'0',0,'5c835e039058fe1819e6763e214f745c',1546659890,'5c835e039058fe1819e6763e214f745c',0),
	(185,'','','428b9a1b89ff60997a272ae9020c46b3',1546659967,'0',0,'428b9a1b89ff60997a272ae9020c46b3',1546659967,'428b9a1b89ff60997a272ae9020c46b3',0),
	(186,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1546659977,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546659977,'f8e0d74ba172bc3779c1d741eb1bc0bd',0),
	(187,'','','fa9762f68f11fe1d4632a73fb3945707',1546659985,'0',0,'fa9762f68f11fe1d4632a73fb3945707',1546659985,'fa9762f68f11fe1d4632a73fb3945707',0),
	(188,'','','f28c519be47c0ed1901efa5593d14c0e',1546660005,'0',0,'f28c519be47c0ed1901efa5593d14c0e',1546660005,'f28c519be47c0ed1901efa5593d14c0e',0),
	(189,'','','005d158f31efef188897e4ece451f4cd',1546831633,'0',0,'005d158f31efef188897e4ece451f4cd',1546831633,'005d158f31efef188897e4ece451f4cd',0),
	(190,'','','fa9762f68f11fe1d4632a73fb3945707',1546831713,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546837715,'fa9762f68f11fe1d4632a73fb3945707',1),
	(191,'','','f28c519be47c0ed1901efa5593d14c0e',1546831975,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546837491,'f28c519be47c0ed1901efa5593d14c0e',1),
	(192,'','','428b9a1b89ff60997a272ae9020c46b3',1546832221,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546837831,'428b9a1b89ff60997a272ae9020c46b3',1),
	(193,'','','5c835e039058fe1819e6763e214f745c',1546832232,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546837827,'5c835e039058fe1819e6763e214f745c',1),
	(194,'','','2d204e70cbb18aaee963d37224cfb1a2',1546833503,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546837488,'2d204e70cbb18aaee963d37224cfb1a2',1),
	(195,'','','f28c519be47c0ed1901efa5593d14c0e',1546918066,'0',0,'f28c519be47c0ed1901efa5593d14c0e',1546918066,'f28c519be47c0ed1901efa5593d14c0e',0),
	(196,'','','5c835e039058fe1819e6763e214f745c',1546919177,'0',0,'5c835e039058fe1819e6763e214f745c',1546919177,'5c835e039058fe1819e6763e214f745c',0),
	(197,'','','2d204e70cbb18aaee963d37224cfb1a2',1546919932,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1546919932,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(198,'','','119dc0dd7a8de2aad832c33a7e862649',1546921163,'0',0,'119dc0dd7a8de2aad832c33a7e862649',1546921163,'119dc0dd7a8de2aad832c33a7e862649',0),
	(199,'','','119dc0dd7a8de2aad832c33a7e862649',1546921180,'0',0,'119dc0dd7a8de2aad832c33a7e862649',1546921180,'119dc0dd7a8de2aad832c33a7e862649',0),
	(200,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1546921341,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1546921341,'f8e0d74ba172bc3779c1d741eb1bc0bd',0),
	(201,'','','5c835e039058fe1819e6763e214f745c',1547004373,'0',0,'5c835e039058fe1819e6763e214f745c',1547004372,'5c835e039058fe1819e6763e214f745c',0),
	(202,'','','005d158f31efef188897e4ece451f4cd',1547092052,'0',0,'005d158f31efef188897e4ece451f4cd',1547092052,'005d158f31efef188897e4ece451f4cd',0),
	(203,'','','428b9a1b89ff60997a272ae9020c46b3',1547093396,'0',0,'428b9a1b89ff60997a272ae9020c46b3',1547093396,'428b9a1b89ff60997a272ae9020c46b3',0),
	(204,'','','f28c519be47c0ed1901efa5593d14c0e',1547093405,'0',0,'f28c519be47c0ed1901efa5593d14c0e',1547093405,'f28c519be47c0ed1901efa5593d14c0e',0),
	(205,'','','2d204e70cbb18aaee963d37224cfb1a2',1547094018,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1547094018,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(206,'','','f28c519be47c0ed1901efa5593d14c0e',1547438583,'0',0,'f28c519be47c0ed1901efa5593d14c0e',1547438583,'f28c519be47c0ed1901efa5593d14c0e',0),
	(207,'','','f8e0d74ba172bc3779c1d741eb1bc0bd',1547438642,'0',0,'f8e0d74ba172bc3779c1d741eb1bc0bd',1547438642,'f8e0d74ba172bc3779c1d741eb1bc0bd',0),
	(208,'','','1',1559448148,'0',0,'1',1559448148,'1',0),
	(209,'','','2d204e70cbb18aaee963d37224cfb1a2',1573815883,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1573815883,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(210,'','','2d204e70cbb18aaee963d37224cfb1a2',1573815896,'0',0,'2d204e70cbb18aaee963d37224cfb1a2',1573815896,'2d204e70cbb18aaee963d37224cfb1a2',0),
	(211,'','','1',1573815970,'0',0,'1',1573815970,'1',0);

/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_order_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_order_menu`;

CREATE TABLE `order_order_menu` (
  `order_id` int(11) unsigned NOT NULL,
  `menu_id` int(11) unsigned NOT NULL,
  `price` varchar(100) NOT NULL DEFAULT '',
  `num` int(10) unsigned DEFAULT '1',
  `name` varchar(300) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `order_order_menu` WRITE;
/*!40000 ALTER TABLE `order_order_menu` DISABLE KEYS */;

INSERT INTO `order_order_menu` (`order_id`, `menu_id`, `price`, `num`, `name`)
VALUES
	(15,1,'1111',12,'0'),
	(15,2,'1222',11,'0'),
	(15,5,'8',1,'0'),
	(15,6,'4',1,'0'),
	(25,1,'1111',11,'0'),
	(25,2,'1222',14,'0'),
	(25,5,'8',12,'0'),
	(26,1,'1111',111,'0'),
	(22,1,'1111',11,'0'),
	(22,2,'1222',141,'0'),
	(22,6,'4',161,'0'),
	(27,6,'4',1,'0'),
	(28,3,'2',1,'0'),
	(29,2,'1222',1,'0'),
	(30,5,'8',1,'0'),
	(31,4,'3',1,'0'),
	(32,7,'3',2,'0'),
	(33,4,'3',1,'0'),
	(35,9,'2.5',1,'0'),
	(40,9,'2.5',1,'0'),
	(41,19,'2.5',1,'0'),
	(44,17,'3',1,'0'),
	(46,13,'2',1,'0'),
	(48,32,'2',1,'0'),
	(49,18,'2.5',1,'0'),
	(50,11,'2',1,'0'),
	(58,11,'2',1,'0'),
	(59,9,'2.5',1,'0'),
	(59,18,'2.5',1,'0'),
	(60,15,'3',1,'0'),
	(60,19,'2.5',1,'0'),
	(62,36,'3',1,'0'),
	(63,22,'3',1,'0'),
	(64,11,'2',1,'0'),
	(65,14,'3',1,'0'),
	(66,14,'3',1,'0'),
	(67,30,'4',1,'0'),
	(68,9,'2.5',1,'0'),
	(69,19,'2.5',1,'0'),
	(70,20,'2.5',1,'0'),
	(73,11,'2',1,'0'),
	(71,11,'2',1,'0'),
	(71,13,'2',1,'0'),
	(71,14,'3',1,'0'),
	(71,19,'2.5',1,'0'),
	(74,14,'3',1,'0'),
	(75,18,'2.5',1,'0'),
	(76,36,'3',1,'0'),
	(77,15,'3',1,'0'),
	(77,18,'2.5',1,'0'),
	(78,38,'3',1,'0'),
	(79,19,'2.5',1,'0'),
	(80,16,'3',1,'0'),
	(81,17,'3',1,'0'),
	(82,32,'2',1,'0'),
	(83,18,'2.5',1,'0'),
	(84,18,'2.5',1,'0'),
	(85,14,'3',1,'0'),
	(86,23,'4',1,'0'),
	(87,19,'2.5',1,'0'),
	(88,20,'2.5',1,'0'),
	(89,14,'3',1,'0'),
	(90,9,'2.5',1,'0'),
	(90,19,'2.5',1,'0'),
	(91,9,'2.5',1,'0'),
	(92,18,'2.5',1,'0'),
	(93,18,'2.5',1,'0'),
	(94,18,'2.5',1,'0'),
	(95,19,'2.5',1,'0'),
	(101,19,'2.5',1,'0'),
	(102,9,'2.5',1,'0'),
	(103,9,'2.5',1,'0'),
	(104,18,'2.5',1,'0'),
	(105,17,'3',1,'0'),
	(106,11,'2',1,'0'),
	(107,14,'3',1,'0'),
	(107,19,'2.5',1,'0'),
	(107,18,'2.5',1,'0'),
	(108,17,'3',1,'0'),
	(109,9,'2.5',1,'0'),
	(109,14,'3',1,'0'),
	(110,20,'2.5',1,'0'),
	(111,23,'4',1,'0'),
	(112,10,'2',1,'0'),
	(113,25,'4',1,'0'),
	(114,9,'2.5',1,'0'),
	(115,9,'2.5',1,'0'),
	(116,9,'2.5',1,'0'),
	(117,16,'3',1,'0'),
	(118,13,'2',1,'0'),
	(119,9,'2.5',1,'0'),
	(120,22,'3',1,'0'),
	(121,21,'3',1,'0'),
	(121,20,'2.5',1,'0'),
	(121,18,'2.5',1,'0'),
	(122,17,'3',2,'0'),
	(123,19,'2.5',1,'0'),
	(124,10,'2',1,'0'),
	(125,15,'3',1,'0'),
	(126,13,'2',1,'0'),
	(127,12,'2',1,'0'),
	(128,18,'2.5',1,'0'),
	(129,34,'3',1,'0'),
	(130,9,'2.5',1,'0'),
	(131,21,'3',2,'0'),
	(132,14,'3',1,'0'),
	(133,12,'2',1,'0'),
	(134,23,'4',1,'0'),
	(135,18,'2.5',1,'0'),
	(136,11,'2',1,'0'),
	(137,23,'4',1,'0'),
	(137,19,'2.5',1,'0'),
	(138,19,'2.5',1,'0'),
	(139,19,'2.5',1,'0'),
	(140,9,'2.5',1,'0'),
	(141,34,'3',1,'0'),
	(141,21,'3',1,'0'),
	(142,23,'4',1,'0'),
	(143,23,'4',1,'0'),
	(144,22,'3',1,'0'),
	(144,21,'3',1,'0'),
	(145,23,'4',1,'0'),
	(146,12,'2',1,'0'),
	(146,11,'2',1,'0'),
	(147,14,'3',1,'0'),
	(148,16,'3',1,'0'),
	(149,19,'2.5',1,'0'),
	(150,9,'2.5',1,'0'),
	(151,23,'4',1,'0'),
	(152,34,'3',1,'0'),
	(153,36,'3',1,'0'),
	(154,16,'3',1,'0'),
	(154,15,'3',1,'0'),
	(155,16,'3',1,'0'),
	(156,18,'2.5',1,'0'),
	(157,9,'2.5',1,'0'),
	(158,13,'2',1,'0'),
	(159,31,'4',1,'0'),
	(160,23,'4',1,'0'),
	(161,31,'4',1,'0'),
	(162,30,'4',1,'0'),
	(163,30,'4',1,'0'),
	(163,22,'3',1,'0'),
	(164,22,'3',2,'0'),
	(165,17,'3',13,'0'),
	(165,21,'3',2,'0'),
	(169,42,'3',1,'0'),
	(170,39,'3',1,'0'),
	(171,41,'3',1,'0'),
	(172,49,'0.5',1,'0'),
	(173,43,'2.5',1,'0'),
	(174,49,'0.5',2,'0'),
	(175,47,'3',2,'0'),
	(176,56,'3',1,'0'),
	(177,45,'3',1,'0'),
	(178,49,'0.5',1,'0'),
	(179,48,'3',1,'0'),
	(180,49,'0.5',2,'0'),
	(181,42,'3',1,'0'),
	(182,47,'3',1,'0'),
	(183,49,'0.5',1,'0'),
	(184,47,'3',1,'0'),
	(185,39,'3',1,'0'),
	(186,41,'3',1,'0'),
	(187,39,'3',1,'0'),
	(188,52,'4',1,'0'),
	(189,39,'3',1,'0'),
	(190,43,'2.5',1,'0'),
	(191,39,'3',1,'0'),
	(192,43,'2.5',1,'0'),
	(193,47,'3',1,'0'),
	(194,42,'3',1,'0'),
	(195,43,'2.5',1,'0'),
	(196,47,'3',1,'0'),
	(197,39,'3',1,'0'),
	(198,48,'3',1,'0'),
	(198,47,'3',1,'0'),
	(199,49,'0.5',2,'0'),
	(200,39,'3',1,'0'),
	(201,47,'3',1,'0'),
	(202,42,'3',1,'0'),
	(203,42,'3',1,'0'),
	(204,43,'2.5',1,'0'),
	(205,42,'3',1,'0'),
	(206,43,'2.5',1,'0'),
	(207,41,'3',1,'0'),
	(208,50,'5',1,'0'),
	(208,52,'4',1,'0'),
	(209,51,'5',1,'0'),
	(209,62,'30',1,'0'),
	(210,50,'5',1,'0'),
	(210,52,'4',1,'0'),
	(211,50,'5',1,'0'),
	(211,41,'3',1,'0');

/*!40000 ALTER TABLE `order_order_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_projects`;

CREATE TABLE `order_projects` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `sncode` varchar(20) DEFAULT NULL,
  `pname` blob NOT NULL COMMENT '項目標題',
  `sponsor` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '發起人',
  `principal` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '負責人',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '項目到期日',
  `emerg_level` tinyint(2) unsigned NOT NULL COMMENT '緊急程度',
  `pdescription` blob NOT NULL COMMENT '項目描述',
  `budget` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '花費',
  `parent_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '上層項目，頂層為0',
  `top_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '最顶层id',
  `complete_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '完成状态',
  `leave_message` blob COMMENT '创建及编辑时的项目留言',
  `create_user` char(32) DEFAULT '0',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT NULL,
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='項目主資料表';

LOCK TABLES `order_projects` WRITE;
/*!40000 ALTER TABLE `order_projects` DISABLE KEYS */;

INSERT INTO `order_projects` (`id`, `sncode`, `pname`, `sponsor`, `principal`, `expiry`, `emerg_level`, `pdescription`, `budget`, `parent_id`, `top_id`, `complete_status`, `leave_message`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,'PJ9052006059890',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'1B854058AB1FCA58411ECEC507A87D83',0,0,0,0,NULL,'1',1538023345,'0',0,'0',0),
	(2,'PJ8747769671724',X'64FE04A3081A5AF1FCB2146B50927653',0,0,0,25,X'5DFAFA8D0540BFFCE32B8F4490D80BFE',0,0,0,1,X'E03C23F59F0CDE29D5A8043E0EBF1E3858799C416F9CC95351B221CD8F117AF5','1',1538024186,'0',0,'0',0),
	(3,'PJ7323796190492',X'720AD7C519B27E5EF1AA0ED90879EB9B',0,0,0,26,X'8A2AF2EE7DC29789C1AF69FF61DC48AF',0,0,0,0,X'8A2AF2EE7DC29789C1AF69FF61DC48AF','1',1538031937,'0',0,'0',0),
	(4,'PJ9561254923224',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'792473BD59E8377220805AAE7B331A64',0,0,0,0,NULL,'1',1538035408,'0',0,'0',0),
	(5,'PJ8553398604525',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'792473BD59E8377220805AAE7B331A64',0,0,0,0,NULL,'1',1538035428,'0',0,'0',0),
	(6,'PJ8964879268068',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'6CA3347F097A648E627691FA99E3CA0F',0,0,0,0,NULL,'1',1538035613,'0',0,'0',0),
	(7,'PJ8964879268068-001',X'4429701222C8E9A218D38B628D807BD4',0,0,0,25,X'792473BD59E8377220805AAE7B331A64',0,6,0,0,X'0143DB63EE66B0CDFF9F69917680151E','1',1538035731,'0',0,'0',0),
	(8,'PJ5741451952769',X'1381AA7D4BF7C0743B2825B6B17F6E9D',0,0,0,26,X'98C8AA37B6B1D0A8963A0E7FCFABF72F',0,0,0,0,X'AA248EEB35D69F1E08A4378A01D48622','1',1538035751,'0',0,'0',0),
	(9,'PJ7775017681144',X'1A2D3926CDC46B9D29DBBE3CF16D5690',0,0,0,25,X'A13E1C572064CC5FC29C50C9B9CFA1AF',0,0,0,0,NULL,'1',1538035810,'0',0,'0',0),
	(10,'PJ2657604288703',X'4754A6098D1743D2E88C2DEA7E9D13DE',0,0,0,25,X'A19217DC67CB5D4B3108F7163072A831',0,0,0,0,NULL,'1',1538035834,'0',0,'0',0),
	(11,'PJ5741451952769-002',X'89079EBF84EC76B448C46637C6CEB6A4',0,0,0,26,X'6CB4337CBC61699E8C078F94D63968124AE6E19C07B49432961FFF5774D9E138',0,8,0,0,X'0143DB63EE66B0CDFF9F69917680151E','1',1538035973,'0',0,'0',0),
	(12,'PJ4071459527070',X'5B529D151131557B88DB3E052B548E8CD8650A02B40126B6493090A746A8E7B5',0,0,0,26,X'74BD6E46B7CF5A602A0010B1B9CE8A28C4B21209E526D9DAE376FAFA617B56B2',0,0,0,0,X'C590064C55E95970DAA0028CEB8A279B','1',1538036308,'1',1538037194,'0',0),
	(13,'PJ9963637484121',X'99499E1F084030BCA8CB10B2B6CFB02C8C8D2D5AC8876837A8E113095F232CD8',0,0,0,25,X'04757A44CE35373F2D5E4F6B63F15691',0,0,0,0,NULL,'1',1538037679,'0',0,'0',0),
	(14,'PJ3417876119863',X'844F9CA49D7AA2A78598B4FADE98D290',0,0,0,25,X'365A53B71A35095C96207F1BEBD5660F',0,0,0,0,NULL,'b3ac4d6fa016464979190d4dd1ff80b8',1538037714,'0',0,'0',0),
	(15,'PJ0328353876723',X'9CCE2BDDE42D25B6976FE69B521A294628FA586FB7495DB972DF2E11CD18B6C6',0,0,0,25,X'354DCE9711CB55E9CC8DD9071A7CD10C',0,0,0,0,NULL,'1',1538037975,'0',0,'0',0),
	(16,'PJ2553398368085',X'23E4F59176D11D643DA0A9954A48673ECAD4F41AFB7AED65181BDBA7D3632A3E',0,0,0,27,X'A95E6FEAC4FA225608465757D7AAC979BC1C86379B6666E26383B9BE95037CA2',0,0,0,0,X'9912FEE82DAA86F35DEEDB8E3CF00FC00143DB63EE66B0CDFF9F69917680151E','1',1538038031,'1',1538209329,'0',0),
	(17,'PJ4621263442702',X'B0998218A86FB36AD46FBE03F2F72C97F46E348C555B4FF67C0C75EF1350AC8E',0,0,0,27,X'455CC1CBE0CD7BE00269BAA3C1254C968946BF9B8D4824E44709813326FAD0BBFE97C4C26204ABC54522618DAF181B1E',0,0,0,0,X'0143DB63EE66B0CDFF9F69917680151E','0a62896fbbdd767a7e57d103f4623eca',1538040286,'0a62896fbbdd767a7e57d103f4623eca',1538044340,'0',0),
	(18,'PJ2764624723265',X'B0998218A86FB36AD46FBE03F2F72C9798BD98ACD857447718F29A452F2F769F',0,0,0,26,X'3284754D1E9119CF8B83D5C0E5B01F16564469E190D1A10F53A6038E0DA16E4990FFAF6FB81BE6B8AAC7390422CF780D94CD2161088057295D047679DD735018',0,0,0,0,X'0143DB63EE66B0CDFF9F69917680151E','0a62896fbbdd767a7e57d103f4623eca',1538041000,'0a62896fbbdd767a7e57d103f4623eca',1538041229,'0',0),
	(19,'PJ2764624723265',X'B0998218A86FB36AD46FBE03F2F72C9798BD98ACD857447718F29A452F2F769F',0,0,0,27,X'3284754D1E9119CF8B83D5C0E5B01F16564469E190D1A10F53A6038E0DA16E4990FFAF6FB81BE6B8AAC7390422CF780D94CD2161088057295D047679DD735018',0,0,0,0,X'0143DB63EE66B0CDFF9F69917680151E','0a62896fbbdd767a7e57d103f4623eca',1538042014,'0a62896fbbdd767a7e57d103f4623eca',1538208505,'0',0),
	(20,'PJ8324918268569',X'555D3DDD8D7CC79E936FCCB064697D6B770F5A3D4CF6985B24873FCE4E735B5A',0,0,0,26,X'770F5A3D4CF6985B24873FCE4E735B5A',0,0,0,0,X'770F5A3D4CF6985B24873FCE4E735B5A','1',1538209351,'0',0,'0',0),
	(21,'PJ8962489389776',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'B8CA9F805383EF785572704EB35B50C4',0,0,0,0,NULL,'1',1539848269,'0',0,'0',0),
	(22,'PJ7127463426083',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,26,X'E5651A32E31C437322789B65B9000720',0,0,0,0,NULL,'1',1539848475,'0',0,'0',0),
	(23,'PJ5952517072615',X'0725BEBDB1340675E4E443F3212F9A12',0,0,0,25,X'FB1DE6326D668051F84F54BB0CD4E36A',0,0,0,0,NULL,'1',1539854395,'0',0,'0',0),
	(24,'PJ9157892719873',X'5094109D23B365DC417971BC066CACE6',0,0,0,25,X'A98CB33BCED86035CED5D528320835FE',0,0,0,0,NULL,'1',1539922918,'0',0,'0',0),
	(25,'PJ6406205942535',X'9B77DF356141FE0EF5371D9BAA0AAF1E',0,0,0,25,X'9393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38416F2F3F1A6E5C97F9C5E7AD56BCF6FBC',0,0,0,0,NULL,'1',1540367545,'0',0,'0',0),
	(26,'PJ3104862027280',X'CEEA3BB6C3C5B219581399FFA1D8D9270DC209BA2A9FBB3F3EDCBBABD2071AB0',0,0,0,25,X'9393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478470143DB63EE66B0CDFF9F69917680151E',0,0,0,1,NULL,'1',1540367768,'0',0,'0',0),
	(27,'PJ6406205942535-003',X'414788EE187AD26232D431913719ACD0AFF10537BF9D12D48E7E63BB9FFDE079',0,0,0,25,X'098BAB9F587E6E38601D11F5300BF7D1',0,25,0,1,X'0143DB63EE66B0CDFF9F69917680151E','1',1540369042,'0',0,'0',0),
	(28,'PJ6406205942535-004',X'59910B96330A97DD344A483FD473BC66A047097F3E89FE386D1E8206783584B9',0,0,0,25,X'9393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478470143DB63EE66B0CDFF9F69917680151E',0,25,0,1,X'95F94B7855D57BAC35E542DCFED2F42F7DCBE2DE7BA79D5E21ABAA61105694A9D5407B3F6A25D55389463053EB3DF21F95F94B7855D57BAC35E542DCFED2F42F39A479953697952DDE5812C103E253EC','1',1540369215,'0',0,'0',0),
	(29,'PJ3597639032264',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'7F3BACF37A8789325B7E0A870163FA1F',0,0,0,0,NULL,'1',1540435979,'0',0,'0',0),
	(30,'PJ1352825204244',X'6C63D9DD2E904A738989957542B3A321',0,0,0,25,X'A3A63B29485D17F814FED6EAD8A0E89A65488BBC4D89B9B0ECB6E45556062F20',0,0,0,0,X'0143DB63EE66B0CDFF9F69917680151E','1',1540784878,'1',1540971532,'0',NULL),
	(31,'PJ8441119555893',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'06D1EFB4AC5E5A86E69C95132B44F5AC',0,0,0,0,NULL,'1',1542768746,'0',NULL,'0',NULL);

/*!40000 ALTER TABLE `order_projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_projects_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_projects_department`;

CREATE TABLE `order_projects_department` (
  `projectid` int(11) unsigned NOT NULL COMMENT '项目id',
  `departmentid` int(11) unsigned NOT NULL COMMENT '客户公司id',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='相关公司对应表';



# Dump of table order_projects_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_projects_history`;

CREATE TABLE `order_projects_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectid` int(11) unsigned NOT NULL COMMENT '项目id',
  `orig_content` blob NOT NULL COMMENT '原始项目描述',
  `new_content` blob NOT NULL COMMENT '新项目描述',
  `update_user` char(32) NOT NULL DEFAULT '0' COMMENT '修改者',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='历史纪录';

LOCK TABLES `order_projects_history` WRITE;
/*!40000 ALTER TABLE `order_projects_history` DISABLE KEYS */;

INSERT INTO `order_projects_history` (`id`, `projectid`, `orig_content`, `new_content`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,12,X'98C8AA37B6B1D0A8963A0E7FCFABF72F',X'74BD6E46B7CF5A602A0010B1B9CE8A28C4B21209E526D9DAE376FAFA617B56B2','1',1538037010,NULL,NULL),
	(2,16,X'A33635A7D17BC38EACE12AD4A0088CE5',X'D374CEDED5DA65EEEBDC947780C48E50','1',1538190079,NULL,NULL),
	(3,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'66337F95ED39D2CEF33D7165B61BFA56','1',1538208307,NULL,NULL),
	(4,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'5F4A28A81BF524F8A6339A7EEFEC2427','1',1538208338,NULL,NULL),
	(5,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'66337F95ED39D2CEF33D7165B61BFA56','1',1538208567,NULL,NULL),
	(6,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'5F4A28A81BF524F8A6339A7EEFEC2427','1',1538208588,NULL,NULL),
	(7,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'66337F95ED39D2CEF33D7165B61BFA56','1',1538208605,NULL,NULL),
	(8,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'66337F95ED39D2CEF33D7165B61BFA56','1',1538208715,NULL,NULL),
	(9,16,X'66337F95ED39D2CEF33D7165B61BFA56',X'1E391196B3D93BC892533D33316F373F','1',1538208743,NULL,NULL),
	(10,16,X'1E391196B3D93BC892533D33316F373F',X'A95E6FEAC4FA225608465757D7AAC979A4ADF38ADDFA5F2F038DC2665AB3BA1C','1',1538208931,NULL,NULL),
	(11,16,X'A95E6FEAC4FA225608465757D7AAC979A4ADF38ADDFA5F2F038DC2665AB3BA1C',X'A95E6FEAC4FA225608465757D7AAC979DCD8077A6C0AE8129C947FE27A3C9140','1',1538209285,NULL,NULL),
	(12,16,X'A95E6FEAC4FA225608465757D7AAC979DCD8077A6C0AE8129C947FE27A3C9140',X'A95E6FEAC4FA225608465757D7AAC979BC1C86379B6666E26383B9BE95037CA2','1',1538209329,NULL,NULL);

/*!40000 ALTER TABLE `order_projects_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_projects_participate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_projects_participate`;

CREATE TABLE `order_projects_participate` (
  `projectid` int(8) unsigned NOT NULL COMMENT '项目id',
  `participateid` char(32) NOT NULL DEFAULT '' COMMENT '参与者id',
  `priveleges` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '留言权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='相关人员对应表';



# Dump of table order_pwn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_pwn`;

CREATE TABLE `order_pwn` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `value` blob,
  `price` blob,
  `price2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_service_plane
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_service_plane`;

CREATE TABLE `order_service_plane` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(2) unsigned NOT NULL DEFAULT '1' COMMENT '1接机2送机3其他',
  `time` int(10) unsigned DEFAULT NULL COMMENT '服务时间',
  `take_address` varchar(500) DEFAULT '' COMMENT '接地点',
  `to_address` varchar(500) DEFAULT '' COMMENT '送地点',
  `flight_on` varchar(30) DEFAULT '' COMMENT '航班号',
  `flight_fly_time` int(11) unsigned DEFAULT '0' COMMENT '起飞时间',
  `flight_arrive_time` int(10) unsigned DEFAULT '0' COMMENT '航班抵达时间',
  `project_name` varchar(300) DEFAULT '' COMMENT '所属项目组',
  `number` varchar(100) DEFAULT NULL COMMENT '接机举牌号码',
  `visa` tinyint(1) unsigned DEFAULT '1' COMMENT '1无需办理签证，2商务签证，3旅游签证',
  `peoples` int(10) unsigned DEFAULT '1' COMMENT '人数',
  `what_car` varchar(500) DEFAULT NULL COMMENT '车辆是否有要求',
  `status` tinyint(1) unsigned DEFAULT '1',
  `remark` text COMMENT '备注，说明',
  `create_user` char(32) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL,
  `update_user` char(32) DEFAULT '0',
  `update_time` int(11) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接送机服务表';

LOCK TABLES `order_service_plane` WRITE;
/*!40000 ALTER TABLE `order_service_plane` DISABLE KEYS */;

INSERT INTO `order_service_plane` (`id`, `type`, `time`, `take_address`, `to_address`, `flight_on`, `flight_fly_time`, `flight_arrive_time`, `project_name`, `number`, `visa`, `peoples`, `what_car`, `status`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,2,1548262800,'傲创','金边机场','sfasdfasdfasdfa',1548694800,0,NULL,NULL,1,11,NULL,1,'普通送机','1',1548059725,'0',0,'0',0),
	(2,2,1548262800,'傲创','金边机场','asdfasdfa',1547485200,0,NULL,NULL,1,123,NULL,4,'普通送机','1',1548059746,'1',1548306082,'0',0),
	(3,2,1548867600,'傲创','金边机场','asdfasdfa',1548262800,0,NULL,NULL,1,123,NULL,4,'普通送机','1',1548059753,'1',1548316071,'0',0),
	(4,2,1547830800,'傲创','金边机场','c98688',1548867600,0,'傲创',NULL,1,1,'无',3,'普通送机asdfasdfasdfa','1',1548059963,'1',1548319224,'0',0),
	(5,2,1547830800,'傲创','金边机场','发342342',1548003600,0,'傲创',NULL,1,1,'无',3,'普通送机qweqweqwe','1',1548239845,'1',1548319531,'0',0),
	(6,2,1548608400,'464 stree EV apartment','金边机场','9c8688',1548608400,0,'傲创',NULL,1,2,'无',2,'普通送机1231231231','1',1548305209,'1',1548320255,'0',0),
	(7,2,1547917200,'金边机场','78768dhfkajskldjflkasjlkflkajslkdjflasdfas','1231231',1546794000,0,'傲创',NULL,1,1,'无',3,'普通接机f','2d204e70cbb18aaee963d37224cfb1a2',1548320446,'2d204e70cbb18aaee963d37224cfb1a2',1548321159,'2d204e70cbb18aaee963d37224cfb1a2',1548321159),
	(8,2,1548694800,'我的公寓','金边机场','sfasdfasdfasdfa',1548608400,0,'傲创',NULL,1,32,'无',3,'普通送机sdfa','2d204e70cbb18aaee963d37224cfb1a2',1548321235,'0',0,'0',0),
	(9,2,1553619600,'金边机场','271time tower 办公室','CZ8467',1553619600,0,'傲创',NULL,1,1,'无',1,'普通接机美琳','bbd1c2afab02b82639a652ec8f4daea0',1552648876,'0',0,'0',0);

/*!40000 ALTER TABLE `order_service_plane` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_shop
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_shop`;

CREATE TABLE `order_shop` (
  `shop_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(200) DEFAULT '0',
  `mobile` varchar(20) DEFAULT '0',
  `phone` varchar(20) DEFAULT '0',
  `weixin` varchar(50) DEFAULT '0',
  `line` varchar(50) DEFAULT '0',
  `telegram` varchar(50) DEFAULT '0',
  `address` varchar(300) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `disabled` tinyint(1) unsigned DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned DEFAULT '0',
  `update_user` char(21) DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) DEFAULT '0',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `order_shop` WRITE;
/*!40000 ALTER TABLE `order_shop` DISABLE KEYS */;

INSERT INTO `order_shop` (`shop_id`, `name`, `email`, `mobile`, `phone`, `weixin`, `line`, `telegram`, `address`, `remark`, `disabled`, `create_time`, `create_user`, `update_time`, `update_user`, `delete_user`, `delete_time`)
VALUES
	(1,'老九门','','','09u9898989823','','0','','','',0,1546397043,'1',1546398759,'1','0',0),
	(2,'中国桂林米粉','我更不知道','你也不知道','我不知道','','0','','老地方隔壁','',0,1546399070,'1',1546443880,'1','0',0);

/*!40000 ALTER TABLE `order_shop` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_strong_man
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_strong_man`;

CREATE TABLE `order_strong_man` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uids` varchar(500) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL,
  `create_user` char(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='壮丁日志';

LOCK TABLES `order_strong_man` WRITE;
/*!40000 ALTER TABLE `order_strong_man` DISABLE KEYS */;

INSERT INTO `order_strong_man` (`id`, `uids`, `create_time`, `create_user`)
VALUES
	(1,'[{\"uid\":\"cadd985895c05d9286051d14a36ebed0\",\"realname\":\"u53ccu559c\"},{\"uid\":\"fa9762f68f11fe1d4632a73fb3945707\",\"realname\":\"u6728u9752\"}]',1545886671,'1'),
	(2,'[{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\"},{\"uid\":\"cadd985895c05d9286051d14a36ebed0\",\"realname\":\"u53ccu559c\"}]',1545886672,'1'),
	(3,'[{\"uid\":\"5c835e039058fe1819e6763e214f745c\",\"realname\":\"sking\"},{\"uid\":\"cadd985895c05d9286051d14a36ebed0\",\"realname\":\"u53ccu559c\"}]',1545887823,'1'),
	(4,'[{\"uid\":\"fa9762f68f11fe1d4632a73fb3945707\",\"realname\":\"u6728u9752\"},{\"uid\":\"428b9a1b89ff60997a272ae9020c46b3\",\"realname\":\"u6674u5929\"}]',1545887825,'1'),
	(5,'[{\"uid\":\"005d158f31efef188897e4ece451f4cd\",\"realname\":\"u5bb8u5353\"},{\"uid\":\"428b9a1b89ff60997a272ae9020c46b3\",\"realname\":\"u6674u5929\"}]',1545887825,'1'),
	(6,'[{\"uid\":\"bbd1c2afab02b82639a652ec8f4daea0\",\"realname\":\"u7f8eu6797\"},{\"uid\":\"b69962a88114d8e61dce408a473efb90\",\"realname\":\"Ice\"}]',1545887825,'1'),
	(7,'[{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\"},{\"uid\":\"00e2e34c14bfcec4fdc43e4d330cbbda\",\"realname\":\"u7389u5b81\"}]',1545887825,'1'),
	(8,'[{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\"},{\"uid\":\"f8e0d74ba172bc3779c1d741eb1bc0bd\",\"realname\":\"u6811u6751\"}]',1545887825,'1'),
	(9,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0}]',1546423619,'1'),
	(10,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0}]',1546424681,'1'),
	(11,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0}]',1546442223,'1'),
	(12,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0}]',1546442369,'1'),
	(13,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0}]',1546444120,'1'),
	(14,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0}]',1546444803,'1'),
	(15,'[{\"uid\":\"5c835e039058fe1819e6763e214f745c\",\"realname\":\"sking\",\"names\":\"\",\"total\":0},{\"uid\":\"379403f090c118f7e3233ca6457e81bf\",\"realname\":\"SiXing\",\"names\":\"\",\"total\":0}]',1546575145,'f8e0d74ba172bc3779c1d741eb1bc0bd'),
	(16,'[{\"uid\":\"1ec88d6f31006b0fee1bd4f34d343d20\",\"realname\":\"u51e0u7c73\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1546576803,'1'),
	(17,'[{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0},{\"uid\":\"1ec88d6f31006b0fee1bd4f34d343d20\",\"realname\":\"u51e0u7c73\",\"names\":\"\",\"total\":0}]',1546659951,'f8e0d74ba172bc3779c1d741eb1bc0bd'),
	(18,'[{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1573815932,'1'),
	(19,'[{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1573815934,'1'),
	(20,'[{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1573815934,'1'),
	(21,'[{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1573815934,'1'),
	(22,'[{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1573815935,'1'),
	(23,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1573824203,'1'),
	(24,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1573824435,'1'),
	(25,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1573824556,'1'),
	(26,'[{\"uid\":\"1\",\"realname\":\"u7ba1u7406u5458\",\"names\":\"\",\"total\":0},{\"uid\":\"2d204e70cbb18aaee963d37224cfb1a2\",\"realname\":\"u94a2u76d4\",\"names\":\"\",\"total\":0}]',1573824573,'1');

/*!40000 ALTER TABLE `order_strong_man` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_tg_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_tg_log`;

CREATE TABLE `order_tg_log` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_uid` char(32) NOT NULL DEFAULT '' COMMENT '消息操作对象uid',
  `params` text,
  `type` smallint(2) unsigned NOT NULL DEFAULT '1' COMMENT '1生日通知，2护照到期通知，3其他',
  `remark` varchar(500) DEFAULT 'null' COMMENT '备注说明',
  `create_user` char(32) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL,
  `update_user` char(32) DEFAULT '0',
  `update_time` int(11) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='请假表';

LOCK TABLES `order_tg_log` WRITE;
/*!40000 ALTER TABLE `order_tg_log` DISABLE KEYS */;

INSERT INTO `order_tg_log` (`log_id`, `object_uid`, `params`, `type`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,'2d204e70cbb18aaee963d37224cfb1a2','{\"chat_id\":\"508945721\",\"text\":\"这个月是【钢盔】的生日！（1989-01-09）\"}',1,'null','0',1548217141,'0',0,'0',0),
	(2,'2d204e70cbb18aaee963d37224cfb1a2','{\"chat_id\":\"508945721\",\"text\":\"这个月是【钢盔】的生日！（1989-01-09）\"}',1,'null','0',1548217201,'0',0,'0',0),
	(3,'2d204e70cbb18aaee963d37224cfb1a2','{\"chat_id\":\"508945721\",\"text\":\"这个月是【钢盔】的生日！（1989-01-09）\"}',1,'null','0',1548217261,'0',0,'0',0);

/*!40000 ALTER TABLE `order_tg_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_user`;

CREATE TABLE `order_user` (
  `id` char(32) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(80) NOT NULL DEFAULT '' COMMENT '账号',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `name` varchar(80) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT '2' COMMENT '性别 0=男、1=女、2=未知',
  `age` tinyint(1) DEFAULT '0' COMMENT '年龄',
  `location` varchar(200) DEFAULT NULL COMMENT '地点',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(80) DEFAULT NULL COMMENT '邮箱',
  `email_verified` tinyint(1) DEFAULT '0' COMMENT '是否邮箱验证',
  `scope` varchar(2000) DEFAULT 'base' COMMENT '授权范围',
  `permissions` varchar(2000) DEFAULT NULL,
  `create_user` char(32) DEFAULT '0',
  `create_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) DEFAULT '0' COMMENT '修改时间',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table order_work
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_work`;

CREATE TABLE `order_work` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(2) unsigned NOT NULL DEFAULT '1' COMMENT '1接机2送机3其他',
  `time` int(10) unsigned NOT NULL COMMENT '服务时间',
  `take_address` varchar(500) NOT NULL DEFAULT '' COMMENT '接地点',
  `to_address` varchar(500) DEFAULT '' COMMENT '送地点',
  `flight_on` varchar(30) DEFAULT '' COMMENT '航班号',
  `flight_fly_time` int(11) unsigned DEFAULT '0' COMMENT '起飞时间',
  `remark` text COMMENT '备注',
  `project_name` varchar(300) DEFAULT NULL COMMENT '所属项目组',
  `number` varchar(100) DEFAULT NULL COMMENT '接机举牌号码',
  `visa` tinyint(1) unsigned DEFAULT '1' COMMENT '1无需办理签证，2商务签证，3旅游签证',
  `peoples` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '人数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1已安排，2已驳回，3未安排',
  `create_user` char(32) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL,
  `update_use` char(32) DEFAULT '0',
  `update_time` int(11) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='办事儿表';



# Dump of table sp_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_admin`;

CREATE TABLE `sp_admin` (
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '管理id',
  `pools` varchar(20) DEFAULT NULL COMMENT '权限池',
  `groups` varchar(1000) NOT NULL DEFAULT '' COMMENT '权限组',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` char(100) DEFAULT NULL COMMENT '用户密码',
  `fake_password` char(100) DEFAULT NULL COMMENT '伪造密码',
  `onetime_password` char(32) DEFAULT NULL COMMENT '一次性密码',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `potato` varchar(20) DEFAULT NULL COMMENT 'Potato',
  `safe_ips` varchar(200) DEFAULT NULL COMMENT '登陆IP限制',
  `is_first_login` tinyint(1) DEFAULT '1' COMMENT '是否首次登录',
  `date_expired` datetime DEFAULT NULL COMMENT '失效日期时间',
  `otp_auth` tinyint(1) DEFAULT '0' COMMENT 'MFA认证等级 0:禁用  1:启用  2:强制启用 [未使用]',
  `otp_authcode` char(16) DEFAULT '' COMMENT 'MFA验证码',
  `need_audit` tinyint(1) DEFAULT '0' COMMENT '登陆是否需要后台进行人工审核 0: 不需要 1:需要',
  `session_id` char(26) DEFAULT '' COMMENT '登陆时session_id',
  `session_expire` int(11) DEFAULT '1440' COMMENT 'SESSION有效期，默认24分钟',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '帐号状态 1:正常 0:禁止登陆',
  `regtime` int(11) NOT NULL COMMENT '注册时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '最后登录时间',
  `loginip` varchar(15) NOT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userid` (`username`),
  KEY `status` (`status`),
  KEY `pools` (`pools`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `sp_admin` WRITE;
/*!40000 ALTER TABLE `sp_admin` DISABLE KEYS */;

INSERT INTO `sp_admin` (`uid`, `pools`, `groups`, `username`, `password`, `fake_password`, `onetime_password`, `realname`, `email`, `potato`, `safe_ips`, `is_first_login`, `date_expired`, `otp_auth`, `otp_authcode`, `need_audit`, `session_id`, `session_expire`, `status`, `regtime`, `regip`, `logintime`, `loginip`)
VALUES
	('1',NULL,'1','admin','$2y$10$mnq6yQodeZ0JEaS5rhDqnOZjmmcqEWvyIVYh2AUvLRbZ4LdwaNO4e','$2y$10$X4u0bePFZ4aBu02FmOjqe.k9a','','管理员','seatle888@gmail.com','','127.0.0.2',0,'2088-06-08 00:00:00',0,'PKNUNEZHV57LSWE4',0,'c1rgee338tfgu69esccnct2eq3',86400,1,1504873451,'10.10.12.25',1543823402,'127.0.0.1'),
	('eea83e86ad5c708bcd7b059ae6811184',NULL,'','test','$2y$10$oXbRplKfGR/hNL9/FffuL.hXE',NULL,'','test','','','',0,NULL,0,'',0,'',1440,1,1541403213,'127.0.0.1',1542101416,'127.0.0.1');

/*!40000 ALTER TABLE `sp_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_admin_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_admin_group`;

CREATE TABLE `sp_admin_group` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `name` varchar(20) DEFAULT NULL COMMENT '用户组名称',
  `pools` varchar(20) DEFAULT NULL COMMENT '权限池',
  `purviews` text NOT NULL COMMENT '用户组权限',
  `uptime` int(10) DEFAULT NULL COMMENT '修改时间',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组表';

LOCK TABLES `sp_admin_group` WRITE;
/*!40000 ALTER TABLE `sp_admin_group` DISABLE KEYS */;

INSERT INTO `sp_admin_group` (`id`, `name`, `pools`, `purviews`, `uptime`, `addtime`)
VALUES
	('1','超级管理员',NULL,'*',1504839424,1504839424),
	('2','普通管理员',NULL,'content-index,content-add,content-edit,content-del,category-index,category-add,category-edit,category-del,member-index,member-add,member-edit,member-del,admin-editpwd,admin-editpwd_fake,admin-mypurview,admin_group-index,admin_group-add,admin_group-edit,admin_group-del,admin-index,admin-add,admin-edit,admin-del,system-edit_menu,config-index,config-add,config-edit,config-del,admin-oplog,admin-login_log,cache-index,cache-del,cache-clear,cache-redis_keys,cache-redis_info,filemanage-index,filemanage-add,filemanage-edit,filemanage-del,crond-index,crond-add,crond-edit,crond-del',1523269932,1504839539),
	('3','测试人员',NULL,'content-index,content-add,content-edit,content-del,category-index,category-add,category-edit,category-del,member-index,member-add,member-edit,member-del,admin-editpwd,admin-editpwd_fake,admin-mypurview',1532783074,1504842647);

/*!40000 ALTER TABLE `sp_admin_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_admin_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_admin_login`;

CREATE TABLE `sp_admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pools` varchar(20) NOT NULL DEFAULT 'admin' COMMENT '应用池',
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '用户ID',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `session_id` varchar(32) DEFAULT NULL COMMENT 'SESSION ID',
  `agent` varchar(500) DEFAULT NULL COMMENT '浏览器信息',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `loginip` varchar(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `logincountry` varchar(2) DEFAULT NULL COMMENT '登陆国家',
  `loginsta` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '登录时状态 1=成功，0=失败',
  `cli_hash` varchar(32) NOT NULL COMMENT '用户登录名和ip的hash',
  PRIMARY KEY (`id`),
  KEY `logintime` (`logintime`),
  KEY `cli_hash` (`cli_hash`,`loginsta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户登陆记录表';

LOCK TABLES `sp_admin_login` WRITE;
/*!40000 ALTER TABLE `sp_admin_login` DISABLE KEYS */;

INSERT INTO `sp_admin_login` (`id`, `pools`, `uid`, `username`, `session_id`, `agent`, `logintime`, `loginip`, `logincountry`, `loginsta`, `cli_hash`)
VALUES
	(491,'admin','1','admin','g4cioqeia4cn1rdolrmquuup30','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36',1542184694,'127.0.0.1',NULL,0,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(492,'admin','1','admin','g774hnhnarhsnc3ro8p6trhok2','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36',1542185265,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(493,'admin','1','admin','9f3l67ml68q46gm375qacku8e5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542684167,'192.168.83.60',NULL,1,'eed4f8583345f6a32f925fe879c5a8e9'),
	(494,'admin','1','admin','dhkj8pqb9fs1c5bclhhdk36v0k','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542703842,'192.168.83.60',NULL,1,'eed4f8583345f6a32f925fe879c5a8e9'),
	(495,'admin','1','admin','nd2f4hjesbquemaof0vov381at','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36',1542715654,'192.168.10.67',NULL,1,'c764227553886d6135a9736b848dcfb3'),
	(496,'admin','1','admin','bp7p1kbnadut3tmdrdctaip8uv','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542717840,'192.168.83.60',NULL,1,'eed4f8583345f6a32f925fe879c5a8e9'),
	(497,'admin','1','admin','qu3u5v94d50bsj4rl1u41nrsq0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542766299,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(498,'admin','1','admin','vkvv4fiac7vc1t79b8un07kab7','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542767036,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(499,'admin','1','admin','bpfghjedabl4e3pf0o9fm7iqj3','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542767245,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(500,'admin','1','admin','1eejlmig4pdd126scqpo2fl8i4','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542773447,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(501,'admin','1','admin','d4p5ug6pbl2131ev0rdg0ke4o3','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542773448,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(502,'admin','1','admin','a9n8ncuro6lilkp2rdhuchije2','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542793825,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(503,'admin','1','admin','of3niun5l9dnh6k5a1lgpfaq93','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542802995,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(504,'admin','1','admin','b5usdebcujalr6tkglhv45nb38','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542807569,'192.168.83.60',NULL,1,'eed4f8583345f6a32f925fe879c5a8e9'),
	(505,'admin','1','admin','d5m3kuieup5t3t8071g5t5li67','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542859378,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(506,'admin','1','admin','g5aq1eim9jm8m0oc40fi33rn96','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542870519,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(507,'admin','1','admin','vl06nj1gsccr0gvcr59l28cak0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1542874327,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(508,'admin','1','admin','ss57pf6utulj0bvrl7p4fbu546','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1543048853,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(509,'admin','1','admin','g1ci9od8kt0drno4jjf0sto1u0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1543573817,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(510,'admin','1','admin','e7pn0rd4p53ou2o6utd7j87d41','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1543579780,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(511,'admin','1','admin','c1rgee338tfgu69esccnct2eq3','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1543823402,'127.0.0.1',NULL,1,'7a0cb45999b8e15ec0dbb6164bf2857d');

/*!40000 ALTER TABLE `sp_admin_login` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_admin_oplog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_admin_oplog`;

CREATE TABLE `sp_admin_oplog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '项id',
  `pools` varchar(20) DEFAULT 'admin' COMMENT '应用池',
  `uid` char(32) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `session_id` char(26) DEFAULT NULL COMMENT 'SESSION ID',
  `msg` varchar(250) NOT NULL COMMENT '消息内容',
  `do_time` int(10) unsigned NOT NULL COMMENT '发生时间',
  `do_ip` varchar(15) NOT NULL COMMENT '客户端IP',
  `do_country` char(2) NOT NULL DEFAULT '' COMMENT '国家',
  `do_url` varchar(100) NOT NULL COMMENT '操作网址',
  PRIMARY KEY (`id`),
  KEY `user_name` (`username`),
  KEY `do_time` (`do_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户操作日志';

LOCK TABLES `sp_admin_oplog` WRITE;
/*!40000 ALTER TABLE `sp_admin_oplog` DISABLE KEYS */;

INSERT INTO `sp_admin_oplog` (`id`, `pools`, `uid`, `username`, `session_id`, `msg`, `do_time`, `do_ip`, `do_country`, `do_url`)
VALUES
	(1,'admin','1','admin','0l3ehd6gke9t4nutcfvebo7ag8','重置MFA 1',1541392172,'127.0.0.1','-','?ct=admin&ac=reset_mfa&id=1'),
	(2,'admin','1','admin','is6741uua8977paipt76p1p2ie','用户修改 1',1541392531,'127.0.0.1','-','?ct=admin&ac=edit&id=1&realname=管理员&email=seatle888@gmail.com&safe_ips=127.0.0.2'),
	(3,'admin','1','admin','okce1oh420cvoe018d9g5nfpug','用户添加 eea83e86ad5c708bcd7b059ae6811184',1541403213,'127.0.0.1','-','?ct=admin&ac=add&username=test&realname=test&email=&safe_ips=&session_expire=1440'),
	(4,'admin','1','admin','okce1oh420cvoe018d9g5nfpug','设置用户独立权限 eea83e86ad5c708bcd7b059ae6811184',1541403228,'127.0.0.1','-','?ct=admin&ac=purview&id=eea83e86ad5c708bcd7b059ae6811184'),
	(5,'admin','1','admin','okce1oh420cvoe018d9g5nfpug','分类添加 8',1541405965,'127.0.0.1','-','?ct=category&ac=add&name=testgggg'),
	(6,'admin','1','admin','9hssql45kiigiikh3jptihgbfn','会员添加 3',1541754398,'127.0.0.1','-','?ct=member&ac=add&name=jjjj&age=10&email=owner888@163.com&address=fesfesfes'),
	(7,'admin','1','admin','qec89l9fstm7i62rneopugjsec','会员修改 3',1541763755,'127.0.0.1','-','?ct=member&ac=edit&id=3&name=jjjj&age=11&email=owner888@163.com&address=fesfesfes'),
	(8,'admin','1','admin','qec89l9fstm7i62rneopugjsec','会员修改 3',1541763763,'127.0.0.1','-','?ct=member&ac=edit&id=3&name=test&age=11&email=owner888@163.com&address=fesfesfes'),
	(9,'admin','1','admin','qec89l9fstm7i62rneopugjsec','会员修改 1',1541763781,'127.0.0.1','-','?ct=member&ac=edit&id=1&name=111&age=12&email=1111@163.com&address=fesjfe'),
	(10,'admin','1','admin','qec89l9fstm7i62rneopugjsec','会员修改 2',1541763792,'127.0.0.1','-','?ct=member&ac=edit&id=2&name=222&age=20&email=222@163.com&address=fesfe'),
	(11,'admin','1','admin','qec89l9fstm7i62rneopugjsec','会员修改 1',1541763798,'127.0.0.1','-','?ct=member&ac=edit&id=1&name=测试一下&age=12&email=1111@163.com&address=fesjfe'),
	(12,'admin','1','admin','5q16raoqvdbg8ossvpsgmvoeq0','伪装密码 1',1541843801,'127.0.0.1','-','?ct=admin&ac=editpwd_fake'),
	(13,'admin','1','admin','i0utq3b7fkgcdh5166mp7hjk1i','重置MFA 1',1542101477,'127.0.0.1','-','?ct=admin&ac=reset_mfa&id=1');

/*!40000 ALTER TABLE `sp_admin_oplog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_admin_parent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_admin_parent`;

CREATE TABLE `sp_admin_parent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(32) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sp_admin_purview
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_admin_purview`;

CREATE TABLE `sp_admin_purview` (
  `pools` varchar(20) DEFAULT 'admin',
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '管理员ID',
  `purviews` text NOT NULL COMMENT '配置字符',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限表';

LOCK TABLES `sp_admin_purview` WRITE;
/*!40000 ALTER TABLE `sp_admin_purview` DISABLE KEYS */;

INSERT INTO `sp_admin_purview` (`pools`, `uid`, `purviews`)
VALUES
	('admin','eea83e86ad5c708bcd7b059ae6811184','content-index,category-del,member-index,member-add');

/*!40000 ALTER TABLE `sp_admin_purview` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_approval
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_approval`;

CREATE TABLE `sp_approval` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `approval_no` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '审批编号',
  `cost_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '费用类型，1=项目费用，2=内部开支',
  `currency_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '货币编号',
  `total_amount` decimal(10,0) unsigned NOT NULL DEFAULT '0' COMMENT '申请总金额',
  `apply_reason` varchar(1500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '申请理由，最多150个字',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0=审批中，1=已通过，2=被驳回，3=撤单',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `create_user` char(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_approval_no` (`approval_no`) USING BTREE,
  KEY `index_cost_type` (`cost_type`) USING BTREE,
  KEY `index_status` (`status`) USING BTREE,
  KEY `index_create_user` (`create_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审批表';

LOCK TABLES `sp_approval` WRITE;
/*!40000 ALTER TABLE `sp_approval` DISABLE KEYS */;

INSERT INTO `sp_approval` (`id`, `approval_no`, `cost_type`, `currency_code`, `total_amount`, `apply_reason`, `status`, `update_time`, `update_user`, `create_time`, `create_user`)
VALUES
	(1,X'31353138323630313937',1,X'434E59',100000,X'31',0,1538032706,'1',1538032706,'1'),
	(2,X'31363134333632393131',1,X'434E59',12900,X'6A66646F6A66696F6A666F6977',1,1538036076,'1',1538036076,'1'),
	(3,X'31303232323133333033',2,X'434E59',12,X'31303235',1,1540434141,'1',1540434141,'1'),
	(4,X'31303537323033333438',2,X'434E59',5000001,X'31303235',0,1540436240,'1',1540436240,'1'),
	(5,X'31303534333734303833',1,X'434E59',1111,X'63647363736463736463736463',0,1542768877,'1',1542768877,'1'),
	(6,X'31303534343031323837',1,X'434E59',1111,X'63647363736463736463736463',0,1542768880,'1',1542768880,'1');

/*!40000 ALTER TABLE `sp_approval` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_approval_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_approval_admin`;

CREATE TABLE `sp_approval_admin` (
  `approval_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审批ID',
  `admin_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '审批人ID',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审批顺序，升序',
  `reason` varchar(450) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '审批原因',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审批状态，0=未审批，1=同意，2=不同意',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审批时间戳',
  `remind_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '催单次数',
  `last_remind_timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最近一次催单时间戳',
  PRIMARY KEY (`approval_id`,`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审批人员关联表';

LOCK TABLES `sp_approval_admin` WRITE;
/*!40000 ALTER TABLE `sp_approval_admin` DISABLE KEYS */;

INSERT INTO `sp_approval_admin` (`approval_id`, `admin_id`, `sort`, `reason`, `status`, `timestamp`, `remind_count`, `last_remind_timestamp`)
VALUES
	(1,X'31',0,X'',0,0,0,0),
	(2,X'31',0,X'',1,1538036090,0,0),
	(3,X'31',0,X'',1,1540434157,0,0),
	(4,X'31',0,X'',0,0,1,1541822771),
	(5,X'3261316432636634376662303736643531336439376265383039343835333262',0,X'',0,0,0,0),
	(5,X'33',1,X'',0,0,0,0),
	(6,X'3261316432636634376662303736643531336439376265383039343835333262',0,X'',0,0,0,0),
	(6,X'33',1,X'',0,0,0,0);

/*!40000 ALTER TABLE `sp_approval_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_approval_copy_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_approval_copy_admin`;

CREATE TABLE `sp_approval_copy_admin` (
  `approval_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审批ID',
  `admin_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '抄送人ID',
  PRIMARY KEY (`approval_id`,`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审批抄送人关联表';

LOCK TABLES `sp_approval_copy_admin` WRITE;
/*!40000 ALTER TABLE `sp_approval_copy_admin` DISABLE KEYS */;

INSERT INTO `sp_approval_copy_admin` (`approval_id`, `admin_id`)
VALUES
	(1,X'31'),
	(2,X'31'),
	(3,X'31'),
	(4,X'31'),
	(5,X'3261316432636634376662303736643531336439376265383039343835333262'),
	(5,X'33'),
	(6,X'3261316432636634376662303736643531336439376265383039343835333262'),
	(6,X'33');

/*!40000 ALTER TABLE `sp_approval_copy_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_budget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_budget`;

CREATE TABLE `sp_budget` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '所属用户id',
  `department_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门id',
  `year` smallint(4) NOT NULL COMMENT '年',
  `month` tinyint(2) NOT NULL COMMENT '月',
  `money` int(11) NOT NULL COMMENT '金额',
  `money_type` varchar(5) DEFAULT 'CNY' COMMENT '币种类型',
  `create_time` int(11) NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '0',
  UNIQUE KEY `uid` (`uid`,`year`,`month`,`department_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预算表';

LOCK TABLES `sp_budget` WRITE;
/*!40000 ALTER TABLE `sp_budget` DISABLE KEYS */;

INSERT INTO `sp_budget` (`uid`, `department_id`, `year`, `month`, `money`, `money_type`, `create_time`, `create_user`)
VALUES
	(1,0,2018,1,100,'CNY',1538107033,'1'),
	(1,0,2018,2,0,'CNY',1538107033,'1'),
	(1,0,2018,3,0,'CNY',1538107033,'1'),
	(1,0,2018,4,0,'CNY',1538107033,'1'),
	(1,0,2018,5,50,'CNY',1538107033,'1'),
	(1,0,2018,6,0,'CNY',1538107033,'1'),
	(1,0,2018,7,0,'CNY',1538107033,'1'),
	(1,0,2018,8,0,'CNY',1538107033,'1'),
	(1,0,2018,9,300000,'CNY',1538107033,'1'),
	(1,0,2018,10,0,'CNY',1538107033,'1'),
	(1,0,2018,11,0,'CNY',1538107033,'1'),
	(1,0,2018,12,0,'CNY',1538107033,'1');

/*!40000 ALTER TABLE `sp_budget` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_category`;

CREATE TABLE `sp_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类表',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `create_user` int(11) DEFAULT NULL COMMENT '创建用户',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改用户',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

LOCK TABLES `sp_category` WRITE;
/*!40000 ALTER TABLE `sp_category` DISABLE KEYS */;

INSERT INTO `sp_category` (`id`, `name`, `sort`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'视频',2,1,1511258578,1,1516347122),
	(2,'音乐',3,1,1511258584,NULL,NULL),
	(3,'小说',4,1,1511258589,1,1535016662),
	(8,'testgggg',100,1,1541405965,NULL,NULL);

/*!40000 ALTER TABLE `sp_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_comment`;

CREATE TABLE `sp_comment` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级评论ID',
  `at_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '@用户ID',
  `object_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '评论对象ID，比如项目ID、日报ID',
  `object_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '评论对象类型，1=项目，2=日报',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型，1=动态，2=全部留言，3=个人留言',
  `comment` varchar(3000) DEFAULT NULL COMMENT '评论內容',
  `link` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是创建项目时的默认留言，1是 0否',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间戳',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间戳',
  `delete_user` char(32) NOT NULL DEFAULT '0',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间戳',
  PRIMARY KEY (`id`),
  KEY `index_delete_time` (`delete_time`) USING BTREE,
  KEY `index_object_id_type_pid` (`object_id`,`object_type`,`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='評論內容表';

LOCK TABLES `sp_comment` WRITE;
/*!40000 ALTER TABLE `sp_comment` DISABLE KEYS */;

INSERT INTO `sp_comment` (`id`, `pid`, `at_id`, `object_id`, `object_type`, `type`, `comment`, `link`, `is_default`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,0,X'30',1,1,3,NULL,'',1,'1',1538023345,'0',0,'0',0),
	(2,0,X'30',1,1,1,'发布新项目：測試項目','?ct=projects&ac=mysponsor&type=create',0,'1',1538023345,'0',0,'0',0),
	(3,0,X'30',2,1,3,'创建项目时的留言','',1,'1',1538024186,'0',0,'0',0),
	(4,0,X'30',2,1,1,'发布新项目：测试项目001','?ct=projects&ac=participate&type=join',0,'1',1538024187,'0',0,'0',0),
	(5,0,X'30',2,1,1,'添加了参与者：admin','',0,'1',1538024309,'0',0,'0',0),
	(6,0,X'30',2,1,1,'删除了参与者：admin  ','',0,'1',1538024313,'0',0,'0',0),
	(7,0,X'30',3,1,3,'水淀粉','',1,'1',1538031937,'0',0,'0',0),
	(8,0,X'30',3,1,1,'发布新项目：测试项目002','?ct=projects&ac=mysponsor&type=create',0,'1',1538031938,'0',0,'0',0),
	(9,0,X'30',3,1,2,'test001进行全部留言','',0,'c8653fd1ff8cf7ba3bd2a58804185b68',1538033096,'0',0,'0',0),
	(10,9,X'6338363533666431666638636637626133626432613538383034313835623638',3,1,2,'答复','',0,'c8653fd1ff8cf7ba3bd2a58804185b68',1538033101,'0',0,'0',1538033105),
	(11,9,X'6338363533666431666638636637626133626432613538383034313835623638',3,1,2,'水淀粉','',0,'c8653fd1ff8cf7ba3bd2a58804185b68',1538033110,'0',0,'0',1538033126),
	(12,9,X'6338363533666431666638636637626133626432613538383034313835623638',3,1,2,'水淀粉答复','',0,'1',1538033119,'0',0,'0',0),
	(13,0,X'30',3,1,3,'水淀粉','',0,'1',1538033133,'0',0,'0',0),
	(14,0,X'30',4,1,3,NULL,'',1,'1',1538035408,'0',0,'0',0),
	(15,0,X'30',4,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1538035408,'0',0,'0',0),
	(16,0,X'30',5,1,3,NULL,'',1,'1',1538035428,'0',0,'0',0),
	(17,0,X'30',5,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1538035428,'0',0,'0',0),
	(18,0,X'30',6,1,3,NULL,'',1,'1',1538035613,'0',0,'0',0),
	(19,0,X'30',6,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1538035613,'0',0,'0',0),
	(20,0,X'30',6,1,1,'创建了添加子項目','',0,'1',1538035731,'0',0,'0',0),
	(21,0,X'30',7,1,1,'发布了添加子項目','',0,'1',1538035731,'0',0,'0',0),
	(22,0,X'30',8,1,3,'的','',1,'1',1538035751,'0',0,'0',0),
	(23,0,X'30',8,1,1,'发布新项目：测试项目003','?ct=projects&ac=mysponsor&type=create',0,'1',1538035751,'0',0,'0',0),
	(24,0,X'30',9,1,3,NULL,'',1,'1',1538035810,'0',0,'0',0),
	(25,0,X'30',9,1,1,'发布新项目：dvffdvd','?ct=projects&ac=index&type=execute',0,'1',1538035811,'0',0,'0',0),
	(26,0,X'30',10,1,3,NULL,'',1,'1',1538035834,'0',0,'0',0),
	(27,0,X'30',10,1,1,'发布新项目：手动方式分','?ct=projects&ac=mysponsor&type=create',0,'1',1538035834,'0',0,'0',0),
	(28,0,X'30',8,1,1,'创建了子項目','',0,'1',1538035973,'0',0,'0',0),
	(29,0,X'30',11,1,3,'','',1,'1',1538035973,'0',0,'0',0),
	(30,0,X'30',11,1,1,'发布了子項目','',0,'1',1538035973,'0',0,'0',0),
	(31,0,X'30',12,1,1,'发布新项目：测试项目005','?ct=projects&ac=mysponsor&type=create',0,'1',1538036308,'0',0,'0',0),
	(32,0,X'30',12,1,1,'添加了参与者：admin','',0,'1',1538036964,'0',0,'0',0),
	(33,0,X'30',12,1,1,'修改项目描述：答复jvdidjiodsjvo','',0,'1',1538037010,'0',0,'0',0),
	(34,0,X'30',12,1,1,'添加了参与者：azhang2','',0,'1',1538037033,'0',0,'0',0),
	(35,0,X'30',12,1,1,'修改项目名称：测试项目005rtt3tet','',0,'1',1538037078,'0',0,'0',0),
	(36,0,X'30',12,1,1,'修改留言内容为：grtgrg','',0,'1',1538037078,'0',0,'0',0),
	(37,0,X'30',12,1,1,'修改相关人员留言权限','',0,'1',1538037078,'0',0,'0',0),
	(38,0,X'30',12,1,3,'grtgrg','',1,'1',1538037078,'0',0,'0',0),
	(39,0,X'30',12,1,3,'grtgrg','',1,'1',1538037078,'0',0,'0',0),
	(40,0,X'30',12,1,3,'grtgrg','',1,'1',1538037078,'0',0,'0',0),
	(41,0,X'30',12,1,2,'vdsjsiojdjvsvvs','',0,'1',1538037352,'0',0,'0',0),
	(42,38,X'31',12,1,3,'vsfvdfvdfvdfv','',0,'1',1538037362,'0',0,'0',0),
	(43,0,X'30',105,1,1,'添加了参与者:admin,test0227','',0,'0a62896fbbdd767a7e57d103f4623eca',1538037596,'0',0,'0',0),
	(44,0,X'30',13,1,1,'发布新项目：測試項目22222','?ct=projects&ac=index&type=execute',0,'1',1538037680,'0',0,'0',0),
	(45,0,X'30',14,1,1,'发布新项目：vfdvvdfv','?ct=projects&ac=index&type=execute',0,'b3ac4d6fa016464979190d4dd1ff80b8',1538037714,'0',0,'0',0),
	(46,0,X'30',13,1,2,'vfdvdvevffevf','',0,'b3ac4d6fa016464979190d4dd1ff80b8',1538037730,'0',0,'0',1538037789),
	(47,0,X'30',13,1,2,'njdsojiosjoicdjvfijvdjivjidfvf','',0,'b3ac4d6fa016464979190d4dd1ff80b8',1538037823,'0',0,'0',0),
	(48,47,X'6233616334643666613031363436343937393139306434646431666638306238',13,1,2,'vvdvdvdf','',0,'b3ac4d6fa016464979190d4dd1ff80b8',1538037835,'0',0,'0',0),
	(49,0,X'30',15,1,1,'发布新项目：測試項目dvvfvf','?ct=projects&ac=index&type=execute',0,'1',1538037976,'0',0,'0',0),
	(50,0,X'30',16,1,1,'发布新项目：測試項目3333','?ct=projects&ac=index&type=execute',0,'1',1538038031,'0',0,'0',0),
	(51,0,X'30',17,1,1,'发布新项目：测试_Chris_20180927','?ct=projects&ac=mysponsor&type=create',0,'0a62896fbbdd767a7e57d103f4623eca',1538040286,'0',0,'0',0),
	(52,0,X'30',18,1,1,'发布新项目：测试_Chris_20180927-1','?ct=projects&ac=mysponsor&type=create',0,'0a62896fbbdd767a7e57d103f4623eca',1538041000,'0',0,'0',0),
	(53,0,X'30',19,1,1,'发布新项目：测试_Chris_20180927-1','?ct=projects&ac=mysponsor&type=create',0,'0a62896fbbdd767a7e57d103f4623eca',1538042014,'0',0,'0',0),
	(54,0,X'30',17,1,1,'修改项目类型','',0,'0a62896fbbdd767a7e57d103f4623eca',1538042045,'0',0,'0',0),
	(55,0,X'30',17,1,1,'修改相关公司','',0,'0a62896fbbdd767a7e57d103f4623eca',1538043310,'0',0,'0',0),
	(56,0,X'30',17,1,1,'修改相关公司','',0,'0a62896fbbdd767a7e57d103f4623eca',1538044322,'0',0,'0',0),
	(57,0,X'30',17,1,1,'修改相关公司','',0,'0a62896fbbdd767a7e57d103f4623eca',1538044340,'0',0,'0',0),
	(58,0,X'30',17,1,1,'删除了相关人员：chris  ','',0,'0a62896fbbdd767a7e57d103f4623eca',1538044724,'0',0,'0',0),
	(59,0,X'30',17,1,1,'删除了相关人员：admin  ，添加了相关人员：azhang2','',0,'0a62896fbbdd767a7e57d103f4623eca',1538044733,'0',0,'0',0),
	(60,0,X'30',16,1,1,'删除了相关人员：admin  ，添加了相关人员：test0227','',0,'1',1538044911,'0',0,'0',0),
	(61,0,X'30',17,1,1,'删除了相关公司：,  ，添加了相关公司：admin','',0,'0a62896fbbdd767a7e57d103f4623eca',1538107913,'0',0,'0',0),
	(62,0,X'30',17,1,1,'删除了相关公司：admin,admin  ','',0,'0a62896fbbdd767a7e57d103f4623eca',1538109262,'0',0,'0',0),
	(63,0,X'30',17,1,1,'删除了相关公司：测试公司002,测试公司002  ，添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538109367,'0',0,'0',0),
	(64,0,X'30',17,1,1,'删除了相关公司：测试公司001,测试公司001  ，添加了相关公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538109433,'0',0,'0',0),
	(65,0,X'30',17,1,1,NULL,'',0,'0a62896fbbdd767a7e57d103f4623eca',1538109807,'0',0,'0',0),
	(66,0,X'30',17,1,1,NULL,'',0,'0a62896fbbdd767a7e57d103f4623eca',1538109838,'0',0,'0',0),
	(67,0,X'30',17,1,1,'删除了相关公司：测试公司002  ，添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538110370,'0',0,'0',0),
	(68,0,X'30',17,1,1,'删除了相关公司：测试公司001  ，添加了相关公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538110540,'0',0,'0',0),
	(69,0,X'30',17,1,1,'添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120317,'0',0,'0',0),
	(70,0,X'30',17,1,1,'添加了相关公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120328,'0',0,'0',0),
	(71,0,X'30',17,1,1,'添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120393,'0',0,'0',0),
	(72,0,X'30',17,1,1,'删除了相关公司：测试公司001  ','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120400,'0',0,'0',0),
	(73,0,X'30',17,1,1,'删除了相关公司：测试公司002  ，添加了相关公司：测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538120452,'0',0,'0',0),
	(74,0,X'30',16,1,1,'删除了相关公司：测试公司002  ','',0,'1',1538189945,'0',0,'0',0),
	(75,0,X'30',16,1,1,'添加了相关公司：测试公司002,请问请问请问请问123','',0,'1',1538189956,'0',0,'0',0),
	(76,0,X'30',16,1,1,'删除了相关公司：请问请问请问请问123  ，添加了相关公司：请问请问请问请问','',0,'1',1538189971,'0',0,'0',0),
	(77,0,X'30',16,1,1,'删除了相关公司：测试公司001,测试公司002  ，添加了相关公司：请问请问请问请问123','',0,'1',1538189981,'0',0,'0',0),
	(78,0,X'30',16,1,1,'修改项目类型','',0,'1',1538190003,'0',0,'0',0),
	(79,0,X'30',16,1,1,'添加了相关人员：azhang2','',0,'1',1538190025,'0',0,'0',0),
	(80,0,X'30',16,1,1,'修改项目名称：測試項目3333111','',0,'1',1538190065,'0',0,'0',0),
	(81,0,X'30',16,1,1,'修改项目描述：dsvfv2','',0,'1',1538190079,'0',0,'0',0),
	(82,0,X'30',16,1,1,'修改项目名称：測試項目333311122','',0,'1',1538190079,'0',0,'0',0),
	(83,0,X'30',16,1,1,'修改留言内容为：2','',0,'1',1538190079,'0',0,'0',0),
	(84,0,X'30',16,1,1,'修改项目类型','',0,'1',1538190079,'0',0,'0',0),
	(85,0,X'30',16,1,3,'2','',1,'1',1538190079,'0',0,'0',0),
	(86,0,X'30',16,1,1,'修改相关公司','',0,'1',1538190097,'0',0,'0',0),
	(87,0,X'30',16,1,1,'修改项目类型','',0,'1',1538190132,'0',0,'0',0),
	(88,0,X'30',16,1,1,'修改相关公司','',0,'1',1538190147,'0',0,'0',0),
	(89,0,X'30',19,1,1,'删除公司：Array, 测试公司002; 新增公司：Array, 测试公司002, 请问请问请问请问, 测试公司001','',0,'0a62896fbbdd767a7e57d103f4623eca',1538206864,'0',0,'0',0),
	(90,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538206945,'0',0,'0',0),
	(91,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207005,'0',0,'0',0),
	(92,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207005,'0',0,'0',0),
	(93,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207062,'0',0,'0',0),
	(94,0,X'30',19,1,1,'删除公司：Array, Array, 测试公司001; 新增公司：Array, Array, 测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207063,'0',0,'0',0),
	(95,0,X'30',19,1,1,'删除公司：Array, Array; 新增公司：Array, Array','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207133,'0',0,'0',0),
	(96,0,X'30',19,1,1,'删除公司：测试公司001; 新增公司：测试公司001, 测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207153,'0',0,'0',0),
	(97,0,X'30',19,1,1,'删除公司：测试公司001; 新增公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207173,'0',0,'0',0),
	(98,0,X'30',19,1,1,'删除公司：测试公司001; 新增公司：测试公司002','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207186,'0',0,'0',0),
	(99,0,X'30',19,1,1,'删除公司：请问请问请问请问, 测试公司001; 新增公司：测试公司002, 请问请问请问请问123','',0,'0a62896fbbdd767a7e57d103f4623eca',1538207330,'0',0,'0',0),
	(100,0,X'30',19,1,1,'删除相关人员：azhang, azhang3; 新增相关人员：admin, test0227','',0,'0a62896fbbdd767a7e57d103f4623eca',1538208028,'0',0,'0',0),
	(101,0,X'30',16,1,1,'删除相关人员：azhang2; 新增相关人员：azhang1','',0,'1',1538208247,'0',0,'0',0),
	(102,0,X'30',16,1,1,'删除公司：请问请问请问请问123; 新增公司：najkdjflkajslkdjflkajskldjlfkas','',0,'1',1538208257,'0',0,'0',0),
	(103,0,X'30',16,1,1,'新增相关人员：azhang, chris','',0,'1',1538208269,'0',0,'0',0),
	(104,0,X'30',16,1,1,'删除了相关人员：azhang1,azhang  ','',0,'1',1538208282,'0',0,'0',0),
	(105,0,X'30',16,1,1,'删除了相关公司：najkdjflkajslkdjflkajskldjlfkas  ，添加了相关公司：请问请问请问请问123','',0,'1',1538208291,'0',0,'0',0),
	(106,0,X'30',19,1,1,'新增相关人员：克里斯的biubiubiu','',0,'0a62896fbbdd767a7e57d103f4623eca',1538208505,'0',0,'0',0),
	(107,0,X'30',16,1,1,'修改项目描述：dsvfv2333','',0,'1',1538208715,'0',0,'0',0),
	(108,0,X'30',16,1,1,'修改项目名称：測試項目33331112233','',0,'1',1538208715,'0',0,'0',0),
	(109,0,X'30',16,1,1,'修改留言内容为：2333','',0,'1',1538208715,'0',0,'0',0),
	(110,0,X'30',16,1,1,'修改项目类型','',0,'1',1538208715,'0',0,'0',0),
	(111,0,X'30',16,1,1,'删除公司：请问请问请问请问, 请问请问请问请问123; 新增公司：najkdjflkajslkdjflkajskldjlfkas','',0,'1',1538208715,'0',0,'0',0),
	(112,0,X'30',16,1,1,'删除相关人员：克里斯的biubiubiu; 新增相关人员：azhang','',0,'1',1538208715,'0',0,'0',0),
	(113,0,X'30',16,1,3,'2333','',1,'1',1538208715,'0',0,'0',0),
	(114,0,X'30',16,1,1,'修改留言内容为：2333实时','',0,'1',1538208724,'0',0,'0',0),
	(115,0,X'30',16,1,1,'修改项目类型','',0,'1',1538208724,'0',0,'0',0),
	(116,0,X'30',16,1,1,'修改项目描述：dsvfv2333是的','',0,'1',1538208743,'0',0,'0',0),
	(117,0,X'30',16,1,1,'修改留言内容为：2333实时的','',0,'1',1538208743,'0',0,'0',0),
	(118,0,X'30',16,1,1,'修改项目类型','',0,'1',1538208743,'0',0,'0',0),
	(119,0,X'30',16,1,1,'删除公司：测试公司001, najkdjflkajslkdjflkajskldjlfkas; 新增公司：请问请问请问请问123','',0,'1',1538208743,'0',0,'0',0),
	(120,0,X'30',16,1,1,'删除相关人员：测试0227, azhang','',0,'1',1538208743,'0',0,'0',0),
	(121,0,X'30',16,1,3,'2333实时的','',1,'1',1538208743,'0',0,'0',0),
	(122,0,X'30',16,1,1,'添加了相关人员：azhang2,test0227','',0,'1',1538208762,'0',0,'0',0),
	(123,0,X'30',16,1,1,'添加了相关公司：测试公司001','',0,'1',1538208771,'0',0,'0',0),
	(124,0,X'30',16,1,1,'修改项目名称：測試項目','',0,'1',1538208847,'0',0,'0',0),
	(125,0,X'30',16,1,1,'修改项目名称：測試項目001','',0,'1',1538208857,'0',0,'0',0),
	(126,0,X'30',16,1,1,'新增相关人员：azhang','',0,'1',1538208867,'0',0,'0',0),
	(127,0,X'30',16,1,1,'删除相关人员：azhang','',0,'1',1538208873,'0',0,'0',0),
	(128,0,X'30',16,1,1,'删除相关人员：azhang2; 新增相关人员：克里斯的biubiubiu','',0,'1',1538208882,'0',0,'0',0),
	(129,0,X'30',16,1,1,'新增公司：请问请问请问请问','',0,'1',1538208889,'0',0,'0',0),
	(130,0,X'30',16,1,1,'删除公司：请问请问请问请问123','',0,'1',1538208909,'0',0,'0',0),
	(131,0,X'30',16,1,1,'删除公司：测试公司002; 新增公司：请问请问请问请问123','',0,'1',1538208917,'0',0,'0',0),
	(132,0,X'30',16,1,1,'修改项目类型','',0,'1',1538208924,'0',0,'0',0),
	(133,0,X'30',16,1,1,'修改项目描述：dsvfv2333是的111','',0,'1',1538208931,'0',0,'0',0),
	(134,0,X'30',16,1,3,'2333实时的','',1,'1',1538208943,'0',0,'0',0),
	(135,0,X'30',16,1,1,'修改留言内容为：2333实时的1','',0,'1',1538208947,'0',0,'0',0),
	(136,0,X'30',16,1,1,'删除了相关公司：请问请问请问请问123  ','',0,'1',1538208974,'0',0,'0',0),
	(137,0,X'30',16,1,1,'添加了相关公司：测试公司002','',0,'1',1538208981,'0',0,'0',0),
	(138,0,X'30',16,1,1,'添加相关公司：请问请问请问请问123','',0,'1',1538209264,'0',0,'0',0),
	(139,0,X'30',16,1,1,'删除相关公司：请问请问请问请问123','',0,'1',1538209273,'0',0,'0',0),
	(140,0,X'30',16,1,1,'修改任务详情：dsvfv2333是的111555','',0,'1',1538209285,'0',0,'0',0),
	(141,0,X'30',16,1,1,'修改项目类型','',0,'1',1538209285,'0',0,'0',0),
	(142,0,X'30',16,1,1,'删除相关人员：克里斯的biubiubiu','',0,'1',1538209285,'0',0,'0',0),
	(143,0,X'30',16,1,1,'修改任务详情：dsvfv2333是的111555222','',0,'1',1538209329,'0',0,'0',0),
	(144,0,X'30',16,1,1,'修改项目名称：測試項目001222','',0,'1',1538209329,'0',0,'0',0),
	(145,0,X'30',16,1,1,'修改留言内容为：2333实时的122','',0,'1',1538209329,'0',0,'0',0),
	(146,0,X'30',16,1,1,'修改项目类型','',0,'1',1538209329,'0',0,'0',0),
	(147,0,X'30',16,1,1,'添加相关公司：请问请问请问请问123','',0,'1',1538209329,'0',0,'0',0),
	(148,0,X'30',16,1,1,'添加相关人员：azhang2','',0,'1',1538209329,'0',0,'0',0),
	(149,0,X'30',16,1,3,'2333实时的122','',1,'1',1538209329,'0',0,'0',0),
	(150,0,X'30',20,1,3,'33','',1,'1',1538209351,'0',0,'0',0),
	(151,0,X'30',20,1,1,'发布新项目：測試項目001333','?ct=projects&ac=mysponsor&type=create',0,'1',1538209351,'0',0,'0',0),
	(152,0,X'30',20,1,1,'添加了相关人员：chris','',0,'1',1538209582,'0',0,'0',0),
	(153,0,X'30',20,1,1,'添加了相关人员：test0227','',0,'1',1538209589,'0',0,'0',0),
	(154,0,X'30',20,1,1,'添加了相关人员：kenji','',0,'1',1538209601,'0',0,'0',0),
	(155,0,X'30',20,1,1,'添加了相关人员：文远测试账号','',0,'1',1538209608,'0',0,'0',0),
	(156,0,X'30',20,1,1,'删除了相关人员：chris,test0227  ','',0,'1',1538209619,'0',0,'0',0),
	(157,0,X'30',20,1,1,'添加相关公司：请问请问请问请问','',0,'1',1538209630,'0',0,'0',0),
	(158,0,X'30',20,1,1,'删除相关公司：测试公司002  ','',0,'1',1538209636,'0',0,'0',0),
	(159,0,X'30',21,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1539848269,'0',0,'0',0),
	(160,0,X'30',22,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1539848475,'0',0,'0',0),
	(161,0,X'30',23,1,1,'发布新项目：testtest001','?ct=projects&ac=index&type=execute',0,'1',1539854395,'0',0,'0',0),
	(162,0,X'30',24,1,1,'发布新项目：111111','?ct=projects&ac=index&type=execute',0,'1',1539922918,'0',0,'0',0),
	(163,0,X'30',25,1,1,'发布新项目：寄一个证件','?ct=projects&ac=mysponsor&type=create',0,'1',1540367545,'0',0,'0',0),
	(164,0,X'30',26,1,1,'发布新项目：再寄一个证件','?ct=projects&ac=mysponsor&type=create',0,'1',1540367768,'0',0,'0',0),
	(165,0,X'30',25,1,2,'资料已经准备好','',0,'1',1540368807,'0',0,'0',0),
	(166,0,X'30',25,1,3,'资料新增身份证','',0,'1',1540368836,'0',0,'0',0),
	(167,165,X'31',25,1,2,'资料看缺不缺驾驶证','',0,'1',1540368853,'0',0,'0',0),
	(168,0,X'30',25,1,1,'创建了重新寄户口本','',0,'1',1540369042,'0',0,'0',0),
	(169,0,X'30',27,1,1,'发布了重新寄户口本','',0,'1',1540369042,'0',0,'0',0),
	(170,0,X'30',25,1,1,'创建了重新寄个身份证','',0,'1',1540369215,'0',0,'0',0),
	(171,0,X'30',28,1,1,'发布了重新寄个身份证','',0,'1',1540369215,'0',0,'0',0),
	(172,0,X'30',26,1,2,'測試留言','',0,'1',1540376772,'0',0,'0',0),
	(173,0,X'30',28,1,2,'接口和客家话客家话','',0,'1',1540377137,'0',0,'0',0),
	(174,0,X'30',28,1,3,'回家赶紧换个环境','',0,'1',1540377147,'0',0,'0',0),
	(175,0,X'30',1,1,3,'玩儿 vv','',0,'1',1540378133,'0',0,'0',0),
	(176,0,X'30',1,1,3,'而为而为我','',0,'1',1540378143,'0',0,'0',0),
	(177,0,X'30',26,1,2,'再次留言','',0,'1',1540435184,'0',0,'0',0),
	(178,177,X'31',26,1,2,'这样处理不好。建议怎样怎样','',0,'1',1540435206,'0',0,'0',0),
	(179,0,X'30',29,1,1,'发布新项目：測試項目','?ct=projects&ac=index&type=execute',0,'1',1540435979,'0',0,'0',0),
	(180,0,X'30',30,1,1,'发布新项目：test888','?ct=projects&ac=index&type=execute',0,'1',1540784878,'0',0,'0',0),
	(181,0,X'30',30,1,3,'1111111111111111111111111111111111111111','',0,'1',1540787173,'0',0,'0',0),
	(182,181,X'31',30,1,3,'asdlfjasldfj alsdkjf lasjdf laskjdflaksdjf alsdkjf laskdjf lakjsdf','',0,'1',1540787187,'0',0,'0',0),
	(183,0,X'30',30,1,2,'test','',0,'1',1540796836,'0',0,'0',1541648227),
	(184,0,X'30',31,1,1,'发布新项目：測試項目','?ct=projects&ac=mysponsor&type=create',0,'1',1542768746,'0',0,'0',0);

/*!40000 ALTER TABLE `sp_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_config`;

CREATE TABLE `sp_config` (
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `value` text COMMENT '变量值',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '说明标题',
  `info` varchar(200) NOT NULL COMMENT '备注',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '分组',
  `type` varchar(10) NOT NULL DEFAULT 'string' COMMENT '变量类型',
  PRIMARY KEY (`name`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置变量表';

LOCK TABLES `sp_config` WRITE;
/*!40000 ALTER TABLE `sp_config` DISABLE KEYS */;

INSERT INTO `sp_config` (`sort`, `name`, `value`, `title`, `info`, `groupid`, `type`)
VALUES
	(4,'attachment_image','jpg|png|gif|bmp|ico','图片文件类型','',2,'string'),
	(5,'attachment_media','mp3|avi|mpg|mp4|3gp|flv|rm|rmvb|wmv|swf','多媒体文件类型','',2,'string'),
	(7,'attachment_size','16','最大附件大小(Mb)','',2,'number'),
	(6,'attachment_soft','zip|7z|rar|gz|bz2|tar|iso|exe|dll|doc|xls|ppt|docx|xlsx|pptx|wps|pdf|psd','其它文件件类型','',2,'string'),
	(6,'authorized_time','10','登录授权时间','用户登录多长时间会被踢出',1,'number'),
	(2,'doc_auto_des','1','自动提取摘要','',3,'bool'),
	(6,'doc_auto_des_len','150','自动摘要长度','',3,'number'),
	(1,'doc_auto_keywords','1','自动获取关键字','',3,'bool'),
	(3,'doc_auto_thumb','0','自动提取缩略图','',3,'bool'),
	(7,'doc_down_remove','0','抓取远程资源','',3,'bool'),
	(5,'doc_thumb_h','200','缩略图默认高度','',3,'number'),
	(4,'doc_thumb_w','200','缩略图默认宽度','',3,'number'),
	(0,'ip_limit','','后台登录IP限制','',0,'string'),
	(1,'open_upload','1','是否允许上传文件','',2,'bool'),
	(4,'site_description','PHPCALL开发框架','当前站点摘要信息','',1,'text'),
	(3,'site_keyword','PHPCALL开发框架','当前站点关键字','',1,'string'),
	(1,'site_name','PHPCALL开发框架','当前站点名称','',1,'string'),
	(5,'site_tj','','当前站点统计代码','',1,'text'),
	(2,'site_upload_path','/uploads','附件上传目录','',2,'string'),
	(3,'site_upload_url','http://uploads.phpcall.org','附件目录网址','如果不使用二级域名，此项留空',2,'string'),
	(2,'site_url','http://www.phpcall.org','当前站点URL','',1,'string'),
	(7,'user_guide_url',NULL,'用户向导URL','',1,'string');

/*!40000 ALTER TABLE `sp_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_content`;

CREATE TABLE `sp_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容表',
  `catid` smallint(5) DEFAULT NULL COMMENT '分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `image` char(17) DEFAULT NULL COMMENT '图片',
  `image2` char(17) DEFAULT NULL COMMENT '图片二',
  `images` varchar(200) DEFAULT NULL COMMENT '多图',
  `images2` varchar(200) DEFAULT NULL COMMENT '多图二',
  `content` text COMMENT '内容',
  `create_user` char(32) DEFAULT '0',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容表';



# Dump of table sp_crond
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_crond`;

CREATE TABLE `sp_crond` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sort` smallint(5) NOT NULL COMMENT '排序',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名',
  `filename` varchar(248) NOT NULL DEFAULT '',
  `runtime_format` varchar(20) NOT NULL,
  `lasttime` int(10) unsigned NOT NULL DEFAULT '0',
  `runtime` varchar(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `uptime` int(10) DEFAULT NULL,
  `addtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='计划任务表';



# Dump of table sp_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_customer`;

CREATE TABLE `sp_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间，用户输入',
  `creator` blob COMMENT '创建人',
  `type` smallint(5) unsigned DEFAULT NULL COMMENT '客户类型',
  `mode` tinyint(3) unsigned DEFAULT NULL COMMENT '注册方式：26企业25银行卡',
  `sourec` int(11) DEFAULT NULL COMMENT '渠道来源id',
  `person` blob COMMENT '企业法人',
  `remark` longblob COMMENT '备注',
  `name` blob COMMENT '企业名称',
  `bank_name` blob COMMENT '待定',
  `to_public_limit` blob COMMENT '对公额度',
  `to_private_limit` blob COMMENT '对私额度',
  `enterprise_web` blob COMMENT '企业网站网址',
  `enterprise_money` blob COMMENT '企业注册资金',
  `money_type` varchar(5) DEFAULT '0' COMMENT '注册资金的单位，美元。人民币子类的',
  `opening_branch` blob COMMENT '开户支行名称-->开户地址',
  `bank_number` blob COMMENT '银行卡号-->对公账号',
  `id_number` blob COMMENT '持卡人身份证号码',
  `id_type` int(11) DEFAULT '0' COMMENT '证件类型id',
  `stockholder` blob COMMENT '股东json数据',
  `business_scope` blob COMMENT '企业经营范围',
  `basic_house` blob COMMENT '基本户-->银行名称',
  `input_time` blob COMMENT '入库时间',
  `aptitude_position` blob COMMENT '资质位置',
  `cyberbank_position` blob COMMENT '网银位置',
  `status` int(11) DEFAULT NULL COMMENT 'aptitude_status资质状态',
  `cate` int(11) unsigned DEFAULT '0' COMMENT 'aptitude_cates资质类别',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `person_status` int(11) DEFAULT NULL COMMENT '法人状态',
  `aptitude_type` int(11) DEFAULT NULL COMMENT '资质类型',
  `regist_address` blob COMMENT '注册地址',
  `aptitude_detail` blob COMMENT '资质明细，多选，json数据',
  `aptitude_detail_remark` blob COMMENT '资质明细备注',
  `internet_bank_position` blob COMMENT '网银位置',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `type_index` (`type`,`mode`) USING BTREE,
  KEY `delete_user` (`delete_user`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `name_index` (`name`(1000)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息表';

LOCK TABLES `sp_customer` WRITE;
/*!40000 ALTER TABLE `sp_customer` DISABLE KEYS */;

INSERT INTO `sp_customer` (`id`, `createtime`, `creator`, `type`, `mode`, `sourec`, `person`, `remark`, `name`, `bank_name`, `to_public_limit`, `to_private_limit`, `enterprise_web`, `enterprise_money`, `money_type`, `opening_branch`, `bank_number`, `id_number`, `id_type`, `stockholder`, `business_scope`, `basic_house`, `input_time`, `aptitude_position`, `cyberbank_position`, `status`, `cate`, `create_time`, `create_user`, `update_time`, `update_user`, `person_status`, `aptitude_type`, `regist_address`, `aptitude_detail`, `aptitude_detail_remark`, `internet_bank_position`, `delete_user`, `delete_time`)
VALUES
	(1,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'AEC7CD522E3734B3682417293072DA3F',NULL,X'77B41A27CC3837BF56008FA592135B2D',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'7F04E0C7D1BCC11CA9AF2450CDD082F6',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1538022303,'1',1539932663,'1',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0),
	(2,1537977600,X'E6972F06B7D171B5ECE9C0F41663E9EC',NULL,26,2,X'8532FB7887D096CEA2BDB01916BE79AA',NULL,X'C47E9F4B929A14E253D88235E7A3A6B4',NULL,X'6E96CBC8992C4502F694445C5E5A4F22',X'82E89F7C6E8CBF2598258CCB08458DD3',X'6C18EFC59EF484C6691B866054223027A0003E144249AA2B1AC4B52D66157DB1F6D052237E8CF4110EF581D03F7B4A43',X'D695B9803C27F7A40BA53EA1C175097B','0',X'9F8D8311B47DAA3E5B46A691BFD0A529',X'4BF3BFA33602FA46EDB76FA3956DC479',NULL,0,X'870E3175BFEBC083D1349D62B06A6B790BF3EA8EF4E8616B8BB11DAA24970825',X'D7EE3CC59FB27ECC1CB3BAF6CD3BE82F',X'561D651EA2FC4D4950418010FEBBD694',X'E2AC7E555D8DD45757D867E121FE80A6',X'A5BE741A10A57CF407E40D2D967233CC',NULL,14,6,1538023088,'1',1538023340,'3',18,10,X'825353EC2A5B7A308D33927511805459',X'BB3F200C49B93B8C232D16E52BD652E7',X'3AECA68A5E9706E250B76E4F73E746AE',X'658E657C1C213A0384C04A2A160CFC9A','0',0),
	(5,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'0143DB63EE66B0CDFF9F69917680151E',NULL,X'6543118F8ACF7F4B34DBC44CC279C1A6CA9DC0E3F82F97D74B1265C7C5DD737F',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'7F04E0C7D1BCC11CA9AF2450CDD082F6',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1538122816,'1',0,'0',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0),
	(6,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'0143DB63EE66B0CDFF9F69917680151E',NULL,X'6543118F8ACF7F4B34DBC44CC279C1A698D1EE8F5C80E93B263B90335D8A04CD',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0EDF9EDCB9E3ED7B193D08773E752EF1C9CBAB2260A73F591F7E18BC2CFC4DF70143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1538124057,'1',1540805486,'1',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0),
	(10,1540915200,X'2D1CBBEECA96EBC22DFD2A73B6BCC394',NULL,26,1,X'0143DB63EE66B0CDFF9F69917680151E',NULL,X'FD49F3B3CC4A80A806076439D7B60F8318BDE152647344B2E7FAFFFB5248BC24',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'43941A3B8D79DA38DB0C5CE3FEBEBC63292E48C8FEDF9E5A77EB48304821E8187F25DD02823BD4671474781D7A83FD474B0BDDE5ACE089DA412B083CDBC902B5AACB74B4AB65A6A9AEC69F0E5845620762D1E8E33CB2D8E340EDCF87CB565D47',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1538196910,'1',1540956605,'1',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0),
	(11,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'0143DB63EE66B0CDFF9F69917680151E',NULL,X'E824B6579393FCEB14029EAED4522C61',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'7F04E0C7D1BCC11CA9AF2450CDD082F6',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1538215553,'1',0,'0',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','1',1538215558),
	(12,1540310400,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,227,X'2E4D5139B8720CF36FEE78189664628C',NULL,X'8070CCD1B5462BCC22B18A5336DB6C3CC39D6734E2F8E6F9007CB28F9A3F1200',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'7F04E0C7D1BCC11CA9AF2450CDD082F6',X'D695B9803C27F7A40BA53EA1C175097B','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,230,228,1540360377,'1',0,'0',231,229,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0),
	(13,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'81DA23DD4E4217C97FFAF7056ED92EDB',NULL,X'553CF0C62EA70170C01509583B70E3C9',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'7F04E0C7D1BCC11CA9AF2450CDD082F6',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1540537668,'1',1540897260,'1',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0),
	(14,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'0143DB63EE66B0CDFF9F69917680151E',NULL,X'606A9ED5FDF61DE48FF18F04CEF3D969',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'7F04E0C7D1BCC11CA9AF2450CDD082F6',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1540537880,'1',0,'0',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0),
	(15,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'0143DB63EE66B0CDFF9F69917680151E',NULL,X'218F88CD88249C0800B492065474778A',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'25C4218152B45901F6D7DF6D78CAB324',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'51A861F69A51E8E4C18EDFA689E8D188',X'A98E4F0A5C256D778358201B63E14BB2',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1540537966,'1',1541043931,'1',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0),
	(16,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'0143DB63EE66B0CDFF9F69917680151E',NULL,X'2A0980865548409A4F505704DCABCB21',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'7F04E0C7D1BCC11CA9AF2450CDD082F6',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,230,5,1540538543,'1',0,'0',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','1',1540539283),
	(17,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'0143DB63EE66B0CDFF9F69917680151E',NULL,X'9DC73E6E42E1FD5794132AFF0B440B6F',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'7F04E0C7D1BCC11CA9AF2450CDD082F6',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1541057771,'1',0,'0',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0),
	(18,0,X'0143DB63EE66B0CDFF9F69917680151E',NULL,26,1,X'0143DB63EE66B0CDFF9F69917680151E',NULL,X'6794A2B8C777F843358D5EB4254259DE',NULL,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'7F04E0C7D1BCC11CA9AF2450CDD082F6',X'0143DB63EE66B0CDFF9F69917680151E','0',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,0,X'9A26362BD6FAA1B417B2AD2B6F99679D',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',NULL,13,5,1542768841,'1',0,'0',17,9,X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E',X'0143DB63EE66B0CDFF9F69917680151E','0',0);

/*!40000 ALTER TABLE `sp_customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_customer_consumption
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_customer_consumption`;

CREATE TABLE `sp_customer_consumption` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL COMMENT '客户id',
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `remark` blob COMMENT '摘要',
  `money` blob COMMENT '金额',
  `create_time` int(11) unsigned NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned DEFAULT '0',
  `update_user` char(32) DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index` (`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户费用明细';

LOCK TABLES `sp_customer_consumption` WRITE;
/*!40000 ALTER TABLE `sp_customer_consumption` DISABLE KEYS */;

INSERT INTO `sp_customer_consumption` (`id`, `customer_id`, `add_time`, `remark`, `money`, `create_time`, `create_user`, `update_time`, `update_user`, `delete_time`, `delete_user`)
VALUES
	(1,2,1537891200,X'5F357E9498B8658878BD747426C34433E7B4FD77DCDBBE6C9C23C89412F7836D',X'82E89F7C6E8CBF2598258CCB08458DD3',1538023088,'1',1538023340,'3',0,'0'),
	(2,2,1537977600,X'5F357E9498B8658878BD747426C34433D34573B5F0351508E875C1BC962915E0',X'4C4DF25614E93253E6CBFDB523142E63',1538023088,'1',1538023340,'3',0,'0'),
	(3,1,0,X'0CC322CEF9A84D2A585082D48BF29A3C06498AF315551FFD947A210C4A0D4DAD',X'0143DB63EE66B0CDFF9F69917680151E',1538128595,'1',1539932663,'1',0,'0');

/*!40000 ALTER TABLE `sp_customer_consumption` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_customer_download
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_customer_download`;

CREATE TABLE `sp_customer_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件下载id',
  `enclosure_id` int(11) NOT NULL COMMENT '客户附件id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `delete_user` char(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户附件下载记录表';

LOCK TABLES `sp_customer_download` WRITE;
/*!40000 ALTER TABLE `sp_customer_download` DISABLE KEYS */;

INSERT INTO `sp_customer_download` (`id`, `enclosure_id`, `customer_id`, `create_time`, `create_user`, `update_time`, `update_user`, `delete_time`, `delete_user`)
VALUES
	(1,1,2,1538023942,'1',1538023942,'1',0,'0'),
	(2,15,1,1538131012,'1',1538131012,'1',0,'0'),
	(3,17,6,1538196475,'1',1538196475,'1',0,'0'),
	(4,18,6,1538196681,'1',1538196681,'1',0,'0'),
	(5,19,6,1538196855,'1',1538196855,'1',0,'0'),
	(6,21,10,1538196919,'1',1538196919,'1',0,'0'),
	(7,22,10,1538196924,'1',1538196924,'1',0,'0'),
	(8,26,1,1539932675,'1',1539932675,'1',0,'0');

/*!40000 ALTER TABLE `sp_customer_download` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_customer_enclosure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_customer_enclosure`;

CREATE TABLE `sp_customer_enclosure` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户附件id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `realname` blob COMMENT '原文件名称',
  `filepath` blob COMMENT '文件路径',
  `filename` blob NOT NULL COMMENT '附件名称',
  `type` blob NOT NULL COMMENT '附件类型，idcard=身份证；upfile=资料；hand=手持；video=视频；',
  `size` int(11) unsigned DEFAULT '0' COMMENT '文件大小，单位kb',
  `crypt_key` char(32) DEFAULT NULL COMMENT '文件加密的key值',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `delete_user` char(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `delete_user` (`delete_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户附件信息表';

LOCK TABLES `sp_customer_enclosure` WRITE;
/*!40000 ALTER TABLE `sp_customer_enclosure` DISABLE KEYS */;

INSERT INTO `sp_customer_enclosure` (`id`, `customer_id`, `realname`, `filepath`, `filename`, `type`, `size`, `crypt_key`, `create_time`, `create_user`, `update_time`, `update_user`, `delete_time`, `delete_user`)
VALUES
	(1,2,X'E44A87646DEDF91233AE3528937938A9C567182735C6613A553A08D469BCECF1CB9223D5104537C1B17E25E1A97C4867',NULL,X'688BB637F1F61A515DAF59A0B1099ABC33322A4BCE95D4CBCCFBAE871F700FA5',X'2F877AB4780E4C5B5F9FE1D9B46E2A51',4285,'055b897548d53ed78f5fdef42d89d61a',1538023089,'1',0,'0',0,'0'),
	(2,2,X'F57CAB39F4BE25D53AF9BCA433E8A51BBD8733C3072100EADD5E7CBCEB4F6907',NULL,X'2F118FA8D5CAABFF5B8E588B6A9C9F5F7A9F3D450CA4D20EAB841350BCF6D428',X'6C6FA74794E45F9357D2DF731EE104CE',5322,'796a6fa23cddb313f6b602e73e18e627',1538023089,'1',0,'0',0,'0'),
	(3,2,X'967EA2CE6B691D51AEADC45C69FBDEC5CC138AF0A805A057AE6FCDABC94E34330143DB63EE66B0CDFF9F69917680151E',NULL,X'09F2F250F3382724F959C0EED953D34DF3A96CC1EA1DE029F96E2C5F685B1DC4',X'A7F21010EFDA1DC5A7F1B268F1533E90',57,'581587f289ecb19bfcc580aea4a7a6aa',1538023089,'1',0,'0',0,'0'),
	(4,2,X'D7CD56022270B23CAAD31A22A94FFDA27C9460FB5B78C9C32C1512EEE46488221B73EBE81F5CCBDD24F9B1BF9E880938',NULL,X'2A854493BD9A46F9EE58933F12939ED933322A4BCE95D4CBCCFBAE871F700FA5',X'01799A1FC60782CC6016139DC0AB296C',4996,'1bf6fe128bf39037b09284e48a7c4d8f',1538023089,'1',0,'0',0,'0'),
	(5,5,X'5B6B523F0E12E8BCE1B46140A6CF635B5F439F7AFCF3D0E847954D277BB764B2D38F74627B6B34F232C6766328D1E4B6',NULL,X'06444E37C6A474D05499E0C5B4EAEA08DC85A954811B1DB7B7BD3BC5615A2A97',X'01799A1FC60782CC6016139DC0AB296C',18639,'c31858a74e833daeb09cc4c912ca3845',1538122963,'1',0,'0',0,'0'),
	(6,6,X'FF4C55CEEB6244D1B18F137B3390D19833322A4BCE95D4CBCCFBAE871F700FA5',NULL,X'AA7C97D992183076F0207F439C4345E5FFE2EF8DA6988FFB83E1972352B07749',X'01799A1FC60782CC6016139DC0AB296C',20209,'16b77d615cb84df01ede4c8085f7136e',1538124348,'1',0,'0',1538196142,'1'),
	(7,6,X'CAEB8599666295C8555FCB188FD5FA7633322A4BCE95D4CBCCFBAE871F700FA5',NULL,X'F8FA27D434FE3849F284EE36F3B088D0',X'01799A1FC60782CC6016139DC0AB296C',0,'',1538124360,'1',0,'0',1538124398,'1'),
	(8,6,X'38226169F64FA07CB948FF1DCB7D386933322A4BCE95D4CBCCFBAE871F700FA5',NULL,X'F8FA27D434FE3849F284EE36F3B088D0',X'01799A1FC60782CC6016139DC0AB296C',0,'',1538124382,'1',0,'0',1538124394,'1'),
	(9,6,X'96F1000F7EA246B88DBE048D257E13D6D27A8267078D7D1EA7A3CA4DDED438ED',NULL,X'35CD0467E17B4BD3509F7C3C161109520C119259D51FAB52AB8C3FEFD9AE8D26',X'01799A1FC60782CC6016139DC0AB296C',25534,'3c3863964dac983a71dc91a4bdc9a472',1538124988,'1',0,'0',1538196140,'1'),
	(10,6,X'96F1000F7EA246B88DBE048D257E13D66FDA2B452B4E0E8DB2199BBA76E5A14D',NULL,X'F8FA27D434FE3849F284EE36F3B088D0',X'01799A1FC60782CC6016139DC0AB296C',0,'',1538124988,'1',0,'0',1538196139,'1'),
	(11,6,X'79D667E1453F6300D49D28291D52DDC16FDA2B452B4E0E8DB2199BBA76E5A14D',NULL,X'2913A512BE4C5CA2CF5FC6753CA6B1B39620F15B5E53B5F30F26D16546480A36',X'01799A1FC60782CC6016139DC0AB296C',25534,'290d20932c5534338df76497bc93130b',1538126514,'1',0,'0',1538196138,'1'),
	(12,6,X'96C6D47E9A52AEE50EA7FEB1F136FFC6D27A8267078D7D1EA7A3CA4DDED438ED',NULL,X'60C48C7782863DFD17CA654ED8514F7686CC4529052413FF7AA7A6931D7E5423',X'01799A1FC60782CC6016139DC0AB296C',25534,'1c03c9e97968176c7152757fc24f7021',1538126783,'1',0,'0',1538196137,'1'),
	(13,6,X'1B88F5EC11C8B2A2ECE537048CC7D5D0C3363773A61E6A8746FAD5DD6307D07C',NULL,X'96B1E8B6D8B15A0CFCFEEB3623A60ABD70C882F3739E788820CD6D0E631C163DD324515F97FCFC3FEC5BCE49AEFDB885',X'6C6FA74794E45F9357D2DF731EE104CE',19161,'51f7fbf0d7c8060054d62dc96ac3d859',1538127888,'1',0,'0',1538196136,'1'),
	(14,6,X'114ED3DF75C85E9C9EEBC2F9B87B7483628E85D146E1EDBFA20AD125808E9F30',NULL,X'22F32B3419B80C4FE47E0E1950FD7D4B24DD34652B45F52A1B095C601ED3F037512E84C82DC7D0AF33A82A84A97399D6',X'6C6FA74794E45F9357D2DF731EE104CE',29227,'d350bcf9fb5548aa6f5f8eed12ba5009',1538129251,'1',0,'0',1538196134,'1'),
	(15,1,X'1EE9BA5F9F57D84EA0B84DA2A2817D19D7EAEAC2EFD8F8FE4AF751A532A3ED8B',NULL,X'F3B1A24B64486B17D87AEF89182DBA00F42F09C1332FF408369D4754C35E6B13CF1D9DE82F87B6B0448997D7D34B6EA3',X'6C6FA74794E45F9357D2DF731EE104CE',2264,'91588f6033dcd15c490dcd25f183f220',1538130991,'1',0,'0',0,'0'),
	(16,6,X'053345DA1BF0BA82D07075E68E6662FCF8D09304D0C9589CF80631330D2C1863',X'0143DB63EE66B0CDFF9F69917680151E',X'9433DFD134D4D58B0D395CF4AFB1E45A306AE6312AABC6B82904620EE1C7722DCF1D9DE82F87B6B0448997D7D34B6EA3',X'6C6FA74794E45F9357D2DF731EE104CE',0,NULL,1538196308,'1',0,'0',0,'0'),
	(17,6,X'0784A12DF570EE7388FCA0F44FAB8AE9D38F74627B6B34F232C6766328D1E4B6',X'04818C1B4867917C6A21CEA9323470809A367A88B8E41E633C42698131BCB541738DD0B3C3A8B21E9F8BBB5EDD0DFB8B',X'48E821FF823FC00947AD24BF6F0F96459244EADA02932D28ED314AF99A51F3D4CF1D9DE82F87B6B0448997D7D34B6EA3',X'6C6FA74794E45F9357D2DF731EE104CE',2510,NULL,1538196469,'1',0,'0',0,'0'),
	(18,6,X'9E87E7DB2287DA9860B66B6CDF36DA21',X'E2878AE04E76890B6DEE257A8A83F7C8ACA62F7699FC71B157D01771A04C0D34A07C441DD1E41FD0C46BB4B59B14D751',X'F5DE28A1E36D334302D8323A54480B1E7E888C18655990AB157D06E285759D63CF1D9DE82F87B6B0448997D7D34B6EA3',X'01799A1FC60782CC6016139DC0AB296C',7042,NULL,1538196672,'1',0,'0',0,'0'),
	(19,6,X'F0FCA7857AF4720C4C765FD29520B9C21FB8EF67171A5A6B3BD8BF950200A55A',X'0A281A5DF47FF49F38EE8076CCB49553E489B33746E6DF11129B55B815AF7C977C99ED30BEA2BE13441E99D8E6E33E42',X'EF777FA07D0287C88B217E0E5F5D4F1325F83C89D865058CE504B8BC454E7EF1CF1D9DE82F87B6B0448997D7D34B6EA3',X'A7F21010EFDA1DC5A7F1B268F1533E90',11595,NULL,1538196848,'1',0,'0',0,'0'),
	(20,6,X'F0FCA7857AF4720C4C765FD29520B9C21FB8EF67171A5A6B3BD8BF950200A55A',X'0A281A5DF47FF49F38EE8076CCB49553E489B33746E6DF11129B55B815AF7C977C99ED30BEA2BE13441E99D8E6E33E42',X'EF777FA07D0287C88B217E0E5F5D4F1325F83C89D865058CE504B8BC454E7EF1CF1D9DE82F87B6B0448997D7D34B6EA3',X'A7F21010EFDA1DC5A7F1B268F1533E90',11595,NULL,1538196864,'1',0,'0',0,'0'),
	(21,10,X'D72345FF2A2AB8B0E4E06AC38FEB5F63FDC53502F1A539D8E62E8749948EFAC4',X'746D79B3F0C6C070F06D4BF954C7C07FCE6FDD202579528C068A4F673CA80A55CF25BBD10DADF2AD424FDAEAEE42CD93',X'30D43F17D7B5C5167A3ABBDE886BE86C64F5E21EA9BDE5C5268AB8351D4E329CCF1D9DE82F87B6B0448997D7D34B6EA3',X'A7F21010EFDA1DC5A7F1B268F1533E90',4967,NULL,1538196910,'1',0,'0',0,'0'),
	(22,10,X'EA3324176C600C0EDE2D46A430841A71DB829D3ECB01515ADADB473294BF8E36',X'15B3F077562A607DE6F7A26A5FF421E12E42CC8DB95C2079449CFE6B5DB822AD20E50912DB997C8D2794FDA7E136BD45',X'E4FD311C6AB04022CEB1819A7642F3F71A15FE2C3A3A42291851162C5BA8D0BECF1D9DE82F87B6B0448997D7D34B6EA3',X'01799A1FC60782CC6016139DC0AB296C',3830,NULL,1538196910,'1',0,'0',0,'0'),
	(23,1,X'BFEAF9FA81395A42AFC3426DDC18013578D7F8C90FBF562521C025B6EFE5DE9C1FB8EF67171A5A6B3BD8BF950200A55A',X'5E80D11B4911B9449EA873C9C87DA6E4ADD90F05392241FC5FE5BF0184D0DCE783F8397753DE870ACB69721451B02D02',X'F850BA6024FE2627A775BD9B934CE2B561598D138FE1824D663525161DA6A324CF1D9DE82F87B6B0448997D7D34B6EA3',X'2F877AB4780E4C5B5F9FE1D9B46E2A51',4285,NULL,1538215529,'1',0,'0',0,'0'),
	(24,11,X'BFEAF9FA81395A42AFC3426DDC18013578D7F8C90FBF562521C025B6EFE5DE9C1FB8EF67171A5A6B3BD8BF950200A55A',X'E49C19E1DD10A4257C48230303054876ADD90F05392241FC5FE5BF0184D0DCE783F8397753DE870ACB69721451B02D02',X'F850BA6024FE2627A775BD9B934CE2B561598D138FE1824D663525161DA6A324CF1D9DE82F87B6B0448997D7D34B6EA3',X'6C6FA74794E45F9357D2DF731EE104CE',4285,NULL,1538215553,'1',0,'0',1538215558,'1'),
	(25,10,X'0E3F96ED12E3E31D9655DFE8AAE679D7',X'8EB647B8467DC18760E791386AB87C46FD90E8A3021E6E8DD3B02BEFE0CE39A2FAC46696AE70E45E99745A51A77B0C20',X'0D8EDC0CD1E4531FC87A31D61659520C946C2788989349BB1E397750CFC71226CF1D9DE82F87B6B0448997D7D34B6EA3',X'2F877AB4780E4C5B5F9FE1D9B46E2A51',59,NULL,1539932628,'1',0,'0',0,'0'),
	(26,1,X'0E3F96ED12E3E31D9655DFE8AAE679D7',X'0AE929E7CDA8A84912941691C6780651FD90E8A3021E6E8DD3B02BEFE0CE39A2FAC46696AE70E45E99745A51A77B0C20',X'0D8EDC0CD1E4531FC87A31D61659520C946C2788989349BB1E397750CFC71226CF1D9DE82F87B6B0448997D7D34B6EA3',X'2F877AB4780E4C5B5F9FE1D9B46E2A51',59,NULL,1539932663,'1',0,'0',0,'0'),
	(27,10,X'8E9E57AEA51A983CBC0ED72305A1AA37',X'4AD78415661E71254300E78FE6C8AAEEFD90E8A3021E6E8DD3B02BEFE0CE39A2FAC46696AE70E45E99745A51A77B0C20',X'0D8EDC0CD1E4531FC87A31D61659520C946C2788989349BB1E397750CFC71226CF1D9DE82F87B6B0448997D7D34B6EA3',X'2F877AB4780E4C5B5F9FE1D9B46E2A51',59,NULL,1539934111,'1',0,'0',0,'0'),
	(28,10,X'0E3F96ED12E3E31D9655DFE8AAE679D7',X'190DB2680D62DAACF38359E3B8E1FFCEFD90E8A3021E6E8DD3B02BEFE0CE39A2FAC46696AE70E45E99745A51A77B0C20',X'0D8EDC0CD1E4531FC87A31D61659520C946C2788989349BB1E397750CFC71226CF1D9DE82F87B6B0448997D7D34B6EA3',X'2F877AB4780E4C5B5F9FE1D9B46E2A51',59,NULL,1539934262,'1',0,'0',0,'0'),
	(29,18,X'CBF959AEEAC36D067E6161ECC51679FACF1D9DE82F87B6B0448997D7D34B6EA3',X'88A158D5DDB2074E73D5B34B2B8AC31E5C66A56E96378656FDAA0315461197AB90CA76754332FECF1D9AA231FF1B4368',X'8B11580C2CCC54FF8C2EEA34BEE31B6FCA4108E0B45A26B4B4FC24359D836C76CF1D9DE82F87B6B0448997D7D34B6EA3',X'2F877AB4780E4C5B5F9FE1D9B46E2A51',87,NULL,1542768841,'1',0,'0',0,'0');

/*!40000 ALTER TABLE `sp_customer_enclosure` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_customer_labe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_customer_labe`;

CREATE TABLE `sp_customer_labe` (
  `labe_id` int(11) NOT NULL COMMENT '户标签id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  UNIQUE KEY `unique` (`labe_id`,`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户标签表';



# Dump of table sp_customer_operation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_customer_operation`;

CREATE TABLE `sp_customer_operation` (
  `customer_id` int(11) unsigned NOT NULL COMMENT '客户id',
  `op_time` int(10) unsigned DEFAULT NULL COMMENT '操作时间',
  `remark` blob COMMENT '操作记录',
  `op_user_id` int(11) NOT NULL COMMENT '操作人',
  `create_time` int(11) unsigned NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `update_user` char(32) DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delete_time` int(11) DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index` (`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户资质操作记录';

LOCK TABLES `sp_customer_operation` WRITE;
/*!40000 ALTER TABLE `sp_customer_operation` DISABLE KEYS */;

INSERT INTO `sp_customer_operation` (`customer_id`, `op_time`, `remark`, `op_user_id`, `create_time`, `create_user`, `update_time`, `update_user`, `id`, `delete_time`, `delete_user`)
VALUES
	(2,1537977600,X'9A5B01822D9AD6B7DFA491AEFA87BEBE',1,1538023088,'1',1538023340,'3',1,0,'0'),
	(2,0,X'DB13A5633C898E4FCD5B21A4F8B69A5A',3,1538023340,'3',0,'0',2,0,'0');

/*!40000 ALTER TABLE `sp_customer_operation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_delay_report_member_potato_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_delay_report_member_potato_log`;

CREATE TABLE `sp_delay_report_member_potato_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `potato_time` int(11) DEFAULT NULL COMMENT '发potato日期',
  `member_id` varchar(500) DEFAULT NULL COMMENT '被提醒迟交日报的成员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sp_delay_report_member_potato_log` WRITE;
/*!40000 ALTER TABLE `sp_delay_report_member_potato_log` DISABLE KEYS */;

INSERT INTO `sp_delay_report_member_potato_log` (`id`, `potato_time`, `member_id`)
VALUES
	(1,1537891200,'1'),
	(2,1537977600,'1'),
	(3,1538064000,'1'),
	(4,1538150400,'1'),
	(5,1538236800,'1'),
	(6,1538323200,'1'),
	(7,1538409600,'1'),
	(8,1538496000,'1'),
	(9,1538582400,'1'),
	(10,1538668800,'1'),
	(11,1538755200,'1'),
	(12,1538841600,'1'),
	(13,1538928000,'1'),
	(14,1539014400,'1'),
	(15,1539100800,'1'),
	(16,1539187200,'1'),
	(17,1539273600,'1'),
	(18,1539360000,'1'),
	(19,1539446400,'1'),
	(20,1539532800,'1'),
	(21,1539619200,'1'),
	(22,1539705600,'1'),
	(23,1539792000,'1'),
	(24,1539878400,'1'),
	(25,1539964800,'1'),
	(26,1540051200,'1'),
	(27,1540137600,'1'),
	(28,1540224000,'1'),
	(29,1540310400,'1'),
	(30,1540396800,'1'),
	(31,1540483200,'1'),
	(32,1540656000,'1'),
	(33,1540742400,'1'),
	(34,1540828800,'1'),
	(35,1540915200,'1'),
	(36,1541001600,'1'),
	(37,1541088000,'1'),
	(38,1541174400,'1'),
	(39,1541260800,'1'),
	(40,1541347200,'1'),
	(41,1541433600,'1'),
	(42,1541520000,'1'),
	(43,1541606400,'1'),
	(44,1541692800,'1'),
	(45,1541779200,'1'),
	(46,1541865600,'1'),
	(47,1541952000,'1'),
	(48,1542038400,'1'),
	(49,1542124800,'1'),
	(50,1542211200,'1'),
	(51,1542297600,'1'),
	(52,1542384000,'1'),
	(53,1542470400,'1'),
	(54,1542556800,'1'),
	(55,1542643200,'1');

/*!40000 ALTER TABLE `sp_delay_report_member_potato_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_department`;

CREATE TABLE `sp_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` blob NOT NULL COMMENT '部门名称',
  `abbreviation` blob NOT NULL COMMENT '部门简称',
  `parent` int(11) DEFAULT NULL COMMENT '上级id',
  `parent_path` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '上级路径',
  `leader_id` int(11) DEFAULT NULL COMMENT '部门主管id',
  `admin_group` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限id',
  `create_user` char(32) DEFAULT '0',
  `create_time` int(10) DEFAULT NULL,
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) DEFAULT NULL,
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '禁用状态，0.未被禁用  1.已被禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';



# Dump of table sp_department_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_department_member`;

CREATE TABLE `sp_department_member` (
  `department_id` int(11) NOT NULL COMMENT '部门id',
  `member_id` int(11) NOT NULL COMMENT '人员id/用户id',
  `is_leader` int(1) NOT NULL DEFAULT '0' COMMENT '是否为主管, 0.否  1.是 ',
  PRIMARY KEY (`department_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门人员关系表';



# Dump of table sp_diplomatic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_diplomatic`;

CREATE TABLE `sp_diplomatic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` bigint(11) unsigned DEFAULT NULL COMMENT '外交时间',
  `recipient` blob COMMENT '接收人',
  `recipient_potato` blob COMMENT '接收人POTATO号码',
  `corporate_name` blob COMMENT '公司名称',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `project_team` blob COMMENT '项目组',
  `remark` blob COMMENT '备注',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL,
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sp_diplomatic` WRITE;
/*!40000 ALTER TABLE `sp_diplomatic` DISABLE KEYS */;

INSERT INTO `sp_diplomatic` (`id`, `time`, `recipient`, `recipient_potato`, `corporate_name`, `customer_id`, `project_team`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,1537977600,X'A91D9C843C362BD82CC726F15888238BDE2F9B603E1C37FC1289902873073805',X'A91D9C843C362BD82CC726F15888238B16F29FD2202DE3DDAA6682EF4C8E7ECA',X'C47E9F4B929A14E253D88235E7A3A6B4',2,X'5FF313E2AC93BDBAF0DE5CB007151A0F',X'57594D6F1ECCDF12AF3F10D254669F5E','1',1538023088,'1',1538023419,'0',0),
	(2,1537977600,X'A91D9C843C362BD82CC726F15888238B2073C61374C4A3C3B92D31ED288E31ED',X'A91D9C843C362BD82CC726F15888238B92E8EAEEA379F92BD046A8DD9A9A9ECC',X'77B41A27CC3837BF56008FA592135B2D',1,X'3584949529FE03DF14B3257FDB148C13',X'38F2E8C93ADB73EDCFADAF9474AD86A7AE0EF4B8D3D5D62B8E6BC9FA0D8D5391','0',0,'1',1539932663,'0',0),
	(3,1539100800,X'F3F68ACD9A2111DA083580FC16CB332BCC525C27A3A96D27620925129EA882CF',X'199B94C64825F21AB9C3FF905163082C',X'8070CCD1B5462BCC22B18A5336DB6C3CC39D6734E2F8E6F9007CB28F9A3F1200',12,X'2FD5D60A6E947A3ED96F91F1326F6A4993A2877954136C80E8798551D20EC85F',X'0143DB63EE66B0CDFF9F69917680151E','1',1540365963,'1',1540365963,'0',0),
	(4,1540483200,X'A91D9C843C362BD82CC726F15888238B2073C61374C4A3C3B92D31ED288E31ED',X'A91D9C843C362BD82CC726F15888238B92E8EAEEA379F92BD046A8DD9A9A9ECC',X'553CF0C62EA70170C01509583B70E3C9',13,X'3584949529FE03DF14B3257FDB148C13',X'2767231A7DD5E41558F10D4E6C5F62385B903D361ED92C2ABAD81B1B626B2BB7E45840656869D0F07DC88FB22E25BCB75B34FC360F15376DCCFB25D4DB402764300073784E3CC0E35AE6272AA68CBB25','1',1540537695,'1',1540897260,'0',0),
	(5,1540396800,X'A91D9C843C362BD82CC726F15888238BE960E339971A2A5AA7DC2A3F97E755D1',X'873E73014A4697579FB2484777492F20',NULL,14,X'3584949529FE03DF14B3257FDB148C13',X'4B5706B105BF56596D1B9EAAA7D779D4','1',1540537880,'0',0,'0',0),
	(6,1540483200,X'A91D9C843C362BD82CC726F15888238B2073C61374C4A3C3B92D31ED288E31ED',X'873E73014A4697579FB2484777492F20',X'2A0980865548409A4F505704DCABCB21',16,X'3584949529FE03DF14B3257FDB148C13',X'0143DB63EE66B0CDFF9F69917680151E','1',1540538557,'1',1540538557,'1',1540539283),
	(7,1542729600,X'A91D9C843C362BD82CC726F15888238B2073C61374C4A3C3B92D31ED288E31ED',X'48BDBED294AE781A488C99922FA5E881',X'218F88CD88249C0800B492065474778A',15,X'4E9F22DDB90C40735B6A1ABB49AAB90A',X'0143DB63EE66B0CDFF9F69917680151E','1',1542768856,'1',1542768856,'0',0);

/*!40000 ALTER TABLE `sp_diplomatic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_member`;

CREATE TABLE `sp_member` (
  `uid` smallint(5) unsigned NOT NULL COMMENT '管理id',
  `pools` varchar(20) DEFAULT NULL COMMENT '权限池',
  `groups` varchar(100) NOT NULL COMMENT '权限组',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` char(32) DEFAULT NULL COMMENT '用户密码',
  `fake_password` char(32) DEFAULT NULL COMMENT '伪造密码',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `potato` varchar(20) DEFAULT NULL COMMENT 'Potato',
  `safe_ips` varchar(200) DEFAULT NULL COMMENT '登陆IP限制',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '帐号状态 1:正常 0:禁止登陆',
  `regtime` int(11) NOT NULL COMMENT '注册时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '最后登录时间',
  `loginip` varchar(15) NOT NULL COMMENT '最后登录IP',
  `logincountry` char(2) DEFAULT '' COMMENT '最后登陆国家',
  `otp_auth` tinyint(1) DEFAULT '0' COMMENT 'MFA认证 0:禁用  1:启用  2:强制启用',
  `otp_authcode` char(16) DEFAULT '' COMMENT 'MFA验证码',
  `date_expired` date DEFAULT '2088-06-08' COMMENT '失效日期',
  `need_audit` tinyint(1) DEFAULT '0' COMMENT '登陆是否需要后台进行人工审核 0: 不需要 1:需要',
  `session_id` char(26) DEFAULT '' COMMENT '登陆时session_id',
  `session_expire` int(11) DEFAULT '1440' COMMENT 'SESSION有效期，默认24分钟',
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理id',
  `name` blob,
  `age` blob,
  `address` blob,
  `create_user` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`username`) USING BTREE,
  KEY `pools` (`pools`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `sp_member` WRITE;
/*!40000 ALTER TABLE `sp_member` DISABLE KEYS */;

INSERT INTO `sp_member` (`uid`, `pools`, `groups`, `username`, `password`, `fake_password`, `realname`, `email`, `potato`, `safe_ips`, `status`, `regtime`, `regip`, `logintime`, `loginip`, `logincountry`, `otp_auth`, `otp_authcode`, `date_expired`, `need_audit`, `session_id`, `session_expire`, `id`, `name`, `age`, `address`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(0,NULL,'',NULL,NULL,NULL,NULL,'7g',NULL,NULL,1,0,'',0,'','',0,'','2088-06-08',0,'',1440,1,X'AD2917D3E309183DDB6E0C408581CE02',X'405F9C4B731BF5762A832D6DAB0616E2',X'BAD43F9D4CF2D6CEB55B5DBA0E0859D8',1,1541754398,1,1541763798),
	(0,NULL,'',NULL,NULL,NULL,NULL,'<g',NULL,NULL,1,0,'',0,'','',0,'','2088-06-08',0,'',1440,2,X'649523384676A8FF38F679E4D55FD99F',X'7285D5916C44A33B605A108BB1618C7F',X'65901FFED16C56375C75F6C76F08E366',1,1541754398,1,1541763792),
	(0,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,1,0,'',0,'','',0,'','2088-06-08',0,'',1440,3,X'9E9CE44CD9DF2B201F51947E03BCCBE2',X'52208B4F4121A25F986549A204CB8FD3',X'6F0951F345B12AB78A313B10122F4AB6',1,1541754398,1,1541763763);

/*!40000 ALTER TABLE `sp_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_oauth_access_tokens`;

CREATE TABLE `sp_oauth_access_tokens` (
  `access_token` char(32) NOT NULL DEFAULT '',
  `client_id` char(32) NOT NULL DEFAULT '',
  `user_id` varchar(80) DEFAULT NULL,
  `openid` char(32) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sp_oauth_authorization_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_oauth_authorization_codes`;

CREATE TABLE `sp_oauth_authorization_codes` (
  `authorization_code` char(32) NOT NULL DEFAULT '',
  `client_id` char(32) NOT NULL DEFAULT '',
  `user_id` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  `id_token` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sp_oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_oauth_clients`;

CREATE TABLE `sp_oauth_clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) DEFAULT NULL COMMENT '应用名称',
  `website` varchar(200) DEFAULT NULL COMMENT '应用网站',
  `cate` tinyint(1) DEFAULT '1' COMMENT '应用分类 1、网页应用 2、客户端',
  `desc` varchar(200) DEFAULT NULL COMMENT '应用介绍',
  `domain` varchar(200) DEFAULT NULL COMMENT '域名绑定，绑定后的域名才可访问client_id',
  `ip` varchar(200) DEFAULT NULL COMMENT '信任IP，以逗号分隔，信任IP才可访问OpenAPI',
  `client_id` char(32) NOT NULL DEFAULT '' COMMENT 'App Key，只生成一次',
  `client_secret` char(32) NOT NULL DEFAULT '' COMMENT 'App Secret，后台可以重置',
  `redirect_uri` varchar(2000) NOT NULL DEFAULT '' COMMENT '授权回调页',
  `cancel_uri` varchar(2000) DEFAULT NULL COMMENT '取消授权回调页',
  `grant_types` varchar(80) DEFAULT NULL COMMENT '授权方式',
  `scope` varchar(2000) DEFAULT NULL COMMENT '授权作用域',
  `user_id` varchar(80) DEFAULT NULL COMMENT '用户ID',
  `create_user` int(11) DEFAULT NULL COMMENT '添加用户',
  `create_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改用户',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sp_oauth_clients` WRITE;
/*!40000 ALTER TABLE `sp_oauth_clients` DISABLE KEYS */;

INSERT INTO `sp_oauth_clients` (`id`, `name`, `website`, `cate`, `desc`, `domain`, `ip`, `client_id`, `client_secret`, `redirect_uri`, `cancel_uri`, `grant_types`, `scope`, `user_id`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'测试应用','http://www1.phpcall.org',1,'这是一个测试应用','www1.phpcall.org','127.0.0.1,192.168.0.46','testclient','testpass','http://www1.phpcall.org/oauth2_sdk/callback.php',NULL,'authorization_code,refresh_token,password,client_credentials','basic','user',1,1526151992,1,1528379432),
	(7,'fesfes',NULL,1,'fes','fes','fs','4396ff23eb80bbe11fabd578458b27c8','0ef64bd272146903d624a852158b9be0','http://fes','http://fes','authorization_code','basic','user',1,1526151992,1,1526152004);

/*!40000 ALTER TABLE `sp_oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_oauth_jwt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_oauth_jwt`;

CREATE TABLE `sp_oauth_jwt` (
  `client_id` char(32) NOT NULL DEFAULT '',
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sp_oauth_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_oauth_permissions`;

CREATE TABLE `sp_oauth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `info` varchar(200) DEFAULT NULL COMMENT '权限说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sp_oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_oauth_refresh_tokens`;

CREATE TABLE `sp_oauth_refresh_tokens` (
  `refresh_token` char(32) NOT NULL DEFAULT '',
  `client_id` char(32) NOT NULL DEFAULT '',
  `user_id` varchar(80) DEFAULT NULL,
  `openid` char(32) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sp_oauth_scopes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_oauth_scopes`;

CREATE TABLE `sp_oauth_scopes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT '授权名称',
  `scope` varchar(80) DEFAULT NULL COMMENT '授权',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  `desc` varchar(200) DEFAULT NULL COMMENT '授权说明',
  `create_user` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scope` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sp_oauth_scopes` WRITE;
/*!40000 ALTER TABLE `sp_oauth_scopes` DISABLE KEYS */;

INSERT INTO `sp_oauth_scopes` (`id`, `name`, `scope`, `is_default`, `desc`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'基础信息','basic',1,'登陆即可获取：包含userid、userinfo_basic，用户ID、姓名、头像、性别',1,1526146038,1,1528271472),
	(2,'用户信息','userinfo',0,'姓名、头像、性别、省市、Email等',1,1526146038,1,1526146038),
	(3,'用户权限','user_permissions',0,NULL,1,1526146038,1,1526146038),
	(4,'查看下级信息','child_userinfo',0,NULL,1,1526146038,1,1526146038),
	(5,'查看下级详细信息','child_userinfo_all',0,NULL,1,1526146038,1,1526146038),
	(7,'通过关键词搜索用户','search_users_keywords',0,NULL,1,1526146038,1,1526146038),
	(8,'搜索用户时的联想搜索建议','search_users',0,NULL,1,1526146038,1,1526146038),
	(10,'更改头像','update_avatar',0,NULL,1,1526146038,1,1526146038),
	(11,'更改用户资料','update_userinfo',0,NULL,1,1526146038,1,1526146038);

/*!40000 ALTER TABLE `sp_oauth_scopes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_oauth_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_oauth_users`;

CREATE TABLE `sp_oauth_users` (
  `userid` char(32) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(80) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `realname` varchar(80) DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(80) DEFAULT NULL COMMENT '邮箱',
  `email_verified` tinyint(1) DEFAULT '0' COMMENT '是否邮箱验证',
  `scope` varchar(2000) DEFAULT 'base' COMMENT '授权范围',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sp_project_approval
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_project_approval`;

CREATE TABLE `sp_project_approval` (
  `approval_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审批Id',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目ID',
  `apply_amount` double unsigned NOT NULL DEFAULT '0' COMMENT '申请金额',
  `currency_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '货币编码',
  PRIMARY KEY (`approval_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='项目与审批多对多关联表';

LOCK TABLES `sp_project_approval` WRITE;
/*!40000 ALTER TABLE `sp_project_approval` DISABLE KEYS */;

INSERT INTO `sp_project_approval` (`approval_id`, `project_id`, `apply_amount`, `currency_code`)
VALUES
	(1,2,100000,X'434E59'),
	(2,1,12900,X'434E59'),
	(4,26,500000,X'434E59'),
	(5,16,1111,X'434E59'),
	(6,16,1111,X'434E59');

/*!40000 ALTER TABLE `sp_project_approval` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_project_leave_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_project_leave_message`;

CREATE TABLE `sp_project_leave_message` (
  `project_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目id',
  `admin_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '管理员id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '留言数量',
  PRIMARY KEY (`project_id`,`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sp_project_leave_message` WRITE;
/*!40000 ALTER TABLE `sp_project_leave_message` DISABLE KEYS */;

INSERT INTO `sp_project_leave_message` (`project_id`, `admin_id`, `count`)
VALUES
	(1,X'6233616334643666613031363436343937393139306434646431666638306238',2),
	(2,X'33',4),
	(3,X'33',4),
	(4,X'6233616334643666613031363436343937393139306434646431666638306238',2),
	(5,X'3261316432636634376662303736643531336439376265383039343835333262',2),
	(11,X'3261316432636634376662303736643531336439376265383039343835333262',2),
	(12,X'3261316432636634376662303736643531336439376265383039343835333262',5),
	(12,X'33',5),
	(13,X'31',0),
	(13,X'6233616334643666613031363436343937393139306434646431666638306238',0),
	(15,X'3261316432636634376662303736643531336439376265383039343835333262',1),
	(16,X'3061363238393666626264643736376137653537643130336634363233656361',12),
	(16,X'3261316432636634376662303736643531336439376265383039343835333262',7),
	(16,X'33',40),
	(16,X'6233616334643666613031363436343937393139306434646431666638306238',2),
	(17,X'31',0),
	(17,X'3836663638653636383261643139663362396162313365646561363236326432',14),
	(18,X'3836663638653636383261643139663362396162313365646561363236326432',1),
	(19,X'31',0),
	(19,X'3836663638653636383261643139663362396162313365646561363236326432',13),
	(20,X'3061363238393666626264643736376137653537643130336634363233656361',0),
	(20,X'6233616334643666613031363436343937393139306434646431666638306238',3),
	(21,X'6233616334643666613031363436343937393139306434646431666638306238',1),
	(22,X'6233616334643666613031363436343937393139306434646431666638306238',1),
	(23,X'33',1),
	(24,X'33',1),
	(25,X'6233616334643666613031363436343937393139306434646431666638306238',5),
	(26,X'3061363238393666626264643736376137653537643130336634363233656361',4),
	(27,X'3061363238393666626264643736376137653537643130336634363233656361',1),
	(28,X'3061363238393666626264643736376137653537643130336634363233656361',2),
	(30,X'33',1),
	(31,X'3261316432636634376662303736643531336439376265383039343835333262',1),
	(105,X'31',1);

/*!40000 ALTER TABLE `sp_project_leave_message` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_projects`;

CREATE TABLE `sp_projects` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `sncode` varchar(20) DEFAULT NULL,
  `pname` blob NOT NULL COMMENT '項目標題',
  `sponsor` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '發起人',
  `principal` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '負責人',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '項目到期日',
  `emerg_level` tinyint(2) unsigned NOT NULL COMMENT '緊急程度',
  `pdescription` blob NOT NULL COMMENT '項目描述',
  `budget` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '花費',
  `parent_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '上層項目，頂層為0',
  `top_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '最顶层id',
  `complete_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '完成状态',
  `leave_message` blob COMMENT '创建及编辑时的项目留言',
  `create_user` char(32) DEFAULT '0',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT NULL,
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='項目主資料表';

LOCK TABLES `sp_projects` WRITE;
/*!40000 ALTER TABLE `sp_projects` DISABLE KEYS */;

INSERT INTO `sp_projects` (`id`, `sncode`, `pname`, `sponsor`, `principal`, `expiry`, `emerg_level`, `pdescription`, `budget`, `parent_id`, `top_id`, `complete_status`, `leave_message`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,'PJ9052006059890',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'1B854058AB1FCA58411ECEC507A87D83',0,0,0,0,NULL,'1',1538023345,'0',0,'0',0),
	(2,'PJ8747769671724',X'64FE04A3081A5AF1FCB2146B50927653',0,0,0,25,X'5DFAFA8D0540BFFCE32B8F4490D80BFE',0,0,0,1,X'E03C23F59F0CDE29D5A8043E0EBF1E3858799C416F9CC95351B221CD8F117AF5','1',1538024186,'0',0,'0',0),
	(3,'PJ7323796190492',X'720AD7C519B27E5EF1AA0ED90879EB9B',0,0,0,26,X'8A2AF2EE7DC29789C1AF69FF61DC48AF',0,0,0,0,X'8A2AF2EE7DC29789C1AF69FF61DC48AF','1',1538031937,'0',0,'0',0),
	(4,'PJ9561254923224',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'792473BD59E8377220805AAE7B331A64',0,0,0,0,NULL,'1',1538035408,'0',0,'0',0),
	(5,'PJ8553398604525',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'792473BD59E8377220805AAE7B331A64',0,0,0,0,NULL,'1',1538035428,'0',0,'0',0),
	(6,'PJ8964879268068',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'6CA3347F097A648E627691FA99E3CA0F',0,0,0,0,NULL,'1',1538035613,'0',0,'0',0),
	(7,'PJ8964879268068-001',X'4429701222C8E9A218D38B628D807BD4',0,0,0,25,X'792473BD59E8377220805AAE7B331A64',0,6,0,0,X'0143DB63EE66B0CDFF9F69917680151E','1',1538035731,'0',0,'0',0),
	(8,'PJ5741451952769',X'1381AA7D4BF7C0743B2825B6B17F6E9D',0,0,0,26,X'98C8AA37B6B1D0A8963A0E7FCFABF72F',0,0,0,0,X'AA248EEB35D69F1E08A4378A01D48622','1',1538035751,'0',0,'0',0),
	(9,'PJ7775017681144',X'1A2D3926CDC46B9D29DBBE3CF16D5690',0,0,0,25,X'A13E1C572064CC5FC29C50C9B9CFA1AF',0,0,0,0,NULL,'1',1538035810,'0',0,'0',0),
	(10,'PJ2657604288703',X'4754A6098D1743D2E88C2DEA7E9D13DE',0,0,0,25,X'A19217DC67CB5D4B3108F7163072A831',0,0,0,0,NULL,'1',1538035834,'0',0,'0',0),
	(11,'PJ5741451952769-002',X'89079EBF84EC76B448C46637C6CEB6A4',0,0,0,26,X'6CB4337CBC61699E8C078F94D63968124AE6E19C07B49432961FFF5774D9E138',0,8,0,0,X'0143DB63EE66B0CDFF9F69917680151E','1',1538035973,'0',0,'0',0),
	(12,'PJ4071459527070',X'5B529D151131557B88DB3E052B548E8CD8650A02B40126B6493090A746A8E7B5',0,0,0,26,X'74BD6E46B7CF5A602A0010B1B9CE8A28C4B21209E526D9DAE376FAFA617B56B2',0,0,0,0,X'C590064C55E95970DAA0028CEB8A279B','1',1538036308,'1',1538037194,'0',0),
	(13,'PJ9963637484121',X'99499E1F084030BCA8CB10B2B6CFB02C8C8D2D5AC8876837A8E113095F232CD8',0,0,0,25,X'04757A44CE35373F2D5E4F6B63F15691',0,0,0,0,NULL,'1',1538037679,'0',0,'0',0),
	(14,'PJ3417876119863',X'844F9CA49D7AA2A78598B4FADE98D290',0,0,0,25,X'365A53B71A35095C96207F1BEBD5660F',0,0,0,0,NULL,'b3ac4d6fa016464979190d4dd1ff80b8',1538037714,'0',0,'0',0),
	(15,'PJ0328353876723',X'9CCE2BDDE42D25B6976FE69B521A294628FA586FB7495DB972DF2E11CD18B6C6',0,0,0,25,X'354DCE9711CB55E9CC8DD9071A7CD10C',0,0,0,0,NULL,'1',1538037975,'0',0,'0',0),
	(16,'PJ2553398368085',X'23E4F59176D11D643DA0A9954A48673ECAD4F41AFB7AED65181BDBA7D3632A3E',0,0,0,27,X'A95E6FEAC4FA225608465757D7AAC979BC1C86379B6666E26383B9BE95037CA2',0,0,0,0,X'9912FEE82DAA86F35DEEDB8E3CF00FC00143DB63EE66B0CDFF9F69917680151E','1',1538038031,'1',1538209329,'0',0),
	(17,'PJ4621263442702',X'B0998218A86FB36AD46FBE03F2F72C97F46E348C555B4FF67C0C75EF1350AC8E',0,0,0,27,X'455CC1CBE0CD7BE00269BAA3C1254C968946BF9B8D4824E44709813326FAD0BBFE97C4C26204ABC54522618DAF181B1E',0,0,0,0,X'0143DB63EE66B0CDFF9F69917680151E','0a62896fbbdd767a7e57d103f4623eca',1538040286,'0a62896fbbdd767a7e57d103f4623eca',1538044340,'0',0),
	(18,'PJ2764624723265',X'B0998218A86FB36AD46FBE03F2F72C9798BD98ACD857447718F29A452F2F769F',0,0,0,26,X'3284754D1E9119CF8B83D5C0E5B01F16564469E190D1A10F53A6038E0DA16E4990FFAF6FB81BE6B8AAC7390422CF780D94CD2161088057295D047679DD735018',0,0,0,0,X'0143DB63EE66B0CDFF9F69917680151E','0a62896fbbdd767a7e57d103f4623eca',1538041000,'0a62896fbbdd767a7e57d103f4623eca',1538041229,'0',0),
	(19,'PJ2764624723265',X'B0998218A86FB36AD46FBE03F2F72C9798BD98ACD857447718F29A452F2F769F',0,0,0,27,X'3284754D1E9119CF8B83D5C0E5B01F16564469E190D1A10F53A6038E0DA16E4990FFAF6FB81BE6B8AAC7390422CF780D94CD2161088057295D047679DD735018',0,0,0,0,X'0143DB63EE66B0CDFF9F69917680151E','0a62896fbbdd767a7e57d103f4623eca',1538042014,'0a62896fbbdd767a7e57d103f4623eca',1538208505,'0',0),
	(20,'PJ8324918268569',X'555D3DDD8D7CC79E936FCCB064697D6B770F5A3D4CF6985B24873FCE4E735B5A',0,0,0,26,X'770F5A3D4CF6985B24873FCE4E735B5A',0,0,0,0,X'770F5A3D4CF6985B24873FCE4E735B5A','1',1538209351,'0',0,'0',0),
	(21,'PJ8962489389776',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'B8CA9F805383EF785572704EB35B50C4',0,0,0,0,NULL,'1',1539848269,'0',0,'0',0),
	(22,'PJ7127463426083',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,26,X'E5651A32E31C437322789B65B9000720',0,0,0,0,NULL,'1',1539848475,'0',0,'0',0),
	(23,'PJ5952517072615',X'0725BEBDB1340675E4E443F3212F9A12',0,0,0,25,X'FB1DE6326D668051F84F54BB0CD4E36A',0,0,0,0,NULL,'1',1539854395,'0',0,'0',0),
	(24,'PJ9157892719873',X'5094109D23B365DC417971BC066CACE6',0,0,0,25,X'A98CB33BCED86035CED5D528320835FE',0,0,0,0,NULL,'1',1539922918,'0',0,'0',0),
	(25,'PJ6406205942535',X'9B77DF356141FE0EF5371D9BAA0AAF1E',0,0,0,25,X'9393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38416F2F3F1A6E5C97F9C5E7AD56BCF6FBC',0,0,0,0,NULL,'1',1540367545,'0',0,'0',0),
	(26,'PJ3104862027280',X'CEEA3BB6C3C5B219581399FFA1D8D9270DC209BA2A9FBB3F3EDCBBABD2071AB0',0,0,0,25,X'9393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478470143DB63EE66B0CDFF9F69917680151E',0,0,0,1,NULL,'1',1540367768,'0',0,'0',0),
	(27,'PJ6406205942535-003',X'414788EE187AD26232D431913719ACD0AFF10537BF9D12D48E7E63BB9FFDE079',0,0,0,25,X'098BAB9F587E6E38601D11F5300BF7D1',0,25,0,1,X'0143DB63EE66B0CDFF9F69917680151E','1',1540369042,'0',0,'0',0),
	(28,'PJ6406205942535-004',X'59910B96330A97DD344A483FD473BC66A047097F3E89FE386D1E8206783584B9',0,0,0,25,X'9393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478479393F869F1BE2D28BBA507408FABD38468294D8CAA99BEAECA335F6AD17A503055E256C8A66899CFD2E996FCBF5478470143DB63EE66B0CDFF9F69917680151E',0,25,0,1,X'95F94B7855D57BAC35E542DCFED2F42F7DCBE2DE7BA79D5E21ABAA61105694A9D5407B3F6A25D55389463053EB3DF21F95F94B7855D57BAC35E542DCFED2F42F39A479953697952DDE5812C103E253EC','1',1540369215,'0',0,'0',0),
	(29,'PJ3597639032264',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'7F3BACF37A8789325B7E0A870163FA1F',0,0,0,0,NULL,'1',1540435979,'0',0,'0',0),
	(30,'PJ1352825204244',X'6C63D9DD2E904A738989957542B3A321',0,0,0,25,X'A3A63B29485D17F814FED6EAD8A0E89A65488BBC4D89B9B0ECB6E45556062F20',0,0,0,0,X'0143DB63EE66B0CDFF9F69917680151E','1',1540784878,'1',1540971532,'0',NULL),
	(31,'PJ8441119555893',X'06FD4AC9E5EC34EA5CB7965CEFC82F15',0,0,0,25,X'06D1EFB4AC5E5A86E69C95132B44F5AC',0,0,0,0,NULL,'1',1542768746,'0',NULL,'0',NULL);

/*!40000 ALTER TABLE `sp_projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_projects_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_projects_department`;

CREATE TABLE `sp_projects_department` (
  `projectid` int(11) unsigned NOT NULL COMMENT '项目id',
  `departmentid` int(11) unsigned NOT NULL COMMENT '客户公司id',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='相关公司对应表';



# Dump of table sp_projects_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_projects_history`;

CREATE TABLE `sp_projects_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectid` int(11) unsigned NOT NULL COMMENT '项目id',
  `orig_content` blob NOT NULL COMMENT '原始项目描述',
  `new_content` blob NOT NULL COMMENT '新项目描述',
  `update_user` char(32) NOT NULL DEFAULT '0' COMMENT '修改者',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='历史纪录';

LOCK TABLES `sp_projects_history` WRITE;
/*!40000 ALTER TABLE `sp_projects_history` DISABLE KEYS */;

INSERT INTO `sp_projects_history` (`id`, `projectid`, `orig_content`, `new_content`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,12,X'98C8AA37B6B1D0A8963A0E7FCFABF72F',X'74BD6E46B7CF5A602A0010B1B9CE8A28C4B21209E526D9DAE376FAFA617B56B2','1',1538037010,NULL,NULL),
	(2,16,X'A33635A7D17BC38EACE12AD4A0088CE5',X'D374CEDED5DA65EEEBDC947780C48E50','1',1538190079,NULL,NULL),
	(3,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'66337F95ED39D2CEF33D7165B61BFA56','1',1538208307,NULL,NULL),
	(4,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'5F4A28A81BF524F8A6339A7EEFEC2427','1',1538208338,NULL,NULL),
	(5,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'66337F95ED39D2CEF33D7165B61BFA56','1',1538208567,NULL,NULL),
	(6,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'5F4A28A81BF524F8A6339A7EEFEC2427','1',1538208588,NULL,NULL),
	(7,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'66337F95ED39D2CEF33D7165B61BFA56','1',1538208605,NULL,NULL),
	(8,16,X'D374CEDED5DA65EEEBDC947780C48E50',X'66337F95ED39D2CEF33D7165B61BFA56','1',1538208715,NULL,NULL),
	(9,16,X'66337F95ED39D2CEF33D7165B61BFA56',X'1E391196B3D93BC892533D33316F373F','1',1538208743,NULL,NULL),
	(10,16,X'1E391196B3D93BC892533D33316F373F',X'A95E6FEAC4FA225608465757D7AAC979A4ADF38ADDFA5F2F038DC2665AB3BA1C','1',1538208931,NULL,NULL),
	(11,16,X'A95E6FEAC4FA225608465757D7AAC979A4ADF38ADDFA5F2F038DC2665AB3BA1C',X'A95E6FEAC4FA225608465757D7AAC979DCD8077A6C0AE8129C947FE27A3C9140','1',1538209285,NULL,NULL),
	(12,16,X'A95E6FEAC4FA225608465757D7AAC979DCD8077A6C0AE8129C947FE27A3C9140',X'A95E6FEAC4FA225608465757D7AAC979BC1C86379B6666E26383B9BE95037CA2','1',1538209329,NULL,NULL);

/*!40000 ALTER TABLE `sp_projects_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_projects_participate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_projects_participate`;

CREATE TABLE `sp_projects_participate` (
  `projectid` int(8) unsigned NOT NULL COMMENT '项目id',
  `participateid` char(32) NOT NULL DEFAULT '' COMMENT '参与者id',
  `priveleges` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '留言权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='相关人员对应表';



# Dump of table sp_pwn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_pwn`;

CREATE TABLE `sp_pwn` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `value` blob,
  `price` blob,
  `price2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sp_report
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_report`;

CREATE TABLE `sp_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 NOT NULL COMMENT '报告内容',
  `plan` text CHARACTER SET utf8mb4 COMMENT '明日计划',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '报告内容 0.日报',
  `report_time` int(11) DEFAULT NULL COMMENT '报告时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `delete_user` char(32) NOT NULL DEFAULT '0',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报告表';



# Dump of table sp_report_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_report_admin`;

CREATE TABLE `sp_report_admin` (
  `report_id` int(11) NOT NULL COMMENT '报告id',
  `member_id` int(11) NOT NULL COMMENT '人员id/admin_id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0.发送给我的   1.抄送给我的',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0.未读   1.已读',
  `read_time` int(11) DEFAULT NULL COMMENT '阅读时间',
  `update_status` tinyint(1) NOT NULL COMMENT '0.无修改  1.已修改，重新提交',
  `report_time` int(11) DEFAULT NULL COMMENT '报告时间',
  PRIMARY KEY (`report_id`,`member_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报告 人员关系表';



# Dump of table sp_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_setting`;

CREATE TABLE `sp_setting` (
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '配置名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `remark` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '配置备注',
  `setting_id` int(2) NOT NULL COMMENT '配置分组id',
  `type` varchar(50) DEFAULT NULL COMMENT '变量类型',
  `value` text CHARACTER SET utf8mb4 COMMENT '变量值',
  `status` int(1) DEFAULT NULL COMMENT '变量状态 0.未启用  1.启用',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设置，项目设置setting_id为1，日报设置setting_id为2，审批设置setting_id为3';

LOCK TABLES `sp_setting` WRITE;
/*!40000 ALTER TABLE `sp_setting` DISABLE KEYS */;

INSERT INTO `sp_setting` (`name`, `title`, `remark`, `setting_id`, `type`, `value`, `status`)
VALUES
	('','',NULL,0,NULL,NULL,NULL),
	('approval_remind_time_interval','催单间隔时间','上一次催单与本次催单时间差',3,'int','0.05',1),
	('approval_remind_time_lag','催单时差','上一个审批完成时间（或用户发布审批单的时间）与当前时间差',3,'int','0.05',1),
	('approval_remind_time_number','催单总次数','同张审批单、同个审批人催单次数',3,'int','2',1),
	('project_allow_layer','最多允许创建几个层级的子项目','允许每个主项目可以创建几个层级的子项目',1,'int','2',1),
	('project_allow_quantity','最多允许创建几个子项目','允许每个主项目可以创建几个子项目',1,'int','3',1),
	('project_comment_reply','项目评论回复','允许管理（删除）所有评论功能，个人账号评论回复可由个人账号管理（删除）',1,'int','2',1),
	('project_complete_condition','子项目未完成是否允许主项目完成','必须先完成子项目(当有一个或多个子项目未完成时，无法将主项目设置为已完成状态)/可以直接完成主项目(不需要判断子项目是否已完成，可设置主项目为已完成状态)',1,'int','0',1),
	('project_deadline','默认项目截止时间','创建新项目时默认的项目截止时间，为项目发布后XX天后逾期。',1,'int','0',1),
	('report_person','使用日报人员或部门',NULL,2,'string','dept_1,dept_9,dept_10,dept_11,dept_12,dept_13,dept_15,dept_16,mem_1',1),
	('report_plan_open','是否开启的计划安排','开启，关闭后日报内容不需要添加计划内容',2,'int','1',1),
	('report_submit_person','日报默认提交给阅读人',NULL,2,'string','26,31',1),
	('report_submit_time','日报默认提交时间',NULL,2,'int','3',1);

/*!40000 ALTER TABLE `sp_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_setting_approval
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_setting_approval`;

CREATE TABLE `sp_setting_approval` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '审批名称',
  `type` int(1) NOT NULL COMMENT '审批类型 0.项目费用  1.内部开支',
  `range_department` text COMMENT '适用范围 部门',
  `range_member` text COMMENT '适用范围 人员',
  `approver` varchar(100) DEFAULT NULL COMMENT '审批人',
  `copier` text COMMENT '抄送人',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned DEFAULT '0',
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设置，审批设置';

LOCK TABLES `sp_setting_approval` WRITE;
/*!40000 ALTER TABLE `sp_setting_approval` DISABLE KEYS */;

INSERT INTO `sp_setting_approval` (`id`, `name`, `type`, `range_department`, `range_member`, `approver`, `copier`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`)
VALUES
	(1,'项目费用',0,NULL,'1,3,beab7e966d85e0fd3873d06a051df39e','2a1d2cf47fb076d513d97be80948532b,3','2a1d2cf47fb076d513d97be80948532b,3','1',1523355323,'1',1540524956,'0',0),
	(2,'内部开支',1,'1,10','1,38','38,35','1,33,38,35','1',1523355323,'38',1526113624,'0',0);

/*!40000 ALTER TABLE `sp_setting_approval` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_setting_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_setting_tags`;

CREATE TABLE `sp_setting_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '标签或选项名称',
  `setting_id` int(2) NOT NULL COMMENT '1.项目 2.日报 3.审核 4.客户',
  `group_id` int(1) NOT NULL COMMENT '分组',
  `create_user` char(32) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned DEFAULT '0',
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT '0',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填 0.否 1.是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设置，项目设置、客户设置涉及的标签或选项';

LOCK TABLES `sp_setting_tags` WRITE;
/*!40000 ALTER TABLE `sp_setting_tags` DISABLE KEYS */;

INSERT INTO `sp_setting_tags` (`id`, `name`, `setting_id`, `group_id`, `create_user`, `create_time`, `update_user`, `update_time`, `delete_user`, `delete_time`, `is_required`)
VALUES
	(1,'渠道一',4,2,'1',1536564182,'1',1540434943,'0',0,0),
	(2,'渠道二',4,2,'1',1536564182,'1',1540434943,'0',0,0),
	(3,'渠道三',4,2,'1',1536564182,'1',1540434943,'0',0,0),
	(4,'渠道四',4,2,'1',1536564182,'1',1540434943,'0',0,0),
	(5,'子公司',4,3,'1',1536564182,'1',1540434943,'0',0,0),
	(6,'分公司',4,3,'1',1536564182,'1',1540434943,'0',0,0),
	(7,'总公司',4,3,'1',1536564182,'1',1540434943,'0',0,0),
	(8,'大托拉斯',4,3,'1',1536564182,'1',1540434943,'0',0,0),
	(9,'资质类型一',4,7,'1',1536564182,'1',1540434943,'0',0,0),
	(10,'资质类型二',4,7,'1',1536564182,'1',1540434943,'0',0,0),
	(11,'资质类型三',4,7,'1',1536564182,'1',1540434943,'0',0,0),
	(12,'资质类型四',4,7,'1',1536564182,'1',1540434943,'0',0,0),
	(13,'资质状态一',4,6,'1',1536564182,'1',1540434943,'0',0,0),
	(14,'资质状态二',4,6,'1',1536564182,'1',1540434943,'0',0,0),
	(15,'资质状态三',4,6,'1',1536564182,'1',1540434943,'0',0,0),
	(16,'资质状态四',4,6,'1',1536564182,'1',1540434943,'0',0,0),
	(17,'法人状态一',4,1,'1',1536564182,'1',1540434943,'0',0,0),
	(18,'法人状态二',4,1,'1',1536564182,'1',1540434943,'0',0,0),
	(19,'法人状态三',4,1,'1',1536564182,'1',1540434943,'0',0,0),
	(20,'法人状态四',4,1,'1',1536564182,'1',1540434943,'0',0,0),
	(21,'火腿收购',4,8,'1',1536564182,'1',1540434943,'0',0,0),
	(22,'火腿加工',4,8,'1',1536564182,'1',1540434943,'0',0,0),
	(23,'火腿销售',4,8,'1',1536564182,'1',1540434943,'0',0,0),
	(24,'火腿售后',4,8,'1',1536564182,'1',1540434943,'0',0,0),
	(25,'邮寄',1,2,'1',1536564415,'1',1540524906,'0',0,0),
	(26,'问题件处理',1,2,'1',1536564415,'1',1540524906,'0',0,0),
	(27,'加办',1,2,'1',1536564415,'1',1540524906,'0',0,0),
	(28,'測試',1,1,'1',1538037935,'1',1540524906,'0',0,0),
	(29,'dfg ',1,2,'1',1539579053,'1',1540524906,'0',0,0),
	(30,'发送到发送的',1,2,'1',1539579545,'1',1540524906,'0',0,0),
	(31,'123123123',1,2,'1',1539579798,'1',1540524906,'0',0,0),
	(32,'SFASDFASDFA',4,2,'1',1539579835,'1',1540434943,'0',0,0),
	(33,'eeeeee',1,2,'1',1539848891,'1',1540524906,'0',0,0),
	(34,'FASDFASDFA',1,2,'1',1539849112,'1',1540524906,'0',0,0),
	(35,'分類1.2',4,2,'1',1540291372,'1',1540434943,'0',0,0),
	(36,'123123123',4,2,'1',1540291677,'1',1540434943,'0',0,0),
	(37,'111111',4,2,'1',1540291785,'1',1540434943,'0',0,0),
	(38,'111111',4,2,'1',1540291785,'1',1540434943,'0',0,0),
	(40,'加辣口水鸡',4,8,'1',1540292654,'1',1540434943,'0',0,0),
	(41,'乌托邦',4,3,'1',1540292662,'1',1540434943,'0',0,0),
	(42,'加辣口水鸡',4,2,'1',1540292672,'1',1540434943,'0',0,0),
	(43,'测试名称1',4,2,'1',1540292685,'1',1540434943,'0',0,0),
	(44,'测试名称1',4,6,'1',1540292700,'1',1540434943,'0',0,0),
	(45,'测试名称一',4,6,'1',1540292714,'1',1540434943,'0',0,0),
	(46,'111111',4,2,'1',1540296548,'1',1540434943,'0',0,0),
	(81,'成都渠道',4,2,'1',1530174504,'1',1540434943,'0',0,0),
	(84,'杭州第四渠道',4,2,'1',1530174504,'1',1540434943,'0',0,0),
	(85,'关乐渠道',4,2,'1',1530174504,'1',1540434943,'0',0,0),
	(128,'河南渠道',4,2,'1',1530347073,'1',1540434943,'0',0,0),
	(129,'重庆渠道',4,2,'1',1530347073,'1',1540434943,'0',0,0),
	(130,'传承网络',4,2,'1',1530347073,'1',1540434943,'0',0,0),
	(131,'BINGBING渠道',4,2,'1',1530347073,'1',1540434943,'0',0,0),
	(132,'祝总渠道',4,2,'1',1530347073,'1',1540434943,'0',0,0),
	(133,'黑蚂蚁渠道',4,2,'1',1530347073,'1',1540434943,'0',0,0),
	(134,'常州渠道',4,2,'1',1530347073,'1',1540434943,'0',0,0),
	(135,'成都宝宫',4,2,'1',1530347073,'1',1540434943,'0',0,0),
	(136,'广州展望',4,2,'1',1530347178,'1',1540434943,'0',0,0),
	(137,'北京禹启',4,2,'1',1530347202,'1',1540434943,'0',0,0),
	(226,'卡证',1,2,'1',1540298829,'1',1540524906,'0',0,0),
	(227,'浙江金华小叮当',4,2,'1',1540360301,'1',1540434943,'0',0,0),
	(228,'集团公司',4,3,'1',1540360301,'1',1540434943,'0',0,0),
	(229,'火腿加工',4,7,'1',1540360301,'1',1540434943,'0',0,0),
	(230,'生效中',4,6,'1',1540360301,'1',1540434943,'0',0,0),
	(231,'在职',4,1,'1',1540360301,'1',1540434943,'0',0,0),
	(232,'预备变更',4,1,'1',1540360301,'1',1540434943,'0',0,0),
	(238,'标签-1',1,1,'1',1540524906,'0',0,'0',0,0),
	(239,'标签-2',1,1,'1',1540524906,'0',0,'0',0,0);

/*!40000 ALTER TABLE `sp_setting_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_test
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_test`;

CREATE TABLE `sp_test` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sp_upload_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_upload_file`;

CREATE TABLE `sp_upload_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `size` int(11) unsigned NOT NULL COMMENT '文件大小。单位kb',
  `realname` blob NOT NULL COMMENT '文件原名称',
  `filename` blob NOT NULL COMMENT '文件名称',
  `filepath` blob COMMENT '文件路径',
  `crypt_key` char(32) DEFAULT '',
  `create_time` int(10) unsigned NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `update_user` char(32) DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sp_upload_file` WRITE;
/*!40000 ALTER TABLE `sp_upload_file` DISABLE KEYS */;

INSERT INTO `sp_upload_file` (`id`, `size`, `realname`, `filename`, `filepath`, `crypt_key`, `create_time`, `create_user`, `update_time`, `update_user`, `delete_time`, `delete_user`)
VALUES
	(2,4285,X'E7A4BCE5AEBEE58E9FE59E8BE59BBE3039313832333330E5AEB8E58D93',X'3230313830393237313234373534303532392E7A6970',NULL,'d17a4c65b711e2c8eb95f007871829e5',1538023674,'1',0,'0',1538216092,'1'),
	(3,5322,X'E8B083E5BAA6E4B8ADE5BF83',X'3230313830393237313235303030303936392E7A6970',NULL,'1e85d14891151319e30644b0c2270233',1538023800,'1',0,'0',0,'0'),
	(4,15871,X'695465726D322D436F6C6F722D536368656D65732D6D6173746572','',X'2F66696C652F31303030302F34623734346161633464353265623539343466333930666237356461666461642E7A6970','',1538217713,'1',0,'0',0,'0'),
	(5,8995,X'E5BD92E6A1A32032','',X'2F66696C652F31303030302F64323236333235666632353962663961613535326235653638303738386334302E7A6970','',1538218092,'1',0,'0',0,'0'),
	(6,12320,X'E5BD92E6A1A3','',X'2F66696C652F31303030302F62646139393433633238316135363664376235633263333938303236623638312E7A6970','',1538218114,'1',0,'0',1538218192,'1'),
	(7,1848,X'E5B081E5AD98','',X'2F66696C652F31303030302F35336634336639363638343537393661383430376165393934393235376161342E7A6970','',1538218295,'1',0,'0',1538218304,'1'),
	(8,4285,X'E7A4BCE5AEBEE58E9FE59E8BE59BBE3039313832333330E5AEB8E58D93','',X'2F66696C652F31303030302F62646364663665623136353264626563393132303366623738353136663866362E7A6970','',1538218579,'1',0,'0',0,'0'),
	(9,12320,X'E5BD92E6A1A3','',X'2F66696C652F31303030302F62646139393433633238316135363664376235633263333938303236623638312E7A6970','',1538218590,'1',0,'0',1538218594,'1'),
	(10,12320,X'E5BD92E6A1A3','',X'2F66696C652F31303030302F62646139393433633238316135363664376235633263333938303236623638312E7A6970','',1538218604,'1',0,'0',0,'0'),
	(11,5901,X'E7A4BCE5AEBEE58E9FE59E8B3130313032303330E5AEB8E58D93','',X'2F66696C652F31303030302F39323865306264643033343563366338656364356333363664666532616162302E7A6970','',1540802944,'1',0,'0',0,'0');

/*!40000 ALTER TABLE `sp_upload_file` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sp_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sp_user`;

CREATE TABLE `sp_user` (
  `id` char(32) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(80) NOT NULL DEFAULT '' COMMENT '账号',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `name` varchar(80) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT '2' COMMENT '性别 0=男、1=女、2=未知',
  `age` tinyint(1) DEFAULT '0' COMMENT '年龄',
  `location` varchar(200) DEFAULT NULL COMMENT '地点',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(80) DEFAULT NULL COMMENT '邮箱',
  `email_verified` tinyint(1) DEFAULT '0' COMMENT '是否邮箱验证',
  `scope` varchar(2000) DEFAULT 'base' COMMENT '授权范围',
  `permissions` varchar(2000) DEFAULT NULL,
  `create_user` char(32) DEFAULT '0',
  `create_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `update_user` char(32) DEFAULT '0',
  `update_time` int(10) DEFAULT '0' COMMENT '修改时间',
  `delete_user` char(32) DEFAULT '0',
  `delete_time` int(10) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table w_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_admin`;

CREATE TABLE `w_admin` (
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '管理id',
  `user_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0正常的用户，2记录用户不作登陆使用，1前台用户',
  `groups` varchar(1000) NOT NULL DEFAULT '' COMMENT '权限组',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` char(60) DEFAULT NULL COMMENT '用户密码',
  `onetime_password` char(60) DEFAULT NULL,
  `fake_password` char(60) DEFAULT NULL COMMENT '伪造密码',
  `nickname` varchar(200) DEFAULT NULL COMMENT '昵称，花名',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(1) unsigned DEFAULT '0' COMMENT '性别',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `mobile_work` varchar(20) DEFAULT NULL COMMENT '工作手机',
  `passport_no` varchar(30) DEFAULT NULL COMMENT '护照号码',
  `mobile_self` varchar(20) DEFAULT NULL COMMENT '私人手机号码',
  `telegram_no` varchar(30) DEFAULT NULL COMMENT 'tg号码',
  `potato_no` varchar(20) DEFAULT NULL COMMENT 'Potato',
  `visa_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '签证日期',
  `household_register` varchar(200) DEFAULT NULL COMMENT '户籍',
  `nationality` varchar(100) DEFAULT NULL COMMENT '国籍',
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `safe_ips` varchar(200) DEFAULT NULL COMMENT '登陆IP限制',
  `is_first_login` tinyint(1) DEFAULT '1' COMMENT '是否首次登录',
  `date_expired` datetime DEFAULT NULL COMMENT '失效日期时间',
  `otp_auth` tinyint(1) DEFAULT '0' COMMENT 'MFA认证等级 0:禁用  1:启用  2:强制启用 [未使用]',
  `otp_authcode` char(16) DEFAULT '' COMMENT 'MFA验证码',
  `need_audit` tinyint(1) DEFAULT '0' COMMENT '登陆是否需要后台进行人工审核 0: 不需要 1:需要',
  `session_id` varchar(32) DEFAULT '' COMMENT '登陆时session_id',
  `session_expire` int(11) DEFAULT '1440' COMMENT 'SESSION有效期，默认24分钟',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '帐号状态 1:正常 0:禁止登陆',
  `regtime` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `regip` varchar(15) DEFAULT '' COMMENT '注册ip',
  `logintime` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `loginip` varchar(15) DEFAULT '' COMMENT '最后登录IP',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userid` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `w_admin` WRITE;
/*!40000 ALTER TABLE `w_admin` DISABLE KEYS */;

INSERT INTO `w_admin` (`uid`, `user_type`, `groups`, `username`, `password`, `onetime_password`, `fake_password`, `nickname`, `realname`, `sex`, `email`, `mobile_work`, `passport_no`, `mobile_self`, `telegram_no`, `potato_no`, `visa_time`, `household_register`, `nationality`, `position`, `safe_ips`, `is_first_login`, `date_expired`, `otp_auth`, `otp_authcode`, `need_audit`, `session_id`, `session_expire`, `status`, `regtime`, `regip`, `logintime`, `loginip`)
VALUES
	('1',2,'1','admin','$2y$10$mnq6yQodeZ0JEaS5rhDqnOZjmmcqEWvyIVYh2AUvLRbZ4LdwaNO4e','','$2y$10$VM56RjPoP/pBdwWS2RdPO.f8jV1qXX7sHiHckLbALKvjgNqLIKVHG','超级管理员','管理员',0,'seatleqwe888@gmail.com','','','','','',0,'','','','',0,'2088-06-08 00:00:00',0,'',0,'5mlnrr6g44ah030pacemp5hvdc',86400,1,1504873451,'10.10.12.25',1555816935,'127.0.0.1'),
	('3f1437baa8151ce672c59b3f727af5e8',2,'',NULL,NULL,NULL,NULL,'大姚','大姚',0,'','','','','','',0,'','','',NULL,1,NULL,0,'',0,'',1440,0,0,'',0,''),
	('637b311ecec8d0de38b1b9a3f72b63c8',2,'2','kong','$2y$10$mnq6yQodeZ0JEaS5rhDqnOZjmmcqEWvyIVYh2AUvLRbZ4LdwaNO4e',NULL,NULL,'孔以及','孔德新',0,'','17487987987','','','','',0,'','','','',0,NULL,0,'',0,'',1440,0,1551184557,'127.0.0.1',1551191654,'127.0.0.1'),
	('829f4411a2bb72501a166f79f85d66ac',2,'',NULL,NULL,NULL,NULL,'peter','peter',0,'','','','','','',0,'peter','','',NULL,1,NULL,0,'',0,'',1440,0,0,'',0,''),
	('90cbe9ff0fbfb7a036a68680fbca7e62',2,'',NULL,NULL,NULL,NULL,'双喜','双喜',0,'','','','','','',0,'','','',NULL,1,NULL,0,'',0,'',1440,0,0,'',0,''),
	('cb5fab623b92a4859945b139be76c952',2,'',NULL,NULL,NULL,NULL,'晴天','晴天',0,'','','','','','',0,'','','',NULL,1,NULL,0,'',0,'',1440,0,0,'',0,''),
	('f02c814eee264dce676284beb5bf64b9',2,'',NULL,NULL,NULL,NULL,'小泽','小泽',0,'','','','','','',0,'','','',NULL,1,NULL,0,'',0,'',1440,0,0,'',0,''),
	('fbde833ea17d7c1cffdae8b9ee1a0a98',2,'',NULL,NULL,NULL,NULL,'钢盔','钢盔',0,'gangkui1688@icloud.com','123123123123','','','8787888212','567898765',0,'asfdasfsdfasdfasdfasdf','','','',1,NULL,0,'',0,'',1440,0,1555242402,'127.0.0.1',0,'');

/*!40000 ALTER TABLE `w_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table w_admin_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_admin_group`;

CREATE TABLE `w_admin_group` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `name` varchar(20) DEFAULT NULL COMMENT '用户组名称',
  `purviews` text NOT NULL COMMENT '用户组权限',
  `uptime` int(10) DEFAULT NULL COMMENT '修改时间',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组表';

LOCK TABLES `w_admin_group` WRITE;
/*!40000 ALTER TABLE `w_admin_group` DISABLE KEYS */;

INSERT INTO `w_admin_group` (`id`, `name`, `purviews`, `uptime`, `addtime`)
VALUES
	('1','超级管理员','*',1504839424,1504839424),
	('2','服务组','member-index,member-add,member-edit,member-del',1551191642,1504839539),
	('3','司机组','',1551184488,1504842647),
	('93a9750a78315f51e9b5cd82d9d9f901','白丁组','',1551191546,1551191546),
	('eecdcb7c1416183f6d02be982d4671c8','客户组','',1551191530,1544696122);

/*!40000 ALTER TABLE `w_admin_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table w_admin_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_admin_login`;

CREATE TABLE `w_admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '用户ID',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `session_id` varchar(32) DEFAULT NULL COMMENT 'SESSION ID',
  `agent` varchar(500) DEFAULT NULL COMMENT '浏览器信息',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `loginip` varchar(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `logincountry` varchar(2) NOT NULL DEFAULT '' COMMENT '登录国家',
  `loginsta` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '登录时状态 1=成功，0=失败',
  `cli_hash` varchar(32) NOT NULL COMMENT '用户登录名和ip的hash',
  PRIMARY KEY (`id`),
  KEY `logintime` (`logintime`),
  KEY `cli_hash` (`cli_hash`,`loginsta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登陆记录表';

LOCK TABLES `w_admin_login` WRITE;
/*!40000 ALTER TABLE `w_admin_login` DISABLE KEYS */;

INSERT INTO `w_admin_login` (`id`, `uid`, `username`, `session_id`, `agent`, `logintime`, `loginip`, `logincountry`, `loginsta`, `cli_hash`)
VALUES
	(1,'1','admin','f78m7kq1d7pnjh8ba8pjfbg8on','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36',1555816882,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(2,'1','admin','5mlnrr6g44ah030pacemp5hvdc','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36',1555816935,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d');

/*!40000 ALTER TABLE `w_admin_login` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table w_admin_oplog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_admin_oplog`;

CREATE TABLE `w_admin_oplog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '项id',
  `uid` char(32) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `session_id` varchar(32) DEFAULT NULL COMMENT 'SESSION ID',
  `msg` varchar(250) NOT NULL COMMENT '消息内容',
  `do_time` int(10) unsigned NOT NULL COMMENT '发生时间',
  `do_ip` varchar(15) NOT NULL COMMENT '客户端IP',
  `do_country` char(2) NOT NULL DEFAULT '' COMMENT '国家',
  `do_url` varchar(100) NOT NULL COMMENT '操作网址',
  PRIMARY KEY (`id`),
  KEY `user_name` (`username`),
  KEY `do_time` (`do_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志';

LOCK TABLES `w_admin_oplog` WRITE;
/*!40000 ALTER TABLE `w_admin_oplog` DISABLE KEYS */;

INSERT INTO `w_admin_oplog` (`id`, `uid`, `username`, `session_id`, `msg`, `do_time`, `do_ip`, `do_country`, `do_url`)
VALUES
	(1,'1','admin','k8886vtapn5et2rbeang2r0icr','用户修改 1',1546683514,'127.0.0.1','-','?ct=admin&ac=edit&id=1&csrf_token_name=af8644435e0cf5b32300cd8c92aa3fe5&realname=管理员'),
	(2,'1','admin','l1kohvscvtmps4ljdnpq5as6r5','用户修改 1',1546866632,'127.0.0.1','-','?ct=admin&ac=edit&id=1&csrf_token_name=d22be61de728934d1b542a3034d88134&realname=管理员'),
	(3,'1','admin','c8lkfnurjakan3eq2ttckpcosn','用户修改 1',1547821097,'127.0.0.1','-','?ct=admin&ac=edit&id=1&csrf_token_name=2546b9f0ac874955948afb305609defc&realname=管理员'),
	(4,'1','admin','mr9t3gt7mldg1nki4m55hd6io1','用户组修改 eecdcb7c1416183f6d02be982d4671c8',1551184379,'127.0.0.1','-','?ct=admin_group&ac=edit&id=eecdcb7c1416183f6d02be982d4671c8'),
	(5,'1','admin','mr9t3gt7mldg1nki4m55hd6io1','用户组修改 2',1551184441,'127.0.0.1','-','?ct=admin_group&ac=edit&id=2&csrf_token_name=5063ff3da6d3b6a3bfad02c5175953c0&name=服务组'),
	(6,'1','admin','mr9t3gt7mldg1nki4m55hd6io1','用户组修改 eecdcb7c1416183f6d02be982d4671c8',1551184454,'127.0.0.1','-','?ct=admin_group&ac=edit&id=eecdcb7c1416183f6d02be982d4671c8'),
	(7,'1','admin','mr9t3gt7mldg1nki4m55hd6io1','用户组修改 3',1551184488,'127.0.0.1','-','?ct=admin_group&ac=edit&id=3&csrf_token_name=4b218901b8b44d4c223d084f664a244c&name=司机组'),
	(8,'1','admin','mr9t3gt7mldg1nki4m55hd6io1','用户组修改 2',1551184506,'127.0.0.1','-','?ct=admin_group&ac=edit&id=2&csrf_token_name=26c40fb6016d09cf8c91270afaa338dd&name=服务组'),
	(9,'1','admin','mr9t3gt7mldg1nki4m55hd6io1','用户删除 eea83e86ad5c708bcd7b059ae6811184',1551184518,'127.0.0.1','-','?ct=admin&ac=del&ids=array()'),
	(10,'1','admin','mr9t3gt7mldg1nki4m55hd6io1','用户删除 2e9223ebda358a1e265241b903a5be08',1551184522,'127.0.0.1','-','?ct=admin&ac=del&ids=array()'),
	(11,'1','admin','mr9t3gt7mldg1nki4m55hd6io1','用户添加 637b311ecec8d0de38b1b9a3f72b63c8',1551184557,'127.0.0.1','-','?ct=admin&ac=add&csrf_token_name=76571e727f92f6c40eb5c1c09643dbfb&username=kong&realname=孔德新'),
	(12,'1','admin','hqfs6va5iuraglt2pk1bkr1qj4','用户组修改 2',1551184882,'127.0.0.1','-','?ct=admin_group&ac=edit&id=2&csrf_token_name=2be5cc56c7ff00e6795dfd5c382a2410&name=服务组'),
	(13,'1','admin','hqfs6va5iuraglt2pk1bkr1qj4','用户组修改 2',1551191500,'127.0.0.1','-','?ct=admin_group&ac=edit&id=2&csrf_token_name=d37b55e4e6ecbbea8ce7f66bdb53e885&name=服务组'),
	(14,'1','admin','hqfs6va5iuraglt2pk1bkr1qj4','用户组修改 eecdcb7c1416183f6d02be982d4671c8',1551191527,'127.0.0.1','-','?ct=admin_group&ac=edit&id=eecdcb7c1416183f6d02be982d4671c8'),
	(15,'1','admin','hqfs6va5iuraglt2pk1bkr1qj4','用户组修改 eecdcb7c1416183f6d02be982d4671c8',1551191530,'127.0.0.1','-','?ct=admin_group&ac=edit&id=eecdcb7c1416183f6d02be982d4671c8'),
	(16,'1','admin','hqfs6va5iuraglt2pk1bkr1qj4','用户组添加 93a9750a78315f51e9b5cd82d9d9f901',1551191546,'127.0.0.1','-','?ct=admin_group&ac=add&csrf_token_name=2fcbffc4b22245c1d050aba71f190ccc&name=白丁组'),
	(17,'1','admin','hrvfuknscl0vq5nal2tg61ca50','用户修改 637b311ecec8d0de38b1b9a3f72b63c8',1551191621,'127.0.0.1','-','?ct=admin&ac=edit&id=637b311ecec8d0de38b1b9a3f72b63c8'),
	(18,'1','admin','hrvfuknscl0vq5nal2tg61ca50','用户组修改 2',1551191642,'127.0.0.1','-','?ct=admin_group&ac=edit&id=2&csrf_token_name=fe3ea5e12bcb7d98ea6af2823b1fd346&name=服务组'),
	(19,'1','admin','eaejsfgorkevbdik1laf2o2br2','用户修改 fbde833ea17d7c1cffdae8b9ee1a0a98',1555305084,'127.0.0.1','-','?ct=admin&ac=edit&id=fbde833ea17d7c1cffdae8b9ee1a0a98'),
	(20,'1','admin','eaejsfgorkevbdik1laf2o2br2','用户修改 fbde833ea17d7c1cffdae8b9ee1a0a98',1555305140,'127.0.0.1','-','?ct=admin&ac=edit&id=fbde833ea17d7c1cffdae8b9ee1a0a98'),
	(21,'1','admin','eaejsfgorkevbdik1laf2o2br2','用户修改 fbde833ea17d7c1cffdae8b9ee1a0a98',1555305229,'127.0.0.1','-','?ct=admin&ac=edit&id=fbde833ea17d7c1cffdae8b9ee1a0a98');

/*!40000 ALTER TABLE `w_admin_oplog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table w_admin_purview
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_admin_purview`;

CREATE TABLE `w_admin_purview` (
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '管理员ID',
  `purviews` text NOT NULL COMMENT '配置字符',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限表';

LOCK TABLES `w_admin_purview` WRITE;
/*!40000 ALTER TABLE `w_admin_purview` DISABLE KEYS */;

INSERT INTO `w_admin_purview` (`uid`, `purviews`)
VALUES
	('eea83e86ad5c708bcd7b059ae6811184','content-index,category-del,member-index,member-add');

/*!40000 ALTER TABLE `w_admin_purview` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table w_assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_assets`;

CREATE TABLE `w_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '资产名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型ID',
  `num` varchar(200) NOT NULL DEFAULT '' COMMENT '数量',
  `remark` text COMMENT '备注说明',
  `create_time` int(10) unsigned NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '',
  `update_time` int(10) unsigned NOT NULL,
  `update_user` char(32) NOT NULL DEFAULT '',
  `delete_time` int(10) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产登记表';



# Dump of table w_assets_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_assets_type`;

CREATE TABLE `w_assets_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `create_time` int(10) unsigned NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '',
  `update_time` int(10) unsigned NOT NULL,
  `update_user` char(32) NOT NULL DEFAULT '',
  `delete_time` int(10) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table w_attendance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_attendance`;

CREATE TABLE `w_attendance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `uid` char(32) NOT NULL DEFAULT '' COMMENT '员工ID',
  `time` varchar(10) NOT NULL DEFAULT '' COMMENT '年月日',
  `seg` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '班次时段 0 上午 1 下午 2 晚上   ',
  `userstate` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '1 出勤 2 请假 4 公差 8 迟到 16 早退 32 旷工',
  `create_time` int(10) unsigned NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '',
  `update_time` int(10) unsigned NOT NULL,
  `update_user` char(32) NOT NULL DEFAULT '',
  `delete_time` int(10) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤表';



# Dump of table w_book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_book`;

CREATE TABLE `w_book` (
  `book_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '书本名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1正常2禁用',
  `nums` int(10) unsigned DEFAULT '1' COMMENT '库存总数量',
  `borrow_nums` int(10) unsigned DEFAULT '0' COMMENT '借出数量',
  `author` varchar(200) DEFAULT '' COMMENT '作者',
  `remark` text COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '',
  `update_time` int(11) unsigned NOT NULL,
  `update_user` char(32) NOT NULL DEFAULT '',
  `delete_time` int(11) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `w_book` WRITE;
/*!40000 ALTER TABLE `w_book` DISABLE KEYS */;

INSERT INTO `w_book` (`book_id`, `name`, `status`, `nums`, `borrow_nums`, `author`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `delete_time`, `delete_user`)
VALUES
	(1,'程序与设计第一部',1,1,2,'起风了',NULL,1555219952,'1',1555219952,'1',0,'0'),
	(2,'程序与设计第二部',1,11,0,'起风了',NULL,1555219959,'1',1555228792,'1',0,'0'),
	(3,'程序与设计第第四部',1,1,3,'起风了',NULL,1555219969,'1',1555228754,'1',0,'0'),
	(4,'程序与设计第三部',1,120,3,'起风了','&amp;lt;h3&amp;gt;1231jdfljaskljdflajslk231&amp;lt;/h3&amp;gt;',1555228485,'1',1555229865,'1',0,'0'),
	(5,'java程序设计',1,100,4,'起风了','&amp;lt;p&amp;gt;离开就离开家了&amp;lt;/p&amp;gt;',1555233337,'1',1555233337,'1',0,'0'),
	(6,'php程序设计',1,12,1,'起风了','&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color: rgb(113, 140, 0); font-family: Inconsolata, monospace; font-size: 16px; letter-spacing: -0.48px; white-space: pre; background-color: rgb(246, 246, 246);&amp;quot;&amp;gt;multiple&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;background-color: rgb(246, 246, 246); color: rgb(113, 140, 0); font-family: Inconsolata, monospace; font-size: 16px; letter-spacing: -0.48px; white-space: pre;&amp;quot;&amp;gt; multiple&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;background-color: rgb(246, 246, 246); color: rgb(113, 140, 0); font-family: Inconsolata, monospace; font-size: 16px; letter-spacing: -0.48px; white-space: pre;&amp;quot;&amp;gt; multiple&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;',1555233379,'1',1555233379,'1',0,'0'),
	(7,'mysql程序设计',1,11,4,'起风了','&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color: rgb(113, 140, 0); font-family: Inconsolata, monospace; font-size: 16px; letter-spacing: -0.48px; white-space: pre; background-color: rgb(246, 246, 246);&amp;quot;&amp;gt;multiple&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;',1555233400,'1',1555233400,'1',0,'0'),
	(8,'python程序设计',1,13,1,'起风了','&amp;lt;p&amp;gt;放大说到发送到发阿斯顿发阿斯顿发阿斯顿发&amp;lt;/p&amp;gt;',1555242285,'1',1555242285,'1',0,'0'),
	(9,'python程序设计',1,133,0,'起风了','&amp;lt;p&amp;gt;放大说到发送到发阿斯顿发阿斯顿发阿斯顿发&amp;lt;/p&amp;gt;',1555242297,'1',1555242297,'1',0,'0');

/*!40000 ALTER TABLE `w_book` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table w_borrow_book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_borrow_book`;

CREATE TABLE `w_borrow_book` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `borrow_id` bigint(11) unsigned NOT NULL,
  `book_id` bigint(11) unsigned NOT NULL,
  `member_id` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `borrow_id` (`borrow_id`,`member_id`,`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `w_borrow_book` WRITE;
/*!40000 ALTER TABLE `w_borrow_book` DISABLE KEYS */;

INSERT INTO `w_borrow_book` (`id`, `borrow_id`, `book_id`, `member_id`)
VALUES
	(1,1,8,'637b311ecec8d0de38b1b9a3f72b63c8'),
	(5,2,2,'760b9c819d8df78e5493720a4e3fb9de'),
	(4,2,4,'760b9c819d8df78e5493720a4e3fb9de'),
	(3,2,6,'760b9c819d8df78e5493720a4e3fb9de'),
	(2,2,7,'760b9c819d8df78e5493720a4e3fb9de'),
	(8,3,1,'35dfd905039bc63d4b021babc059f69a'),
	(7,3,4,'35dfd905039bc63d4b021babc059f69a'),
	(6,3,6,'35dfd905039bc63d4b021babc059f69a'),
	(12,4,3,'fbde833ea17d7c1cffdae8b9ee1a0a98'),
	(11,4,4,'fbde833ea17d7c1cffdae8b9ee1a0a98'),
	(10,4,5,'fbde833ea17d7c1cffdae8b9ee1a0a98'),
	(9,4,7,'fbde833ea17d7c1cffdae8b9ee1a0a98'),
	(16,5,5,'656c8617ea9bbca4a96aba8de9881644'),
	(15,5,6,'656c8617ea9bbca4a96aba8de9881644'),
	(14,5,7,'656c8617ea9bbca4a96aba8de9881644'),
	(13,5,8,'656c8617ea9bbca4a96aba8de9881644');

/*!40000 ALTER TABLE `w_borrow_book` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table w_borrow_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `w_borrow_log`;

CREATE TABLE `w_borrow_log` (
  `borrow_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` char(32) DEFAULT '0' COMMENT '借书人uid',
  `back_date` varchar(30) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '1已借2已还3丢失',
  `remark` text,
  `create_time` int(11) unsigned NOT NULL,
  `create_user` char(32) NOT NULL DEFAULT '',
  `update_time` int(11) unsigned NOT NULL,
  `update_user` char(32) NOT NULL DEFAULT '',
  `delete_time` int(11) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`borrow_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
