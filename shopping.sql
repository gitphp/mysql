-- MySQL dump 10.13  Distrib 5.5.28, for Win32 (x86)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	5.5.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `es_admin`
--

DROP TABLE IF EXISTS `es_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_admin` (
  `u_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `u_username` varchar(16) NOT NULL COMMENT '用户名16位',
  `u_password` varchar(32) NOT NULL COMMENT 'md5加密',
  `u_nickname` varchar(16) DEFAULT '' COMMENT '昵称',
  `u_name` char(5) NOT NULL COMMENT '真实名字',
  `u_sex` char(1) DEFAULT '1' COMMENT '1=男 0=女',
  `u_email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `u_phone` char(11) DEFAULT NULL COMMENT '11位手机数字',
  `u_qq` char(12) DEFAULT NULL COMMENT '用户QQ',
  `u_addr` varchar(64) DEFAULT NULL COMMENT '用户地址',
  `u_portrait` varchar(128) DEFAULT '' COMMENT '用户头像path',
  `u_logintime` int(11) DEFAULT '0' COMMENT '最后一次登陆时间',
  `u_ip` char(15) DEFAULT '127.0.0.1' COMMENT '用户登录ip',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_username` (`u_username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_admin`
--

LOCK TABLES `es_admin` WRITE;
/*!40000 ALTER TABLE `es_admin` DISABLE KEYS */;
INSERT INTO `es_admin` VALUES (1,'a','0cc175b9c0f1b6a831c399e269772661','小母鸡','杨过','1','qq@qq.com','13888889999','123456','广东省深圳市福田区华强北28楼C4','uploads/thumbs/s_20150127165657qJcobp.jpg',1422586718,'127.0.0.1'),(2,'b','92eb5ffee6ae2fec3ad71c777531578f','小绵羊','郭靖','0','aaa@163.com','12345678900','234567','江西省广州市福田区中关村28楼C4','uploads/thumbs/s_20150127165647QGrXIF.jpg',1234567890,'192.168.1.1'),(3,'c','4a8a08f09d37b73795649038408b5f33','','cc','1','ccc','55555555555',NULL,'广东省广州市珠海市什么什么事','uploads/thumbs/s_20150127165722fHKGTV.jpg',1422342746,'127.0.0.1'),(4,'d','8277e0910d750195b448797616e091ad','','欧阳锋','1','sdfd@qq.com','18890903344',NULL,NULL,'',1422343226,'127.0.0.1'),(5,'e','e1671797c52e15f763380b45e841ec32','','西门庆','1','dsfs@sina.com','18900005555',NULL,NULL,'',1422343280,'127.0.0.1'),(6,'f','8fa14cdd754f91cc6554c9e71929cce7','','潘金莲','1','sdfdfs@souhu.com','17777777777',NULL,NULL,'',1422343312,'127.0.0.1'),(7,'g','b2f5ff47436671b6e533d8dc3614845d','','武大郎','1','sdfsdf@qq.com','1311111111',NULL,NULL,'',1422343340,'127.0.0.1'),(8,'h','2510c39011c5be704182423e3a695e91','','少女时代','1','sdfsdf@qq.com','1333333333',NULL,NULL,'',1422343392,'127.0.0.1'),(9,'','d41d8cd98f00b204e9800998ecf8427e','','','1','','',NULL,NULL,'',1422421964,'127.0.0.1');
/*!40000 ALTER TABLE `es_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_car`
--

DROP TABLE IF EXISTS `es_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_car` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `g_id` int(10) unsigned DEFAULT NULL COMMENT '产品的ID',
  `g_name` varchar(64) DEFAULT NULL COMMENT '产品名字',
  `g_thumb` varchar(128) DEFAULT '' COMMENT '产品缩略图',
  `c_num` int(10) unsigned DEFAULT NULL COMMENT '商品数量',
  `g_price` decimal(10,2) DEFAULT NULL COMMENT '产品单价',
  `c_total` decimal(10,2) DEFAULT NULL COMMENT '商品总价',
  `u_username` varchar(32) DEFAULT NULL COMMENT '用户登陆的用户名信息',
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `g_id` (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_car`
--

LOCK TABLES `es_car` WRITE;
/*!40000 ALTER TABLE `es_car` DISABLE KEYS */;
INSERT INTO `es_car` VALUES (1,2,'佳能700D单反相机','thumbs/s_20150127191143bjlQxH.jpg',1,5.00,5.00,'a'),(3,7,'Genius925纯银施华洛世奇水晶吊坠','thumbs/s_20150127191242xmahos.jpg',2,6.00,12.00,'a');
/*!40000 ALTER TABLE `es_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_category`
--

DROP TABLE IF EXISTS `es_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_category` (
  `c_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `c_name` varchar(16) NOT NULL COMMENT '商品分类名字',
  `c_parent_id` int(10) unsigned DEFAULT '0' COMMENT '父类id',
  `c_sort` tinyint(3) unsigned DEFAULT '100' COMMENT '商品排序',
  `c_desc` varchar(16) DEFAULT '' COMMENT '分类描述',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_category`
--

LOCK TABLES `es_category` WRITE;
/*!40000 ALTER TABLE `es_category` DISABLE KEYS */;
INSERT INTO `es_category` VALUES (1,'图书',0,100,'无描述'),(2,'htc手机',7,100,'无描述'),(3,'音乐',0,10,'无描述'),(4,'HTC_ONE8',2,10,'无描述'),(5,'《小兵漂流记》',1,10,'无描述'),(6,'小马过河',5,10,'无描述'),(7,'手机数码',0,88,'无描述'),(8,'《茶花女》',1,12,'无描述'),(9,'iphone手机',7,43,'无描述'),(10,'悲伤的秋千',9,43,'无描述'),(11,'服装',0,33,'无描述'),(12,'联想笔记本',13,13,'无描述'),(13,'电脑办公',0,55,'无描述'),(14,'iphone 5S',9,78,'无描述'),(15,'鞋子',11,72,'无描述'),(16,'短裤',11,8,'无描述'),(17,'周杰伦-叶惠美',3,49,'无描述');
/*!40000 ALTER TABLE `es_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_goods`
--

DROP TABLE IF EXISTS `es_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_goods` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(32) NOT NULL COMMENT '商品名字',
  `g_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格',
  `c_id` tinyint(4) NOT NULL COMMENT '商品分类',
  `g_inv` int(10) unsigned DEFAULT '0' COMMENT '商品库存',
  `g_sn` char(6) NOT NULL COMMENT '商品编号shop0001',
  `g_brand` varchar(16) DEFAULT '' COMMENT '商品品牌',
  `g_barcode` varchar(32) DEFAULT '' COMMENT '商品条码',
  `g_hot` char(1) DEFAULT '0' COMMENT '是否热销1=true',
  `g_new` char(1) DEFAULT '1' COMMENT '是否新品',
  `g_best` char(1) DEFAULT '0' COMMENT '是否精品',
  `g_onsail` char(1) DEFAULT '1' COMMENT '是否上架',
  `g_desc` text COMMENT '商品描述',
  `g_click` int(10) unsigned DEFAULT '9' COMMENT '点击量',
  `g_sort` tinyint(3) unsigned DEFAULT '50' COMMENT '商品排序',
  `g_image` varchar(64) DEFAULT '' COMMENT '图片名字',
  `g_thumb` varchar(64) DEFAULT '' COMMENT '图片缩略图',
  `g_water` varchar(64) DEFAULT '' COMMENT '图片水印',
  PRIMARY KEY (`g_id`),
  UNIQUE KEY `g_sn` (`g_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_goods`
--

LOCK TABLES `es_goods` WRITE;
/*!40000 ALTER TABLE `es_goods` DISABLE KEYS */;
INSERT INTO `es_goods` VALUES (1,'iphone 6plus',100.00,0,34,'ss0001','乔布斯二代','a11111111','1','1','1','1','<p>三星手机I9300手机，买手机送炫酷手机壳</p>\r\n\r\n<p><img alt=\"\" src=\"/Public/uploads/images/20150129160055DJrlmd.jpg\" style=\"width: 100px; height: 100px;\" /></p>\r\n\r\n<ul>\r\n	<li>产品名称：Samsung/三星 GALAXY S5</li>\r\n	<li>品牌: Samsung/三星</li>\r\n	<li>三星型号: GALAXY S5</li>\r\n	<li>上市时间: 2014年</li>\r\n	<li>网络类型: GSM/WCDMA/LTE</li>\r\n	<li>款式: 直板</li>\r\n	<li>尺寸: 5.1英寸</li>\r\n	<li>机身颜色: 白色 黑色 黄色 蓝色</li>\r\n	<li>套餐类型: 官方标配 套餐一 套餐二 套餐三 套餐四 套餐五</li>\r\n	<li>后置摄像头: 1600万</li>\r\n	<li>操作系统: Android/安卓</li>\r\n	<li>附加功能: WIFI上网 GPS导航</li>\r\n	<li>宝贝成色: 全新</li>\r\n	<li>售后服务: 店铺三包</li>\r\n	<li>触摸屏类型: 电容式</li>\r\n	<li>运行内存RAM: 2GB</li>\r\n	<li>机身内存: 16GB</li>\r\n	<li>键盘类型: 虚拟触屏键盘</li>\r\n	<li>厚度: 9mm以下</li>\r\n	<li>分辨率: 1920x1080</li>\r\n	<li>手机类型: 智能手机</li>\r\n	<li>电池类型: 可拆卸式电池</li>\r\n	<li>摄像头类型: 双摄像头（前后）</li>\r\n	<li>视频显示格式: 1080P(全高清D5)</li>\r\n	<li>网络模式: 单卡多模</li>\r\n	<li>核心数: 四核心</li>\r\n	<li>版本类型: 港澳台 亚太 中国大</li>\r\n</ul>\r\n\r\n<p>你知道我在等你吗？你真的真的在乎我？</p>\r\n\r\n<p>&nbsp;</p>',11,1,'imgs/20150127191128joussh.jpg','thumbs/s_20150127191128joussh.jpg',''),(2,'佳能700D单反相机',5.00,0,99,'ss0002','佳能','a11111222','1','0','1','1','<p style=\"line-height: 20.7999992370605px;\">三星手机I9300手机，买手机送炫酷手机壳</p>\r\n\r\n<p style=\"line-height: 20.7999992370605px;\"><img alt=\"\" src=\"/Public/uploads/images/20150129160055DJrlmd.jpg\" style=\"width: 100px; height: 100px;\" /></p>\r\n\r\n<ul style=\"line-height: 20.7999992370605px;\">\r\n	<li>产品名称：Samsung/三星 GALAXY S5</li>\r\n	<li>品牌: Samsung/三星</li>\r\n	<li>三星型号: GALAXY S5</li>\r\n	<li>上市时间: 2014年</li>\r\n	<li>网络类型: GSM/WCDMA/LTE</li>\r\n	<li>款式: 直板</li>\r\n	<li>尺寸: 5.1英寸</li>\r\n	<li>机身颜色: 白色 黑色 黄色 蓝色</li>\r\n	<li>套餐类型: 官方标配 套餐一 套餐二 套餐三 套餐四 套餐五</li>\r\n	<li>后置摄像头: 1600万</li>\r\n	<li>操作系统: Android/安卓</li>\r\n	<li>附加功能: WIFI上网 GPS导航</li>\r\n	<li>宝贝成色: 全新</li>\r\n	<li>售后服务: 店铺三包</li>\r\n	<li>触摸屏类型: 电容式</li>\r\n	<li>运行内存RAM: 2GB</li>\r\n	<li>机身内存: 16GB</li>\r\n	<li>键盘类型: 虚拟触屏键盘</li>\r\n	<li>厚度: 9mm以下</li>\r\n	<li>分辨率: 1920x1080</li>\r\n	<li>手机类型: 智能手机</li>\r\n	<li>电池类型: 可拆卸式电池</li>\r\n	<li>摄像头类型: 双摄像头（前后）</li>\r\n	<li>视频显示格式: 1080P(全高清D5)</li>\r\n	<li>网络模式: 单卡多模</li>\r\n	<li>核心数: 四核心</li>\r\n	<li>版本类型: 港澳台 亚太 中国大</li>\r\n</ul>\r\n\r\n<p style=\"line-height: 20.7999992370605px;\">你知道我在等你吗？你真的真的在乎我？</p>',14,1,'imgs/20150127191143bjlQxH.jpg','thumbs/s_20150127191143bjlQxH.jpg',''),(3,'佳能700D单反相机',5.00,0,99,'ss0003','佳能','a11111222','1','0','1','1','<p style=\"line-height: 20.7999992370605px;\">三星手机I9300手机，买手机送炫酷手机壳</p>\r\n\r\n<p style=\"line-height: 20.7999992370605px;\"><img alt=\"\" src=\"/Public/uploads/images/20150129160055DJrlmd.jpg\" style=\"width: 100px; height: 100px;\" /></p>\r\n\r\n<ul style=\"line-height: 20.7999992370605px;\">\r\n	<li>产品名称：Samsung/三星 GALAXY S5</li>\r\n	<li>品牌: Samsung/三星</li>\r\n	<li>三星型号: GALAXY S5</li>\r\n	<li>上市时间: 2014年</li>\r\n	<li>网络类型: GSM/WCDMA/LTE</li>\r\n	<li>款式: 直板</li>\r\n	<li>尺寸: 5.1英寸</li>\r\n	<li>机身颜色: 白色 黑色 黄色 蓝色</li>\r\n	<li>套餐类型: 官方标配 套餐一 套餐二 套餐三 套餐四 套餐五</li>\r\n	<li>后置摄像头: 1600万</li>\r\n	<li>操作系统: Android/安卓</li>\r\n	<li>附加功能: WIFI上网 GPS导航</li>\r\n	<li>宝贝成色: 全新</li>\r\n	<li>售后服务: 店铺三包</li>\r\n	<li>触摸屏类型: 电容式</li>\r\n	<li>运行内存RAM: 2GB</li>\r\n	<li>机身内存: 16GB</li>\r\n	<li>键盘类型: 虚拟触屏键盘</li>\r\n	<li>厚度: 9mm以下</li>\r\n	<li>分辨率: 1920x1080</li>\r\n	<li>手机类型: 智能手机</li>\r\n	<li>电池类型: 可拆卸式电池</li>\r\n	<li>摄像头类型: 双摄像头（前后）</li>\r\n	<li>视频显示格式: 1080P(全高清D5)</li>\r\n	<li>网络模式: 单卡多模</li>\r\n	<li>核心数: 四核心</li>\r\n	<li>版本类型: 港澳台 亚太 中国大</li>\r\n</ul>\r\n\r\n<p style=\"line-height: 20.7999992370605px;\">你知道我在等你吗？你真的真的在乎我？</p>',14,1,'imgs/20150127191202TqcUKf.jpg','thumbs/s_20150127191202TqcUKf.jpg',''),(4,'尼康小相机',5488.00,0,99,'ss0004','宏碁','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127190100BVwBxY.jpg','thumbs/s_20150127190100BVwBxY.jpg',''),(5,'联想笔记本电脑 高速独立显存',4.00,0,99,'ss0005','戴尔','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191216MvPCiE.jpg','thumbs/s_20150127191216MvPCiE.jpg',''),(6,'法姿韩版显瘦彩边时尚牛仔铅笔裤',5.00,0,99,'ss0006','三星','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191230esBEVf.jpg','thumbs/s_20150127191230esBEVf.jpg',''),(7,'Genius925纯银施华洛世奇水晶吊坠',6.00,0,99,'ss0007','尼康','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191242xmahos.jpg','thumbs/s_20150127191242xmahos.jpg',''),(8,'利仁2018M福满堂电饼铛 好用实惠',7.00,0,99,'ss0008','小米','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191257jPjYtb.jpg','thumbs/s_20150127191257jPjYtb.jpg',''),(9,'达派高档拉杆箱20寸 经典款式',8.00,0,99,'ss0009','电源','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191311zqxOZt.jpg','thumbs/s_20150127191311zqxOZt.jpg',''),(10,'利仁2018M福满堂电饼铛 好用实惠',5488.00,0,99,'ss0010','日入','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191324dJKdJD.jpg','thumbs/s_20150127191324dJKdJD.jpg',''),(11,'爱国者MP4 全屏触摸多格式播放 4G',9.00,0,99,'ss0011','三亚','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191354EjvKeg.jpg','thumbs/s_20150127191354EjvKeg.jpg',''),(12,'达派高档拉杆箱20寸 经典款式',10.00,0,99,'ss0012','佳能','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191408ZXtpWz.jpg','thumbs/s_20150127191408ZXtpWz.jpg',''),(13,'多美滋金装金盾3阶段幼儿配方奶粉',20.00,0,99,'ss0013','佳能','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191423uwAftR.jpg','thumbs/s_20150127191423uwAftR.jpg',''),(14,'爱国者MP4 全屏触摸多格式播放 4G',10.00,0,99,'ss0014','佳能','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191438SEBnTm.jpg','thumbs/s_20150127191438SEBnTm.jpg',''),(15,'乐扣普通型保鲜盒圣诞7件套',30.00,0,99,'ss0015','佳能','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191452VxERBk.jpg','thumbs/s_20150127191452VxERBk.jpg',''),(16,'法国德菲丝松露精品巧克力500g/盒',40.00,0,99,'ss0016','佳能','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191507SSklgM.jpg','thumbs/s_20150127191507SSklgM.jpg',''),(17,'佳能700D单反相机',11.00,0,99,'ss0017','佳能','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191522DPfwnx.jpg','thumbs/s_20150127191522DPfwnx.jpg',''),(18,'多美滋金装金盾3阶段幼儿配方奶粉',15.00,0,99,'ss0018','佳能','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191540rnxOVk.jpg','thumbs/s_20150127191540rnxOVk.jpg',''),(19,'乐扣普通型保鲜盒圣诞7件套',25.00,0,99,'ss0019','佳能','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191558lXmKku.jpg','thumbs/s_20150127191558lXmKku.jpg',''),(20,'法国德菲丝松露精品巧克力500g/盒',5.00,0,99,'ss0020','佳能','a11111222','1','0','1','1','最好的相机',14,1,'imgs/20150127191611QvLzGv.jpg','thumbs/s_20150127191611QvLzGv.jpg','');
/*!40000 ALTER TABLE `es_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_goods_image`
--

DROP TABLE IF EXISTS `es_goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_goods_image` (
  `i_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `i_pic` varchar(150) NOT NULL COMMENT '原图',
  `i_thumb_pic` varchar(150) NOT NULL COMMENT '缩略图(默认100*100)',
  `i_water_pic` varchar(150) NOT NULL COMMENT '水印图',
  `i_goods_id` mediumint(8) unsigned NOT NULL COMMENT '对应的商品的id',
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_goods_image`
--

LOCK TABLES `es_goods_image` WRITE;
/*!40000 ALTER TABLE `es_goods_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_messages`
--

DROP TABLE IF EXISTS `es_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_messages` (
  `m_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言板id',
  `m_title` varchar(64) NOT NULL COMMENT '留言主题',
  `m_content` text NOT NULL COMMENT '留言内容',
  `m_type` tinyint(3) unsigned DEFAULT '0' COMMENT '0：表示未回复 1：表示回复',
  `m_time` int(10) unsigned DEFAULT '0' COMMENT '留言时间',
  `m_ip` char(15) DEFAULT '127.0.0.1' COMMENT '用户留言ip',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_messages`
--

LOCK TABLES `es_messages` WRITE;
/*!40000 ALTER TABLE `es_messages` DISABLE KEYS */;
INSERT INTO `es_messages` VALUES (1,'传智播客有就业班信息展示啦，快来！','床前明月光逛逛,床前明月光逛逛',1,1111111111,'127.0.0.1'),(2,'习近平致电印度总统祝贺印共和国日！','床前明月光逛逛,床前明月光逛逛',1,1111111111,'127.0.0.1'),(3,'李克强：经济发展须按下改革快进键','床前明月光逛逛,床前明月光逛逛',1,1111111111,'127.0.0.1'),(4,'查了一下是正品,就是好，手机待电也还好','床前明月光逛逛,床前明月光逛逛',1,1111111111,'127.0.0.1'),(5,'不错,看起来还行的，还来这！','床前明月光逛逛,床前明月光逛逛',1,1111111111,'127.0.0.1'),(6,'是正品,暂时没发现什么质量问题','床前明月光逛逛,床前明月光逛逛',1,1111111111,'127.0.0.1'),(7,'这个东西质量怎么样？耐摔不。。','床前明月光逛逛,床前明月光逛逛',1,1111111111,'127.0.0.1');
/*!40000 ALTER TABLE `es_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_news`
--

DROP TABLE IF EXISTS `es_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_news` (
  `n_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `n_title` varchar(64) NOT NULL COMMENT '新闻标题',
  `n_content` text NOT NULL COMMENT '新闻内容',
  `n_author` varchar(16) NOT NULL COMMENT '作者',
  `n_type` varchar(64) NOT NULL COMMENT '新闻类型',
  `n_date` int(11) DEFAULT '0' COMMENT '新闻发布时间',
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_news`
--

LOCK TABLES `es_news` WRITE;
/*!40000 ALTER TABLE `es_news` DISABLE KEYS */;
INSERT INTO `es_news` VALUES (1,'苹果破产啦!!!','<p><strong style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">艺术简介</strong><br style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\" />\r\n<span style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">陈培伦，1953年出生，山东单县人。现为国家文化部副局长，中国美术家协会会员，中国楹联学会会员，全国美术考级评审委员会委员，文化部艺术评估委员会委员，中国书画收藏家协会艺术顾问，中国画创作研究院院长。 多年来致力于书画艺术的创作与研究，并得到李铎、刘大为、张道兴、龙瑞等老师的悉心指教。其国画作品清秀隽永、空灵秀逸、意境深远、格调高雅。其书法作品以隶书见长，朴厚劲秀，宽博庄重。书画作品曾多次参加全国、全军及国内外书画交流展，并多次举办个人画展。出版有《陈培伦画集》、《陈培伦写生作品》等。&nbsp;</span><br style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\" />\r\n<strong style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">获得头衔</strong><br style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\" />\r\n<span style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">中国美术家协会会员</span><br style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\" />\r\n<span style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">全国美术考级评审委员会委员</span><br style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\" />\r\n<span style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">文化部艺术评估委员会委员</span><br style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\" />\r\n<span style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">中国画创作研究院院长</span><br style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\" />\r\n<span style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">中华旅游书画院院长&nbsp;</span><br style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\" />\r\n<strong style=\"font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">联系方式</strong></p>\r\n\r\n<table style=\"border-collapse: collapse; font-family: Verdana, Geneva, sans-serif; font-size: 14px; line-height: 30px;\">\r\n	<tbody>\r\n		<tr>\r\n			<th>通　　信：</th>\r\n			<td>北京市朝阳门北大街10号(文化部) 100020<br />\r\n			北京市复兴路23号9-4-501 100036</td>\r\n		</tr>\r\n		<tr>\r\n			<th>电　　话：</th>\r\n			<td>13621230093<br />\r\n			010-59881750（办）<br />\r\n			010-68274332（宅）</td>\r\n		</tr>\r\n		<tr>\r\n			<th>传　　真：</th>\r\n			<td>010-59881410</td>\r\n		</tr>\r\n		<tr>\r\n			<th>邮　　箱：</th>\r\n			<td>4873473@qq.com</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','yeZi','3C数码',1876543210),(2,'赵本山不去春晚了','<p>赵本山不去春晚了！</p>\r\n\r\n<p>那我也不看春晚啦。。。。。啊哈哈哈</p>\r\n','Mumu','娱乐新闻',1376543210),(3,'深圳可以入户','<h1><strong>深圳</strong>好地方，<s>你说入户</s>就入户，<em>骗子</em>。。。。。</h1>\r\n','yiad','地方新闻',1866543210),(4,'江西是个好地方','破产啦破产啦破产啦！','yeZi','3C数码',1876543210),(5,'广州不好玩','破产啦破产啦破产啦！','yeZi','3C数码',1816543210),(6,'床前明月光逛逛','破产啦破产啦破产啦！','yeZi','3C数码',1176543210),(7,'你看我有多深。','破产啦破产啦破产啦！','yeZi','3C数码',1376543210),(8,'苹果破产啦!!!','破产啦破产啦破产啦！','yeZi','3C数码',1876543210),(9,'赵本山不去春晚了','赵本山不去春晚了！','Mumu','娱乐新闻',1376543210),(10,'深圳可以入户','深圳好地方','yiad','地方新闻',1866543210),(11,'江西是个好地方','破产啦破产啦破产啦！','yeZi','3C数码',1876543210),(12,'广州不好玩','破产啦破产啦破产啦！','yeZi','3C数码',1816543210),(13,'床前明月光逛逛','破产啦破产啦破产啦！','yeZi','3C数码',1176543210),(14,'你看我有多深。','破产啦破产啦破产啦！','yeZi','3C数码',1376543210);
/*!40000 ALTER TABLE `es_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_order`
--

DROP TABLE IF EXISTS `es_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_hao` char(6) NOT NULL COMMENT '订单编号ss0001',
  `o_name` varchar(255) NOT NULL COMMENT '产品名字',
  `o_price` varchar(255) DEFAULT NULL COMMENT '商品单价',
  `o_num` varchar(255) DEFAULT NULL COMMENT '商品数量',
  `o_totle` varchar(255) DEFAULT NULL COMMENT '所有的商品总价',
  `u_username` varchar(32) DEFAULT NULL COMMENT '用户的登陆账号',
  PRIMARY KEY (`o_id`),
  KEY `o_hao` (`o_hao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_order`
--

LOCK TABLES `es_order` WRITE;
/*!40000 ALTER TABLE `es_order` DISABLE KEYS */;
INSERT INTO `es_order` VALUES (1,'ss0000','iphone 6plus@@法姿韩版显瘦彩边时尚牛仔铅笔裤','100.00@@5.00','1@@1','100.00@@5.00','a'),(2,'ss0001','多美滋金装金盾3阶段幼儿配方奶粉','15.00','1','15.00','a'),(3,'ss0002','法国德菲丝松露精品巧克力500g/盒','40.00','1','40.00','a');
/*!40000 ALTER TABLE `es_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_session`
--

DROP TABLE IF EXISTS `es_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_session` (
  `s_id` char(32) NOT NULL COMMENT 'sessionid',
  `s_data` text COMMENT 'session内容',
  `s_expire` int(11) DEFAULT NULL COMMENT 'session生成时间',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最好用myisam引擎';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_session`
--

LOCK TABLES `es_session` WRITE;
/*!40000 ALTER TABLE `es_session` DISABLE KEYS */;
INSERT INTO `es_session` VALUES ('755g7csjir9qja419lghtcqhc4','user|a:13:{s:4:\"u_id\";s:1:\"1\";s:10:\"u_username\";s:1:\"a\";s:10:\"u_password\";s:32:\"0cc175b9c0f1b6a831c399e269772661\";s:10:\"u_nickname\";s:9:\"小母鸡\";s:6:\"u_name\";s:6:\"杨过\";s:5:\"u_sex\";s:1:\"1\";s:7:\"u_email\";s:9:\"qq@qq.com\";s:7:\"u_phone\";s:11:\"13888889999\";s:4:\"u_qq\";s:6:\"123456\";s:6:\"u_addr\";s:43:\"广东省深圳市福田区华强北28楼C4\";s:10:\"u_portrait\";s:41:\"uploads/thumbs/s_20150127165657qJcobp.jpg\";s:11:\"u_logintime\";s:10:\"1422586718\";s:4:\"u_ip\";s:9:\"127.0.0.1\";}',1422586920);
/*!40000 ALTER TABLE `es_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_userinfo`
--

DROP TABLE IF EXISTS `es_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_userinfo` (
  `u_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `u_username` varchar(32) DEFAULT NULL COMMENT '登录用户名',
  `u_name` varchar(16) NOT NULL COMMENT '用户姓名',
  `u_addr` varchar(64) NOT NULL COMMENT '用户地址',
  `u_phone` char(11) NOT NULL COMMENT '用户电话',
  PRIMARY KEY (`u_id`),
  KEY `u_username` (`u_username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_userinfo`
--

LOCK TABLES `es_userinfo` WRITE;
/*!40000 ALTER TABLE `es_userinfo` DISABLE KEYS */;
INSERT INTO `es_userinfo` VALUES (1,'a','武大郎','深圳市广州区天河街华强北华强广场','18890903344'),(2,'a','李秀媛','深圳市广州区天河街华强北腾讯大厦101','18811881199'),(3,'a','李秀媛','深圳市广州区天河街华强北腾讯大厦101','18811881199');
/*!40000 ALTER TABLE `es_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-30 11:17:20
