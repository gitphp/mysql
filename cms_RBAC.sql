
-- 用户表
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin` (
  `a_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `a_username` varchar(32) NOT NULL COMMENT '用户名',
  `a_password` char(32) NOT NULL COMMENT '密码',
  `a_salt` char(10) NOT NULL DEFAULT 'yaso8848' COMMENT '密码的秘钥',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='后台用户表';


-- 权限表
DROP TABLE IF EXISTS `cms_auth`;
CREATE TABLE `cms_auth` (
  `p_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `p_name` varchar(30) NOT NULL COMMENT '权限名字',
  `p_pid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `p_cname` varchar(32) NOT NULL DEFAULT '' COMMENT '控制器名',
  `p_aname` varchar(32) NOT NULL DEFAULT '' COMMENT '方法名字',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='后台权限表';


-- 权限角色表
DROP TABLE IF EXISTS `cms_auth_role`;
CREATE TABLE `cms_auth_role` (
  `auth_id` tinyint(3) unsigned NOT NULL COMMENT '权限id',
  `role_id` tinyint(3) unsigned NOT NULL COMMENT '角色id',
  KEY `auth_id` (`auth_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限+角色(中间表)';


-- 角色表
DROP TABLE IF EXISTS `cms_role`;
CREATE TABLE `cms_role` (
  `r_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `r_name` varchar(32) NOT NULL COMMENT '角色名字',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户角色表';


INSERT INTO `cms_role` VALUES (2,'网站编辑'),(3,'商品编辑'),(4,'普通员工'),(5,'总经理'),(6,'网站管理员'),(7,'测试角色');

-- 用户角色
DROP TABLE IF EXISTS `cms_user_role`;
CREATE TABLE `cms_user_role` (
  `user_id` tinyint(3) unsigned NOT NULL COMMENT '用户id',
  `role_id` tinyint(3) unsigned NOT NULL COMMENT '角色id',
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户+角色(中间表)';

INSERT INTO `cms_user_role` VALUES (2,2),(3,3),(4,4),(5,5),(6,6),(7,7);











#
# Source for table "cms_city"
#

DROP TABLE IF EXISTS `cms_city`;
CREATE TABLE `cms_city` (
  `c_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `c_name` varchar(64) NOT NULL COMMENT '地区名字',
  `c_pid` smallint(5) unsigned NOT NULL COMMENT '父亲id',
  `c_type` tinyint(4) NOT NULL COMMENT '类型',
  `c_is_open` enum('T','F') NOT NULL DEFAULT 'F' COMMENT '是否开放',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;

#
# Data for table "cms_city"
#


#
# Source for table "cms_fields"
#

DROP TABLE IF EXISTS `cms_fields`;
CREATE TABLE `cms_fields` (
  `f_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` tinyint(4) NOT NULL COMMENT '模型的id',
  `f_ename` varchar(32) NOT NULL COMMENT '英文名称',
  `f_cname` varchar(32) NOT NULL COMMENT '中文名称',
  `f_type` varchar(32) NOT NULL COMMENT '字段的类型',
  `f_value` varchar(32) NOT NULL COMMENT '字段的默认值',
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='字段表';

#
# Data for table "cms_fields"
#


#
# Source for table "cms_img"
#

DROP TABLE IF EXISTS `cms_img`;
CREATE TABLE `cms_img` (
  `aid` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "cms_img"
#


#
# Source for table "cms_model"
#

DROP TABLE IF EXISTS `cms_model`;
CREATE TABLE `cms_model` (
  `m_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `m_name` varchar(32) NOT NULL COMMENT '模型名字',
  `m_tablename` varchar(32) NOT NULL COMMENT '附加表名字',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='模型的表';

#
# Data for table "cms_model"
#

INSERT INTO `cms_model` VALUES (1,'电影','movie'),(2,'图片','img');

#
# Source for table "cms_movie"
#

DROP TABLE IF EXISTS `cms_movie`;
CREATE TABLE `cms_movie` (
  `aid` smallint(5) unsigned NOT NULL,
  `daoyan` varchar(32) NOT NULL DEFAULT '',
  `year` varchar(32) NOT NULL DEFAULT '',
  `qing` varchar(256) NOT NULL DEFAULT '',
  `lang` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "cms_movie"
#



