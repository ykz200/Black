#
# SQL Export
# Created by Querious (1072)
# Created: 17 December 2017 at 23:53:09 GMT+8
# Encoding: Unicode (UTF-8)
#


DROP DATABASE IF EXISTS `blacklist_test`;
CREATE DATABASE `blacklist_test` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
USE `blacklist_test`;




SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(128) DEFAULT ' ',
  `companyName` varchar(128) DEFAULT ' ',
  `enable` varchar(1) DEFAULT 'Y',
  `remarks` varchar(300) DEFAULT '单位性质培训 信息来源网络',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) DEFAULT NULL COMMENT '申请邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8;


CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_value` varchar(200) CHARACTER SET latin1 DEFAULT NULL COMMENT 'key value 秘钥值',
  `key_type` int(11) DEFAULT '0' COMMENT 'key_type key的类型\n	1、对接黑名单接口',
  `key_remark` varchar(500) CHARACTER SET latin1 DEFAULT NULL COMMENT '备注',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'key创建时间',
  `stop_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '停止时间 有效期',
  `enable` varchar(1) CHARACTER SET latin1 DEFAULT 'Y' COMMENT 'Y 即为可用 N 则反之',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='key秘钥库';


CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT ' ',
  `enable` varchar(128) DEFAULT 'Y',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(128) DEFAULT NULL,
  `pageValue` varchar(5000) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `enable` varchar(128) DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


LOCK TABLES `info` WRITE;
ALTER TABLE `info` DISABLE KEYS;
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`, `email`) VALUES (1,'北京市海淀区苏州街55号名商大厦3楼	','北京汇瑞安网络科技有限公司','Y','单位性质培训 信息来源网络','2017-11-22 19:02:51',NULL);
ALTER TABLE `info` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `keys` WRITE;
ALTER TABLE `keys` DISABLE KEYS;
INSERT INTO `keys` (`id`, `key_value`, `key_type`, `key_remark`, `create_date`, `stop_date`, `enable`) VALUES (1,'186B3CBB13BCCFB485838AF8AA3248',0,'1','2017-11-26 01:09:32','0000-00-00 00:00:00','Y');
ALTER TABLE `keys` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `notice` WRITE;
ALTER TABLE `notice` DISABLE KEYS;
INSERT INTO `notice` (`id`, `title`, `enable`, `createDate`, `content`) VALUES (13,'【壳叔极力推荐】我在北京一家公司打工两个月，昨夜露宿街头','Y','2017-11-14 15:06:33','<p><br/>我在北京一家公司打工两个月，昨夜露宿街头</p>\n\n<p>壳叔极力推荐选择公司之前阅读文章</p>\n\n<p><b>\n<a href="https://juejin.im/post/5a0918856fb9a044fe45dacc">https://juejin.im/post/5a0918856fb9a044fe45dacc</a></b></p>');
ALTER TABLE `notice` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `page` WRITE;
ALTER TABLE `page` DISABLE KEYS;
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (1,'js_index','<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");\ndocument.write(unescape("%3Cspan id=\'cnzz_stat_icon_1262757961\'%3E%3C/span%3E%3Cscript src=\'" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1262757961%26show%3Dpic1\' type=\'text/javascript\'%3E%3C/script%3E"));</script>\n\n<script>\n(function(){\n    var bp = document.createElement(\'script\');\n    var curProtocol = window.location.protocol.split(\':\')[0];\n    if (curProtocol === \'https\') {\n        bp.src = \'https://zz.bdstatic.com/linksubmit/push.js\';        \n    }\n    else {\n        bp.src = \'http://push.zhanzhang.baidu.com/push.js\';\n    }\n    var s = document.getElementsByTagName("script")[0];\n    s.parentNode.insertBefore(bp, s);\n})();\n</script>\n\n\n\n\n\n ','pc端js动态添加','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (2,'js_map_index','<script>\n(function(){\n    var bp = document.createElement(\'script\');\n    var curProtocol = window.location.protocol.split(\':\')[0];\n    if (curProtocol === \'https\') {\n        bp.src = \'https://zz.bdstatic.com/linksubmit/push.js\';        \n    }\n    else {\n        bp.src = \'http://push.zhanzhang.baidu.com/push.js\';\n    }\n    var s = document.getElementsByTagName("script")[0];\n    s.parentNode.insertBefore(bp, s);\n})();\n</script>\n\n','移动端js动态添加','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (3,'head_index',' ','pc端index 页面<head></head>之间内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (4,'head_map_index',' ','移动端index 页面<head></head>之间内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (5,'footer_pc','© Copyright 2017 北京IT黑名单 Inc.All Rights Reserved. <a href="http://www.miitbeian.gov.cn"></a>\n\n','pc端尾部内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (6,'footer_map','© Copyright 2017 北京IT黑名单 Inc.All Rights Reserved.\n<script src="https://s22.cnzz.com/z_stat.php?id=1262757961&web_id=1262757961" language="JavaScript"></script>\n','移动端尾部内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (7,'header_index','<!--<span>如果有未收录的黑企信息，请将企业信息的以邮件的方式发送至\n    <a href="mailto:keshu@bhusk.com">keshu@bhusk.com</a>\n如使用过程中有问题请及时邮件反馈沟通，我们将尽快修复。</span>\n<br/><br/><br/><span style="color:red">公告功能上线:<a href="http://black.bhusk.com/notice">点击我看花样公告</a> -->','PC端主页头部提示内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (8,'header_map_index','<span>如果有未收录的黑企信息，请将企业信息的以邮件的方式发送至\n    <a href="mailto:keshu@bhusk.com">keshu@bhusk.com</a>\n使用过程中有问题请及时邮件反馈沟通，我们将尽快修复。\n<br/><span style="color:red">公告功能上线:<a href="http://black.bhusk.com/notice">点击我看花样公告</a> \n<span style="color:#fff">\n<a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=25b503daf8d907bcb7cbcecd2ee512ef6cad4bd31f048bea7b0103a17397cf7a">官方 QQ群：200408242</a>\n</span>','移动端主页头部提示内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (9,'site_title','IT黑名单-精准查询it黑企业','网站标题','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (10,'keywords','IT黑名单,北京IT黑名单,黑企业,北京黑企业,北京IT黑企业,black.bhusk.com','关键字','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (11,'description','IT黑名单(http://black.bhusk.com)，全网最精准查询IT黑企业，保护自身利益，避免受到恶意敲诈勒索！\n北京IT企业黑名单为公益网站，精准抓取IT黑企业数据，让求职之路更加顺畅，开心无烦恼，只为你安心。black.bhusk.com  ','网站描述','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (12,'js_notice','<script>\n(function(){\n    var bp = document.createElement(\'script\');\n    var curProtocol = window.location.protocol.split(\':\')[0];\n    if (curProtocol === \'https\') {\n        bp.src = \'https://zz.bdstatic.com/linksubmit/push.js\';        \n    }\n    else {\n        bp.src = \'http://push.zhanzhang.baidu.com/push.js\';\n    }\n    var s = document.getElementsByTagName("script")[0];\n    s.parentNode.insertBefore(bp, s);\n})();\n</script>','公告页面js','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (13,'head_notice',NULL,'公告页面<HEAD></HEAD>之间内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (14,'footer_notice','<span style="\n    color: black;\n">© Copyright 2017 北京IT黑名单 Inc.All Rights Reserved. </span>\n<script src="https://s22.cnzz.com/z_stat.php?id=1262757961&web_id=1262757961" language="JavaScript"></script>\n','公告页面尾部内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (15,'header_notice','我们的目的很明显,只是为了竭尽我们的力量去帮助我们能够帮助的同伴 - <a href="http://www.bhusk.com">黑壳网</a>','公告页面头部提示内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (16,'head_advertising_index_pc',' ','广告pc端index页面头部','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (17,'footer_advertising_index_pc','<!--\n  <script src="http://wm.lrswl.com/page/s.php?s=244089&w=950&h=90"></script>\n<script src="http://wm.lrswl.com/page/s.php?s=244085&w=950&h=150"></script>\n-->','广告pc端index页面尾部','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (18,'head_advertising_index_map','<!--<script src=\'http://veim.lrswl.com/s.php?id=5403\'></script>-->\n<script src=\'http://veim.lrswl.com/s.php?id=5404\'></script>','广告移动端index页面头部','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (19,'footer_advertising_index_map','<script src=\'http://veim.lrswl.com/s.php?id=5402\'></script>\n<script src=\'http://veim.lrswl.com/s.php?id=5929\'></script>','广告移动端index页面尾部','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (20,'site_title_notice','公告栏-IT黑名单-精准查询it黑企业','公告标题','Y');
ALTER TABLE `page` ENABLE KEYS;
UNLOCK TABLES;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


