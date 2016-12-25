# Host: 192.168.33.10  (Version: 5.6.24)
# Date: 2016-11-24 15:05:01
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "st_activity"
#

DROP TABLE IF EXISTS `st_activity`;
CREATE TABLE `st_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '统计id',
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id,其中-1表示全部活动',
  `stats_date` int(11) NOT NULL DEFAULT '0' COMMENT '统计日期',
  `pv` int(11) DEFAULT '0' COMMENT '浏览量(page view)',
  `uv` int(11) DEFAULT '0' COMMENT '访客数',
  `register_num` int(11) DEFAULT '0' COMMENT '注册数',
  `invest_num` int(11) DEFAULT '0' COMMENT '投资数',
  `invest_money` double DEFAULT '0' COMMENT '投资金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动统计表';

#
# Data for table "st_activity"
#


#
# Structure for table "st_channel"
#

DROP TABLE IF EXISTS `st_channel`;
CREATE TABLE `st_channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `e_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '统计日期',
  `channel_id` int(11) NOT NULL DEFAULT '0' COMMENT '渠道id',
  `channel_name` varchar(128) NOT NULL DEFAULT '' COMMENT '渠道名字',
  `visitors_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '访客总人数',
  `register_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册总人数',
  `invest_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '投资总人数',
  `invest_money` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '投资总金额',
  PRIMARY KEY (`id`),
  KEY `e_time` (`e_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多啦渠道统计表';

#
# Data for table "st_channel"
#

/*!40000 ALTER TABLE `st_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_channel` ENABLE KEYS */;

#
# Structure for table "st_channel_baidu"
#

DROP TABLE IF EXISTS `st_channel_baidu`;
CREATE TABLE `st_channel_baidu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '统计id',
  `channel_id` int(11) NOT NULL DEFAULT '0' COMMENT '渠道id',
  `activity_id` int(11) DEFAULT '0' COMMENT '活动id',
  `stats_date` int(11) NOT NULL DEFAULT '0' COMMENT '统计日期',
  `pv` int(11) DEFAULT '0' COMMENT '浏览量(page view)',
  `uv` int(11) DEFAULT '0' COMMENT '访客数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='百度统计表';

#
# Data for table "st_channel_baidu"
#


#
# Structure for table "st_cron_schedule"
#

DROP TABLE IF EXISTS `st_cron_schedule`;
CREATE TABLE `st_cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT '任务名称',
  `status` enum('pending','running','success','missed','error') NOT NULL DEFAULT 'pending' COMMENT '任务状态',
  `messages` text COMMENT '日志信息',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `scheduled_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计执行时间',
  `executed_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '实际执行时间',
  `finished_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '完成时间',
  PRIMARY KEY (`schedule_id`),
  KEY `task_name` (`job_code`),
  KEY `scheduled_at` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

#
# Data for table "st_cron_schedule"
#


#
# Structure for table "st_investment"
#

DROP TABLE IF EXISTS `st_investment`;
CREATE TABLE `st_investment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `e_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '统计日期时间',
  `invest_total_num` int(11) NOT NULL DEFAULT '0' COMMENT '在平台投资过的总人数',
  `invest_total_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '投资总金额',
  `invest_null_num` int(11) NOT NULL DEFAULT '0' COMMENT '未投资的的总人数',
  `invest_pay_num` int(11) NOT NULL DEFAULT '0' COMMENT '充值了但未投资的的总人数',
  `invest_out_num` int(11) NOT NULL DEFAULT '0' COMMENT '退出投资的的总人数',
  `invest_in_num` int(11) NOT NULL DEFAULT '0' COMMENT '在途投资总人数',
  PRIMARY KEY (`id`),
  KEY `e_time` (`e_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多啦用户投资统计数据分析表';

#
# Data for table "st_investment"
#

/*!40000 ALTER TABLE `st_investment` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_investment` ENABLE KEYS */;

#
# Structure for table "st_migrations"
#

DROP TABLE IF EXISTS `st_migrations`;
CREATE TABLE `st_migrations` (
  `version` int(3) NOT NULL,
  `__#alibaba_rds_row_id#__` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Implicit Primary Key by RDS',
  KEY `__#alibaba_rds_row_id#__` (`__#alibaba_rds_row_id#__`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据迁移表';

#
# Data for table "st_migrations"
#


#
# Structure for table "st_recharge"
#

DROP TABLE IF EXISTS `st_recharge`;
CREATE TABLE `st_recharge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `e_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '统计的日期',
  `charge_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值总次数(笔数)',
  `charge_user_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值用户总人数',
  `charge_total_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '充值总金额',
  `ll_pay_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '连连充值总人数',
  `offline_pay_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '线下充值总人数',
  `error_pay_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值失败的笔数',
  `pc_pay_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'PC充值的总笔数',
  `ios_pay_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios充值的总笔数',
  `android_pay_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Android充值的总笔数',
  `wechat_pay_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'wechat充值的总笔数',
  PRIMARY KEY (`id`),
  KEY `e_time` (`e_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多啦用户充值数据统计分析表';

#
# Data for table "st_recharge"
#

/*!40000 ALTER TABLE `st_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_recharge` ENABLE KEYS */;

#
# Structure for table "st_table"
#

DROP TABLE IF EXISTS `st_table`;
CREATE TABLE `st_table` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '统计时间',
  `type` varchar(128) NOT NULL DEFAULT '' COMMENT '指标名字',
  `number` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '统计的值',
  PRIMARY KEY (`id`),
  KEY `create_at` (`create_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "st_table"
#

/*!40000 ALTER TABLE `st_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_table` ENABLE KEYS */;

#
# Structure for table "st_type"
#

DROP TABLE IF EXISTS `st_type`;
CREATE TABLE `st_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) DEFAULT '' COMMENT '指标名字',
  `stat_time_begin` int(11) DEFAULT '0' COMMENT '开始时间',
  `stat_time_end` int(11) DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `stat_time_begin` (`stat_time_begin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "st_type"
#

/*!40000 ALTER TABLE `st_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_type` ENABLE KEYS */;

#
# Structure for table "st_user_balance"
#

DROP TABLE IF EXISTS `st_user_balance`;
CREATE TABLE `st_user_balance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `e_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '统计的日期',
  `balance_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '用户可用总余额',
  `zero_user_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '余额=0的用户总人数',
  `hasmoney_user_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '余额>0的用户总人数',
  PRIMARY KEY (`id`),
  KEY `e_time` (`e_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户账户金额数据统计分析表';

#
# Data for table "st_user_balance"
#

/*!40000 ALTER TABLE `st_user_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_user_balance` ENABLE KEYS */;

#
# Structure for table "st_userinfo"
#

DROP TABLE IF EXISTS `st_userinfo`;
CREATE TABLE `st_userinfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `e_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '统计的日期时间',
  `user_num` int(11) NOT NULL DEFAULT '0' COMMENT '平台注册总人数',
  `new_user_num` int(11) NOT NULL DEFAULT '0' COMMENT '平台新用户注册总人数',
  `user_pay_num` int(11) NOT NULL DEFAULT '0' COMMENT '平台充值过的总人数',
  `first_pay_num` int(11) NOT NULL DEFAULT '0' COMMENT '第一次充值的总人数',
  `user_regular_num` int(11) NOT NULL DEFAULT '0' COMMENT '投资定期计划人数(人)',
  `avg_total_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '人均投资定期计划金额（元）',
  `one_total_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '1个月产品投资金额（元）',
  `three_total_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '3个月产品投资金额（元）',
  `six_total_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '6个月产品投资金额（元）',
  `twelve_total_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '12个月产品投资金额（元）',
  `one_total_num` int(11) NOT NULL DEFAULT '0' COMMENT '1个月产品投资人数(人)',
  `three_total_num` int(11) NOT NULL DEFAULT '0' COMMENT '3个月产品投资人数(人)',
  `six_total_num` int(11) NOT NULL DEFAULT '0' COMMENT '6个月产品投资人数(人)',
  `twelve_total_num` int(11) NOT NULL DEFAULT '0' COMMENT '12个月产品投资人数(人)',
  PRIMARY KEY (`id`),
  KEY `e_time` (`e_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多啦用户数据统计分析表';

#
# Data for table "st_userinfo"
#

/*!40000 ALTER TABLE `st_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_userinfo` ENABLE KEYS */;

#
# Structure for table "st_withdraw"
#

DROP TABLE IF EXISTS `st_withdraw`;
CREATE TABLE `st_withdraw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `e_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '统计的日期',
  `withdraw_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提现总次数(笔数)',
  `withdraw_audit_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提现待审核(笔数)',
  `withdraw_user_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提现用户总人数',
  `withdraw_total_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '提现总金额',
  `withdraw_true_money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '提现用户实际到账金额',
  `withdraw_total_fee` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费总金额',
  `pc_cash_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'PC提现的总笔数',
  `ios_cash_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ios提现的总笔数',
  `android_cash_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Android提现的总笔数',
  `wechat_cash_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'wechat提现的总笔数',
  PRIMARY KEY (`id`),
  KEY `e_time` (`e_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多啦用户提现数据统计分析表';

#
# Data for table "st_withdraw"
#

/*!40000 ALTER TABLE `st_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_withdraw` ENABLE KEYS */;
