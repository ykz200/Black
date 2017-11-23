#
# SQL Export
# Created by Querious (1072)
# Created: 23 November 2017 at 08:36:55 GMT+8
# Encoding: Unicode (UTF-8)
#


DROP DATABASE IF EXISTS `blacklist_test`;
CREATE DATABASE `blacklist_test` DEFAULT CHARACTER SET latin1 DEFAULT COLLATE latin1_swedish_ci;
USE `blacklist_test`;




SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(128) DEFAULT ' ',
  `companyName` varchar(128) DEFAULT ' ',
  `enable` varchar(1) DEFAULT 'Y',
  `remarks` varchar(500) DEFAULT '单位性质培训 信息来源网络',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8;


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


CREATE TABLE `ssvpn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line` varchar(128) DEFAULT NULL,
  `serverIp` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `encryption` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `user_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `usertype` varchar(2) DEFAULT NULL COMMENT '用户类型',
  `enabled` int(2) DEFAULT NULL COMMENT '是否可用',
  `realname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `qq` varchar(14) DEFAULT NULL COMMENT 'QQ',
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户信息表';




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


LOCK TABLES `info` WRITE;
ALTER TABLE `info` DISABLE KEYS;
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (1,'北京市海淀区苏州街55号名商大厦3楼	','北京汇瑞安网络科技有限公司','Y','单位性质培训 信息来源网络','2017-11-22 19:02:51');
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (2,'北京市海淀区苏州街55号名商大厦3层','天瑞地安网络科技有限公司北京分公司','Y','单位性质培训 信息来源网络','2017-11-22 19:02:51');
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (3,'北京市海淀区苏州街55号名商大厦3层	','北京嘉惠卓通科技有限公司	','Y','单位性质培训 信息来源网络','2017-11-22 19:02:51');
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (4,'北京市海淀区苏州街55号名商大厦3层	','北京瑞丰时代网络科技有限公司	','Y','单位性质培训 信息来源网络','2017-11-22 19:02:51');
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (5,'北京市海淀区苏州街55号名商大厦3层	','北京天利瑞安科技有限公司	','Y','单位性质培训 信息来源网络','2017-11-22 19:02:51');
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (6,'北京市海淀区善缘街1号4层2-325	','北京瑞通合力科技有限公司	','Y','单位性质培训 信息来源网络','2017-11-22 19:02:51');
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (286,' ','黑龙江滨才学院','Y','网络黑名单 信息来源网络','2017-11-22 19:02:51');
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (304,'北京市昌平区生命科学园珠江摩尔大厦6号楼2单元701室','北京睿一科技有限公司','Y','单位性质培训 信息来源网络','2017-11-22 19:02:51');
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (319,'北京市昌平区霍营街道黄平路和龙锦三街交叉口驿府商务酒店隔壁社区服务中心3楼','北京独创时代','Y','单位性质培训','2017-11-22 19:02:51');
INSERT INTO `info` (`id`, `position`, `companyName`, `enable`, `remarks`, `create_date`) VALUES (384,'北京市海淀区上地东路1号盈创动力五层','北京华胜龙腾软件技术有限公司','Y','这家公司合同、社保找第三方（智联等）签订，长期拖欠离职、在职员工薪资，欠所有离职员工最少十几万，在职员工大部分时间每月只能发1700左右。内部使用的IBM Lotus软件没有经过授权，普加甘特图等也是破解的。老板吴亚群，电话18910360249。欠我1w左右薪资，拖欠了2年多，还没有还清。我电话18721937934，有任何虚假信息，欢迎骚扰！','2017-11-22 19:02:51');
ALTER TABLE `info` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `notice` WRITE;
ALTER TABLE `notice` DISABLE KEYS;
INSERT INTO `notice` (`id`, `title`, `enable`, `createDate`, `content`) VALUES (1,'IT黑目录第一篇公告','Y','2017-07-17 17:04:44','<h1>创建网站的第一感</h1>\n\n<p>在面试的这几天感觉当中，我感觉到了前所未有的困难。\n投出去的简历，回馈给我的却是十几家培训机构。\n这让我前所未有的恐惧，太可怕了。</p>\n\n<p>我心一想是不是所有IT新人都像我一样，找工作的阻挠都是这么多。</p>\n\n<p>我就每晚抽出一点时间，来做一个IT黑企的查询系统，数据来源网络。</p>\n\n<p>我开心我高兴至少付出是有回报的，既方便了我，也方便了大家。</p>\n\n<h3>为了方便交流</h3>\n\n<p>壳叔特此开放黑壳的交流群 <u>200408242</u> <b>OR</b> <a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=12017874d1dc78885dcad2e7e92e11174831d3cbc6d128e8be057eb828466f3a"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="黑壳网技术交流" title="黑壳网技术交流"></a>\n用来反馈网站使用过程中产生的问题，并且大家都是程序员也可以方便沟通。</p>');
INSERT INTO `notice` (`id`, `title`, `enable`, `createDate`, `content`) VALUES (11,'IT黑名单App V1.2版本发布','Y','2017-07-18 22:14:26','<h1>下载地址</h1>\n \n<p>下载地址 <a href="http://download.bhusk.com/ITBlackList_V1.2.apk" target="_blank">IT黑名单V1.2.apk</a>\n \n<br/>备用：<a href="https://bhusk99.ctfile.com/fs/12729178-212306412" target="_blank">IT黑名单V1.2.apk</a><br/></p>\n <br/><span>注：V1.0版本无法下载请浏览器打开</span>\n<br/>http://t.im/1f62y 进行版本更新\n<p><br/>更新内容\n<br/>1、修复邮箱链接无法分享问题。\n<br/>2、修复返回直接退出app。\n<br/>3、修复文件下载问题。\n<br/>4、修复无法调用QQ问题。\n<br/>5、修复诸多代码细节问题。');
INSERT INTO `notice` (`id`, `title`, `enable`, `createDate`, `content`) VALUES (12,'IT黑名单网站代码GitHub开源','Y','2017-08-03 17:33:29','<p><br/>为了网站更加开源-已将代码上传。</p>\n\n<p>开源目的，你想改咋改~</p>\n\n<p><b>\n<a href="https://github.com/ykz200/Black">Github:https://github.com/ykz200/Black</a></b></p>');
INSERT INTO `notice` (`id`, `title`, `enable`, `createDate`, `content`) VALUES (13,'【壳叔极力推荐】我在北京一家公司打工两个月，昨夜露宿街头','Y','2017-11-14 15:06:33','<p><br/>我在北京一家公司打工两个月，昨夜露宿街头</p>\n\n<p>壳叔极力推荐选择公司之前阅读文章</p>\n\n<p><b>\n<a href="https://juejin.im/post/5a0918856fb9a044fe45dacc">https://juejin.im/post/5a0918856fb9a044fe45dacc</a></b></p>');
ALTER TABLE `notice` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `page` WRITE;
ALTER TABLE `page` DISABLE KEYS;
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (1,'js_index','<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");\ndocument.write(unescape("%3Cspan id=\'cnzz_stat_icon_1262757961\'%3E%3C/span%3E%3Cscript src=\'" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1262757961%26show%3Dpic1\' type=\'text/javascript\'%3E%3C/script%3E"));</script>\n\n<script>\n(function(){\n    var bp = document.createElement(\'script\');\n    var curProtocol = window.location.protocol.split(\':\')[0];\n    if (curProtocol === \'https\') {\n        bp.src = \'https://zz.bdstatic.com/linksubmit/push.js\';        \n    }\n    else {\n        bp.src = \'http://push.zhanzhang.baidu.com/push.js\';\n    }\n    var s = document.getElementsByTagName("script")[0];\n    s.parentNode.insertBefore(bp, s);\n})();\n</script>\n\n\n\n\n\n ','pc端js动态添加','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (2,'js_map_index','<script>\n(function(){\n    var bp = document.createElement(\'script\');\n    var curProtocol = window.location.protocol.split(\':\')[0];\n    if (curProtocol === \'https\') {\n        bp.src = \'https://zz.bdstatic.com/linksubmit/push.js\';        \n    }\n    else {\n        bp.src = \'http://push.zhanzhang.baidu.com/push.js\';\n    }\n    var s = document.getElementsByTagName("script")[0];\n    s.parentNode.insertBefore(bp, s);\n})();\n</script>\n\n','移动端js动态添加','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (3,'head_index',' ','pc端index 页面<head></head>之间内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (4,'head_map_index',' ','移动端index 页面<head></head>之间内容','Y');
INSERT INTO `page` (`id`, `pageName`, `pageValue`, `remarks`, `enable`) VALUES (5,'footer_pc','© Copyright 2017 北京IT黑名单 Inc.All Rights Reserved. <a href="http://www.miitbeian.gov.cn">京ICP备17029987号-2</a>\n\n','pc端尾部内容','Y');
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


LOCK TABLES `ssvpn` WRITE;
ALTER TABLE `ssvpn` DISABLE KEYS;
ALTER TABLE `ssvpn` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `user_info` WRITE;
ALTER TABLE `user_info` DISABLE KEYS;
INSERT INTO `user_info` (`Id`, `username`, `password`, `usertype`, `enabled`, `realname`, `qq`, `email`, `tel`) VALUES (1,'test1','12345678','1',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_info` (`Id`, `username`, `password`, `usertype`, `enabled`, `realname`, `qq`, `email`, `tel`) VALUES (2,'test2','aaaa','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_info` (`Id`, `username`, `password`, `usertype`, `enabled`, `realname`, `qq`, `email`, `tel`) VALUES (3,'test3','bbbb','1',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_info` (`Id`, `username`, `password`, `usertype`, `enabled`, `realname`, `qq`, `email`, `tel`) VALUES (4,'test4','cccc','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user_info` (`Id`, `username`, `password`, `usertype`, `enabled`, `realname`, `qq`, `email`, `tel`) VALUES (5,'test5','dddd','1',NULL,NULL,NULL,NULL,NULL);
ALTER TABLE `user_info` ENABLE KEYS;
UNLOCK TABLES;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


