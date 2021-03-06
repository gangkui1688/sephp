# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.01 (MySQL 5.7.20-log)
# Database: sephp
# Generation Time: 2019-11-18 13:41:13 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table se_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_admin`;

CREATE TABLE `se_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '0' COMMENT '1男2女',
  `email` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常2禁用',
  `realname` varchar(100) DEFAULT NULL,
  `nickname` varchar(200) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `auth_secert` char(32) DEFAULT '' COMMENT 'google身份验证的密钥',
  `reg_ip` int(11) DEFAULT NULL,
  `session_id` varchar(60) DEFAULT '',
  `app_token` char(64) DEFAULT NULL COMMENT 'c',
  `addtim` int(11) DEFAULT '0',
  `uptime` int(11) DEFAULT '0',
  `deltime` int(11) DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_admin` WRITE;
/*!40000 ALTER TABLE `se_admin` DISABLE KEYS */;

INSERT INTO `se_admin` (`admin_id`, `group_id`, `sex`, `email`, `status`, `realname`, `nickname`, `mobile`, `remark`, `auth_secert`, `reg_ip`, `session_id`, `app_token`, `addtim`, `uptime`, `deltime`)
VALUES
	(1,1,1,'admin@admin.com',1,'钢盔','hony',NULL,'so fuck beautiful','EEOQBNTJ7CDGCWPDVSVVQGZ37FK7RBU7',NULL,'3el3s0dgq6dvorlmv8majaq907',NULL,NULL,0,0),
	(6,2,1,'asdfasd@123.com',1,'里相遇',NULL,NULL,'','DZWBRUUNUUJDAXXR44MVYMCUPOEMQIPS',NULL,'0',NULL,NULL,0,0),
	(11,5,NULL,'001@adm.com',1,'钢盔01',NULL,NULL,'gangkui001','HOELO43EFXMWYYWKWCSZ3QEMWRPQLR33',NULL,'myprefix-brcmrvlo54bapnm4hm8mqjact6',NULL,NULL,0,0);

/*!40000 ALTER TABLE `se_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_admin_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_admin_group`;

CREATE TABLE `se_admin_group` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) NOT NULL DEFAULT '',
  `remark` text,
  `create_time` int(11) NOT NULL,
  `create_user` int(11) DEFAULT '0',
  `powerlist` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_admin_group` WRITE;
/*!40000 ALTER TABLE `se_admin_group` DISABLE KEYS */;

INSERT INTO `se_admin_group` (`group_id`, `group_name`, `remark`, `create_time`, `create_user`, `powerlist`, `status`)
VALUES
	(1,'超级管理员','权限不受控制',1535536245,1,'*',1),
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
	(78,'fl7cp105e12ldfjc3hpccb0lf2',1,'127.0.0.1','admin',1570787554,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(79,'as122ti9nuc8tlonrq0ml3ucn8',1,'127.0.0.1','admin',1570855937,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(80,'brplbb6pub9ck2iiqndkv2dt4t',1,'127.0.0.1','admin',1570872083,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL);

/*!40000 ALTER TABLE `se_admin_login` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_admin_pam
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_admin_pam`;

CREATE TABLE `se_admin_pam` (
  `admin_id` char(32) NOT NULL DEFAULT '' COMMENT '账户序号ID',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(225) NOT NULL DEFAULT '' COMMENT '登录密码',
  `password_account` char(10) DEFAULT '' COMMENT '加密字符串',
  `wechat_openid` varchar(225) DEFAULT NULL COMMENT '微信openid',
  `app_token` char(64) DEFAULT NULL COMMENT 'app登陆tokne',
  `session_id` varchar(50) DEFAULT NULL,
  `uptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次更新时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员密码表';

LOCK TABLES `se_admin_pam` WRITE;
/*!40000 ALTER TABLE `se_admin_pam` DISABLE KEYS */;

INSERT INTO `se_admin_pam` (`admin_id`, `username`, `password`, `password_account`, `wechat_openid`, `app_token`, `session_id`, `uptime`)
VALUES
	('1','admin','$2y$10$q0Y6LyDnJuVhc48idZ9T.eIdLNNVbSryXnSqfXL6ivtvmXV.7grJq','',NULL,'7ObgsBAfRTQISZ17c4ca4238a0b923820dcc509a6f75849bloKU62E7CYwUqKq1','',1573810955),
	('11','gangkui001','$2y$10$pLKmTwiz./w.8hPja3qQjuBdIwvskB3gPEY/ljVCdau6P/hElYELq','',NULL,NULL,NULL,0),
	('6','gangkui003','$2y$10$rsRw/PKLQPfhpR.XwrD6m.ocMygl6gd4BEtuNAPJbokykX5e.AMG.','',NULL,NULL,NULL,0);

/*!40000 ALTER TABLE `se_admin_pam` ENABLE KEYS */;
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
	('app_order_check_base_setting','{\"app_token\":\"sofv5V57xJjm9sHKlZIZvojGOassNkXA70k7XVkiOXC2lFdujGmVHINuL7WCHXHr\",\"app_url\":\"http://sephp.a.com\",\"group_id\":\"4\"}'),
	('base_config','{\"web_name\":\"章洪科技\",\"page_title\":\"章洪科技\",\"page_keywords\":\"章洪科技，软件开发，系统维护，app开发\",\"page_description\":\"章洪科技专业的软件开发公司\",\"count_code\":\"\",\"icp_name\":\"粤icp-12322339783\",\"company_address\":\"湖北省宜昌市宜陵路687号1807号\",\"contact_number\":\"18502050396\",\"email\":\"wanggang5161@163.com\",\"qq_number\":\"549224868\"}'),
	('check_app_base_setting','{\"app_token\":\"OIo6jKmhae94on7dWAwm9uKQTy6j94o\",\"app_url\":\"http:://check.zhanghongkeij.com\",\"uid\":\"6\"}'),
	('company_aptitude','\"&lt;p&gt;dfasdfasdfa&lt;/p&gt;\"'),
	('company_cultural','\"&lt;p&gt;sdfasdfasdfa&lt;/p&gt;\"'),
	('company_profile','\"&lt;p&gt;weqwerqwerqwer&lt;/p&gt;\"'),
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



# Dump of table se_customer_consumption_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_customer_consumption_log`;

CREATE TABLE `se_customer_consumption_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '消费标题',
  `consumption_img` varchar(200) DEFAULT NULL COMMENT '消费单照片',
  `remark` text COMMENT '消费备注',
  `money` decimal(8,3) DEFAULT '0.000' COMMENT '消费金额',
  `discount` decimal(8,3) DEFAULT '0.000' COMMENT '折扣金额',
  `refund_money` decimal(8,3) DEFAULT '0.000' COMMENT '退款金额',
  `pay_money` decimal(8,3) DEFAULT '0.000' COMMENT '实际支付金额',
  `addtime` int(11) NOT NULL,
  `adduser` char(32) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `upuser` char(32) DEFAULT '0',
  `deltime` int(11) DEFAULT '0',
  `deluser` char(32) DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户消费记录';



# Dump of table se_customer_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_customer_info`;

CREATE TABLE `se_customer_info` (
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户id',
  `member_id` char(32) NOT NULL DEFAULT '' COMMENT '所属会员',
  `realname` varchar(100) DEFAULT NULL COMMENT '真是名称',
  `mobile` bigint(20) DEFAULT NULL COMMENT '电话号码',
  `car_number` varchar(50) DEFAULT NULL COMMENT '车牌号码',
  `sex` tinyint(11) DEFAULT '0' COMMENT '性别',
  `remark` text COMMENT '备注',
  `addtime` int(11) NOT NULL,
  `adduser` char(32) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `upuser` char(32) DEFAULT '0',
  `deltime` int(11) DEFAULT '0',
  `deluser` char(32) DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';



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
  `goods_sn` varchar(30) NOT NULL DEFAULT '' COMMENT '商品编号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '销售价',
  `currency` varchar(10) DEFAULT 'CNY' COMMENT '币种',
  `type_id` int(8) unsigned DEFAULT '0' COMMENT '类型',
  `cate_id` int(8) unsigned DEFAULT '0' COMMENT '分类',
  `brand_id` int(8) unsigned DEFAULT '0' COMMENT '品牌',
  `marketable` enum('1','2') NOT NULL DEFAULT '1' COMMENT '上架',
  `store` int(8) unsigned DEFAULT '0' COMMENT '库存',
  `notify_num` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '缺货登记',
  `downtime` int(10) unsigned DEFAULT NULL COMMENT '下架时间',
  `last_modify` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `p_order` mediumint(8) unsigned NOT NULL DEFAULT '30' COMMENT '排序',
  `d_order` mediumint(8) unsigned NOT NULL DEFAULT '30' COMMENT '动态排序',
  `score` mediumint(8) unsigned DEFAULT NULL COMMENT '积分',
  `cost` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '成本价',
  `mktprice` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '市场价',
  `weight` decimal(20,3) DEFAULT NULL COMMENT '重量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `brief` varchar(255) DEFAULT NULL COMMENT '商品简介',
  `image_default_id` varchar(1000) DEFAULT '' COMMENT '默认图片',
  `small_pic` varchar(255) DEFAULT NULL COMMENT '小图',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '大图',
  `intro` longtext COMMENT '详细介绍',
  `store_place` varchar(255) DEFAULT NULL COMMENT '库位',
  `min_buy` mediumint(8) unsigned DEFAULT NULL COMMENT '起定量',
  `nostore_sell` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否开启无库存销售',
  `goods_setting` longtext COMMENT '商品设置',
  `comments_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论次数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `buy_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买次数',
  `addtime` int(11) NOT NULL,
  `adduser` char(32) NOT NULL DEFAULT '',
  `uptime` int(10) unsigned DEFAULT '0',
  `upuser` char(32) DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `uni_bn` (`goods_sn`),
  KEY `ind_frontend` (`marketable`),
  KEY `idx_d_order` (`d_order`),
  KEY `idx_goods_type_d_order` (`d_order`),
  KEY `idx_marketable` (`marketable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_goods` WRITE;
/*!40000 ALTER TABLE `se_goods` DISABLE KEYS */;

INSERT INTO `se_goods` (`goods_id`, `goods_sn`, `name`, `price`, `currency`, `type_id`, `cate_id`, `brand_id`, `marketable`, `store`, `notify_num`, `downtime`, `last_modify`, `p_order`, `d_order`, `score`, `cost`, `mktprice`, `weight`, `unit`, `brief`, `image_default_id`, `small_pic`, `big_pic`, `intro`, `store_place`, `min_buy`, `nostore_sell`, `goods_setting`, `comments_count`, `view_count`, `buy_count`, `addtime`, `adduser`, `uptime`, `upuser`)
VALUES
	(1,'191023094953','玉泉寺成人票',88.000,'CNY',0,0,0,'1',6666777,0,NULL,NULL,1,30,2,111.000,222.000,0.000,'张','千年古刹，玉泉山下，铁塔地宫','[\"18/415e7a51597f87fa1f50507a6b252570.jpg\"]','','','&amp;lt;h1&amp;gt;&amp;lt;strong&amp;gt;金山岭长城秋色浓郁 层林尽染灿若图秀&amp;lt;/strong&amp;gt;&amp;lt;/h1&amp;gt;\r\n&amp;lt;p&amp;gt;2019-10-25 14:47&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;img src=&amp;quot;https://himg2.huanqiucdn.cn/attachment2010/2019/1025/20191025024736204.jpg&amp;quot; data-image=&amp;quot;oikfc2jg19ni&amp;quot;&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;近日，位于京郊的金山岭长城秋景正浓，层林尽染，五色纷披，灿若图绣。文/张桂芹 图/郭中兴&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;img src=&amp;quot;https://himg2.huanqiucdn.cn/attachment2010/2019/1025/20191025024736765.jpg&amp;quot; data-image=&amp;quot;vfe3nfe8v2x6&amp;quot;&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;img src=&amp;quot;https://himg2.huanqiucdn.cn/attachment2010/2019/1025/20191025024736182.jpg&amp;quot; data-image=&amp;quot;qixep3c4azg1&amp;quot;&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;img src=&amp;quot;https://himg2.huanqiucdn.cn/attachment2010/2019/1025/20191025024736326.jpg&amp;quot; data-image=&amp;quot;1biesfmcb7dh&amp;quot;&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;','0',0,'1','',1,1,1,1571824193,'1',0,'0'),
	(2,'191023130251','玉泉寺儿童票',96.000,'CNY',0,0,0,'1',999999,0,NULL,NULL,22,30,22,111.000,99.000,0.000,'张','千年古刹，玉泉山下，铁塔地宫','[\"24/218e084162baea350ac379f66651af9a.jpg\",\"43/92f4b898caa781dc9a1957896988676f.jpg\",\"41/920b5d319cfabb359fcd4099c09bf243.jpg\",\"71/5825a84891161f3e0a119f7a7dc36b54.jpg\",\"35/ac6a3d376941aae1e8202b346606bfc5.jpg\"]','','','&amp;lt;h1&amp;gt;玉泉寺&amp;lt;/h1&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;（湖北省当阳市玉泉寺）&amp;lt;/h2&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;玉泉寺位于湖北省&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E5%BD%93%E9%98%B3%E5%B8%82/11044261&amp;quot; data-lemmaid=&amp;quot;11044261&amp;quot;&amp;gt;当阳市&amp;lt;/a&amp;gt;城西南12公里的玉泉山东麓，中心景区面积8.9平方公里。相传东汉建安年间，僧人普净结庐于此。南朝后梁时，梁宣帝敕玉泉为&amp;ldquo;覆船山寺&amp;rdquo;。隋代改为&amp;ldquo;玉泉寺&amp;rdquo;。玉泉寺大雄宝殿为中国南方最大的一座古建筑。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[1]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[1]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;amp;nbsp;殿前置隋代大型铁质文物十余件；殿侧有石刻观音画像一通，传为唐代画圣吴道子手迹。现存的&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E7%8E%89%E6%B3%89%E9%93%81%E5%A1%94/4010591&amp;quot; data-lemmaid=&amp;quot;4010591&amp;quot;&amp;gt;玉泉铁塔&amp;lt;/a&amp;gt;对研究中国古代冶金铸造、金属防腐、营造法式、建筑力学、铸雕艺术以及佛教史具有重要的价值。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[1-3]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[1-3]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;玉泉寺为佛教圣地&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E5%A4%A9%E5%8F%B0%E5%AE%97/85537&amp;quot; data-lemmaid=&amp;quot;85537&amp;quot;&amp;gt;天台宗&amp;lt;/a&amp;gt;祖庭之一&amp;lt;sup&amp;gt;&amp;amp;nbsp;[4]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[4]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;amp;nbsp;，曾与浙江天台&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E5%9B%BD%E6%B8%85%E5%AF%BA/75038&amp;quot; data-lemmaid=&amp;quot;75038&amp;quot;&amp;gt;国清寺&amp;lt;/a&amp;gt;、山东长清&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E7%81%B5%E4%B8%A5%E5%AF%BA/5984085&amp;quot; data-lemmaid=&amp;quot;5984085&amp;quot;&amp;gt;灵严寺&amp;lt;/a&amp;gt;、江苏南京&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E6%A0%96%E9%9C%9E%E5%AF%BA/36023&amp;quot; data-lemmaid=&amp;quot;36023&amp;quot;&amp;gt;栖霞寺&amp;lt;/a&amp;gt;并称为&amp;ldquo;天下四绝&amp;rdquo;，被誉为&amp;ldquo;三楚名山&amp;rdquo;&amp;lt;sup&amp;gt;&amp;amp;nbsp;[5-6]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[5-6]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;amp;nbsp;。1982年，玉泉寺及铁塔被列为全国重点文物保护单位。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[7]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[7]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;中文名称玉泉寺外文名称Yuquan Temple地理位置宜昌市当阳市玉泉村230县道6公里处气候类型亚热带季风气候占地面积8.9平方公里（中心景区）开放时间7:30-17:00门票价格免费著名景点&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E7%8E%89%E6%B3%89%E9%93%81%E5%A1%94&amp;quot;&amp;gt;玉泉铁塔&amp;lt;/a&amp;gt;寺院主持释明玉（已故），宽一（监院）所属国家中国所属城市湖北省宜昌市&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;历史沿革&amp;lt;/h2&amp;gt;&amp;lt;ol&amp;gt;&amp;lt;/ol&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;东汉建安二十二年（218年），普净和尚在此结茅为庵，打坐修行。&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;a title=&amp;quot;玉泉寺&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/19225869/245e8bcaf848dcc1c817686c?fr=lemma&amp;amp;ct=cover&amp;quot; target=&amp;quot;_blank&amp;quot; nslog-type=&amp;quot;10000206&amp;quot;&amp;gt;&amp;lt;img alt=&amp;quot;玉泉寺&amp;quot; src=&amp;quot;https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=182db0a876094b36df921cef93cd7c00/0823dd54564e9258f889c8999c82d158ccbf4e03.jpg&amp;quot; data-image=&amp;quot;ilelyhd1ztch&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;南北朝后梁大定五年（559年），梁宣帝敕建覆船山寺（即今玉泉寺）。隋开皇年间，佛教天台宗创始人智口和尚在这里正式创建了玉泉寺。唐朝时，禅宗北宗神秀从黄梅东山寺来此弘扬禅法，四海倾仰。宋朝时，宋真宗明肃皇后对玉泉寺加以扩建，并改额为&amp;ldquo;&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E6%99%AF%E5%BE%B7%E7%A6%85%E5%AF%BA&amp;quot;&amp;gt;景德禅寺&amp;lt;/a&amp;gt;&amp;rdquo;，被誉为&amp;ldquo;荆楚丛林之冠&amp;rdquo;。明初，恢复&amp;ldquo;玉泉寺&amp;rdquo;名号。明万历年间，明神宗敕赐&amp;ldquo;荆楚第一丛林&amp;rdquo;匾额。1983年，成为全国首批重点对外开放寺庙之一。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[4]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[4]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;1985年8月，玉泉寺作为佛教活动场所，由文物部门移交给佛教界管理使用。在寺僧人成立了&amp;ldquo;当阳县玉泉寺管理委员会&amp;rdquo;管理寺务，明玉法师任主持。1987年，玉泉寺恢复了十方丛林体制，明玉法师升座为方丈，并按照丛林制度按排了相应的执事。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[8]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[8]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;2014年6月17日，韩国天台宗总务院总务部长金月道法师一行三人访问当阳玉泉寺，度门寺方丈宽悟法师及玉泉寺法师一起陪同韩国法师参观玉泉寺，并就中韩天台宗友好和平碑选址交流并达成一致意见。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[9]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[9]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;2&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_2&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;建筑格局&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;建筑格局&amp;lt;/h2&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp; &amp;amp;nbsp;风水布局&amp;lt;/strong&amp;gt;寺院背倚覆船山，可称为玄武，山门前的溪水可称为朱雀，溪流上的双桥，可起到聚气、止气的作用。整座寺院背山面水，负阴抱阳，形成了与天象相吻合的四灵兽的格局。寺院背山朝阳，抵挡西北方向的寒流，面临溪水，接纳东南方向的凉风，山门东向，有良好的光照。寺院后隆起的八字小山脉，缓解了山洪对寺院的威胁。&amp;lt;strong&amp;gt;建筑格局&amp;lt;/strong&amp;gt;玉泉寺的主要建筑，布置在一条东西轴线上，由东而西有三大建筑：&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;a nslog-type=&amp;quot;9317&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/0/964b2e4e5680ba8dd0c86a43?fr=lemma&amp;amp;ct=single&amp;quot; target=&amp;quot;_blank&amp;quot; title=&amp;quot;玉泉寺 千瓣并蒂莲&amp;quot;&amp;gt;&amp;lt;img src=&amp;quot;https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=a33d23b331adcbef053479049cae2e0e/ca1349540923dd5425d1bd1fd109b3de9c824822.jpg&amp;quot; alt=&amp;quot;玉泉寺 千瓣并蒂莲&amp;quot; data-image=&amp;quot;xze8alfvkp15&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;玉泉寺 千瓣并蒂莲天王、大雄、毗卢三殿，与天王殿隔溪相望的北宋铁塔和三园门牌坊，都向南偏离了该轴线。 三大建筑均是宫殿式的建筑。与中轴线建筑形成对照的，是南北两翼的附属建筑，各堂口体量相应减少，一律不用中轴线建筑所用的灰筒瓦，而改用小青瓦。以水墨画装饰墙面，不用重彩。南翼建筑，是三组深宅大院：西禅堂、藏经楼、 退居堂，是安养、阅藏、坐禅的地方。北翼建筑，是一组花园式的建筑，布局灵活，讲经台、般舟堂、东禅堂、大士阁（已毁）、圆通阁、送子庵，依山就势，高低错落。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[10]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[10]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_3&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;主要建筑&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;主要建筑&amp;lt;/h2&amp;gt;&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h3&amp;gt;天王殿&amp;lt;/h3&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;a nslog-type=&amp;quot;9317&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/0/ae51f3deb48f8c54e2ebe67e3d292df5e0fe7fa2?fr=lemma&amp;amp;ct=single&amp;quot; target=&amp;quot;_blank&amp;quot; title=&amp;quot;当阳玉泉寺 天王殿&amp;quot;&amp;gt;&amp;lt;img src=&amp;quot;https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=663d4522fcf2b211e02e824cfa806511/ae51f3deb48f8c54e2ebe67e3d292df5e0fe7fa2.jpg&amp;quot; alt=&amp;quot;当阳玉泉寺 天王殿&amp;quot; data-image=&amp;quot;we7rvaq5yyop&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;当阳玉泉寺 天王殿天王殿是中轴线上的第一座建筑，坐西朝东，门前有宽阔的广场。面阔七间，进深三间，除了高大的中门 外，在尽间各开一园门，南尽间作票房。粉墙高5米；屋面为单檐硬山灰筒瓦顶，正脊的云龙拼版和吞脊大吻，全部是灰陶制品。殿内梁架为木结构穿斗式，是鄂西地方民居的一般做法。殿内造像全为现代重塑。明间正面本尊，是弥勒化身的布袋和尚坐像，汉白玉石料。弥勒佛背后，雕塑手执宝杵，现天将军身的韦驮天像，全身金盔金甲，左手握杵拄地，右手插腰，左足略向前立，面向大雄宝殿。在天王殿南北梢间，塑四大天王像。天王殿始建时间不详，自明代以来经过多次重修。1990年，当阳市地方财政拨款，全落架大修天王殿。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[11]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[11]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3_2&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_3_2&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;毗卢殿&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3-2&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h3&amp;gt;毗卢殿&amp;lt;/h3&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;a nslog-type=&amp;quot;9317&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/0/7a899e510fb30f248837cf52cf95d143ad4b0335?fr=lemma&amp;amp;ct=single&amp;quot; target=&amp;quot;_blank&amp;quot; title=&amp;quot;当阳玉泉寺 毗卢殿&amp;quot;&amp;gt;&amp;lt;img src=&amp;quot;https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=5d9a262f221f95caa2f595b4f9167fc5/7a899e510fb30f248837cf52cf95d143ad4b0335.jpg&amp;quot; alt=&amp;quot;当阳玉泉寺 毗卢殿&amp;quot; data-image=&amp;quot;20a3j660360z&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;当阳玉泉寺 毗卢殿毗卢殿大堂即法堂，也称讲堂，是演说佛法皈戒集会的场所，在寺院中是仅次于大殿的主要建筑。大堂面宽五间，进深三间。檐下悬挂&amp;ldquo;毗卢上方&amp;rdquo;匾，王任重题。大堂中央，供奉毗卢遮那佛一尊。佛座四周，龛内塑500罗汉坐像，另增一尊执扇济公像。大堂经历次改建，形成两坡水硬山小青瓦顶，结构简单。大堂南山墙有小门通观音堂，堂中塑千手千眼观音像一尊，堂中有小天井，天井内有小假山。毗卢殿清代多次大修。1965年国家文物局拨款4万元修复，1975年再次小修。&amp;lt;a name=&amp;quot;3_3&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_3_3&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;上方殿&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3-3&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h3&amp;gt;上方殿&amp;lt;/h3&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;a nslog-type=&amp;quot;9317&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/0/023b5bb5c9ea15ce0f7bcd58b1003af33b87b2cd?fr=lemma&amp;amp;ct=single&amp;quot; target=&amp;quot;_blank&amp;quot; title=&amp;quot;当阳玉泉寺&amp;quot;&amp;gt;&amp;lt;img src=&amp;quot;https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=cb7b4f4d16dfa9ecf92e511552d1f754/023b5bb5c9ea15ce0f7bcd58b1003af33b87b2cd.jpg&amp;quot; alt=&amp;quot;当阳玉泉寺&amp;quot; data-image=&amp;quot;319u9lwzuigp&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;当阳玉泉寺上方殿与毗卢殿北山墙相连，坐西朝东，中间是大天井。上方殿第一进大门两侧，南间为烧香师住，北间为衣钵师住。穿过天井，是第二进，面宽三间，三间统连，中无立柱，俗称大厅，厅南北两侧摆红木坐椅，是平时住持与八堂当家师议事的地方。大厅之后是面宽三间的方丈楼，楼下是方丈室、会客厅，楼上是陈列室，挂名人字画，摆镇山八宝等珍贵文物。上方殿是清代寺院中建筑最精美的地方，抗日战争期间被大火烧毁，现仅存遗址。&amp;lt;a name=&amp;quot;3_4&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_3_4&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;观音殿&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3-4&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h3&amp;gt;观音殿&amp;lt;/h3&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;a nslog-type=&amp;quot;9317&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/0/0b46f21fbe096b63d14873010b338744ebf8ac09?fr=lemma&amp;amp;ct=single&amp;quot; target=&amp;quot;_blank&amp;quot; title=&amp;quot;观音殿&amp;quot;&amp;gt;&amp;lt;img src=&amp;quot;https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=86e79fb7207f9e2f74351a0a2f31e962/0b46f21fbe096b63d14873010b338744ebf8ac09.jpg&amp;quot; alt=&amp;quot;观音殿&amp;quot; data-image=&amp;quot;sfewa1m278hv&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;观音殿观音殿又名吞珠阁，在毗卢殿之后。观音殿始建年代不详，清康熙十八年（1679年），川湖总督蔡毓荣、守备刘汉臣捐造观世音菩萨泥金大像供奉于殿内。殿前平台上，放置元代大铁釜二口，铁香炉一只，四周植有桃、杏、石榴、柚子、罗汉松等果木树和观赏树。观音殿面宽五间，共两进，中隔天井，两侧有围屋，殿外筑有封闭的围墙，十分幽静。 观音殿及围墙1960年后倒塌，现遗址处仅存元代铁釜一口，重3000斤。&amp;lt;a name=&amp;quot;3_5&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_3_5&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;玉皇顶&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3-5&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h3&amp;gt;玉皇顶&amp;lt;/h3&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;a nslog-type=&amp;quot;9317&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/0/b3fb43166d224f4a3ade5e420ef790529822d11f?fr=lemma&amp;amp;ct=single&amp;quot; target=&amp;quot;_blank&amp;quot; title=&amp;quot;当阳玉泉寺 玉皇阁&amp;quot;&amp;gt;&amp;lt;img src=&amp;quot;https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=b30d2173b41bb0518b24b42a067bda77/b3fb43166d224f4a3ade5e420ef790529822d11f.jpg&amp;quot; alt=&amp;quot;当阳玉泉寺 玉皇阁&amp;quot; data-image=&amp;quot;eby97nt9dxl9&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;当阳玉泉寺 玉皇阁玉皇顶又名玉皇阁，在天上天之后， 面宽五间，共两进，两进之间有天井。第一进单檐歇山小青瓦顶，第二进重檐硬山小青瓦顶。第二进楼下供奉佛、菩萨像，楼上供奉民间信奉的雷公和闪母娘娘造像。玉皇顶南侧在清代末年尚有小泉，祖印和尚曾于泉畔筑石室闭关。抗日战争时期，玉皇顶建筑塌毁，泉眼枯竭。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[10]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[10]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3_6&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_3_6&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;大雄宝殿&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3-6&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h3&amp;gt;大雄宝殿&amp;lt;/h3&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;a nslog-type=&amp;quot;9317&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/0/d009b3de9c82d15846c17be0870a19d8bc3e421b?fr=lemma&amp;amp;ct=single&amp;quot; target=&amp;quot;_blank&amp;quot; title=&amp;quot;大雄宝殿&amp;quot;&amp;gt;&amp;lt;img src=&amp;quot;https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=26d139bca4cc7cd9fe2d33db09002104/d009b3de9c82d15846c17be0870a19d8bc3e421b.jpg&amp;quot; alt=&amp;quot;大雄宝殿&amp;quot; data-image=&amp;quot;o45c7u0afnxt&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;大雄宝殿大雄宝殿位居天王殿之后，两殿之间有丹池、青石甬道相连，建筑通高21米，台明面阔40米，进深30米，高0.4米，建筑面积1253平方米。大雄宝殿前有宽敞的月台，南有唐代千年古银杏，北有明代仅存的大塔柏，树下历代铁铸法器。台明上立柱三层，即廊柱、檐柱、金柱各24根。 72根立柱全部是金丝楠木，采用了穿斗与抬梁相结合的手法，榫卯结构。殿中斗拱，分内槽、外槽二种，共154朵。天花板共91块，每块厚0.05米，1.66米见方，上面用矿物颜色粘贴彩画，彩画种类有火珠、云龙、莲荷，色彩边缘以松烟墨重重勾勒。屋面为重檐歇山灰色筒板瓦顶，正脊高1.3米，以40余块灰陶花版拼成，两面各有高浮雕5条腾云驾雾的蛟龙。正脊两头的吞脊大吻，各高1.8米，是明代典型的官式建筑造型手法。殿上檐&amp;ldquo;智者道场&amp;rdquo;直匾，是中国佛教协会原会长&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E8%B5%B5%E6%9C%B4%E5%88%9D&amp;quot;&amp;gt;赵朴初&amp;lt;/a&amp;gt;的手笔。殿内并排砌有三个须弥座，中间的塑像为释迦 牟尼佛，坐像与须弥座通高8米。南次间须弥座上&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;a title=&amp;quot;玉泉寺&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/24130030/6159252dd42a2834bf6db8bc56b5c9ea14cebfba?fr=lemma&amp;amp;ct=cover&amp;quot; target=&amp;quot;_blank&amp;quot; nslog-type=&amp;quot;10000206&amp;quot;&amp;gt;&amp;lt;img alt=&amp;quot;玉泉寺&amp;quot; src=&amp;quot;https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=818db98f76f40ad111e4c0e1672d1151/6159252dd42a2834bf6db8bc56b5c9ea14cebfba.jpg&amp;quot; data-image=&amp;quot;sj0sp1cxpzsa&amp;quot;&amp;gt;玉泉寺(18张)&amp;lt;/a&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;供奉阿弥陀佛，北次间供奉药师佛。殿内南北山墙下，各塑罗汉九尊，皆为坐姿。另外，在殿内西北角供奉一尊铜胎地藏王菩萨坐像，东北角安装幽冥铁钟一口。大雄宝殿始建于隋开皇十三年（593年），历代重修。1982年至1984年由国家文物局拨款，全落架大修。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[10]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[10]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3_7&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_3_7&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;玉泉铁塔&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;3-7&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h3&amp;gt;玉泉铁塔&amp;lt;/h3&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;a nslog-type=&amp;quot;9317&amp;quot; href=&amp;quot;https://baike.baidu.com/pic/%E7%8E%89%E6%B3%89%E5%AF%BA/8317462/0/cdfe7281e777369fbd3e1e61?fr=lemma&amp;amp;ct=single&amp;quot; target=&amp;quot;_blank&amp;quot; title=&amp;quot;玉泉寺 棱金铁塔&amp;quot;&amp;gt;&amp;lt;img src=&amp;quot;https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=d56cbc54b07eca8016053ee5a1229712/8d5494eef01f3a294a88cfb99925bc315c607c00.jpg&amp;quot; alt=&amp;quot;玉泉寺 棱金铁塔&amp;quot; data-image=&amp;quot;52hmmx3aizws&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;玉泉寺 棱金铁塔玉泉寺前三园门北侧青龙山馀脉冈地上有&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E7%8E%89%E6%B3%89%E9%93%81%E5%A1%94&amp;quot;&amp;gt;玉泉铁塔&amp;lt;/a&amp;gt;一座。铁塔本名&amp;ldquo;佛牙舍利塔&amp;rdquo;，俗称&amp;ldquo;棱金铁塔&amp;rdquo;、&amp;ldquo;千佛塔&amp;rdquo;，北宋嘉佑六年（1061年）为重瘗唐高宗、则天皇后所授舍利而铸建，仿木构楼阁式，八角十三级，通高16.945米，重26472公斤。铁塔由地宫、塔基、塔身、塔刹四部分组成。地宫为石质六角形竖井，内置汉白玉须弥座，座上置石函三重，函中供奉舍利；塔基、塔身均为生铁铸造，塔基须弥座八面铸有铁围山、大海、八仙过海、二龙戏珠及石榴花饰纹，座八隅各铸顶塔力士一尊，状极威猛；塔身平座上铸有单钩阑，塔身各作四门，两两相对，隔层交错。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[12]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[12]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;4&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_4&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;价值地位&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;价值地位&amp;lt;/h2&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;天台宗祖庭&amp;lt;/strong&amp;gt;玉泉寺，是中国佛教天台宗祖庭之一。智顗大师在此创立天台宗，其重要代表著作《&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E6%91%A9%E8%AF%83%E6%AD%A2%E8%A7%82&amp;quot;&amp;gt;摩诃止观&amp;lt;/a&amp;gt;》、《&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E6%B3%95%E5%8D%8E%E7%8E%84%E4%B9%89&amp;quot;&amp;gt;法华玄义&amp;lt;/a&amp;gt;》均在玉泉讲演结集，在中国佛教史上留下&amp;ldquo;东土释迦&amp;rdquo;，&amp;ldquo;九旬谈妙&amp;rdquo;等佳话。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[1]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[1]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;strong&amp;gt;北禅宗祖庭&amp;lt;/strong&amp;gt;玉泉寺也是禅宗北宗祖庭唐国师神秀的道场。唐仪风年间（公元676年-678年），神秀自&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E9%BB%84%E6%A2%85&amp;quot;&amp;gt;黄梅&amp;lt;/a&amp;gt;五祖来到玉泉寺，在寺东开辟道场驻锡传禅20余年，朝野钦重。圆寂后，灵骨归葬于玉泉寺东楞伽峰。自唐以来，玉泉寺教、律、密、禅、净兼修，诸宗竞秀，各派流光，高僧辈出，见诸记载的有一百二十多位大德高僧，其中被历代帝王封为&amp;ldquo;大师&amp;rdquo;和&amp;ldquo;国师&amp;rdquo;称号的就有十人之多。自&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E6%99%BA%E9%A1%97&amp;quot;&amp;gt;智顗&amp;lt;/a&amp;gt;开始，下传&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E7%AB%A0%E5%AE%89&amp;quot;&amp;gt;章安&amp;lt;/a&amp;gt;灌顶，再传道素、弘景、惠真、弥陀承远、法照等，以次传灯，延及后世。弘景律师兼通天台与南山律，在此出家、弘法、圆寂。他从章安的门人道素学天台，从道&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E5%AE%A3%E5%BE%8B%E7%A5%96&amp;quot;&amp;gt;宣律祖&amp;lt;/a&amp;gt;学南山律，协助实叉难陀翻译八十卷《华严经》，景龙二年（708）三月为&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E9%89%B4%E7%9C%9F&amp;quot;&amp;gt;鉴真&amp;lt;/a&amp;gt;授具足戒。弘景法嗣有惠真、鉴真、普寂、怀让等。鉴真奉大唐皇帝之命东渡日本传教，成为中日文化交流史的始缔者，千古流芳。普寂后承神秀法脉，称北禅七祖。怀让禅师于玉泉寺皈依弘景禅师出家，后接曹溪惠能法脉，世称&amp;ldquo;&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E5%8D%97%E5%B2%B3%E6%80%80%E8%AE%A9&amp;quot;&amp;gt;南岳怀让&amp;lt;/a&amp;gt;&amp;rdquo;。一行本普寂弟子，再随惠真研习天台教观与戒律，后受敕命辅助善无畏，为中国古代著名天文学家和密宗一代宗师。承远，24岁礼惠真出家，后受命住锡&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E5%8D%97%E5%B2%B3%E8%A1%A1%E5%B1%B1&amp;quot;&amp;gt;南岳衡山&amp;lt;/a&amp;gt;，为净土宗三祖，其弟子有净土宗四祖法照等。荷泽宗创始人神会于（967&amp;mdash;701年）在此从神秀学习禅法，神秀赴京前劝其到曹溪惠能处学习，颇受惠能器重，系南禅立派重要人物。后有唐末五代诗僧齐已，宋慕荣、道源、务本、承皓，元藏山、钟山，明正诲，清&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E6%81%92%E6%B2%B3&amp;quot;&amp;gt;恒河&amp;lt;/a&amp;gt;、莲月、亮山，近现代有祖印、尘空等。北宋天禧年间，道源于玉泉山传灯录院编撰完成我国禅宗重要历史文献&amp;mdash;&amp;mdash;《&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E6%99%AF%E5%BE%B7%E4%BC%A0%E7%81%AF%E5%BD%95&amp;quot;&amp;gt;景德传灯录&amp;lt;/a&amp;gt;》。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[13]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[13]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;strong&amp;gt;伽蓝菩萨道场、关公信仰的发源地&amp;lt;/strong&amp;gt;玉泉寺也是伽蓝菩萨道场、关公信仰的发源地。唐《重修玉泉关庙记》载：&amp;ldquo;智顗禅师者至自天台，宴坐乔木之下，夜分忽于神遇（关公），云：&amp;lsquo;愿舍此地为僧坊，请师出山，以观其用。&amp;rsquo;&amp;rdquo;又据载，当年智者大师至覆船山一乔木下趺坐入定，见一人前致敬曰：&amp;ldquo;予即关某，死有余烈，故王此山。禅师何枉法足？&amp;rdquo;。又言：&amp;ldquo;弟子愿与子平建寺。&amp;rdquo;寺成，关公向大师乞受归戒。由此，关公成为保护伽蓝、护正祛邪的护法神，并为后人尊为&amp;ldquo;武财神&amp;rdquo;。现玉泉寺山麓尚有&amp;ldquo;汉云长显圣处&amp;rdquo;石望表（明代），全国最早之关庙&amp;ldquo;显烈祠&amp;rdquo;（始建于南北朝前）。北宋&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E5%A4%A7%E4%B8%AD%E7%A5%A5%E7%AC%A6&amp;quot;&amp;gt;大中祥符&amp;lt;/a&amp;gt;年间，宋真宗派官专程到玉泉寺祭祀关公，是见于史籍最早的官祀记载。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[14]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[14]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;strong&amp;gt;玉泉铁塔&amp;lt;/strong&amp;gt;&amp;lt;a target=&amp;quot;_blank&amp;quot; href=&amp;quot;https://baike.baidu.com/item/%E7%8E%89%E6%B3%89%E9%93%81%E5%A1%94&amp;quot;&amp;gt;玉泉铁塔&amp;lt;/a&amp;gt;塔身及平座铸有斗拱；腰檐出檐深远，翼角挑出龙头以悬风铎；塔身上著有铭文1397字，记载了塔名、塔重、铸建年代、工匠和功德主姓名及有关史迹，还铸有佛像2279尊，俨然一副铁铸佛国世界图；塔刹为铜质，形似为宝葫芦。铁塔通体不施榫扣，不加焊粘，逐件叠压，自重以固；其外型俊秀挺拔，稳健玲珑，如玉笋嵌空。玉泉铁塔是我国现存最高、最重、最完整的一座铁塔，它对研究中国古代冶金铸造、金属防腐、营造法式、建筑力学、铸雕艺术以及佛教史具有十分重要的价值。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[15]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[15]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;5&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_5&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;文物保护&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;文物保护&amp;lt;/h2&amp;gt;\r\n&amp;lt;p&amp;gt;1982年，玉泉寺及铁塔被列为全国重点文物保护单位。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[7]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[7]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;玉泉寺般舟堂于2006年因暴风雨，被后山大树砸垮，一直未能修复，寺院及地方文物部门积极努力争取，得到国家文物局大力支持，修复方案已批复，动土修缮，按照修旧如旧原则，寺院按要求定做20万块青砖，规格尺寸和过去古青砖相同。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[16]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[16]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;6&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_6&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;文化传播&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;文化传播&amp;lt;/h2&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;历代诗作&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;table&amp;gt;&amp;lt;tbody&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;th&amp;gt;诗名&amp;lt;/th&amp;gt;&amp;lt;th&amp;gt;朝代&amp;lt;/th&amp;gt;&amp;lt;th&amp;gt;作者&amp;lt;/th&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;《答族侄僧中孚赠玉泉仙人掌茶并序》&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;唐代&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;李白&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;《玉泉道中作》&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;唐代&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;元稹&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;《紫盖山还经玉泉寺》&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;唐代&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;张九龄&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;《送慧雅法师归玉泉寺》&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;唐代&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;贾岛&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;《次张曲江》&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;元代&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;卫应宸&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;《玉泉寺同黄平倩赋》&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;明代&amp;lt;/td&amp;gt;&amp;lt;td width=&amp;quot;211&amp;quot; valign=&amp;quot;top&amp;quot;&amp;gt;袁宏道&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;tr&amp;gt;&amp;lt;td valign=&amp;quot;top&amp;quot; colspan=&amp;quot;3&amp;quot; rowspan=&amp;quot;1&amp;quot;&amp;gt;&amp;lt;em&amp;gt;参考资料：&amp;lt;/em&amp;gt;&amp;lt;sup&amp;gt;&amp;amp;nbsp;[10]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[10]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/td&amp;gt;&amp;lt;/tr&amp;gt;&amp;lt;/tbody&amp;gt;&amp;lt;/table&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;a name=&amp;quot;7&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_7&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;佛事活动&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;佛事活动&amp;lt;/h2&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;抗日战争胜利后，玉泉寺曾于1946年秋天举办一次和平祈祷会，并派法师到远安鹿苑寺主持了类似的法会。1986年6月27日，寺僧在大雄宝殿内举行第一届祈祷世界和平法会，有百余名外地僧众参加祈祷。此后每年八九月举行一次，已成惯例。1995年的祈祷会最为隆重，恰逢世界反法西斯战争和中国人民抗日战争胜利50周年，意义十分重大。孟兰盆会是玉泉寺每年重要佛事之一，在农历七月十五日这天举行。自从1985年僧众进寺之后，每年都举行盂兰盆会，施主乐捐净资，供养众僧。1987年之后，每年一度的祈祷世界和平法会，是重要佛事活动之一。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[10]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[10]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;ref_10&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;2014年10月5日（农历九月十二），玉泉寺一年一度祈祷世界和平念佛法会今日起七，上午8时大众在净业堂共修念佛。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[17]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[17]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;2014年10月4日（农历九月十一），下午14：30分，玉泉寺水陆法会进行了坛场洒净仪式，主法法师为宽忍法师、宽直法师、宏圣法师。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[18]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[18]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;8&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_8&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;历任方丈&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;历任方丈&amp;lt;/h2&amp;gt;\r\n&amp;lt;p&amp;gt;玉泉寺历史上著名的祖师有智头、神秀等，著名方丈有弘景、一行、斋己、慕容、务本、广铸等。释明玉：曾任中国佛教协会理事，湖北省佛协会长，宜昌市、当阳市政协委员。宽一法师：现任监院。&amp;lt;sup&amp;gt;&amp;amp;nbsp;[7]&amp;lt;/sup&amp;gt;&amp;lt;a name=&amp;quot;ref_[7]_7528775&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;9&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_9&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;旅游贴士&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h2&amp;gt;旅游贴士&amp;lt;/h2&amp;gt;\r\n&amp;lt;h3&amp;gt;位置&amp;lt;/h3&amp;gt;\r\n&amp;lt;p&amp;gt;玉泉寺位于湖北省当阳市玉泉村230县道当阳玉泉风景区内。玉泉寺位于湖北省当阳市城西南12公里的玉泉山东麓。&amp;lt;a name=&amp;quot;9_2&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;sub7528775_9_2&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;交通信息&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;a name=&amp;quot;9-2&amp;quot;&amp;gt;&amp;lt;/a&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;h3&amp;gt;交通信息&amp;lt;/h3&amp;gt;\r\n&amp;lt;p&amp;gt;1、在宜昌长途汽车站乘坐前往当阳的车，在长坂坡下车即到。&amp;lt;br&amp;gt;　　2、宜昌东站乘坐开往当阳的火车，下车后乘坐当地的面包车或者摩的到景区。&amp;lt;/p&amp;gt;','0',0,'1','',22,22,1,1571835771,'1',0,'0'),
	(3,'191023130628U2VZW','玉泉寺特殊票',66.000,'CNY',0,0,0,'1',555555,0,NULL,NULL,2,30,4,111.000,30.000,0.000,'张','千年古刹，玉泉山下，铁塔地宫','[\"24/218e084162baea350ac379f66651af9a.jpg\",\"89/f05c8b302286031d1500241270a853ae.jpg\",\"39/a6671f77f4dd40632b7bbda5eba65654.jpg\",\"55/33933c5bb10de5c5c150549c61ce2b29.jpg\",\"43/92f4b898caa781dc9a1957896988676f.jpg\"]','','','&amp;lt;h1&amp;gt;&amp;lt;strong&amp;gt;江西旱情持续 赣江南昌段大片河床裸露&amp;lt;/strong&amp;gt;&amp;lt;/h1&amp;gt;\r\n&amp;lt;p&amp;gt;2019-10-23 14:45&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;img src=&amp;quot;https://himg2.huanqiucdn.cn/attachment2010/2019/1023/20191023024547367.jpg&amp;quot; data-image=&amp;quot;kjmg3bokm24n&amp;quot;&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;　　央视网消息：2019年10月22日，无人机航拍长江主要支流之一、江西省最大河流赣江南昌段水域，河床大面积裸露，岸边不少河床甚至干涸龟裂。当日20时，赣江南昌站实时水位为11.61米。8月以来，江西气温创历史同期新高，降水异常偏少，平均降雨量较常年同期偏少近9成，山塘水库大面积干涸。图片来源：视觉中国&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;img src=&amp;quot;https://himg2.huanqiucdn.cn/attachment2010/2019/1023/20191023024547212.jpg&amp;quot; data-image=&amp;quot;8dalhbny09aq&amp;quot;&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;img src=&amp;quot;https://himg2.huanqiucdn.cn/attachment2010/2019/1023/20191023024547326.jpg&amp;quot; data-image=&amp;quot;1puh0fa2yz4t&amp;quot;&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;\r\n&amp;lt;figure&amp;gt;&amp;lt;img src=&amp;quot;https://himg2.huanqiucdn.cn/attachment2010/2019/1023/20191023024548746.jpg&amp;quot; data-image=&amp;quot;oriy9bjx99dv&amp;quot;&amp;gt;&amp;lt;/figure&amp;gt;\r\n&amp;lt;p&amp;gt;&amp;lt;/p&amp;gt;','0',0,'1','',44,334,1,1571835988,'1',0,'0');

/*!40000 ALTER TABLE `se_goods` ENABLE KEYS */;
UNLOCK TABLES;


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
  `disabled` tinyint(1) DEFAULT '1' COMMENT '失效',
  `ordernum` int(3) unsigned DEFAULT '0' COMMENT '排序',
  `adduser` char(32) NOT NULL DEFAULT '' COMMENT '32',
  `addtime` int(11) NOT NULL,
  `upuser` char(32) DEFAULT '0' COMMENT '32',
  `uptime` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`brand_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_ordernum` (`ordernum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_goods_brand` WRITE;
/*!40000 ALTER TABLE `se_goods_brand` DISABLE KEYS */;

INSERT INTO `se_goods_brand` (`brand_id`, `brand_name`, `brand_url`, `brand_desc`, `brand_logo`, `brand_keywords`, `brand_setting`, `disabled`, `ordernum`, `adduser`, `addtime`, `upuser`, `uptime`)
VALUES
	(1,'锤子','www.chuizi.com','锤子手机，罗永浩永远的痛','32/2ccbdc5c06dd8e7e147a7a5fbbc2a0e8.jpg','锤子','',1,4,'1',1571728519,'0',0),
	(2,'华为','www.huawei.com','中国手机自主产权最高的手机制造商','32/2ccbdc5c06dd8e7e147a7a5fbbc2a0e8.jpg','huawei','',1,3,'1',1571728561,'0',0),
	(3,'魅族','www.meizu.com','魅族科技是最让人惋惜的，错过了中国手机发展的红利','32/2ccbdc5c06dd8e7e147a7a5fbbc2a0e8.jpg','魅族','',1,2,'1',1571728823,'0',0),
	(4,'小米','www.xiaomi.com','小米手机是发展最快的科技公司','32/2ccbdc5c06dd8e7e147a7a5fbbc2a0e8.jpg','小米','',1,1,'1',1571728911,'0',0);

/*!40000 ALTER TABLE `se_goods_brand` ENABLE KEYS */;
UNLOCK TABLES;


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
  `image_id` bigint(20) NOT NULL COMMENT '图片ID',
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
  `uptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addtime` int(10) NOT NULL,
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



# Dump of table se_login_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_login_log`;

CREATE TABLE `se_login_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(60) DEFAULT '' COMMENT '用户登陆session_id ',
  `app_token` char(64) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL COMMENT '1登陆成功2登录失败',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '登陆IP地址',
  `username` varchar(100) DEFAULT NULL COMMENT '登陆用户名称',
  `login_time` int(10) unsigned NOT NULL COMMENT '登陆时间',
  `login_uid` char(32) NOT NULL DEFAULT '0' COMMENT '登陆用户id',
  `agent` varchar(1000) DEFAULT NULL COMMENT '浏览器信息',
  `user_type` enum('admin','member') NOT NULL DEFAULT 'admin' COMMENT 'admin后台用户',
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_login_log` WRITE;
/*!40000 ALTER TABLE `se_login_log` DISABLE KEYS */;

INSERT INTO `se_login_log` (`id`, `session_id`, `app_token`, `status`, `login_ip`, `username`, `login_time`, `login_uid`, `agent`, `user_type`, `remark`)
VALUES
	(1,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','admin',1541652488,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(2,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','gangkui003',1541652713,'6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(3,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','gangkui003',1541663249,'6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(4,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','gangkui003',1541663463,'6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(5,'ka4n0rp0es5tlsva5c290rc1o6',NULL,2,'127.0.0.1','gangkui002',1541663594,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin','用户名或者密码错误'),
	(6,'ka4n0rp0es5tlsva5c290rc1o6',NULL,2,'127.0.0.1','gangkui002',1541663599,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin','用户名或者密码错误'),
	(7,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','gangkui001',1541663626,'11','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(8,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','admin',1541666475,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(9,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','admin',1541666669,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(10,'3es2dhof7u9qa27gko6384i9t7',NULL,2,'127.0.0.1','gangkui001',1541670999,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Safari/605.1.15','admin','用户名或者密码错误'),
	(11,'3es2dhof7u9qa27gko6384i9t7',NULL,1,'127.0.0.1','gangkui001',1541671024,'11','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Safari/605.1.15','admin',NULL),
	(12,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','admin',1541671184,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(13,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','admin',1541671923,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(14,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','gangkui001',1541671952,'11','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(15,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','gangkui001',1541672566,'11','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(16,'ka4n0rp0es5tlsva5c290rc1o6',NULL,1,'127.0.0.1','gangkui001',1541673499,'11','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(17,'myprefix-brcmrvlo54bapnm4hm8mqjact6',NULL,1,'127.0.0.1','gangkui001',1542114074,'11','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','admin',NULL),
	(18,'t6ju3io3uj97dbusfcrucgnb45',NULL,1,'127.0.0.1','admin',1542255720,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(19,'fs1lr2kerrlagmsmns1210e5j3',NULL,1,'127.0.0.1','admin',1542255731,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(20,'k3e6sb9n872ocrhbgas18svao0',NULL,1,'127.0.0.1','admin',1542255781,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(21,'gad4an9vbc5a7h619r4uc8bi12',NULL,1,'127.0.0.1','admin',1542256020,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(22,'3soob4n9q2igqup2lucb04mks3',NULL,1,'127.0.0.1','admin',1542256070,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(23,'fb8p8cmd39hiqc2nt30u21qpa1',NULL,1,'127.0.0.1','admin',1542256273,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(24,'i0f9dcgti8qk0pomone3222fq7',NULL,1,'127.0.0.1','admin',1542256281,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(25,'e3k56iobiveacg9hvlo79k3600',NULL,1,'127.0.0.1','admin',1542256356,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(26,'v2ba02m7e69cu1p299r45vqev2',NULL,1,'127.0.0.1','admin',1542256396,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(27,'1tti0a2lmlcu04cs3upk3cd8c2',NULL,1,'127.0.0.1','admin',1542256465,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(28,'myprefix-brcmrvlo54bapnm4hm8mqjact6',NULL,1,'127.0.0.1','admin',1542256558,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(29,'myprefix-brcmrvlo54bapnm4hm8mqjact6',NULL,1,'127.0.0.1','admin',1542256880,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(30,'9jp4p7vpt8f61q0m4lmu3ngk90',NULL,1,'127.0.0.1','admin',1542256959,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(31,'jepgibupjem1hc93n154vogvj2',NULL,1,'127.0.0.1','admin',1542256965,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(32,'uhtk8inecd8p2aciu0tg2k2e93',NULL,1,'127.0.0.1','admin',1542256993,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(33,'4ma9opvlqb9n3tupsiv3v9a3f5',NULL,1,'127.0.0.1','admin',1542257064,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(34,'tai3urqrlg2g12pn5cl17cb9l2',NULL,1,'127.0.0.1','admin',1542257100,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(35,'s04qkivuh4dk79h338sa2npgm6',NULL,1,'127.0.0.1','admin',1542257155,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(36,'psaq6a4p8n3276f0c9i83keku3',NULL,1,'127.0.0.1','admin',1542257181,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(37,'3ccvnrhhhqd8mng4mj9hs5i113',NULL,1,'127.0.0.1','admin',1542257258,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(38,'tmr1e4l9v91ersgeg82jqf5k10',NULL,1,'127.0.0.1','admin',1542257306,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(39,'myprefix-brcmrvlo54bapnm4hm8mqjact6',NULL,1,'127.0.0.1','admin',1542257397,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(40,'8dgblmo9tnpg28m5mk6pd07hc4',NULL,1,'127.0.0.1','admin',1542257418,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(41,'71pu3jiqh12bcf4lanmipq5dj5',NULL,1,'127.0.0.1','admin',1542257425,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(42,'b0ee2j87jodesemkcr6ldhknq4',NULL,1,'127.0.0.1','admin',1542257466,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(43,'s8c3gt8p1ioas0j32fi4pb4mg4',NULL,1,'127.0.0.1','admin',1542257548,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(44,'6perv7psdbs195mb8gg6pak5l0',NULL,1,'127.0.0.1','admin',1542257661,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(45,'cgj5da5tfsl9oe4ua20oarn587',NULL,1,'127.0.0.1','admin',1542257667,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(46,'lsqpd5rf50si39cmma0dvkdpi2',NULL,1,'127.0.0.1','admin',1542266764,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(47,'v0qqpe5l32ja5nvh503qmsmi61',NULL,1,'127.0.0.1','admin',1542266765,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(48,'cfb94rqasarkkmac9hh8in1i17',NULL,1,'127.0.0.1','admin',1542266803,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(49,'gqjfkrfroqmei6rr3mgdqegq30',NULL,1,'127.0.0.1','admin',1542266852,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(50,'tp7uvagdijosn6qpo1a3irfdt7',NULL,1,'127.0.0.1','admin',1542266999,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(51,'t2tsnr9lfst4oogqb860272id5',NULL,1,'127.0.0.1','admin',1542267276,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(52,'myprefix-brcmrvlo54bapnm4hm8mqjact6',NULL,1,'127.0.0.1','admin',1542267334,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(53,'kbc1op51k73dn7au7raffq4cr4',NULL,1,'127.0.0.1','admin',1542268392,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(54,'v9fhvisuumdf05u4vjelj94m21',NULL,1,'127.0.0.1','admin',1542360186,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(55,'53lkms8qpucb33a957oq172jf3',NULL,1,'127.0.0.1','admin',1542360275,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(56,'09r243kn1ltpbsms327igrjmn1',NULL,1,'127.0.0.1','admin',1542360281,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(57,'gt0befg5ng88s6ogp45r9skb87',NULL,1,'127.0.0.1','admin',1542360297,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(58,'796pf1ibif71kgkdjc5eqc3pm0',NULL,1,'127.0.0.1','admin',1542360348,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(59,'3b1q88neo8p7uld5fa4t58ie41',NULL,1,'127.0.0.1','admin',1542360359,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(60,'cmgv414fhdgg03ne2ac6alelp6',NULL,1,'127.0.0.1','admin',1542360406,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(61,'dl6p36j67o55lh9ol55pd0rtk1',NULL,1,'127.0.0.1','admin',1542360492,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(62,'245uah9gpr2r1ia0n0o284u7r0',NULL,1,'127.0.0.1','admin',1542369258,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(63,'q1a30ltml5nr7qfk2oeg380e83',NULL,1,'127.0.0.1','admin',1542425736,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(64,'8n2bj4ht9hv006g2vqk0mdvjo2',NULL,1,'127.0.0.1','admin',1542623928,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(65,'oceufq48junehgmvdgvr715292',NULL,1,'127.0.0.1','admin',1542806409,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36','admin',NULL),
	(66,'e5j04cr7lk7oufn7i5v21o8a54',NULL,1,'127.0.0.1','admin',1543549074,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','admin',NULL),
	(67,'b3rp4598u8r1e9mo5cp26q4t85',NULL,1,'127.0.0.1','admin',1545817751,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','admin',NULL),
	(68,'eg0h75o3ovobqgcfes2pcfbbl2',NULL,1,'127.0.0.1','admin',1545829619,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','admin',NULL),
	(69,'s74kf4mo9ts3ks0l6v5secchn0',NULL,2,'127.0.0.1','admin',1545898398,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0) Gecko/20100101 Firefox/64.0','admin','用户名或者密码错误'),
	(70,'s74kf4mo9ts3ks0l6v5secchn0',NULL,1,'127.0.0.1','admin',1545898408,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0) Gecko/20100101 Firefox/64.0','admin',NULL),
	(71,'6je5opa88ljsvv1n7n5rm7g953',NULL,1,'127.0.0.1','admin',1545900420,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','admin',NULL),
	(72,'1ln6fjjrbina5s5du131meuts4',NULL,1,'127.0.0.1','admin',1564542585,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','admin',NULL),
	(73,'in7pj989hkpdcpkbgpacqnu0l0',NULL,1,'127.0.0.1','admin',1564634313,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36','admin',NULL),
	(74,'pi98q3nt376ur0caultto706us',NULL,1,'127.0.0.1','admin',1570765439,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(75,'pi98q3nt376ur0caultto706us',NULL,1,'127.0.0.1','admin',1570765475,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(76,'pi98q3nt376ur0caultto706us',NULL,1,'127.0.0.1','admin',1570765912,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(77,'pi98q3nt376ur0caultto706us',NULL,1,'127.0.0.1','admin',1570766231,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(78,'fl7cp105e12ldfjc3hpccb0lf2',NULL,1,'127.0.0.1','admin',1570787554,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(79,'as122ti9nuc8tlonrq0ml3ucn8',NULL,1,'127.0.0.1','admin',1570855937,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(80,'brplbb6pub9ck2iiqndkv2dt4t',NULL,1,'127.0.0.1','admin',1570872083,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(81,'s59f51fej7rfm505t91kok11ve',NULL,1,'127.0.0.1','admin',1571052232,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(82,'guh59igealt57qmtbhnh1ka8eq',NULL,1,'127.0.0.1','admin',1571111611,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(83,'61c40jq4jttgqilu7n9eqdkf32',NULL,1,'127.0.0.1','admin',1571126625,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(84,'qnsso83iskgd6bcj640lm725fp',NULL,1,'127.0.0.1','admin',1571142399,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(85,'77tbiadi2elupln0a8m62ptedt',NULL,1,'127.0.0.1','admin',1571197304,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(86,'vfasl6scaepmd66a42q03v4mjg',NULL,1,'127.0.0.1','admin',1571211730,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(87,'q6ptfqcnb15jfrd7nm8l4tef90',NULL,1,'127.0.0.1','admin',1571283678,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(88,'hobbbakattdgtiravfodg77e6b',NULL,1,'127.0.0.1','admin',1571303372,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(89,'hobbbakattdgtiravfodg77e6b',NULL,1,'127.0.0.1','admin',1571303379,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(90,'kdvovgtarfptarpbemenhohmsd',NULL,1,'127.0.0.1','admin',1571316227,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(91,'f7b7pqjgrtl0jtts2o5jf1oipc',NULL,1,'127.0.0.1','admin',1571650684,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(92,'dmpgmt7fgh7loal6mrq5p1r9p7',NULL,1,'127.0.0.1','admin',1571665539,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36','admin',NULL),
	(93,'ciaq6htmg3h2ultjh54h5655a6',NULL,1,'127.0.0.1','admin',1571716893,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(94,'c9di87jf9b47b2o3d762ar6a9n',NULL,1,'127.0.0.1','admin',1571729216,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(95,'tn96efsrolmi32omps3nr35l66',NULL,1,'127.0.0.1','admin',1571748633,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(96,'0t88epl7faj46jav4unncpc3fh',NULL,1,'127.0.0.1','admin',1571800309,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(97,'vmcffcagbm6ttdjthdu0eg9en4',NULL,1,'127.0.0.1','admin',1571815514,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(98,'5nqn3k48cd8rmfuojhh18ela5r',NULL,1,'127.0.0.1','admin',1571834652,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(99,'dmhq0v7bmtpsiv5alv886tpg1v',NULL,1,'127.0.0.1','admin',1571905045,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(100,'j3pejpsj8skfa33bb9jothv12a',NULL,1,'127.0.0.1','admin',1571922544,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(101,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571972594,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(102,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571975639,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(103,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571975807,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(104,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571976483,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(105,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571976525,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(106,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571976864,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(107,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571976904,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(108,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571976920,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(109,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571976941,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(110,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571977131,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(111,'12in3ibqjv357o3tp0vivqo7a1',NULL,2,'127.0.0.1','admin1',1571978194,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(112,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571978308,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(113,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571978603,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(114,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571978907,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(115,'12in3ibqjv357o3tp0vivqo7a1',NULL,1,'127.0.0.1','admin',1571979036,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(116,'curc868u8msgpdg02gtsqrp1ai',NULL,1,'127.0.0.1','admin',1571987155,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(117,'73m6dqbbmlgv0abct25ocliloq',NULL,1,'127.0.0.1','admin',1572008316,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(118,'3av3us71ctdjf818r1vmh1e50v',NULL,1,'127.0.0.1','admin',1572116084,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36','admin',NULL),
	(119,'atsgnqq63seoo8inkl773lqjgj',NULL,1,'127.0.0.1','admin',1572156860,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36','admin',NULL),
	(120,'2agl7ursu7g9rvp38uejsblbu9',NULL,1,'127.0.0.1','admin',1572171804,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36','admin',NULL),
	(121,'7rp0j0aold5d9vbb98lrs85s26',NULL,1,'127.0.0.1','admin',1572451684,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36','admin',NULL),
	(122,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','gangkui',1572492667,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(123,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','gangkui',1572492728,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(124,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','gangkui',1572492768,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(125,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','gangkui',1572493028,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(126,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','gangkui',1572493149,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(127,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','gangkui',1572493159,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(128,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','gangkui',1572494577,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(129,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','gangkui',1572494594,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(130,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','gangkui',1572494708,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(131,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,2,'127.0.0.1','gangkui',1572497504,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(132,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','admin',1572497514,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(133,'vsm7fnvsvdtjkpf9ts1s3s352j',NULL,1,'127.0.0.1','admin',1572497680,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(134,'3an90dtnfk48kj9knuu0cfi7vk',NULL,1,'127.0.0.1','gangkui',1572505460,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(135,'bh3qqs3ul3o218vdcjkqu6nt57',NULL,1,'127.0.0.1','gangkui',1572519844,'ed79914ea512d38bc1bbb9d7199a3af0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(136,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','gangkui',1573207363,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(137,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','admin',1573207371,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(138,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','',1573209006,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(139,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','',1573209010,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(140,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','',1573210840,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(141,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','',1573210846,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(142,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','',1573210886,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(143,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','',1573210891,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(144,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','',1573210970,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(145,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','',1573210974,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(146,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','admin',1573211047,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(147,'o5grn58acf86j5ke22g53sjjai',NULL,2,'127.0.0.1','admin',1573211051,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(148,'ttmt6pqhte8ls32a48al8b0jf6',NULL,2,'127.0.0.1','admin',1573217994,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(149,'ttmt6pqhte8ls32a48al8b0jf6',NULL,2,'127.0.0.1','admin',1573218131,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(150,'3el3s0dgq6dvorlmv8majaq907',NULL,1,'127.0.0.1','admin',1573271531,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(151,'3el3s0dgq6dvorlmv8majaq907',NULL,1,'127.0.0.1','admin',1573271536,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(152,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','admin',1573286384,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(153,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','admin',1573286387,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(154,'8pbdi9gjpokruveo4ss2c1iu1r','',1,'127.0.0.1','admin',1573287650,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(155,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296217,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(156,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296238,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(157,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296249,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(158,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296250,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(159,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296316,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(160,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296331,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(161,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296332,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(162,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296332,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(163,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296332,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(164,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296416,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(165,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296454,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(166,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296483,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(167,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296498,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(168,'8pbdi9gjpokruveo4ss2c1iu1r',NULL,2,'127.0.0.1','',1573296512,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin','用户名或者密码错误'),
	(169,'','',1,'127.0.0.1','admin',1573296585,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(170,'','',1,'127.0.0.1','admin',1573296746,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(171,'','',1,'127.0.0.1','admin',1573297694,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(172,'','',1,'127.0.0.1','admin',1573297701,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(173,'','',1,'127.0.0.1','admin',1573297711,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(174,'','',1,'127.0.0.1','admin',1573464988,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(175,'','',1,'127.0.0.1','admin',1573465390,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(176,'','',1,'127.0.0.1','admin',1573465499,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(177,'','',1,'127.0.0.1','admin',1573465588,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(178,'','',1,'127.0.0.1','admin',1573465606,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(179,'','',1,'127.0.0.1','admin',1573465609,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(180,'','yTg0LuL85fAE10vBc4ca4238a0b923820dcc509a6f75849bZAzDCBjzUxPmuUOv',1,'127.0.0.1','admin',1573465730,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(181,'','jfCa2v6rHwbbSrh2c4ca4238a0b923820dcc509a6f75849bWamzphNwmlEeXKSt',1,'127.0.0.1','admin',1573465746,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(182,'','AoYTqBpH77vVjsw7c4ca4238a0b923820dcc509a6f75849bDRGKEcim2TqaJlXq',1,'127.0.0.1','admin',1573465751,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(183,'','IXueZvG6Es5LaNsoc4ca4238a0b923820dcc509a6f75849bMVgZr1sZ4rG3TDXp',1,'127.0.0.1','admin',1573480521,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(184,'','yfUXaCEFOm4rxeSRc4ca4238a0b923820dcc509a6f75849bpDEY25uOoqEsMgG3',1,'127.0.0.1','admin',1573480538,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(185,'','KUTmRkQbQb5hz8sUc4ca4238a0b923820dcc509a6f75849bILcOJunECGdXfcfR',1,'127.0.0.1','admin',1573480538,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(186,'','RaywpI9mgwjXAJorc4ca4238a0b923820dcc509a6f75849ba7Zpg5dnk2wAOAOJ',1,'127.0.0.1','admin',1573480538,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(187,'','P8d8RBTgSwgjqUa4c4ca4238a0b923820dcc509a6f75849bQN5hYsmHNyMZnIj0',1,'127.0.0.1','admin',1573480540,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(188,'','gzPQggtbOJ19eI5pc4ca4238a0b923820dcc509a6f75849bnhQalEUlQI7VKJm2',1,'127.0.0.1','admin',1573532571,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(189,'kobr5cp2v7cm3amdqgkgln7kcn','',1,'127.0.0.1','admin',1573617234,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(190,'','Kz9AQqpEk8rMfryrc4ca4238a0b923820dcc509a6f75849b0duivIvaYa7emFro',1,'127.0.0.1','admin',1573631672,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36','admin',NULL),
	(191,'1sne14aagdvbnk9npacf7ij4l4',NULL,2,'127.0.0.1','',1573807915,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin','用户名或者密码错误'),
	(192,'1sne14aagdvbnk9npacf7ij4l4',NULL,2,'127.0.0.1','',1573807925,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin','用户名或者密码错误'),
	(193,'','xatCWQ0FYvSdzZVkc4ca4238a0b923820dcc509a6f75849bdDwfBLIvKoscUmbl',1,'127.0.0.1','admin',1573808036,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(194,'','Lo9K2ByTW0OtxKPWc4ca4238a0b923820dcc509a6f75849bfU9JUIrpQmkUkjdW',1,'127.0.0.1','admin',1573808147,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(195,'','hxQ4Ji3HPjdfIi59c4ca4238a0b923820dcc509a6f75849bYmvICuPVm8Bnodah',1,'127.0.0.1','admin',1573808148,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(196,'','rUl69uohEsuDuBWdc4ca4238a0b923820dcc509a6f75849bRCiW9uD9UHdRLl1A',1,'127.0.0.1','admin',1573808958,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(197,'','FihqrSt2zuvJ8LRnc4ca4238a0b923820dcc509a6f75849bMruCLcun9cyNwSZn',1,'127.0.0.1','admin',1573808959,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(198,'','IILUAF6TUkHEXiIrc4ca4238a0b923820dcc509a6f75849bGLttcEFjxHgpWiwv',1,'127.0.0.1','admin',1573808960,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(199,'','QmQOA72efoqc9zlhc4ca4238a0b923820dcc509a6f75849bEbRLoilumn7EnUPy',1,'127.0.0.1','admin',1573808960,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(200,'','ClOktGFmipXvKzlHc4ca4238a0b923820dcc509a6f75849bdVEFud7pncIfXor1',1,'127.0.0.1','admin',1573808961,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(201,'','C8PvMfxdMgnOwLtDc4ca4238a0b923820dcc509a6f75849by433830klWf0GGki',1,'127.0.0.1','admin',1573809076,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(202,'','S0cHkuZA8aNOKESwc4ca4238a0b923820dcc509a6f75849bBjL9gl3rgcfk1oGm',1,'127.0.0.1','admin',1573810935,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL),
	(203,'1sne14aagdvbnk9npacf7ij4l4',NULL,2,'127.0.0.1','',1573810938,'0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin','用户名或者密码错误'),
	(204,'','7ObgsBAfRTQISZ17c4ca4238a0b923820dcc509a6f75849bloKU62E7CYwUqKq1',1,'127.0.0.1','admin',1573810955,'1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Safari/605.1.15','admin',NULL);

/*!40000 ALTER TABLE `se_login_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_member`;

CREATE TABLE `se_member` (
  `member_id` char(32) NOT NULL DEFAULT '' COMMENT '会员用户名',
  `member_lv_id` mediumint(8) unsigned DEFAULT '0' COMMENT '会员等级',
  `group_id` int(11) DEFAULT '0',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(100) DEFAULT NULL COMMENT '会员昵称',
  `point` int(10) DEFAULT '0' COMMENT '积分',
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `email` varchar(200) DEFAULT '' COMMENT 'EMAIL',
  `refer_id` varchar(50) DEFAULT NULL COMMENT '来源ID',
  `refer_url` varchar(200) DEFAULT NULL COMMENT '推广来源URL',
  `reg_ip` varchar(30) DEFAULT NULL COMMENT '注册时IP地址',
  `state` tinyint(1) DEFAULT '0' COMMENT '会员验证状态',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1启用2禁用',
  `remark` text COMMENT '备注',
  `experience` int(10) DEFAULT '0' COMMENT '经验值',
  `resetpwd` varchar(255) DEFAULT NULL COMMENT '找回密码唯一标示',
  `resetpwdtime` int(10) unsigned DEFAULT NULL COMMENT '找回密码时间',
  `source` enum('pc','wap','weixin','api') DEFAULT 'pc' COMMENT '平台来源',
  `session_id` varchar(50) DEFAULT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adduser` char(32) DEFAULT '0',
  `uptime` int(10) unsigned DEFAULT '0',
  `upuser` char(32) DEFAULT '0',
  `deluser` char(32) DEFAULT '0',
  `deltime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `ind_email` (`email`),
  KEY `ind_disabled` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员信息表';

LOCK TABLES `se_member` WRITE;
/*!40000 ALTER TABLE `se_member` DISABLE KEYS */;

INSERT INTO `se_member` (`member_id`, `member_lv_id`, `group_id`, `realname`, `nickname`, `point`, `addr`, `mobile`, `email`, `refer_id`, `refer_url`, `reg_ip`, `state`, `status`, `remark`, `experience`, `resetpwd`, `resetpwdtime`, `source`, `session_id`, `addtime`, `adduser`, `uptime`, `upuser`, `deluser`, `deltime`)
VALUES
	('36dabe09c80cf27b732114d7c9c807bb',0,0,'','',0,'0','','','','','/index/?ct=index&amp;ac=regist',0,1,'',0,'',0,'pc',NULL,1572491077,'-1',0,'0','0',0),
	('ed79914ea512d38bc1bbb9d7199a3af0',0,0,'王刚','干锅儿',0,'0','567890','','','','/index/?ct=index&amp;ac=regist',0,1,'',0,'',0,'pc',NULL,1572463485,'-1',0,'0','0',0);

/*!40000 ALTER TABLE `se_member` ENABLE KEYS */;
UNLOCK TABLES;


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



# Dump of table se_member_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_member_group`;

CREATE TABLE `se_member_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  `member_id` char(32) NOT NULL DEFAULT '' COMMENT '账户序号ID',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(225) NOT NULL DEFAULT '' COMMENT '登录密码',
  `password_account` char(10) DEFAULT '' COMMENT '加密字符串',
  `wechat_openid` varchar(225) DEFAULT NULL COMMENT '微信openid',
  `app_token` char(64) DEFAULT NULL COMMENT 'app登陆tokne',
  `session_id` varchar(50) DEFAULT NULL,
  `uptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次更新时间',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员密码表';

LOCK TABLES `se_member_pam` WRITE;
/*!40000 ALTER TABLE `se_member_pam` DISABLE KEYS */;

INSERT INTO `se_member_pam` (`member_id`, `username`, `password`, `password_account`, `wechat_openid`, `app_token`, `session_id`, `uptime`)
VALUES
	('36dabe09c80cf27b732114d7c9c807bb','gangkui001','$2y$10$nLCRHEgqJNpRVU9aiX59l./BSilQj.freTW5QHzSljsYIZ8HRvC3e','','',NULL,NULL,0),
	('ed79914ea512d38bc1bbb9d7199a3af0','gangkui','$2y$10$Qe9mUfxUYh5vPOM4OUcFYeReKz0twNyPxbNF5cxSYax/vBt.NAnY2','','',NULL,'vsm7fnvsvdtjkpf9ts1s3s352j',0);

/*!40000 ALTER TABLE `se_member_pam` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order`;

CREATE TABLE `se_order` (
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单号',
  `order_sn` varchar(32) NOT NULL DEFAULT '',
  `qrcode` char(32) NOT NULL DEFAULT '' COMMENT '二维码code',
  `total_amount` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '订单货币总值',
  `cost_item` decimal(20,3) DEFAULT '0.000' COMMENT '订单商品总价格',
  `pay_status` tinyint(1) DEFAULT '1' COMMENT '付款状态',
  `ship_status` enum('0','1','2','3','4') NOT NULL DEFAULT '0' COMMENT '发货状态',
  `is_delivery` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否需要发货',
  `payment` varchar(100) DEFAULT NULL COMMENT '支付方式',
  `shipping_id` mediumint(8) unsigned DEFAULT NULL COMMENT '配送方式',
  `shipping` varchar(100) DEFAULT NULL COMMENT '配送方式',
  `member_id` char(32) DEFAULT '0' COMMENT '会员用户名',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订单状态',
  `confirm` tinyint(1) DEFAULT '1' COMMENT '确认状态',
  `ship_area` varchar(255) DEFAULT NULL COMMENT '收货地区',
  `ship_name` varchar(50) DEFAULT NULL COMMENT '收货人',
  `weight` decimal(20,3) DEFAULT '0.000' COMMENT '订单总重量',
  `tostr` longtext COMMENT '订单文字描述',
  `itemnum` int(8) unsigned NOT NULL DEFAULT '1' COMMENT '订单子订单数量',
  `ip` varchar(15) DEFAULT NULL COMMENT 'IP地址',
  `ship_addr` text COMMENT '收货地址',
  `ship_zip` varchar(20) DEFAULT NULL COMMENT '收货人邮编',
  `ship_tel` varchar(50) DEFAULT NULL COMMENT '收货电话',
  `ship_email` varchar(200) DEFAULT NULL COMMENT '收货人email',
  `ship_time` varchar(50) DEFAULT NULL COMMENT '配送时间',
  `ship_mobile` varchar(50) DEFAULT NULL COMMENT '收货人手机',
  `is_tax` tinyint(1) DEFAULT '1' COMMENT '是否要开发票',
  `tax_type` tinyint(1) DEFAULT '0' COMMENT '发票类型',
  `tax_content` varchar(255) DEFAULT NULL COMMENT '发票内容',
  `cost_tax` decimal(20,3) DEFAULT '0.000' COMMENT '订单税率',
  `tax_company` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `cost_payment` decimal(20,3) DEFAULT NULL COMMENT '支付费用',
  `currency` varchar(20) DEFAULT 'CNY' COMMENT '订单支付货币',
  `cur_rate` decimal(10,4) DEFAULT '0.0000' COMMENT '订单支付货币汇率',
  `score_u` decimal(20,3) DEFAULT '0.000' COMMENT '订单使用积分',
  `score_g` decimal(20,3) DEFAULT '0.000' COMMENT '订单获得积分',
  `discount` decimal(20,3) DEFAULT '0.000' COMMENT '订单减免',
  `pmt_goods` decimal(20,3) DEFAULT NULL COMMENT '商品促销优惠',
  `pmt_order` decimal(20,3) DEFAULT NULL COMMENT '订单促销优惠',
  `payed` decimal(20,3) DEFAULT '0.000' COMMENT '订单支付金额',
  `memo` longtext COMMENT '订单附言',
  `disabled` tinyint(1) DEFAULT '1',
  `mark_type` varchar(2) NOT NULL DEFAULT 'b1' COMMENT '订单备注图标',
  `mark_text` longtext COMMENT '订单备注',
  `cost_freight` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '配送费用',
  `extend` varchar(255) DEFAULT 'false' COMMENT '订单扩展',
  `addon` longtext COMMENT '订单附属信息(序列化)',
  `addtime` int(11) NOT NULL,
  `adduser` char(32) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0' COMMENT '最后更新时间',
  `upuser` char(32) DEFAULT '0' COMMENT '最后跟新人',
  `deltime` int(11) DEFAULT '0',
  `deluser` char(32) DEFAULT '0',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `qrcode` (`qrcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

LOCK TABLES `se_order` WRITE;
/*!40000 ALTER TABLE `se_order` DISABLE KEYS */;

INSERT INTO `se_order` (`order_id`, `order_sn`, `qrcode`, `total_amount`, `cost_item`, `pay_status`, `ship_status`, `is_delivery`, `payment`, `shipping_id`, `shipping`, `member_id`, `status`, `confirm`, `ship_area`, `ship_name`, `weight`, `tostr`, `itemnum`, `ip`, `ship_addr`, `ship_zip`, `ship_tel`, `ship_email`, `ship_time`, `ship_mobile`, `is_tax`, `tax_type`, `tax_content`, `cost_tax`, `tax_company`, `cost_payment`, `currency`, `cur_rate`, `score_u`, `score_g`, `discount`, `pmt_goods`, `pmt_order`, `payed`, `memo`, `disabled`, `mark_type`, `mark_text`, `cost_freight`, `extend`, `addon`, `addtime`, `adduser`, `uptime`, `upuser`, `deltime`, `deluser`)
VALUES
	(1572519982916717890,'ZKXC1910311106229167005','ed79914ea512d38bc1bbb9d7199a3af0',96.000,0.000,1,'0','','',0,'','ed79914ea512d38bc1bbb9d7199a3af0',1,1,'','',0.000,'',1,'127.0.0.1','','','','','','',1,1,'',0.000,'',96.000,'CNY',0.0000,0.000,0.000,0.000,0.000,0.000,96.000,'',1,'','',0.000,'','a:1:{i:2;a:6:{s:14:&quot;member_buy_num&quot;;s:1:&quot;1&quot;;s:5:&quot;price&quot;;s:6:&quot;96.000&quot;;s:4:&quot;cost&quot;;s:7:&quot;111.000&quot;;s:8:&quot;mktprice&quot;;s:6:&quot;99.000&quot;;s:8:&quot;goods_id&quot;;i:2;s:4:&quot;name&quot;;s:18:&quot;玉泉寺儿童票&quot;;}}',1572519982,'ed79914ea512d38bc1bbb9d7199a3af0',0,'0',0,'0');

/*!40000 ALTER TABLE `se_order` ENABLE KEYS */;
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



# Dump of table se_order_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_cart`;

CREATE TABLE `se_order_cart` (
  `cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `total_price` varchar(20) NOT NULL DEFAULT '' COMMENT ' 总价',
  `addtime` int(11) NOT NULL,
  `adduser` char(32) NOT NULL DEFAULT '' COMMENT '会员ident',
  `uptime` int(11) DEFAULT '0',
  `upuser` char(32) DEFAULT '0',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';



# Dump of table se_order_cart_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_cart_item`;

CREATE TABLE `se_order_cart_item` (
  `cart_id` int(11) unsigned NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_params` longtext NOT NULL COMMENT 'json商品是数据',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` varchar(11) NOT NULL DEFAULT '' COMMENT '单价',
  `nun` int(11) NOT NULL COMMENT '数量',
  `addtime` int(11) NOT NULL COMMENT '新增时间',
  `uptime` int(11) DEFAULT '0' COMMENT '更新时间',
  `deltime` int(11) DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车对应的详细商品数据';



# Dump of table se_order_check_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_check_log`;

CREATE TABLE `se_order_check_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT '0' COMMENT '订单ID',
  `type` tinyint(1) NOT NULL,
  `check_str` varchar(128) NOT NULL DEFAULT '' COMMENT '核销编码',
  `status` tinyint(1) unsigned zerofill NOT NULL COMMENT '1成功2失败',
  `request_data` text COMMENT '请求参数',
  `addip` varchar(20) NOT NULL DEFAULT '',
  `addtime` int(11) NOT NULL,
  `adduser` int(11) DEFAULT '0',
  `deltime` int(11) DEFAULT '0',
  `deluser` char(32) DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_order_check_log` WRITE;
/*!40000 ALTER TABLE `se_order_check_log` DISABLE KEYS */;

INSERT INTO `se_order_check_log` (`log_id`, `order_id`, `type`, `check_str`, `status`, `request_data`, `addip`, `addtime`, `adduser`, `deltime`, `deluser`)
VALUES
	(3,0,0,'dsjflajsdlkasdfa',2,'{&quot;qrcode_str&quot;:&quot;dsjflajsdlkasdfa&quot;,&quot;type&quot;:&quot;app&quot;}','127.0.0.1',1573639244,1,0,'0');

/*!40000 ALTER TABLE `se_order_check_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_items`;

CREATE TABLE `se_order_items` (
  `item_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单明细ID',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `goods_params` longtext NOT NULL COMMENT '订单对应的商品json数据',
  `goods_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `type_id` mediumint(8) unsigned DEFAULT NULL COMMENT '商品类型ID',
  `bn` varchar(40) DEFAULT NULL COMMENT '明细商品的品牌名',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '明细商品的名称',
  `cost` decimal(20,3) DEFAULT NULL COMMENT '明细商品的成本',
  `price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '明细商品的销售价(购入价)',
  `currency` varchar(20) NOT NULL DEFAULT '' COMMENT '币种',
  `g_price` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '明细商品的会员价原价',
  `amount` decimal(20,3) DEFAULT NULL COMMENT '明细商品总额',
  `score` mediumint(8) unsigned DEFAULT NULL COMMENT '明细商品积分',
  `weight` mediumint(8) unsigned DEFAULT NULL COMMENT '明细商品重量',
  `nums` float NOT NULL DEFAULT '1' COMMENT '明细商品购买数量',
  `sendnum` float NOT NULL DEFAULT '0' COMMENT '明细商品发货数量',
  `addon` longtext COMMENT '明细商品的规格属性',
  `addtime` int(11) NOT NULL,
  `adduser` char(32) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `upuser` char(32) DEFAULT '0',
  `deltime` int(11) DEFAULT '0',
  `deluser` char(32) DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `ind_item_bn` (`bn`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';

LOCK TABLES `se_order_items` WRITE;
/*!40000 ALTER TABLE `se_order_items` DISABLE KEYS */;

INSERT INTO `se_order_items` (`item_id`, `order_id`, `goods_params`, `goods_id`, `type_id`, `bn`, `goods_name`, `cost`, `price`, `currency`, `g_price`, `amount`, `score`, `weight`, `nums`, `sendnum`, `addon`, `addtime`, `adduser`, `uptime`, `upuser`, `deltime`, `deluser`)
VALUES
	(4,1572519982916717890,'a:37:{s:8:\"goods_id\";i:2;s:8:\"goods_sn\";s:12:\"191023130251\";s:4:\"name\";s:18:\"玉泉寺儿童票\";s:5:\"price\";s:6:\"96.000\";s:8:\"currency\";s:3:\"CNY\";s:7:\"type_id\";i:0;s:7:\"cate_id\";i:0;s:8:\"brand_id\";i:0;s:10:\"marketable\";s:1:\"1\";s:5:\"store\";i:999999;s:10:\"notify_num\";i:0;s:8:\"downtime\";N;s:11:\"last_modify\";N;s:7:\"p_order\";i:22;s:7:\"d_order\";i:30;s:5:\"score\";i:22;s:4:\"cost\";s:7:\"111.000\";s:8:\"mktprice\";s:6:\"99.000\";s:6:\"weight\";s:5:\"0.000\";s:4:\"unit\";s:3:\"张\";s:5:\"brief\";s:42:\"千年古刹，玉泉山下，铁塔地宫\";s:16:\"image_default_id\";a:4:{i:0;s:135:\"http://sephp.a.com/upload/image/http://sephp.a.com/upload/image/http://sephp.a.com/upload/image/55/e8f37adc5a222fd8c3a954738ca5c468.jpg\";i:1;s:135:\"http://sephp.a.com/upload/image/http://sephp.a.com/upload/image/http://sephp.a.com/upload/image/45/4a083e9fed9721327f545b12d117b8f1.jpg\";i:2;s:135:\"http://sephp.a.com/upload/image/http://sephp.a.com/upload/image/http://sephp.a.com/upload/image/58/7c10d0cab1e0922fd44ff1a131d4963f.jpg\";i:3;s:135:\"http://sephp.a.com/upload/image/http://sephp.a.com/upload/image/http://sephp.a.com/upload/image/40/618e6d0cb2b6b1cf0225835f87928386.jpg\";}s:9:\"small_pic\";s:0:\"\";s:7:\"big_pic\";s:0:\"\";s:5:\"intro\";s:3105:\"<p>做php开发中，如果遇到自己不能修改服务器的相关配置也不能知道服务器某些功能是否开启的情况下，直接使用某些特殊的函数会导致程序报错，比如curl_init这种系统函数。当服务器未开启curl相关服务的时候，直接使用curl系列函数会报Call to undefined function curl_init()......这样的错误。</p>\r\n<p>那么对于出现这种情况该如何办呢？很多事情不只是有一种办法的，如果某些方法不行，我们还可以使用另外的方法。这里我们就需要涉及到判断某个方法是否存在的问题了，如果存在该方法则使用该方法，如果不存在该方法则使用另外的方法。</p>\r\n<p>这里对于如何判断一个函数，类以及类中的方法是否存在做了一个整理：</p>\r\n<p><strong>（1）php判断系统函数或自己写的函数是否存在</strong></p>\r\n<p>bool function_exists ( string $function_name ) 判断函数是否已经定义，例如：</p>\r\n<table><tbody><tr><td><code>1</code></td><td><code>if</code><code>(function_exists(</code><code>&#039;curl_init&#039;</code><code>)){</code></td></tr></tbody></table>\r\n<table><tbody><tr><td><code>2</code></td><td>    <code>curl_init();</code></td></tr></tbody></table>\r\n<table><tbody><tr><td><code>3</code></td><td><code>}</code><code>else</code><code>{</code></td></tr></tbody></table>\r\n<table><tbody><tr><td><code>4</code></td><td>    <code>echo</code>&nbsp;<code>&#039;not function curl_init&#039;</code><code>;</code></td></tr></tbody></table>\r\n<table><tbody><tr><td><code>5</code></td><td><code>}</code></td></tr></tbody></table>\r\n<p><strong>（2）php判断类是否存在</strong></p>\r\n<p>bool class_exists ( string $class_name [, bool $autoload = true ] ) 检查一个类是否已经定义，一定以返回true，否则返回false，例如：</p>\r\n<table><tbody><tr><td><code>1</code></td><td><code>if</code><code>(</code><code>class_exists</code><code>(</code><code>&#039;MySQL&#039;</code><code>)){</code></td></tr></tbody></table>\r\n<table><tbody><tr><td><code>2</code></td><td>    <code>$myclass</code><code>=</code><code>new</code>&nbsp;<code>MySQL();</code></td></tr></tbody></table>\r\n<table><tbody><tr><td><code>3</code></td><td><code>}</code></td></tr></tbody></table>\r\n<p><strong>（3）php判断类里面的某个方法是否已经定义</strong></p>\r\n<p>bool method_exists ( mixed $object , string $method_name ) 检查类的方法是否存在，例如：</p>\r\n<table><tbody><tr><td><code>1</code></td><td><code>$directory</code><code>=</code><code>new</code>&nbsp;<code>Directory;</code></td></tr></tbody></table>\r\n<table><tbody><tr><td><code>2</code></td><td><code>if</code><code>(!method_exists(</code><code>$directory</code><code>,</code><code>&#039;read&#039;</code><code>)){</code></td></tr></tbody></table>\r\n<table><tbody><tr><td><code>3</code></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<code>echo</code>&nbsp;<code>&#039;未定义read方法！&#039;</code><code>;</code></td></tr></tbody></table>\r\n<table><tbody><tr><td><code>4</code></td><td><code>}</code></td></tr></tbody></table>\";s:11:\"store_place\";s:1:\"0\";s:7:\"min_buy\";i:0;s:12:\"nostore_sell\";s:1:\"1\";s:13:\"goods_setting\";s:0:\"\";s:14:\"comments_count\";i:22;s:10:\"view_count\";i:22;s:9:\"buy_count\";i:1;s:7:\"addtime\";i:1571835771;s:7:\"adduser\";s:1:\"1\";s:6:\"uptime\";i:0;s:6:\"upuser\";s:1:\"0\";s:15:\"show_marketable\";s:6:\"上架\";}',2,NULL,NULL,'玉泉寺儿童票',111.000,96.000,'CNY',0.000,96.000,NULL,NULL,1,0,NULL,1572519982,'ed79914ea512d38bc1bbb9d7199a3af0',1572519982,'ed79914ea512d38bc1bbb9d7199a3af0',0,'0');

/*!40000 ALTER TABLE `se_order_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_order_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_order_log`;

CREATE TABLE `se_order_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单日志ID',
  `rel_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对象ID',
  `op_type` enum('order','recharge','joinfee','prepaid_recharge') NOT NULL DEFAULT 'order' COMMENT '操作方式',
  `behavior` enum('creates','updates','payments','refunds','delivery','reship','finish','cancel') NOT NULL DEFAULT 'payments' COMMENT '日志记录操作的行为',
  `result` enum('SUCCESS','FAILURE') NOT NULL COMMENT '日志结果',
  `log_text` longtext COMMENT '操作内容',
  `addon` longtext COMMENT '序列化数据',
  `addname` varchar(100) DEFAULT 'null' COMMENT '操作人名称',
  `addtime` int(10) unsigned DEFAULT '0' COMMENT '操作时间',
  `adduser` char(32) DEFAULT '0' COMMENT '操作员ID',
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
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '下单时间',
  `adduser` int(11) DEFAULT NULL,
  `uptime` int(11) DEFAULT NULL,
  `upuser` int(11) DEFAULT NULL,
  `deltime` int(11) DEFAULT NULL,
  `deluser` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `ind_ship_status` (`ship_status`),
  KEY `ind_pay_status` (`pay_status`),
  KEY `ind_status` (`status`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_last_modified` (`last_modified`),
  KEY `ind_createtime` (`createtime`),
  KEY `idx_order_refer` (`order_refer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';



# Dump of table se_parking_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_parking_log`;

CREATE TABLE `se_parking_log` (
  `parking_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '停车记录ID',
  `member_id` char(32) DEFAULT '' COMMENT '所属停车场会员ID',
  `car_num` varchar(100) NOT NULL DEFAULT '' COMMENT '车牌号',
  `come_in_time` int(11) NOT NULL COMMENT '进入时间',
  `come_out_time` int(11) DEFAULT '0' COMMENT '出去时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '1激活，2已完成',
  `amount` decimal(8,3) DEFAULT '0.000' COMMENT '消费金额',
  `amount_formula` varchar(200) DEFAULT NULL COMMENT '消费总金额公式',
  `parking_id` int(11) NOT NULL COMMENT '停车场ID',
  `addtime` int(11) NOT NULL,
  `adduser` char(32) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `upuser` char(32) DEFAULT '0',
  `deltime` int(11) DEFAULT '0',
  `deluser` char(32) DEFAULT '0',
  PRIMARY KEY (`parking_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='停车记录';



# Dump of table se_parking_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_parking_setting`;

CREATE TABLE `se_parking_setting` (
  `parking_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '停车场ID',
  `member_id` char(32) NOT NULL DEFAULT '' COMMENT '停车场所属人',
  `parking_name` varchar(200) DEFAULT NULL COMMENT '停车场名称',
  `pay_type` tinyint(1) NOT NULL COMMENT '收费方式',
  `max_amount` decimal(8,3) DEFAULT '0.000' COMMENT '最高费用',
  `min_amount` decimal(8,3) DEFAULT '0.000' COMMENT '最低费用',
  `hour_money` decimal(8,3) DEFAULT '0.000' COMMENT '每小时多少钱',
  `status` tinyint(1) DEFAULT '1' COMMENT '1启用2禁用',
  `addtime` int(11) NOT NULL,
  `adduser` char(32) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `upuser` char(32) DEFAULT '0',
  `deltime` int(11) DEFAULT '0',
  `deluser` char(32) DEFAULT '0',
  PRIMARY KEY (`parking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='停车场设置';



# Dump of table se_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_payments`;

CREATE TABLE `se_payments` (
  `payment_id` varchar(20) NOT NULL DEFAULT '' COMMENT '支付单号',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '支付金额',
  `cur_money` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '支付货币金额',
  `member_id` varchar(100) DEFAULT NULL COMMENT '会员用户名',
  `status` enum('succ','failed','cancel','error','invalid','progress','timeout','ready') NOT NULL DEFAULT 'ready' COMMENT '支付状态',
  `pay_name` varchar(100) DEFAULT NULL COMMENT '支付描述名称',
  `pay_type` enum('online','offline','deposit') NOT NULL DEFAULT 'online' COMMENT '支付类型',
  `t_payed` int(10) unsigned DEFAULT '0' COMMENT '支付完成时间',
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
  `addtime` int(11) NOT NULL,
  `adduser` char(32) NOT NULL DEFAULT '',
  `uptime` int(11) DEFAULT '0',
  `upuser` char(32) DEFAULT '0',
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
