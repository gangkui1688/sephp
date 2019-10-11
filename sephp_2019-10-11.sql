# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.01 (MySQL 5.7.20-log)
# Database: sephp
# Generation Time: 2019-10-11 13:13:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table se_admin_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_admin_group`;

CREATE TABLE `se_admin_group` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `remark` text,
  `create_time` int(11) NOT NULL,
  `create_user` int(11) DEFAULT '0',
  `powerlist` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_admin_group` WRITE;
/*!40000 ALTER TABLE `se_admin_group` DISABLE KEYS */;

INSERT INTO `se_admin_group` (`group_id`, `name`, `remark`, `create_time`, `create_user`, `powerlist`, `status`)
VALUES
	(1,'超级管理员','权限不受控制',1535536245,1,'[\"systemManagement\",\"?ct=system&ac=menus\",\"后台用户管理\",\"?ct=admin&ac=userlist\",\"?ct=admin&ac=grouplist\",\"文件管理\",\"?ct=system&ac=file_manager\",\"?ct=system&ac=upload_file\",\"?ct=system&ac=file_label\",\"?ct=system&ac=baise_config\",\"?ct=system&ac=menus\",\"?ct=system&ac=friend_link\",\"数据库管理\",\"?ct=system&ac=data_backups\",\"?ct=system&ac=data_optimization\",\"?ct=system&ac=data_select\",\"whcatManagement\",\"?ct=wechat&ac=base\",\"?ct=wechat&ac=content_index\",\"?ct=wechat&ac=content_index\",\"?ct=wechat&ac=content_index\",\"contentManagement\",\"?ct=content&ac=cate_index\",\"?ct=content&ac=content_index\",\"membersManagement\",\"?ct=member&ac=member_list\",\"?ct=member&ac=grade_list\",\"?ct=member&ac=message_list\",\"?ct=member&ac=advance_list\",\"?ct=member&ac=advance_list\",\"?ct=member&ac=advance_list\",\"?ct=member&ac=log_list\",\"卡劵管理\",\"?ct=coupons&ac=coupons_add\",\"?ct=coupons&ac=coupons_list\",\"?ct=coupons&ac=coupons_use\",\"代理管理\",\"?ct=system&ac=data_backups\",\"?ct=system&ac=data_optimization\",\"stroeCenter\",\"?ct=stroe&ac=index\",\"?ct=stroe&ac=catelist\",\"productManager\",\"?ct=product&ac=index\",\"?ct=product&ac=catelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"orderCenter\",\"?ct=order&ac=index\"]',1),
	(2,'老师组','园区老师',1535536292,1,'null',1),
	(3,'校长','校长',1536742381,1,NULL,1),
	(4,'学生','',1536744469,1,NULL,1),
	(5,'财务部门','会计',1536745043,1,NULL,1);

/*!40000 ALTER TABLE `se_admin_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_admin_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_admin_login`;

CREATE TABLE `se_admin_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(60) DEFAULT '' COMMENT '用户登陆session_id ',
  `status` tinyint(1) unsigned NOT NULL COMMENT '1登陆成功2登录失败',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '登陆IP地址',
  `username` varchar(100) DEFAULT NULL COMMENT '登陆用户名称',
  `login_time` int(10) unsigned NOT NULL COMMENT '登陆时间',
  `login_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登陆用户id',
  `agent` varchar(1000) DEFAULT NULL COMMENT '浏览器信息',
  `user_type` varchar(30) NOT NULL DEFAULT 'admin' COMMENT 'admin后台用户',
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_admin_login` WRITE;
/*!40000 ALTER TABLE `se_admin_login` DISABLE KEYS */;

INSERT INTO `se_admin_login` (`id`, `session_id`, `status`, `login_ip`, `username`, `login_time`, `login_id`, `agent`, `user_type`, `remark`)
VALUES
	(1,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','admin',1541652488,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(2,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','gangkui003',1541652713,6,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(3,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','gangkui003',1541663249,6,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(4,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','gangkui003',1541663463,6,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(5,'ka4n0rp0es5tlsva5c290rc1o6',2,'127.0.0.1','gangkui002',1541663594,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin','用户名或者密码错误'),
	(6,'ka4n0rp0es5tlsva5c290rc1o6',2,'127.0.0.1','gangkui002',1541663599,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin','用户名或者密码错误'),
	(7,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','gangkui001',1541663626,11,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(8,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','admin',1541666475,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(9,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','admin',1541666669,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(10,'3es2dhof7u9qa27gko6384i9t7',2,'127.0.0.1','gangkui001',1541670999,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Safari/605.1.15','admin','用户名或者密码错误'),
	(11,'3es2dhof7u9qa27gko6384i9t7',1,'127.0.0.1','gangkui001',1541671024,11,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Safari/605.1.15','admin',NULL),
	(12,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','admin',1541671184,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(13,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','admin',1541671923,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(14,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','gangkui001',1541671952,11,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(15,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','gangkui001',1541672566,11,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(16,'ka4n0rp0es5tlsva5c290rc1o6',1,'127.0.0.1','gangkui001',1541673499,11,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(17,'myprefix-brcmrvlo54bapnm4hm8mqjact6',1,'127.0.0.1','gangkui001',1542114074,11,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(18,'t6ju3io3uj97dbusfcrucgnb45',1,'127.0.0.1','admin',1542255720,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(19,'fs1lr2kerrlagmsmns1210e5j3',1,'127.0.0.1','admin',1542255731,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(20,'k3e6sb9n872ocrhbgas18svao0',1,'127.0.0.1','admin',1542255781,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(21,'gad4an9vbc5a7h619r4uc8bi12',1,'127.0.0.1','admin',1542256020,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(22,'3soob4n9q2igqup2lucb04mks3',1,'127.0.0.1','admin',1542256070,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(23,'fb8p8cmd39hiqc2nt30u21qpa1',1,'127.0.0.1','admin',1542256273,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(24,'i0f9dcgti8qk0pomone3222fq7',1,'127.0.0.1','admin',1542256281,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(25,'e3k56iobiveacg9hvlo79k3600',1,'127.0.0.1','admin',1542256356,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(26,'v2ba02m7e69cu1p299r45vqev2',1,'127.0.0.1','admin',1542256396,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(27,'1tti0a2lmlcu04cs3upk3cd8c2',1,'127.0.0.1','admin',1542256465,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(28,'myprefix-brcmrvlo54bapnm4hm8mqjact6',1,'127.0.0.1','admin',1542256558,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(29,'myprefix-brcmrvlo54bapnm4hm8mqjact6',1,'127.0.0.1','admin',1542256880,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(30,'9jp4p7vpt8f61q0m4lmu3ngk90',1,'127.0.0.1','admin',1542256959,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(31,'jepgibupjem1hc93n154vogvj2',1,'127.0.0.1','admin',1542256965,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(32,'uhtk8inecd8p2aciu0tg2k2e93',1,'127.0.0.1','admin',1542256993,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(33,'4ma9opvlqb9n3tupsiv3v9a3f5',1,'127.0.0.1','admin',1542257064,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(34,'tai3urqrlg2g12pn5cl17cb9l2',1,'127.0.0.1','admin',1542257100,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(35,'s04qkivuh4dk79h338sa2npgm6',1,'127.0.0.1','admin',1542257155,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(36,'psaq6a4p8n3276f0c9i83keku3',1,'127.0.0.1','admin',1542257181,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(37,'3ccvnrhhhqd8mng4mj9hs5i113',1,'127.0.0.1','admin',1542257258,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(38,'tmr1e4l9v91ersgeg82jqf5k10',1,'127.0.0.1','admin',1542257306,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(39,'myprefix-brcmrvlo54bapnm4hm8mqjact6',1,'127.0.0.1','admin',1542257397,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(40,'8dgblmo9tnpg28m5mk6pd07hc4',1,'127.0.0.1','admin',1542257418,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(41,'71pu3jiqh12bcf4lanmipq5dj5',1,'127.0.0.1','admin',1542257425,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(42,'b0ee2j87jodesemkcr6ldhknq4',1,'127.0.0.1','admin',1542257466,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(43,'s8c3gt8p1ioas0j32fi4pb4mg4',1,'127.0.0.1','admin',1542257548,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(44,'6perv7psdbs195mb8gg6pak5l0',1,'127.0.0.1','admin',1542257661,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(45,'cgj5da5tfsl9oe4ua20oarn587',1,'127.0.0.1','admin',1542257667,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(46,'lsqpd5rf50si39cmma0dvkdpi2',1,'127.0.0.1','admin',1542266764,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(47,'v0qqpe5l32ja5nvh503qmsmi61',1,'127.0.0.1','admin',1542266765,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(48,'cfb94rqasarkkmac9hh8in1i17',1,'127.0.0.1','admin',1542266803,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(49,'gqjfkrfroqmei6rr3mgdqegq30',1,'127.0.0.1','admin',1542266852,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(50,'tp7uvagdijosn6qpo1a3irfdt7',1,'127.0.0.1','admin',1542266999,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(51,'t2tsnr9lfst4oogqb860272id5',1,'127.0.0.1','admin',1542267276,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(52,'myprefix-brcmrvlo54bapnm4hm8mqjact6',1,'127.0.0.1','admin',1542267334,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(53,'kbc1op51k73dn7au7raffq4cr4',1,'127.0.0.1','admin',1542268392,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(54,'v9fhvisuumdf05u4vjelj94m21',1,'127.0.0.1','admin',1542360186,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(55,'53lkms8qpucb33a957oq172jf3',1,'127.0.0.1','admin',1542360275,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(56,'09r243kn1ltpbsms327igrjmn1',1,'127.0.0.1','admin',1542360281,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(57,'gt0befg5ng88s6ogp45r9skb87',1,'127.0.0.1','admin',1542360297,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(58,'796pf1ibif71kgkdjc5eqc3pm0',1,'127.0.0.1','admin',1542360348,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(59,'3b1q88neo8p7uld5fa4t58ie41',1,'127.0.0.1','admin',1542360359,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(60,'cmgv414fhdgg03ne2ac6alelp6',1,'127.0.0.1','admin',1542360406,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(61,'dl6p36j67o55lh9ol55pd0rtk1',1,'127.0.0.1','admin',1542360492,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(62,'245uah9gpr2r1ia0n0o284u7r0',1,'127.0.0.1','admin',1542369258,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(63,'q1a30ltml5nr7qfk2oeg380e83',1,'127.0.0.1','admin',1542425736,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(64,'8n2bj4ht9hv006g2vqk0mdvjo2',1,'127.0.0.1','admin',1542623928,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(65,'oceufq48junehgmvdgvr715292',1,'127.0.0.1','admin',1542806409,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(66,'e5j04cr7lk7oufn7i5v21o8a54',1,'127.0.0.1','admin',1543549074,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','admin',NULL),
	(67,'b3rp4598u8r1e9mo5cp26q4t85',1,'127.0.0.1','admin',1545817751,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','admin',NULL),
	(68,'eg0h75o3ovobqgcfes2pcfbbl2',1,'127.0.0.1','admin',1545829619,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','admin',NULL),
	(69,'s74kf4mo9ts3ks0l6v5secchn0',2,'127.0.0.1','admin',1545898398,0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0) Gecko/20100101 Firefox/64.0','admin','用户名或者密码错误'),
	(70,'s74kf4mo9ts3ks0l6v5secchn0',1,'127.0.0.1','admin',1545898408,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0) Gecko/20100101 Firefox/64.0','admin',NULL),
	(71,'6je5opa88ljsvv1n7n5rm7g953',1,'127.0.0.1','admin',1545900420,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','admin',NULL),
	(72,'1ln6fjjrbina5s5du131meuts4',1,'127.0.0.1','admin',1564542585,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','admin',NULL),
	(73,'in7pj989hkpdcpkbgpacqnu0l0',1,'127.0.0.1','admin',1564634313,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','admin',NULL),
	(74,'pi98q3nt376ur0caultto706us',1,'127.0.0.1','admin',1570765439,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(75,'pi98q3nt376ur0caultto706us',1,'127.0.0.1','admin',1570765475,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(76,'pi98q3nt376ur0caultto706us',1,'127.0.0.1','admin',1570765912,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(77,'pi98q3nt376ur0caultto706us',1,'127.0.0.1','admin',1570766231,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(78,'fl7cp105e12ldfjc3hpccb0lf2',1,'127.0.0.1','admin',1570787554,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL);

/*!40000 ALTER TABLE `se_admin_login` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_admin_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_admin_user`;

CREATE TABLE `se_admin_user` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` char(60) NOT NULL DEFAULT '',
  `sex` tinyint(1) DEFAULT NULL COMMENT '1男2女',
  `email` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常2禁用',
  `realname` varchar(100) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `auth_secert` char(32) DEFAULT '' COMMENT 'google身份验证的密钥',
  `session_id` varchar(60) DEFAULT '',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_admin_user` WRITE;
/*!40000 ALTER TABLE `se_admin_user` DISABLE KEYS */;

INSERT INTO `se_admin_user` (`admin_id`, `group_id`, `username`, `password`, `sex`, `email`, `status`, `realname`, `remark`, `create_time`, `auth_secert`, `session_id`)
VALUES
	(1,1,'admin','$2y$10$tra3DMOjyKhDpQD1qe82Oe6b3n7StDIkprH8UXtscUdYo46DnAsim',1,'admin@admin.com',1,'钢盔','so fuck beautiful',NULL,'EEOQBNTJ7CDGCWPDVSVVQGZ37FK7RBU7','fl7cp105e12ldfjc3hpccb0lf2'),
	(2,0,'admi12312','88eefa138a5584a45b6790cf2c4fbd67',1,'admin@admin.com',2,NULL,'',NULL,NULL,'0'),
	(3,0,'dasdfasfdasd','2236495fe9bf433cf70949790ef20841',1,'sdfasdfasdf',2,NULL,'',NULL,NULL,'0'),
	(6,2,'gangkui003','$2y$10$rsRw/PKLQPfhpR.XwrD6m.ocMygl6gd4BEtuNAPJbokykX5e.AMG.',1,'asdfasd@123.com',1,'里相遇','',NULL,'DZWBRUUNUUJDAXXR44MVYMCUPOEMQIPS','0'),
	(11,5,'gangkui001','$2y$10$pLKmTwiz./w.8hPja3qQjuBdIwvskB3gPEY/ljVCdau6P/hElYELq',NULL,'001@adm.com',1,'钢盔01','gangkui001',1535528791,'HOELO43EFXMWYYWKWCSZ3QEMWRPQLR33','myprefix-brcmrvlo54bapnm4hm8mqjact6'),
	(13,2,'gangkui','7fef6171469e80d32c0559f88b377245',NULL,'admin@admin.com',2,'发送到发送','Smarty_Internal_Templatelexer Smarty_Internal_Templatelexer Smarty_Internal_Templatelexer Smarty_Internal_Templatelexer',1536739662,'','0');

/*!40000 ALTER TABLE `se_admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_cart`;

CREATE TABLE `se_cart` (
  `cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `member_ident` varchar(50) NOT NULL COMMENT '会员ident',
  `params` longtext NOT NULL COMMENT '购物车对象参数',
  PRIMARY KEY (`cart_id`,`member_ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_config`;

CREATE TABLE `se_config` (
  `key` varchar(250) NOT NULL DEFAULT '',
  `value` longtext,
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

LOCK TABLES `se_config` WRITE;
/*!40000 ALTER TABLE `se_config` DISABLE KEYS */;

INSERT INTO `se_config` (`key`, `value`)
VALUES
	('base_config','{\"web_name\":\"宜昌章技网络科技有限公司\",\"page_title\":\"宜昌软件开发_软件开发公司_宜昌软件公司-宜昌章洪科技软件开发公司\",\"page_keywords\":\"宜昌软件开发公司,软件开发公司,武汉软件公司,武汉软件开发,武汉手机软件开发公司,武汉app开发公司\",\"page_description\":\"章洪科科技-为企业提供专业的软件开发外包解决方案，涵盖多种应用与技术平台，拥有成熟的信息系统和行业软件开发外包解决方案，我们的专业团队将作为您的IT部门来开展长期紧密的合作，立足于您的业务和信息化目标，开发符合您业务目标和商业价值的软件。\",\"count_code\":\"&lt;script&gt;console.log(12312312312)&lt;/script&gt;\",\"icp_name\":\"ICP-浙KSKJ6789YYUI234\",\"company_address\":\"你猜dfasdfasdfa\",\"contact_number\":\"18923423423423\",\"email\":\"admin@admin.com\",\"qq_number\":\"12312312312fsdfasdfasdfas\"}'),
	('company_aptitude','\"&lt;p&gt;dfasdfasdfa&lt;/p&gt;\"'),
	('company_cultural','\"&lt;div class=&quot;general_con_c_ri_title&quot;&gt;&lt;h4&gt;&lt;b&gt;专业+经验+创意+服务&lt;/b&gt;&lt;/h4&gt;&lt;h6&gt;&lt;span style=&quot;font-family: Arial;&quot;&gt;专业的&amp;nbsp;技术&amp;nbsp;，丰富的成功经验，卓越的设计思维，为您创作符合您业务和商业价值的解决方案！&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;font-family: Arial;&quot;&gt;为客户服务而努力，是我们每一个人贡献自己才华的方向，我们不光要懂得软件开发技术，还需要与客户发展战略规划对接，给客户优质服务，公司将坚持以创新、求实、诚信作为经营理念，不断吸收先进团队管理经验，继续为各个行业提供更加优秀、更加完善的解决方案。&lt;/span&gt;&lt;/h6&gt;&lt;/div&gt;\"'),
	('company_profile','\"&lt;p&gt;&lt;b&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;我们是谁？&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 北京宜天信达网络科技有限公司-软件开发公司是国内专业的软件外包、定制开发公司。自成立以来，秉承&quot;诚信、协作、奉献、超越&quot;的精神，着力打造集战略咨询、平台技术和专业服务为一体的软件企业。在金融、保险、银行、医疗、物流、制造、教育、核能、汽车等行业拥有丰富的软件开发经验。北京软件开发公司宜天信达涵盖多种应用与技术平台，拥有成熟的信息系统和软件开发外包解决方案，我们的专业团队将作为您的IT部门来开展长期紧密的合作，立足于您的业务和信息化目标，开发符合您业务目标和商业价值的软件。我们将抓住机遇，坚持以人为本，加大自主产品创新，提升重大工程实施能力，加快规范化进程，实现规模经济和跨越式发展，立志打造&ldquo;中国软件行业优秀企业&rdquo;。&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;我们之所以存在，是因为我们帮助客户解决问题&lt;/p&gt;\"'),
	('files','\"\"'),
	('friend_link','[{\"sort_id\":\"87\",\"title\":\"百度\",\"url\":\"www.baidu.com\",\"status\":\"2\"},{\"sort_id\":\"43\",\"title\":\"阿里巴巴\",\"url\":\"www.alibaba.com\",\"status\":\"1\"},{\"sort_id\":\"11\",\"title\":\"腾讯\",\"url\":\"www.qq.com\",\"status\":\"1\"},{\"sort_id\":\"3\",\"title\":\"谷歌\",\"url\":\"www.google.com\",\"status\":\"1\"},{\"sort_id\":\"1\",\"title\":\"脸书\",\"url\":\"www.facebook.com\",\"status\":\"1\"}]'),
	('join_us','\"&lt;div class=&quot;general_con_c_ri_word&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; color: rgb(102, 102, 102); font-family: 微软雅黑; font-size: 12px; background-color: rgb(246, 246, 246);&quot;&gt;加入宜天信达是在一个成熟的工作机会，我们是不断发展公司成功结合的创新和经验实践的机会！软件开发公司宜天信达提供了大量的可能性不断增加个人的专业和个人发展的帮助。让你的职业生涯的技术思想开阔和获得丰厚回报。&lt;br&gt;我们不介意你是否科班出身，是否有这证书那资格&hellip;&hellip; 你的能力才是唯一证明你实力的途径 JAVA、C#、UI设计、前端网页、等各都可以。&lt;br&gt;如果除了学校教的那点玩意，你再没有在设计和创意上费过心力，就不用浪费自己和我们的时间了。&lt;br&gt;如果你爱软件、爱创意，有出众的美感和过剩的灵感 而且一直勤奋地创作了大量作品。那么，你很可能就是我们在找的人&lt;/div&gt;&lt;div class=&quot;jion_mail&quot; style=&quot;margin: 10px 0px 0px; padding: 0px; border: 0px; color: rgb(68, 68, 68); font-family: 微软雅黑; font-size: 12px; background-color: rgb(246, 246, 246);&quot;&gt;咨询邮箱：service@yitianxinda.com&lt;/div&gt;\"'),
	('service_range','\"\"');

/*!40000 ALTER TABLE `se_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_content`;

CREATE TABLE `se_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL DEFAULT '' COMMENT '文章标题',
  `cate_id` int(11) unsigned NOT NULL COMMENT '文章分类',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '文章重要性，1推荐置顶，2不推',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示1显示，2不显示',
  `author` varchar(200) DEFAULT '0' COMMENT '文章作者	',
  `keywords` varchar(500) DEFAULT NULL COMMENT '关键字',
  `description` varchar(500) DEFAULT NULL COMMENT '网页描述	',
  `url` varchar(300) DEFAULT NULL COMMENT '外部链接	',
  `content` longtext COMMENT '文章内容',
  `create_time` int(10) unsigned NOT NULL,
  `create_user` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned DEFAULT '0',
  `update_user` int(10) unsigned DEFAULT '0',
  `delete_user` int(10) unsigned DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_content` WRITE;
/*!40000 ALTER TABLE `se_content` DISABLE KEYS */;

INSERT INTO `se_content` (`id`, `title`, `cate_id`, `is_top`, `status`, `is_show`, `author`, `keywords`, `description`, `url`, `content`, `create_time`, `create_user`, `update_time`, `update_user`, `delete_user`, `delete_time`)
VALUES
	(1,'我要买飞机',7,2,1,1,'admin','dsfasdfasdf','asdfasdfasdf','sdfasdf','&lt;p&gt;sdfasdfasdfa发送到发送&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;阿斯顿发送到发啊撒&lt;img src=&quot;http://sephp.a.com/upload/file/955638227140648969821.jpg&quot; data-filename=&quot;插入图片&quot; style=&quot;width: 25%;&quot;&gt;&lt;/p&gt;',1537527202,1,0,0,0,0),
	(2,'充值流程',3,2,1,1,'admin','fa s d f','a s d fa s d fa s d f','阿斯顿发送到发','',1537527300,1,0,0,0,0),
	(3,'售后流程',5,2,1,1,'','阿就会快乐；立刻就会哭','说到发送的发送到发阿斯顿','','',1537527351,1,0,0,0,0),
	(4,'发展既要',2,2,1,1,'admin','','到发','','',1537585159,1,0,0,0,0);

/*!40000 ALTER TABLE `se_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_content_cate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_content_cate`;

CREATE TABLE `se_content_cate` (
  `cate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '类名',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `is_show` tinyint(1) unsigned DEFAULT '1' COMMENT '首页显示，1显示2不显示',
  `path` varchar(100) NOT NULL DEFAULT '0' COMMENT '路径',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '等级，级别',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1可用2禁用',
  `remark` varchar(500) DEFAULT NULL COMMENT '描述,备注',
  `create_user` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `keywords` varchar(500) DEFAULT NULL COMMENT '关键字',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `sort_num` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '排序号码',
  `child_num` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '子类数量',
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_content_cate` WRITE;
/*!40000 ALTER TABLE `se_content_cate` DISABLE KEYS */;

INSERT INTO `se_content_cate` (`cate_id`, `name`, `parent_id`, `is_show`, `path`, `level`, `status`, `remark`, `create_user`, `create_time`, `keywords`, `description`, `sort_num`, `child_num`)
VALUES
	(1,'关于我们',4,1,'0',1,1,'',1,1537001111,'据了解阿莱克斯简单快乐发送','说到发送到发送的',1,2),
	(2,'日常妙招',1,1,'0-1',2,1,NULL,1,1537003308,'sssssssfasdfasdfasd','实打实分',1,2),
	(3,'联系我们',0,1,'0',1,1,NULL,1,1537003355,'新产品','是否',1,1),
	(4,'电子产品',3,1,'0-3',2,1,NULL,1,1537003373,'阿斯顿发送到','',1,0),
	(5,'可以试试',2,1,'0-1-2',3,1,NULL,1,1537003919,'回家看了就好看就好','',1,0),
	(6,'一起健身',2,1,'0-1-2',3,1,NULL,1,1537008693,'收到发发撒的发','阿斯顿发',1,0),
	(7,'技术跟新',1,2,'0-1',2,1,NULL,1,1537008710,'a s d f s d f','dsfasdfasd是发送到发dfasdfasdf',1,0),
	(8,'合作案例',0,1,'0',1,1,NULL,1,1537009126,'可节省空间','就会快乐JKL;LKJHKL;',100,1),
	(9,'找鸭子',8,1,'0-8',2,1,NULL,1,1537009151,'','',2,0);

/*!40000 ALTER TABLE `se_content_cate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_coupons`;

CREATE TABLE `se_coupons` (
  `cpns_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券方案id',
  `cpns_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券号码',
  `cpns_prefix` varchar(50) DEFAULT '' COMMENT '优惠券前缀',
  `cpns_key` varchar(20) DEFAULT '' COMMENT '优惠券生成的key',
  `cpns_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券状态,1未使用，2已使用',
  `cpns_limit` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '卡券额度',
  `create_time` int(10) unsigned NOT NULL,
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间0代表用不过期',
  `cpns_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券类型,1充值卡，2月卡，3年卡',
  `create_user` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned DEFAULT '0',
  `update_user` int(10) unsigned DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT '0',
  `delete_user` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cpns_id`),
  UNIQUE KEY `cpns_code` (`cpns_code`,`cpns_prefix`),
  KEY `cpns_status` (`cpns_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠卷数据表';



# Dump of table se_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_file`;

CREATE TABLE `se_file` (
  `file_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `realname` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL DEFAULT '',
  `label_id` int(11) unsigned DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL,
  `create_user` int(11) unsigned NOT NULL,
  `delete_user` int(11) DEFAULT '0',
  `delete_time` int(11) DEFAULT '0',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_file` WRITE;
/*!40000 ALTER TABLE `se_file` DISABLE KEYS */;

INSERT INTO `se_file` (`file_id`, `realname`, `filename`, `status`, `size`, `type`, `label_id`, `create_time`, `create_user`, `delete_user`, `delete_time`)
VALUES
	(1,'I01.jpg','948269153192550401985.jpg',1,540452,'image/jpeg',0,1537344498,1,1,1537345334),
	(2,'I01.jpg','948305215944171521984.jpg',1,540452,'image/jpeg',0,1537345358,1,0,0),
	(3,'T01.jpg','948305222487285761985.jpg',1,369658,'image/jpeg',0,1537345358,1,0,0),
	(4,'G03.jpg','948305227772108801984.jpg',1,260002,'image/jpeg',0,1537345358,1,0,0),
	(5,'I07.jpg','948305235992944641985.jpg',1,238434,'image/jpeg',0,1537345358,1,0,0),
	(6,'S02.jpg','948305240732508161984.jpg',1,205966,'image/jpeg',0,1537345358,1,0,0),
	(7,'004.jpg','948305246101217281985.jpg',1,375116,'image/jpeg',0,1537345358,1,0,0),
	(8,'002.jpg','948305253105704961984.jpg',1,377408,'image/jpeg',0,1537345359,1,0,0),
	(9,'003.jpg','948305258474414081985.jpg',1,373268,'image/jpeg',0,1537345359,1,0,0),
	(10,'001.jpg','948305263549521921984.jpg',1,279043,'image/jpeg',0,1537345359,1,0,0),
	(11,'H05.jpg','948305270679838721985.jpg',1,130719,'image/jpeg',0,1537345359,1,0,0),
	(12,'a9e8a5efce1b9d166726a71cffdeb48f8d54649c.jpg','948305275419402241984.jpg',1,401270,'image/jpeg',0,1537345359,1,0,0),
	(13,'ChMkJ1XS22GIECf-ABpv5H6GZB4AAAPZAEhbEIAGm_8800.jpg','948305280871997441985.jpg',1,179836,'image/jpeg',0,1537345359,1,0,0),
	(14,'73812cdda3cc7cd932c3d5bc3f01213fb90e919c.jpg','948305285401845761984.jpg',1,270391,'image/jpeg',0,1537345359,1,0,0),
	(15,'f15d89d4b31c8701eefb5fea2b7f9e2f0708ff18.jpg','948305291106099201985.jpg',1,188700,'image/jpeg',0,1537345360,1,0,0),
	(16,'a230d01b0ef41bd5b75c089157da81cb39db3d72.jpg','948305295468175361984.jpg',1,153387,'image/jpeg',0,1537345360,1,0,0),
	(17,'b3af820a19d8bc3e5800ebc68e8ba61ea8d34565.jpg','948305299662479361985.jpg',1,224069,'image/jpeg',0,1537345360,1,0,0),
	(18,'GirlsWhoCode_Beauty16.jpg','948305303437352961984.jpg',1,110673,'image/jpeg',0,1537345360,1,0,0),
	(19,'f1f3a1cc7cd98d10c13aed54273fb80e7aec909c.jpg','948305308638289921985.jpg',1,137535,'image/jpeg',0,1537345360,1,0,0),
	(20,'67d7f45b8e3b21585d88383d807013f7.jpg','948305312413163521984.jpg',1,205962,'image/jpeg',0,1537345360,1,0,0),
	(21,'7bd11dfde12e2683998af07c70755f04--little-girl-photography-cute-children-photography.jpg','948305316020264961985.jpg',1,197611,'image/jpeg',0,1537345360,1,0,0),
	(22,'gilmore-girls-revival-ss02.jpg','948305319627366401984.jpg',1,163041,'image/jpeg',0,1537345360,1,0,0),
	(23,'maxresdefault.jpg','948305322982809601985.jpg',1,148382,'image/jpeg',0,1537345360,1,0,0),
	(24,'hair-style-street-fashion-beautiful-girl_1139-844.jpg','948305325834936321984.jpg',1,48447,'image/jpeg',0,1537345360,1,0,0),
	(25,'5aa7ab2a47f23.jpg','948305328645120001985.jpg',1,46234,'image/jpeg',0,1537345360,1,0,0),
	(26,'c6aa767094d956d6434ef958ebb486c4.pdf','948305330280898561984.pdf',1,41175,'application/pdf',0,1537345360,1,0,0),
	(27,'gangkui.jpg','948305333049139201985.jpg',1,46265,'image/jpeg',0,1537345361,1,0,0),
	(28,'34d6184c510fd9f95da0b865292dd42a2834a432.jpg','948305337704816641984.jpg',1,40855,'image/jpeg',0,1537345361,1,0,0),
	(29,'IMG_0002.jpg','948305340598886401985.jpg',1,17146,'image/jpeg',0,1537345361,1,1,1537350888),
	(30,'I01.jpg','951895944541020161984.jpg',1,2806235,'image/jpeg',0,1537430967,1,0,0),
	(31,'I01.jpg','951912939231682561984.jpg',1,2806235,'image/jpeg',0,1537431373,1,0,0),
	(32,'I01.jpg','951923857256652801984.jpg',1,2806235,'image/jpeg',0,1537431633,1,0,0),
	(33,'I01.jpg','951932371609886721984.jpg',1,2806235,'image/jpeg',0,1537431836,1,0,0),
	(34,'I01.jpg','951936233221693441985.jpg',1,2806235,'image/jpeg',0,1537431928,1,0,0),
	(35,'I01.jpg','951940127087697921984.jpg',1,2806235,'image/jpeg',0,1537432021,1,0,0),
	(36,'T01.jpg','951941731828408321985.jpg',1,1914331,'image/jpeg',0,1537432059,1,0,0),
	(37,'I01.jpg','951947813023948801985.jpg',1,2806235,'image/jpeg',0,1537432204,1,0,0),
	(38,'T01.jpg','951958592259399687466.jpg',1,1914331,'image/jpeg',0,1537432461,1,0,0),
	(39,'I01.jpg','951959788642672647466.jpg',1,2806235,'image/jpeg',0,1537432490,1,0,0),
	(40,'I01.jpg','951960919510917127466.jpg',1,2806235,'image/jpeg',0,1537432516,1,0,0),
	(41,'a9e8a5efce1b9d166726a71cffdeb48f8d54649c.jpg','951962522951393281985.jpg',1,557938,'image/jpeg',0,1537432555,1,0,0),
	(42,'I01.jpg','951980620660121601984.jpg',1,2806235,'image/jpeg',0,1537432986,1,0,0),
	(43,'I01.jpg','952265887480586247466.jpg',1,2806235,'image/jpeg',0,1537439787,1,0,0),
	(44,'a9e8a5efce1b9d166726a71cffdeb48f8d54649c.jpg','952280823271301121985.jpg',1,557938,'image/jpeg',0,1537440144,1,0,0),
	(45,'I01.jpg','952288388789084161984.jpg',1,2806235,'image/jpeg',0,1537440324,1,0,0),
	(46,'G03.jpg','952291259874058241984.jpg',1,1473273,'image/jpeg',0,1537440392,1,0,0),
	(47,'b3af820a19d8bc3e5800ebc68e8ba61ea8d34565.jpg','952294065737605121985.jpg',1,356031,'image/jpeg',0,1537440459,1,0,0),
	(48,'a230d01b0ef41bd5b75c089157da81cb39db3d72.jpg','952295102359838721985.jpg',1,377377,'image/jpeg',0,1537440484,1,0,0),
	(49,'I01.jpg','952297039373312007466.jpg',1,2806235,'image/jpeg',0,1537440530,1,0,0),
	(50,'b3af820a19d8bc3e5800ebc68e8ba61ea8d34565.jpg','952302049050009607466.jpg',1,356031,'image/jpeg',0,1537440650,1,0,0),
	(51,'GirlsWhoCode_Beauty16.jpg','952314334124482561984.jpg',1,349009,'image/jpeg',0,1537440943,1,0,0),
	(52,'T01.jpg','952316594980167687466.jpg',1,1914331,'image/jpeg',0,1537440996,1,0,0),
	(53,'maxresdefault.jpg','952324260196556801985.jpg',1,122649,'image/jpeg',0,1537441179,1,0,0),
	(54,'IMG_0002.jpg','952334174440693761985.jpg',1,19972,'image/jpeg',0,1537441416,1,0,0),
	(55,'b3af820a19d8bc3e5800ebc68e8ba61ea8d34565.jpg','952823181591224321984.jpg',1,356031,'image/jpeg',0,1537453074,1,0,0),
	(56,'002.jpg','952831175976591367466.jpg',1,1105974,'image/jpeg',0,1537453265,1,0,0),
	(57,'004.jpg','952841040769884167466.jpg',1,1106089,'image/jpeg',0,1537453500,1,0,0),
	(58,'001.jpg','952842745544744961985.jpg',1,771563,'image/jpeg',0,1537453541,1,0,0),
	(59,'GirlsWhoCode_Beauty16.jpg','952852221274398721984.jpg',1,349009,'image/jpeg',0,1537453767,1,0,0),
	(60,'34d6184c510fd9f95da0b865292dd42a2834a432.jpg','952856570893475841985.jpg',1,35820,'image/jpeg',0,1537453870,1,0,0),
	(61,'002.jpg','952897442414632967466.jpg',1,1105974,'image/jpeg',0,1537454845,1,0,0),
	(62,'I01.jpg','954808277013667841984.jpg',1,2806235,'image/jpeg',0,1537500403,1,0,0),
	(63,'I01.jpg','954860426095534081985.jpg',1,2806235,'image/jpeg',0,1537501646,1,0,0),
	(64,'S02.jpg','954886142421934081984.jpg',1,1192001,'image/jpeg',0,1537502259,1,0,0),
	(65,'I01.jpg','954921493064622087466.jpg',1,2806235,'image/jpeg',0,1537503102,1,0,0),
	(66,'I01.jpg','954929599815393281985.jpg',1,2806235,'image/jpeg',0,1537503295,1,0,0),
	(67,'I01.jpg','954932826115973121984.jpg',1,2806235,'image/jpeg',0,1537503372,1,0,0),
	(68,'I01.jpg','954936116799119367466.jpg',1,2806235,'image/jpeg',0,1537503451,1,0,0),
	(69,'67d7f45b8e3b21585d88383d807013f7.jpg','954937351560273921984.jpg',1,208851,'image/jpeg',0,1537503480,1,0,0),
	(70,'001.jpg','954940061500088327466.jpg',1,771563,'image/jpeg',0,1537503545,1,0,0),
	(71,'H05.jpg','954962086083993601984.jpg',1,689295,'image/jpeg',0,1537504070,1,0,0),
	(72,'I01.jpg','955014313263800329821.jpg',1,2806235,'image/jpeg',0,1537505315,1,0,0),
	(73,'I01.jpg','955015155983360009831.jpg',1,2806235,'image/jpeg',0,1537505335,1,0,0),
	(74,'G03.jpg','955016619417968647466.jpg',1,1473273,'image/jpeg',0,1537505370,1,0,0),
	(75,'T01.jpg','955018028662169609831.jpg',1,1914331,'image/jpeg',0,1537505404,1,0,0),
	(76,'I01.jpg','955018831787499529831.jpg',1,2806235,'image/jpeg',0,1537505423,1,0,0),
	(77,'002.jpg','955022740962713609821.jpg',1,1105974,'image/jpeg',0,1537505516,1,0,0),
	(78,'I07.jpg','955030394644766727466.jpg',1,1213179,'image/jpeg',0,1537505698,1,0,0),
	(79,'002.jpg','955033283261931527466.jpg',1,1105974,'image/jpeg',0,1537505767,1,0,0),
	(80,'73812cdda3cc7cd932c3d5bc3f01213fb90e919c.jpg','955036830300938247466.jpg',1,468616,'image/jpeg',0,1537505852,1,0,0),
	(81,'GirlsWhoCode_Beauty16.jpg','955039125717688329831.jpg',1,349009,'image/jpeg',0,1537505907,1,0,0),
	(82,'I07.jpg','955046699959623689821.jpg',1,1213179,'image/jpeg',0,1537506087,1,0,0),
	(83,'S02.jpg','955048347356405769831.jpg',1,1192001,'image/jpeg',0,1537506127,1,0,0),
	(84,'003.jpg','955048881836564489831.jpg',1,1090908,'image/jpeg',0,1537506139,1,0,0),
	(85,'b3af820a19d8bc3e5800ebc68e8ba61ea8d34565.jpg','955049633791385609831.jpg',1,356031,'image/jpeg',0,1537506157,1,0,0),
	(86,'004.jpg','955056996220968969821.jpg',1,1106089,'image/jpeg',0,1537506333,1,0,0),
	(87,'f15d89d4b31c8701eefb5fea2b7f9e2f0708ff18.jpg','955057409905172487466.jpg',1,425410,'image/jpeg',0,1537506343,1,0,0),
	(88,'f1f3a1cc7cd98d10c13aed54273fb80e7aec909c.jpg','955058243648921609831.jpg',1,265580,'image/jpeg',0,1537506362,1,0,0),
	(89,'004.jpg','955470536685690889831.jpg',1,1106089,'image/jpeg',0,1537516192,1,0,0),
	(90,'002.jpg','955534674640281609821.jpg',1,1105974,'image/jpeg',0,1537517721,1,0,0),
	(91,'004.jpg','955535929576038409821.jpg',1,1106089,'image/jpeg',0,1537517751,1,0,0),
	(92,'b3af820a19d8bc3e5800ebc68e8ba61ea8d34565.jpg','955537140471603209821.jpg',1,356031,'image/jpeg',0,1537517780,1,0,0),
	(93,'gilmore-girls-revival-ss02.jpg','955540757555486729831.jpg',1,156398,'image/jpeg',0,1537517866,1,0,0),
	(94,'003.jpg','955638227140648969821.jpg',1,1090908,'image/jpeg',0,1537520190,1,0,0);

/*!40000 ALTER TABLE `se_file` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_file_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_file_label`;

CREATE TABLE `se_file_label` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_goods`;

CREATE TABLE `se_goods` (
  `goods_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `bn` varchar(200) DEFAULT NULL COMMENT '商品编号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '销售价',
  `type_id` mediumint(8) unsigned DEFAULT NULL COMMENT '类型',
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `brand_id` mediumint(8) unsigned DEFAULT NULL COMMENT '品牌',
  `marketable` enum('true','false') NOT NULL DEFAULT 'true' COMMENT '上架',
  `store` mediumint(8) unsigned DEFAULT '0' COMMENT '库存',
  `notify_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '缺货登记',
  `uptime` int(10) unsigned DEFAULT NULL COMMENT '上架时间',
  `downtime` int(10) unsigned DEFAULT NULL COMMENT '下架时间',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `p_order` mediumint(8) unsigned NOT NULL DEFAULT '30' COMMENT '排序',
  `d_order` mediumint(8) unsigned NOT NULL DEFAULT '30' COMMENT '动态排序',
  `score` mediumint(8) unsigned DEFAULT NULL COMMENT '积分',
  `cost` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '成本价',
  `mktprice` decimal(20,3) DEFAULT NULL COMMENT '市场价',
  `weight` decimal(20,3) DEFAULT NULL COMMENT '重量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `brief` varchar(255) DEFAULT NULL COMMENT '商品简介',
  `goods_type` enum('normal','bind','gift') NOT NULL DEFAULT 'normal' COMMENT '销售类型',
  `image_default_id` varchar(32) DEFAULT NULL COMMENT '默认图片',
  `udfimg` enum('true','false') DEFAULT 'false' COMMENT '是否用户自定义图',
  `thumbnail_pic` varchar(32) DEFAULT NULL COMMENT '缩略图',
  `small_pic` varchar(255) DEFAULT NULL COMMENT '小图',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '大图',
  `intro` longtext COMMENT '详细介绍',
  `store_place` varchar(255) DEFAULT NULL COMMENT '库位',
  `min_buy` mediumint(8) unsigned DEFAULT NULL COMMENT '起定量',
  `package_scale` decimal(20,2) DEFAULT NULL COMMENT '打包比例',
  `package_unit` varchar(20) DEFAULT NULL COMMENT '打包单位',
  `package_use` enum('0','1') DEFAULT NULL COMMENT '是否开启打包',
  `score_setting` enum('percent','number') DEFAULT 'number',
  `store_prompt` mediumint(8) unsigned DEFAULT NULL COMMENT '库存提示规则',
  `nostore_sell` enum('0','1') DEFAULT '0' COMMENT '是否开启无库存销售',
  `goods_setting` longtext COMMENT '商品设置',
  `spec_desc` longtext COMMENT '货品规格序列化',
  `params` longtext COMMENT '商品规格序列化',
  `disabled` enum('true','false') NOT NULL DEFAULT 'false',
  `rank_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'google page rank count',
  `comments_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论次数',
  `view_w_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周浏览次数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `count_stat` longtext COMMENT '统计数据序列化',
  `buy_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买次数',
  `buy_w_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买次数',
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `uni_bn` (`bn`),
  KEY `ind_frontend` (`disabled`,`goods_type`,`marketable`),
  KEY `idx_goods_type` (`goods_type`),
  KEY `idx_d_order` (`d_order`),
  KEY `idx_goods_type_d_order` (`goods_type`,`d_order`),
  KEY `idx_marketable` (`marketable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_goods_brand
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_goods_brand`;

CREATE TABLE `se_goods_brand` (
  `brand_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `brand_name` varchar(50) NOT NULL COMMENT '品牌名称',
  `brand_url` varchar(255) DEFAULT NULL COMMENT '品牌网址',
  `brand_desc` longtext COMMENT '品牌介绍',
  `brand_logo` varchar(255) DEFAULT NULL COMMENT '品牌图片标识',
  `brand_keywords` longtext COMMENT '品牌别名',
  `brand_setting` longtext COMMENT '品牌设置',
  `disabled` enum('true','false') DEFAULT 'false' COMMENT '失效',
  `ordernum` mediumint(8) unsigned DEFAULT NULL COMMENT '排序',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`brand_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_ordernum` (`ordernum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_goods_keywords
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_goods_keywords`;

CREATE TABLE `se_goods_keywords` (
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `keyword` varchar(40) NOT NULL DEFAULT '' COMMENT '搜索关键字',
  `refer` varchar(255) DEFAULT '' COMMENT '来源',
  `res_type` enum('goods','article') NOT NULL DEFAULT 'goods' COMMENT '搜索结果类型',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`goods_id`,`keyword`,`res_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_goods_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_goods_products`;

CREATE TABLE `se_goods_products` (
  `product_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '货品ID',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `barcode` varchar(128) DEFAULT NULL COMMENT '条码',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `bn` varchar(30) DEFAULT NULL COMMENT '货号',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '销售价格',
  `cost` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '成本价',
  `mktprice` decimal(20,3) DEFAULT NULL COMMENT '市场价',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '货品名称',
  `weight` decimal(20,3) DEFAULT NULL COMMENT '单位重量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `store` mediumint(8) unsigned DEFAULT '0' COMMENT '库存',
  `store_place` varchar(255) DEFAULT NULL COMMENT '库位',
  `freez` mediumint(8) unsigned DEFAULT NULL COMMENT '冻结库存',
  `goods_type` enum('normal','bind','gift') NOT NULL DEFAULT 'normal' COMMENT '销售类型',
  `spec_info` longtext COMMENT '物品描述',
  `spec_desc` longtext COMMENT '规格值,序列化',
  `is_default` enum('true','false') NOT NULL DEFAULT 'false',
  `qrcode_image_id` varchar(32) DEFAULT NULL COMMENT '二维码图片ID',
  `uptime` int(10) unsigned DEFAULT NULL COMMENT '录入时间',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '最后修改时间',
  `disabled` enum('true','false') DEFAULT 'false',
  `marketable` enum('true','false') NOT NULL DEFAULT 'true' COMMENT '上架',
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `ind_bn` (`bn`),
  KEY `ind_goods_id` (`goods_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_barcode` (`barcode`),
  KEY `idx_goods_type` (`goods_type`),
  KEY `idx_store` (`store`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_goods_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_goods_type`;

CREATE TABLE `se_goods_type` (
  `type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型序号',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '类型名称',
  `floatstore` enum('0','1') NOT NULL DEFAULT '0' COMMENT '小数型库存',
  `alias` longtext COMMENT '类型别名(|分隔,前后|)',
  `is_physical` enum('0','1') NOT NULL DEFAULT '1' COMMENT '实体商品',
  `schema_id` varchar(30) NOT NULL DEFAULT 'custom' COMMENT '供应商序号',
  `setting` longtext COMMENT '类型设置',
  `price` longtext COMMENT '设置价格区间，用于列表页搜索使用',
  `minfo` longtext COMMENT '用户购买时所需输入信息的字段定义序列化数组方式 array(字段名,字段含义,类型(input,select,radio))',
  `params` longtext COMMENT '参数表结构(序列化) array(参数组名=>array(参数名1=>别名1|别名2,参数名2=>别名1|别名2))',
  `tab` longtext COMMENT '商品详情页的自定义tab设置',
  `dly_func` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否包含发货函数',
  `ret_func` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否包含退货函数',
  `reship` enum('disabled','func','normal','mixed') NOT NULL DEFAULT 'normal' COMMENT '退货方式 disabled:不允许退货 func:函数式',
  `disabled` enum('true','false') DEFAULT 'false',
  `is_def` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否系统默认',
  `lastmodify` int(10) unsigned DEFAULT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`type_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_image`;

CREATE TABLE `se_image` (
  `image_id` char(32) NOT NULL COMMENT '图片ID',
  `storage` varchar(50) NOT NULL DEFAULT 'filesystem' COMMENT '存储引擎',
  `image_name` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `ident` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL COMMENT '网址',
  `l_ident` varchar(200) DEFAULT NULL COMMENT '大图唯一标识',
  `l_url` varchar(200) DEFAULT NULL COMMENT '大图URL地址',
  `m_ident` varchar(200) DEFAULT NULL COMMENT '中图唯一标识',
  `m_url` varchar(200) DEFAULT NULL COMMENT '中图URL地址',
  `s_ident` varchar(200) DEFAULT NULL COMMENT '小图唯一标识',
  `s_url` varchar(200) DEFAULT NULL COMMENT '小图URL地址',
  `width` mediumint(8) unsigned DEFAULT NULL COMMENT '宽度',
  `height` mediumint(8) unsigned DEFAULT NULL COMMENT '高度',
  `watermark` enum('true','false') DEFAULT 'false' COMMENT '有水印',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_image_attach
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_image_attach`;

CREATE TABLE `se_image_attach` (
  `attach_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片关联表ID',
  `target_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对象id-外键',
  `target_type` varchar(20) NOT NULL DEFAULT '0' COMMENT '对象类型',
  `image_id` char(32) NOT NULL DEFAULT '0' COMMENT '图片的主键-外键关联image表',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attach_id`),
  KEY `index_1` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_member_advance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_member_advance`;

CREATE TABLE `se_member_advance` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '出入金额',
  `message` varchar(255) DEFAULT NULL COMMENT '管理备注',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交易时间',
  `payment_id` varchar(20) DEFAULT NULL COMMENT '支付单号',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单号',
  `paymethod` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `memo` varchar(100) DEFAULT NULL COMMENT '业务摘要',
  `import_money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '存入金额',
  `explode_money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '支出金额',
  `member_advance` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '当前余额',
  `shop_advance` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '商店余额',
  `disabled` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '失效',
  PRIMARY KEY (`log_id`),
  KEY `ind_mtime` (`mtime`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员余额明细表';



# Dump of table se_member_coupon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_member_coupon`;

CREATE TABLE `se_member_coupon` (
  `cpns_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员优惠券ID',
  `member_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `result` enum('fail','succ') NOT NULL DEFAULT 'succ' COMMENT '优惠卷使用结果',
  `disabled` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '优惠券无效(过期)',
  `remark` varchar(666) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) unsigned zerofill NOT NULL COMMENT '使用时间',
  `create_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '使用IP地址',
  PRIMARY KEY (`cpns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员使用优惠卷记录表';



# Dump of table se_member_lv
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_member_lv`;

CREATE TABLE `se_member_lv` (
  `member_lv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '等级名称',
  `status` tinyint(255) unsigned NOT NULL DEFAULT '1' COMMENT '1已启用2已禁用',
  `dis_count` varchar(20) DEFAULT '100' COMMENT '会员折扣率',
  `pre_id` mediumint(9) DEFAULT NULL COMMENT '前一级别ID',
  `default_lv` enum('1','2') NOT NULL DEFAULT '2' COMMENT '是否默认，1是2不是',
  `lv_type` enum('retail','wholesale','dealer') DEFAULT 'retail' COMMENT '等级类型',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所需积分',
  `experience` int(10) DEFAULT '0' COMMENT '经验值',
  `expiretime` int(10) DEFAULT '0' COMMENT '积分过期时间',
  PRIMARY KEY (`member_lv_id`),
  UNIQUE KEY `ind_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员等级表';

LOCK TABLES `se_member_lv` WRITE;
/*!40000 ALTER TABLE `se_member_lv` DISABLE KEYS */;

INSERT INTO `se_member_lv` (`member_lv_id`, `name`, `status`, `dis_count`, `pre_id`, `default_lv`, `lv_type`, `point`, `experience`, `expiretime`)
VALUES
	(5,'普通会员',1,'110',NULL,'1','retail',0,0,0),
	(10,'青铜会员',1,'100',NULL,'2','retail',5000,0,0),
	(11,'银牌会员',1,'0.00',NULL,'2','retail',20000,0,0),
	(12,'黄金会员',1,'100',NULL,'2','retail',50000,0,0),
	(13,'铂金会员',1,'0',NULL,'2','retail',100000,0,0),
	(14,'钻石会员',1,'0',NULL,'2','retail',500000,0,0),
	(15,'终极VIP会员',1,'0',NULL,'2','retail',10000000,0,0);

/*!40000 ALTER TABLE `se_member_lv` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_member_msg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_member_msg`;

CREATE TABLE `se_member_msg` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `for_id` int(11) DEFAULT '0' COMMENT '回复哪个信件',
  `from_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '发起会员ID',
  `from_uname` varchar(100) DEFAULT '' COMMENT '发信者',
  `from_type` int(11) DEFAULT '0' COMMENT '发信类型',
  `to_id` mediumint(8) unsigned DEFAULT '0' COMMENT '目标会员ID',
  `to_uname` varchar(100) DEFAULT NULL COMMENT '目标会员姓名',
  `subject` varchar(100) NOT NULL COMMENT '消息主题',
  `content` text NOT NULL COMMENT '内容',
  `order_id` bigint(20) DEFAULT '0' COMMENT '订单ID',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  `to_time` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  `has_read` enum('true','false') DEFAULT 'false' COMMENT '是否已读',
  `keep_unread` enum('true','false') DEFAULT 'false' COMMENT '保持未读',
  `has_star` enum('true','false') DEFAULT 'false' COMMENT '是否打上星标',
  `has_sent` enum('true','false') DEFAULT 'true' COMMENT '是否发送',
  `send_ip` varchar(20) DEFAULT NULL COMMENT '发送IP地址',
  PRIMARY KEY (`msg_id`),
  KEY `ind_to_id` (`to_id`,`has_read`,`has_sent`),
  KEY `ind_from_id` (`from_id`,`has_read`,`has_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_member_pam
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_member_pam`;

CREATE TABLE `se_member_pam` (
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '账户序号ID',
  `login_account` varchar(100) NOT NULL COMMENT '登录名',
  `login_password` varchar(32) NOT NULL COMMENT '登录密码',
  `password_account` char(8) NOT NULL DEFAULT '' COMMENT '加密字符串',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员密码表';

LOCK TABLES `se_member_pam` WRITE;
/*!40000 ALTER TABLE `se_member_pam` DISABLE KEYS */;

INSERT INTO `se_member_pam` (`member_id`, `login_account`, `login_password`, `password_account`)
VALUES
	(26,'admin','52d2a3960720e5e0fbe1f20129a907bd','r[(I%!!e'),
	(27,'admin','1b3791336ca7c9a4381eee3a57eadb86','*2EEz/|\"');

/*!40000 ALTER TABLE `se_member_pam` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_members`;

CREATE TABLE `se_members` (
  `member_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员用户名',
  `member_lv_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `nickname` int(11) DEFAULT NULL COMMENT '会员昵称',
  `point` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `tel` varchar(50) DEFAULT NULL COMMENT '固定电话',
  `email` varchar(200) DEFAULT '' COMMENT 'EMAIL',
  `zip` varchar(20) DEFAULT NULL COMMENT '邮编',
  `refer_id` varchar(50) DEFAULT NULL COMMENT '来源ID',
  `refer_url` varchar(200) DEFAULT NULL COMMENT '推广来源URL',
  `advance` decimal(20,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '会员账户余额',
  `reg_ip` varchar(16) DEFAULT NULL COMMENT '注册时IP地址',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员验证状态',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1启用2禁用',
  `remark` text COMMENT '备注',
  `experience` int(10) DEFAULT '0' COMMENT '经验值',
  `resetpwd` varchar(255) DEFAULT NULL COMMENT '找回密码唯一标示',
  `resetpwdtime` int(10) unsigned DEFAULT NULL COMMENT '找回密码时间',
  `member_refer` varchar(50) DEFAULT 'local' COMMENT '会员来源(弃用)',
  `source` enum('pc','wap','weixin','api') DEFAULT 'pc' COMMENT '平台来源',
  `create_time` int(10) unsigned DEFAULT '0',
  `create_user` int(10) unsigned DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `update_user` int(10) unsigned DEFAULT '0',
  `delete_user` int(10) unsigned DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `ind_email` (`email`),
  KEY `ind_disabled` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员信息表';

LOCK TABLES `se_members` WRITE;
/*!40000 ALTER TABLE `se_members` DISABLE KEYS */;

INSERT INTO `se_members` (`member_id`, `member_lv_id`, `realname`, `nickname`, `point`, `addr`, `mobile`, `tel`, `email`, `zip`, `refer_id`, `refer_url`, `advance`, `reg_ip`, `state`, `status`, `remark`, `experience`, `resetpwd`, `resetpwdtime`, `member_refer`, `source`, `create_time`, `create_user`, `update_time`, `update_user`, `delete_user`, `delete_time`)
VALUES
	(26,5,'fdasdfasdf',NULL,0,NULL,'123123123',NULL,'gangkui1688@icloud.com',NULL,NULL,NULL,0.000,NULL,0,1,'sdfasdfasdf',0,NULL,NULL,'local','pc',1537851903,1,0,0,0,0),
	(27,5,'fdasdfasdf1231231                                 ',NULL,0,NULL,'123123123',NULL,'gangkui1688@icloud.com',NULL,NULL,NULL,0.000,NULL,0,1,'sdfasdfasdf',0,NULL,NULL,'local','pc',1537861550,1,0,0,0,0);

/*!40000 ALTER TABLE `se_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_order_cancel_reason
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_cancel_reason`;

CREATE TABLE `se_order_cancel_reason` (
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `reason_type` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0' COMMENT '取消原因类型',
  `reason_desc` varchar(150) DEFAULT NULL COMMENT '其他原因',
  `cancel_time` int(10) unsigned DEFAULT NULL COMMENT '取消时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单取消表';



# Dump of table se_order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_items`;

CREATE TABLE `se_order_items` (
  `item_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单明细ID',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `obj_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单明细对应的商品对象ID, 对应到sdb_b2c_order_objects表',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '货品ID',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `type_id` mediumint(8) unsigned DEFAULT NULL COMMENT '商品类型ID',
  `bn` varchar(40) DEFAULT NULL COMMENT '明细商品的品牌名',
  `name` varchar(200) DEFAULT NULL COMMENT '明细商品的名称',
  `cost` decimal(20,3) DEFAULT NULL COMMENT '明细商品的成本',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '明细商品的销售价(购入价)',
  `g_price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '明细商品的会员价原价',
  `amount` decimal(20,3) DEFAULT NULL COMMENT '明细商品总额',
  `score` mediumint(8) unsigned DEFAULT NULL COMMENT '明细商品积分',
  `weight` mediumint(8) unsigned DEFAULT NULL COMMENT '明细商品重量',
  `nums` float NOT NULL DEFAULT '1' COMMENT '明细商品购买数量',
  `sendnum` float NOT NULL DEFAULT '0' COMMENT '明细商品发货数量',
  `addon` longtext COMMENT '明细商品的规格属性',
  `item_type` enum('product','pkg','gift','adjunct') NOT NULL DEFAULT 'product' COMMENT '明细商品类型',
  PRIMARY KEY (`item_id`),
  KEY `ind_item_bn` (`bn`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';



# Dump of table se_order_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_log`;

CREATE TABLE `se_order_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单日志ID',
  `rel_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对象ID',
  `op_id` mediumint(8) unsigned DEFAULT NULL COMMENT '操作员ID',
  `op_name` varchar(100) DEFAULT NULL COMMENT '操作人名称',
  `alttime` int(10) unsigned DEFAULT NULL COMMENT '操作时间',
  `bill_type` enum('order','recharge','joinfee','prepaid_recharge') NOT NULL DEFAULT 'order' COMMENT '操作人员姓名',
  `behavior` enum('creates','updates','payments','refunds','delivery','reship','finish','cancel') NOT NULL DEFAULT 'payments' COMMENT '日志记录操作的行为',
  `result` enum('SUCCESS','FAILURE') NOT NULL COMMENT '日志结果',
  `log_text` longtext COMMENT '操作内容',
  `addon` longtext COMMENT '序列化数据',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单操作日志';



# Dump of table se_order_objects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_objects`;

CREATE TABLE `se_order_objects` (
  `obj_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单商品对象ID',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `obj_type` varchar(50) NOT NULL DEFAULT '' COMMENT '对象类型',
  `obj_alias` varchar(100) NOT NULL DEFAULT '' COMMENT '对象别名',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `bn` varchar(40) DEFAULT NULL COMMENT '品牌名',
  `name` varchar(200) DEFAULT NULL COMMENT '商品对象名字',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '商品对象单价',
  `amount` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '商品对象总金额',
  `quantity` float NOT NULL DEFAULT '1' COMMENT '商品对象购买量',
  `weight` mediumint(8) unsigned DEFAULT NULL COMMENT '总重量',
  `score` mediumint(8) unsigned DEFAULT NULL COMMENT '获得积分',
  PRIMARY KEY (`obj_id`),
  KEY `ind_obj_bn` (`bn`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单对象表';



# Dump of table se_order_pmt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_pmt`;

CREATE TABLE `se_order_pmt` (
  `pmt_id` int(8) NOT NULL COMMENT '促销规则id',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `product_id` mediumint(8) unsigned DEFAULT NULL COMMENT '商品ID',
  `pmt_type` enum('order','goods','coupon') NOT NULL DEFAULT 'goods' COMMENT '优惠规则类型',
  `pmt_amount` decimal(20,3) NOT NULL DEFAULT '0.000',
  `pmt_tag` longtext,
  `pmt_memo` longtext,
  `pmt_describe` longtext,
  PRIMARY KEY (`pmt_id`,`order_id`,`pmt_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单促销表';



# Dump of table se_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_orders`;

CREATE TABLE `se_orders` (
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单号',
  `total_amount` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '商品默认货币总值',
  `final_amount` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单货币总值, 包含支付价格,税等',
  `pay_status` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0' COMMENT '付款状态',
  `ship_status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT '发货状态',
  `is_delivery` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否需要发货',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '下单时间',
  `last_modified` int(10) unsigned DEFAULT NULL COMMENT '最后更新时间',
  `payment` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `shipping_id` mediumint(8) unsigned DEFAULT NULL COMMENT '配送方式',
  `shipping` varchar(100) DEFAULT NULL COMMENT '配送方式',
  `member_id` mediumint(8) unsigned DEFAULT NULL COMMENT '会员用户名',
  `status` enum('active','dead','finish') NOT NULL DEFAULT 'active' COMMENT '订单状态',
  `confirm` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '确认状态',
  `ship_area` varchar(255) DEFAULT NULL COMMENT '收货地区',
  `ship_name` varchar(50) DEFAULT NULL COMMENT '收货人',
  `weight` decimal(20,3) DEFAULT NULL COMMENT '订单总重量',
  `tostr` longtext COMMENT '订单文字描述',
  `itemnum` mediumint(8) unsigned DEFAULT NULL COMMENT '订单子订单数量',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP地址',
  `ship_addr` text COMMENT '收货地址',
  `ship_zip` varchar(20) DEFAULT NULL COMMENT '收货人邮编',
  `ship_tel` varchar(50) DEFAULT NULL COMMENT '收货电话',
  `ship_email` varchar(200) DEFAULT NULL COMMENT '收货人email',
  `ship_time` varchar(50) DEFAULT NULL COMMENT '配送时间',
  `ship_mobile` varchar(50) DEFAULT NULL COMMENT '收货人手机',
  `cost_item` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单商品总价格',
  `is_tax` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否要开发票',
  `tax_type` enum('false','personal','company') NOT NULL DEFAULT 'false' COMMENT '发票类型',
  `tax_content` varchar(255) DEFAULT NULL COMMENT '发票内容',
  `cost_tax` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单税率',
  `tax_company` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `is_protect` enum('true','false') NOT NULL DEFAULT 'false' COMMENT '是否还有保价费',
  `cost_protect` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '保价费',
  `cost_payment` decimal(20,3) DEFAULT NULL COMMENT '支付费用',
  `currency` varchar(8) DEFAULT NULL COMMENT '订单支付货币',
  `cur_rate` decimal(10,4) DEFAULT '1.0000' COMMENT '订单支付货币汇率',
  `score_u` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单使用积分',
  `score_g` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单获得积分',
  `discount` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单减免',
  `pmt_goods` decimal(20,3) DEFAULT NULL COMMENT '商品促销优惠',
  `pmt_order` decimal(20,3) DEFAULT NULL COMMENT '订单促销优惠',
  `payed` decimal(20,3) DEFAULT '0.000' COMMENT '订单支付金额',
  `memo` longtext COMMENT '订单附言',
  `disabled` enum('true','false') DEFAULT 'false',
  `mark_type` varchar(2) NOT NULL DEFAULT 'b1' COMMENT '订单备注图标',
  `mark_text` longtext COMMENT '订单备注',
  `cost_freight` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '配送费用',
  `extend` varchar(255) DEFAULT 'false' COMMENT '订单扩展',
  `order_refer` varchar(20) NOT NULL DEFAULT 'local' COMMENT '订单来源',
  `addon` longtext COMMENT '订单附属信息(序列化)',
  `source` enum('pc','wap','weixin') DEFAULT 'pc' COMMENT '平台来源',
  PRIMARY KEY (`order_id`),
  KEY `ind_ship_status` (`ship_status`),
  KEY `ind_pay_status` (`pay_status`),
  KEY `ind_status` (`status`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_last_modified` (`last_modified`),
  KEY `ind_createtime` (`createtime`),
  KEY `idx_order_refer` (`order_refer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';



# Dump of table se_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_payments`;

CREATE TABLE `se_payments` (
  `payment_id` varchar(20) NOT NULL DEFAULT '' COMMENT '支付单号',
  `money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '支付金额',
  `cur_money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '支付货币金额',
  `member_id` varchar(100) DEFAULT NULL COMMENT '会员用户名',
  `status` enum('succ','failed','cancel','error','invalid','progress','timeout','ready') NOT NULL DEFAULT 'ready' COMMENT '支付状态',
  `pay_name` varchar(100) DEFAULT NULL,
  `pay_type` enum('online','offline','deposit') NOT NULL DEFAULT 'online' COMMENT '支付类型',
  `t_payed` int(10) unsigned DEFAULT NULL COMMENT '支付完成时间',
  `op_id` mediumint(8) unsigned DEFAULT NULL COMMENT '操作员',
  `payment_bn` varchar(32) DEFAULT '' COMMENT '支付单唯一编号',
  `account` varchar(50) DEFAULT NULL COMMENT '收款账号',
  `bank` varchar(50) DEFAULT NULL COMMENT '收款银行',
  `pay_account` varchar(50) DEFAULT NULL COMMENT '支付账户',
  `currency` varchar(10) DEFAULT NULL COMMENT '货币',
  `paycost` decimal(20,3) DEFAULT NULL COMMENT '支付网关费用',
  `pay_app_id` varchar(100) NOT NULL DEFAULT '0' COMMENT '支付方式名称',
  `pay_ver` varchar(50) DEFAULT NULL COMMENT '支付版本号',
  `ip` varchar(20) DEFAULT NULL COMMENT '支付IP',
  `t_begin` int(10) unsigned DEFAULT NULL COMMENT '支付开始时间',
  `t_confirm` int(10) unsigned DEFAULT NULL COMMENT '支付确认时间',
  `memo` longtext COMMENT '支付注释',
  `return_url` varchar(100) DEFAULT NULL COMMENT '支付返回地址',
  `disabled` enum('true','false') DEFAULT 'false' COMMENT '支付单状态',
  `trade_no` varchar(30) DEFAULT NULL COMMENT '支付单交易编号',
  `thirdparty_account` varchar(50) DEFAULT '' COMMENT '第三方支付账户',
  PRIMARY KEY (`payment_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_test
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_test`;

CREATE TABLE `se_test` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_wechat_base
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_wechat_base`;

CREATE TABLE `se_wechat_base` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) NOT NULL DEFAULT '',
  `appsecret` varchar(50) NOT NULL DEFAULT '',
  `wechat_id` varchar(100) NOT NULL DEFAULT '' COMMENT '微信号',
  `name` varchar(300) DEFAULT NULL COMMENT '公众号名称',
  `menu_data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table se_wechat_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_wechat_menu`;

CREATE TABLE `se_wechat_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sephp_image_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sephp_image_image`;

CREATE TABLE `sephp_image_image` (
  `image_id` char(32) NOT NULL COMMENT '图片ID',
  `storage` varchar(50) NOT NULL DEFAULT 'filesystem' COMMENT '存储引擎',
  `image_name` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `ident` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL COMMENT '网址',
  `l_ident` varchar(200) DEFAULT NULL COMMENT '大图唯一标识',
  `l_url` varchar(200) DEFAULT NULL COMMENT '大图URL地址',
  `m_ident` varchar(200) DEFAULT NULL COMMENT '中图唯一标识',
  `m_url` varchar(200) DEFAULT NULL COMMENT '中图URL地址',
  `s_ident` varchar(200) DEFAULT NULL COMMENT '小图唯一标识',
  `s_url` varchar(200) DEFAULT NULL COMMENT '小图URL地址',
  `width` mediumint(8) unsigned DEFAULT NULL COMMENT '宽度',
  `height` mediumint(8) unsigned DEFAULT NULL COMMENT '高度',
  `watermark` enum('true','false') DEFAULT 'false' COMMENT '有水印',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
