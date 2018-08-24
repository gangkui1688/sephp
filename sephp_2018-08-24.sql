# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.01 (MySQL 5.7.20-log)
# Database: sephp
# Generation Time: 2018-08-24 11:09:11 +0000
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
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  `nickname` varchar(100) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_admin_user` WRITE;
/*!40000 ALTER TABLE `se_admin_user` DISABLE KEYS */;

INSERT INTO `se_admin_user` (`admin_id`, `group_id`, `username`, `password`, `sex`, `email`, `status`, `nickname`, `remark`, `create_time`)
VALUES
	(1,0,'admin','7fef6171469e80d32c0559f88b377245',1,'admin@admin.com',1,NULL,'',NULL),
	(2,0,'admi12312','88eefa138a5584a45b6790cf2c4fbd67',1,'admin@admin.com',0,NULL,'',NULL),
	(3,0,'dasdfasfdasd','2236495fe9bf433cf70949790ef20841',1,'sdfasdfasdf',0,NULL,'',NULL),
	(4,0,'fasdfasd','06c4aed327920fd83a81e624b37fb9e3',1,'fasdfas',0,NULL,'',NULL),
	(5,0,'1231','7815696ecbf1c96e6894b779456d330e',1,'asdasd',0,NULL,'',NULL),
	(6,0,'sdfas','22ca8686bfa31a2ae5f55a7f60009e14',1,'asdfasd',0,NULL,'',NULL),
	(7,0,'123123','6e8f17a1cd2fd963d5843aca794e2287',1,'fasdfas',0,NULL,'',NULL),
	(8,0,'asdfasdf','711613d7c7b6fa6952320096dcae8ee7',1,'fafasdf',0,NULL,'',NULL),
	(9,0,'12eqeqw','124d80be7ba5020c80f26f2ffc0c1ed4',1,'',0,NULL,'',NULL);

/*!40000 ALTER TABLE `se_admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table se_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `se_config`;

CREATE TABLE `se_config` (
  `key` varchar(100) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `se_config` WRITE;
/*!40000 ALTER TABLE `se_config` DISABLE KEYS */;

INSERT INTO `se_config` (`key`, `value`)
VALUES
	('key_967351','z7s{z}8VM'),
	('menu','<menu>\r\n\r\n\r\n\r\n\r\n</meun>'),
	('name','root'),
	('pass','admin999');

/*!40000 ALTER TABLE `se_config` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
