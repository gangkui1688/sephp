# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.01 (MySQL 5.7.20-log)
# Database: sephp
# Generation Time: 2018-09-19 11:09:37 +0000
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
	(1,'将垃圾筐据了解卡结算的阿里结束','statusstatusstatus',1535536245,1,'[\"?ct=system&ac=menus\",\"?ct=admin&ac=userlist\",\"?ct=system&ac=file_manager\",\"?ct=system&ac=baise_config\",\"?ct=system&ac=menus\",\"?ct=system&ac=menus\",\"?ct=system&ac=menus\",\"?ct=system&ac=menus\",\"stroeCenter\",\"?ct=stroe&ac=index\",\"?ct=stroe&ac=catelist\",\"?ct=stroe&ac=catelist\",\"stroeCenter\",\"?ct=stroe&ac=index\",\"?ct=stroe&ac=catelist\",\"productManager\",\"?ct=product&ac=index\",\"?ct=product&ac=catelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"?ct=product&ac=labelist\",\"orderCenter\",\"?ct=order&ac=index\",\"printerCenter\",\"?ct=printer&ac=index\",\"?ct=printer&ac=faillist\"]',1),
	(2,'超级管理员','事实上',1535536292,1,'null',1),
	(3,'测试一组','发送到发',1536742381,1,NULL,1),
	(4,'信息补全组','嘻嘻不足',1536744469,1,NULL,1),
	(5,'后勤开发','发送到发送',1536745043,1,NULL,1);

/*!40000 ALTER TABLE `se_admin_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_admin_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_admin_user`;

CREATE TABLE `se_admin_user` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `sex` tinyint(1) DEFAULT NULL COMMENT '1男2女',
  `email` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常2禁用',
  `realname` varchar(100) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_admin_user` WRITE;
/*!40000 ALTER TABLE `se_admin_user` DISABLE KEYS */;

INSERT INTO `se_admin_user` (`admin_id`, `group_id`, `username`, `password`, `sex`, `email`, `status`, `realname`, `remark`, `create_time`)
VALUES
	(1,0,'admin','7fef6171469e80d32c0559f88b377245',1,'admin@admin.com',1,NULL,'',NULL),
	(2,0,'admi12312','88eefa138a5584a45b6790cf2c4fbd67',1,'admin@admin.com',2,NULL,'',NULL),
	(3,0,'dasdfasfdasd','2236495fe9bf433cf70949790ef20841',1,'sdfasdfasdf',2,NULL,'',NULL),
	(4,0,'fasdfasd','06c4aed327920fd83a81e624b37fb9e3',1,'fasdfas',2,NULL,'',NULL),
	(5,0,'1231','7815696ecbf1c96e6894b779456d330e',1,'asdasd',2,NULL,'',NULL),
	(6,0,'sdfas','22ca8686bfa31a2ae5f55a7f60009e14',1,'asdfasd',2,NULL,'',NULL),
	(7,0,'123123','6e8f17a1cd2fd963d5843aca794e2287',1,'fasdfas',1,NULL,'',NULL),
	(8,0,'asdfasdf','711613d7c7b6fa6952320096dcae8ee7',1,'fafasdf',1,NULL,'',NULL),
	(9,0,'12eqeqw','124d80be7ba5020c80f26f2ffc0c1ed4',1,'',1,NULL,'',NULL),
	(10,NULL,'21232f297a57a5a743894a0e4a801fc3','',NULL,'07bb6b621d589e69100a84fdbe7df6a8',2,NULL,'89e6d2b383471fc370d828e552c19e65',1535528162),
	(11,NULL,'sdfa','21232f297a57a5a743894a0e4a801fc3',NULL,'asd@adm.com',2,NULL,'sd',1535528791),
	(12,NULL,'','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,1,NULL,NULL,NULL),
	(13,NULL,'gangkui','7fef6171469e80d32c0559f88b377245',NULL,'admin@admin.com',1,'发送到发送','fghjkl;&#039;;lkjhgfdsdfghjop\r\n&#039;p;ldfsafghjkl;&#039;&#039;\r\n',1536739662);

/*!40000 ALTER TABLE `se_admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_config`;

CREATE TABLE `se_config` (
  `key` varchar(300) NOT NULL DEFAULT '',
  `value` text,
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

LOCK TABLES `se_config` WRITE;
/*!40000 ALTER TABLE `se_config` DISABLE KEYS */;

INSERT INTO `se_config` (`key`, `value`)
VALUES
	('base_config','{\"page_title\":\"你在找我吗\",\"page_keywords\":\"找人，找钱，找项目，找场地。\",\"page_description\":\"么有什么好说都 \",\"count_code\":\"&lt;script&gt;console.log(12312312312)&lt;/script&gt;\",\"icp_name\":\"ICP-浙KSKJ6789YYUI234\",\"company_address\":\"你猜\",\"contact_number\":\"不告诉你\",\"qq_number\":\"\"}'),
	('friend_link','[{\"sort_id\":\"87\",\"title\":\"dfasdfasdfasd\",\"url\":\"sdfasdfasdfas\",\"status\":\"2\"},{\"sort_id\":\"43\",\"title\":\"sdfasdfasd\",\"url\":\"sdfasdfasdf\",\"status\":\"1\"},{\"sort_id\":\"11\",\"title\":\"123123123\",\"url\":\"sdasdfasdfasdf\",\"status\":\"1\"},{\"sort_id\":\"3\",\"title\":\"sfdasd\",\"url\":\"fasdfasdfa\",\"status\":\"2\"}]');

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
  `text` longtext COMMENT '文章内容',
  `create_time` int(10) unsigned NOT NULL,
  `create_user` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned DEFAULT '0',
  `update_user` int(10) unsigned DEFAULT '0',
  `delete_user` int(10) unsigned DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
	(1,'每日推荐',4,2,'0',1,1,'',1,1537001111,'据了解阿莱克斯简单快乐发送','说到发送到发送的',1,2),
	(2,'日常妙招',1,1,'0-1',2,1,NULL,1,1537003308,'sssssssfasdfasdfasd','实打实分',1,2),
	(3,'产品发布',0,1,'0',1,1,NULL,1,1537003355,'新产品','是否',1,1),
	(4,'电子产品',3,1,'0-3',2,1,NULL,1,1537003373,'阿斯顿发送到','',1,0),
	(5,'可以试试',2,1,'0-1-2',3,1,NULL,1,1537003919,'回家看了就好看就好','',1,0),
	(6,'一起健身',2,1,'0-1-2',3,1,NULL,1,1537008693,'收到发发撒的发','阿斯顿发',1,0),
	(7,'技术跟新',1,2,'0-1',2,1,NULL,1,1537008710,'a s d f s d f','dsfasdfasd是发送到发dfasdfasdf',1,0),
	(8,'花边娱乐',0,1,'0',1,1,NULL,1,1537009126,'可节省空间','就会快乐JKL;LKJHKL;',100,1),
	(9,'找鸭子',8,1,'0-8',2,1,NULL,1,1537009151,'','',2,0);

/*!40000 ALTER TABLE `se_content_cate` ENABLE KEYS */;
UNLOCK TABLES;


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
	(29,'IMG_0002.jpg','948305340598886401985.jpg',1,17146,'image/jpeg',0,1537345361,1,1,1537350888);

/*!40000 ALTER TABLE `se_file` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_file_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_file_label`;

CREATE TABLE `se_file_label` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
