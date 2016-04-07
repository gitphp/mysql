
--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `password` varchar(32) NOT NULL,
  `model` int(11) NOT NULL DEFAULT '0' COMMENT '数据源',
  `ctime` datetime NOT NULL COMMENT '创建日期',
  `endtime` datetime NOT NULL COMMENT '有效时间'
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='管理员';

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `name`, `nickname`, `password`, `model`, `ctime`, `endtime`) VALUES
(1, 'admin', '超级管理员', '5c28fcdd675e239f5fe1267b1858dec2', 0, '2014-11-23 00:00:00', '2016-02-23 00:00:00'),
(49, 'hp', '合拍使用者', 'e10adc3949ba59abbe56e057f20f883e', 38, '2014-11-23 15:54:16', '2015-11-23 15:49:50'),
(50, 'hpadmin', '合拍管理员', 'e10adc3949ba59abbe56e057f20f883e', 38, '2014-11-23 15:56:07', '2015-11-23 15:56:10'),
(51, 'vip', '唯品会', 'e10adc3949ba59abbe56e057f20f883e', 39, '2014-11-23 15:56:43', '2015-11-23 15:56:46'),
(52, 'vipadmin', '唯品会管理员', 'e10adc3949ba59abbe56e057f20f883e', 39, '2014-11-23 15:57:20', '2015-11-23 15:57:20'),
(53, 'yalan', '雅兰', 'd964173dc44da83eeafa3aebbee9a1a0', 40, '2015-02-02 00:00:00', '2016-02-02 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `admin_loginlog`
--

CREATE TABLE IF NOT EXISTS `admin_loginlog` (
  `id` int(10) unsigned NOT NULL,
  `admin_id` mediumint(8) unsigned NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL COMMENT '登录IP',
  `do_type` enum('1','2') NOT NULL COMMENT '日志类型，''1'' 登陆日志，''2''操作日志',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `ctime` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3847 DEFAULT CHARSET=utf8 COMMENT='后台登录日志';

--
-- 转存表中的数据 `admin_loginlog`
--


-- --------------------------------------------------------

--
-- 表的结构 `pt_active`
--

CREATE TABLE IF NOT EXISTS `pt_active` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) NOT NULL,
  `title` varchar(200) NOT NULL COMMENT '活动标题',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1为启用；0为关闭',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `browse_num` int(10) NOT NULL COMMENT '浏览数',
  `partin_num` int(10) NOT NULL COMMENT '参与',
  `ctime` int(10) unsigned NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_active_result`
--

CREATE TABLE IF NOT EXISTS `pt_active_result` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `result_id` int(10) NOT NULL,
  `nums` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='自测结果';

-- --------------------------------------------------------

--
-- 表的结构 `pt_actlog_ggk`
--

CREATE TABLE IF NOT EXISTS `pt_actlog_ggk` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) NOT NULL,
  `aid` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `sn` varchar(25) NOT NULL,
  `ctime` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='刮刮卡活动日志表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_admin`
--

CREATE TABLE IF NOT EXISTS `pt_admin` (
  `id` mediumint(8) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总公司ID',
  `pid` int(10) unsigned NOT NULL COMMENT '所属上级id',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店ID',
  `name` varchar(20) NOT NULL,
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `password` char(32) NOT NULL,
  `role` enum('admin','manager','province','city','seller','service') NOT NULL COMMENT '角色，admin管理员，manager大区经理，province省级经理，city市级经理，seller销售员，service客服',
  `permission` text NOT NULL COMMENT '权限',
  `disabled` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1禁用，0启用',
  `ctime` int(10) unsigned NOT NULL COMMENT '创建日期',
  `grade` tinyint(1) NOT NULL COMMENT '账号等级，1管理员（有所有权限），2职能部门',
  `job_number` varchar(20) NOT NULL COMMENT '工号'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='管理员';

--
-- 转存表中的数据 `pt_admin`
--


-- --------------------------------------------------------

--
-- 表的结构 `pt_admin_log`
--

CREATE TABLE IF NOT EXISTS `pt_admin_log` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) NOT NULL,
  `admin_id` mediumint(8) unsigned NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL COMMENT '登录IP',
  `do_type` enum('1','2') NOT NULL COMMENT '日志类型，''1'' 登陆日志，''2''操作日志',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `ctime` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=550 DEFAULT CHARSET=utf8 COMMENT='后台操作日志';

--
-- 转存表中的数据 `pt_admin_log`
--

-- --------------------------------------------------------

--
-- 表的结构 `pt_adverts`
--

CREATE TABLE IF NOT EXISTS `pt_adverts` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '广告链接类型',
  `goods` varchar(100) DEFAULT NULL COMMENT '商城商品',
  `img` varchar(50) NOT NULL COMMENT '广告图片',
  `adv_url` varchar(100) NOT NULL COMMENT '广告链接地址',
  `ctime` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='广告表';

--
-- 转存表中的数据 `pt_adverts`
--

INSERT INTO `pt_adverts` (`id`, `mid`, `type`, `goods`, `img`, `adv_url`, `ctime`) VALUES
(5, 1, 2, '', '1/2015/0724/1437729011273.jpg', 'http://xingya.m.vsapp.cn/mobile/goods/detail?mid=1&amp;id=47', 1430377889),
(2, 1, 2, '', '1/2015/0724/1437728989517.jpg', 'http://xingya.m.vsapp.cn/mobile/goods/detail?id=49&amp;qid=28', 1430216901),
(6, 1, 2, '', '1/2015/0724/1437727453775.jpg', 'http://xingya.m.vsapp.cn/mobile/goods/detail?mid=1&amp;id=48', 1435212176),
(4, 1, 2, '', '1/2015/0824/1440385736010.jpg', 'http://xingya.m.vsapp.cn/mobile/goods/detail?id=50&amp;qid=31', 1430216946);

-- --------------------------------------------------------

--
-- 表的结构 `pt_answer`
--

CREATE TABLE IF NOT EXISTS `pt_answer` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `active_id` int(10) NOT NULL COMMENT '活动ID',
  `question_id` int(10) NOT NULL COMMENT '题目ID',
  `option_id` varchar(3) NOT NULL COMMENT '所选答案',
  `ip` varchar(15) NOT NULL COMMENT '用户IP',
  `ctime` int(10) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户答题记录';

-- --------------------------------------------------------

--
-- 表的结构 `pt_area_and_shop`
--

CREATE TABLE IF NOT EXISTS `pt_area_and_shop` (
  `id` int(10) unsigned NOT NULL,
  `area_id` int(10) unsigned NOT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='区域ID和门店ID';

-- --------------------------------------------------------

--
-- 表的结构 `pt_area_shop`
--

CREATE TABLE IF NOT EXISTS `pt_area_shop` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `area_name` varchar(30) NOT NULL COMMENT '区域名称',
  `area_manage` varchar(20) NOT NULL COMMENT '区域管理者',
  `ctime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pt_article`
--

CREATE TABLE IF NOT EXISTS `pt_article` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `send_time` int(10) NOT NULL COMMENT '发送时间',
  `img_url` varchar(100) NOT NULL COMMENT '图片',
  `cid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `type` enum('news','wpage','company','case') NOT NULL DEFAULT 'wpage' COMMENT '类型',
  `ctime` int(10) unsigned NOT NULL,
  `other_img` varchar(250) NOT NULL,
  `link` varchar(100) NOT NULL,
  `content_type` tinyint(1) NOT NULL COMMENT '1：图文 2：图片 3：链接',
  `base_set` tinyint(1) NOT NULL COMMENT '是否使用该内容，1：使用 0：否',
  `intro_set` tinyint(1) NOT NULL,
  `img_set` tinyint(1) NOT NULL,
  `link_set` tinyint(1) NOT NULL,
  `num` int(10) NOT NULL COMMENT '点击量'
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='文章表';

--
-- 转存表中的数据 `pt_article`
--


-- --------------------------------------------------------

--
-- 表的结构 `pt_article_cate`
--

CREATE TABLE IF NOT EXISTS `pt_article_cate` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `cname` varchar(50) NOT NULL COMMENT '分类名称',
  `type` enum('news','wpage','lovecar') NOT NULL DEFAULT 'wpage' COMMENT '类型',
  `rank` int(10) NOT NULL DEFAULT '0' COMMENT '从小到大排序'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章分类表';

--
-- 转存表中的数据 `pt_article_cate`
--

INSERT INTO `pt_article_cate` (`id`, `mid`, `cname`, `type`, `rank`) VALUES
(4, 1, '分类一', 'wpage', 0),
(5, 1, '分类二', 'wpage', 0);

-- --------------------------------------------------------

--
-- 表的结构 `pt_ask_log`
--

CREATE TABLE IF NOT EXISTS `pt_ask_log` (
  `ask_id` int(10) unsigned NOT NULL COMMENT 'ID',
  `mid` mediumint(8) unsigned NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `ip` varchar(15) NOT NULL COMMENT 'IP',
  `word` tinytext NOT NULL COMMENT '查询内容',
  `chour` tinyint(2) unsigned NOT NULL COMMENT '消息时间 小时',
  `ctime` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=113668 DEFAULT CHARSET=utf8 COMMENT='微信用户查询日志';

-- --------------------------------------------------------

--
-- 表的结构 `pt_attr`
--

CREATE TABLE IF NOT EXISTS `pt_attr` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '0微商城，1二手车，2金融服务',
  `aname` varchar(20) NOT NULL COMMENT '属性名',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父ID',
  `ctime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pt_autoreply`
--

CREATE TABLE IF NOT EXISTS `pt_autoreply` (
  `id` tinyint(1) unsigned NOT NULL COMMENT 'id',
  `mid` int(11) NOT NULL COMMENT '模块id',
  `auto_type` tinyint(1) unsigned NOT NULL COMMENT '自动回复类型，1：被添加自动回复，2：消息自动回复3：关注回复',
  `reply_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '回复内容类型，1=>''文本'',2=>''图文'',3=>''音频'',4=>''位置地理'''
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='自动回复表';

--
-- 转存表中的数据 `pt_autoreply`
--

INSERT INTO `pt_autoreply` (`id`, `mid`, `auto_type`, `reply_type`) VALUES
(1, 38, 1, 1),
(2, 38, 2, 1),
(3, 39, 1, 1),
(4, 39, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pt_bank`
--

CREATE TABLE IF NOT EXISTS `pt_bank` (
  `id` int(11) NOT NULL,
  `mid` int(11) DEFAULT NULL,
  `bank_name` varchar(20) DEFAULT NULL,
  `account` varchar(20) DEFAULT NULL,
  `ctime` int(20) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_bank`
--

INSERT INTO `pt_bank` (`id`, `mid`, `bank_name`, `account`, `ctime`) VALUES
(1, 1, '中国工商银行', '1231231231231235555', 1429902073),
(4, 1, '农业银行', '12312312312311231223', 1430157781);

-- --------------------------------------------------------

--
-- 表的结构 `pt_banner`
--

CREATE TABLE IF NOT EXISTS `pt_banner` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `img_url` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `rank` int(10) unsigned NOT NULL COMMENT '排序，从小到大排'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='banner表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_barter_refund`
--

CREATE TABLE IF NOT EXISTS `pt_barter_refund` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `type` enum('barter','refund') NOT NULL COMMENT '类型，barter换货，refund退款',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未审核，1审核通过。2拒绝',
  `seller_content` varchar(200) NOT NULL COMMENT '卖家回复内容',
  `buyer_content` varchar(200) NOT NULL COMMENT '买家提交内容',
  `ctime` int(10) unsigned NOT NULL,
  `seller_time` int(10) unsigned NOT NULL COMMENT '卖家回复时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='换货退货表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_card_data`
--

CREATE TABLE IF NOT EXISTS `pt_card_data` (
  `id` int(10) unsigned NOT NULL,
  `fid` int(10) unsigned NOT NULL COMMENT 'favorable主键',
  `passwd` varchar(30) NOT NULL COMMENT '卡号密码',
  `num` varchar(30) NOT NULL COMMENT '卡号编码',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '领取者用户ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未使用，1已使用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='虚拟卡数据';

-- --------------------------------------------------------

--
-- 表的结构 `pt_car_brand`
--

CREATE TABLE IF NOT EXISTS `pt_car_brand` (
  `id` int(11) NOT NULL COMMENT '品牌ID',
  `mid` int(11) NOT NULL COMMENT 'mid',
  `bname` varchar(20) NOT NULL COMMENT '品牌名称',
  `asname` varchar(5) NOT NULL COMMENT '编码代号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='汽车品牌';

-- --------------------------------------------------------

--
-- 表的结构 `pt_car_series`
--

CREATE TABLE IF NOT EXISTS `pt_car_series` (
  `id` int(11) NOT NULL COMMENT '品牌ID',
  `bid` int(11) NOT NULL COMMENT '品牌ID',
  `mid` int(11) NOT NULL COMMENT 'mid',
  `sname` varchar(20) NOT NULL COMMENT '品牌名称',
  `asname` varchar(5) NOT NULL COMMENT '编码代号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='汽车系列';

-- --------------------------------------------------------

--
-- 表的结构 `pt_car_type`
--

CREATE TABLE IF NOT EXISTS `pt_car_type` (
  `id` int(11) NOT NULL COMMENT '品牌ID',
  `bid` int(11) NOT NULL COMMENT '品牌ID',
  `sid` int(11) NOT NULL COMMENT '品牌ID',
  `mid` int(11) NOT NULL COMMENT 'mid',
  `tname` varchar(20) NOT NULL COMMENT '品牌名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='汽车类型';

-- --------------------------------------------------------

--
-- 表的结构 `pt_cbg`
--

CREATE TABLE IF NOT EXISTS `pt_cbg` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `keyword` varchar(50) NOT NULL COMMENT '关键词',
  `keyword_return` varchar(200) NOT NULL DEFAULT '' COMMENT '发送关键词之后的回复',
  `name` varchar(50) NOT NULL COMMENT '活动名称',
  `intro` varchar(200) NOT NULL COMMENT '活动摘要',
  `dj_info` varchar(250) NOT NULL COMMENT '兑奖信息',
  `start_time` int(10) NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) NOT NULL COMMENT '活动结束时间',
  `act_desc` text NOT NULL COMMENT '活动说明',
  `zfcjhf` varchar(250) NOT NULL COMMENT '重复抽奖回复',
  `end_title` varchar(250) NOT NULL COMMENT '活动结束公告主题',
  `end_info` text NOT NULL COMMENT '活动结束说明',
  `prize1_name` varchar(50) NOT NULL COMMENT '一等奖名称',
  `prize1_num` int(10) NOT NULL COMMENT '一等奖数量',
  `prize1_percent` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '中奖概率',
  `prize1_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize1_img` varchar(100) NOT NULL COMMENT '第一个商品的图片',
  `prize2_name` varchar(50) NOT NULL COMMENT '二等奖名称',
  `prize2_num` int(10) NOT NULL COMMENT '二等奖数量',
  `prize2_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize2_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize2_img` varchar(100) NOT NULL COMMENT '第二个商品图片',
  `prize3_name` varchar(50) NOT NULL COMMENT '三等奖名称',
  `prize3_num` int(10) NOT NULL COMMENT '三等奖数量',
  `prize3_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize3_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize3_img` varchar(100) NOT NULL COMMENT '第三个商品图片',
  `prize4_name` varchar(50) NOT NULL COMMENT '四等奖名称',
  `prize4_num` int(10) NOT NULL COMMENT '四等奖数量',
  `prize4_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize4_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize4_img` varchar(100) NOT NULL COMMENT '第四个商品图片',
  `prize5_name` varchar(50) NOT NULL COMMENT '五等奖名称',
  `prize5_num` int(10) NOT NULL COMMENT '五等奖数量',
  `prize5_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize5_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize5_img` varchar(100) NOT NULL COMMENT '第五个商品图片',
  `prize6_name` varchar(50) NOT NULL COMMENT '六等奖名称',
  `prize6_num` int(10) NOT NULL COMMENT '六等奖数量',
  `prize6_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize6_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize6_img` varchar(100) NOT NULL COMMENT '第六个商品图片',
  `moretime` decimal(10,3) NOT NULL DEFAULT '0.000',
  `user_times` int(10) NOT NULL COMMENT '每人最多允许抽奖次数',
  `mobile_name` varchar(50) NOT NULL COMMENT '手机号重命名',
  `prize_num_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0隐藏1显示，抽奖页面是否显示奖品数量',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0禁用，1启用',
  `ctime` int(10) NOT NULL COMMENT '添加时间',
  `view_num` int(10) NOT NULL DEFAULT '0' COMMENT '浏览数',
  `limit_type` varchar(10) NOT NULL DEFAULT 'day' COMMENT 'day每天,week每周,month每月,year每年',
  `limit_times` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '限制次数',
  `user_score` int(5) NOT NULL COMMENT '每次抽奖消耗积分数',
  `bannerimg` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='刮刮卡活动内容';

-- --------------------------------------------------------

--
-- 表的结构 `pt_cbg_count`
--

CREATE TABLE IF NOT EXISTS `pt_cbg_count` (
  `id` int(10) unsigned NOT NULL COMMENT '自增ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `usesecond` int(2) unsigned NOT NULL COMMENT '每个游戏者的使用时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pt_cbg_log`
--

CREATE TABLE IF NOT EXISTS `pt_cbg_log` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `did` int(10) NOT NULL COMMENT '活动id',
  `uid` int(10) NOT NULL,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT 'dzp_prize的对应id为0则未中奖',
  `score` int(5) NOT NULL COMMENT '中奖获得的积分',
  `ctime` int(10) NOT NULL COMMENT '抽奖时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='中奖用户信息';

-- --------------------------------------------------------

--
-- 表的结构 `pt_cbg_prize`
--

CREATE TABLE IF NOT EXISTS `pt_cbg_prize` (
  `id` int(10) NOT NULL,
  `did` int(10) NOT NULL COMMENT '活动ID',
  `sn_num` varchar(25) NOT NULL COMMENT '奖品编号',
  `prize_index` tinyint(2) NOT NULL COMMENT '奖品等级1-6',
  `mid` int(10) NOT NULL,
  `ctime` int(10) NOT NULL COMMENT '添加时间',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '中奖用户',
  `etime` int(10) NOT NULL DEFAULT '0' COMMENT '中奖时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0有效，1被抽中，2奖品已发放',
  `card_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '中奖后的虚拟物ID',
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠方式ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='奖品信息';

-- --------------------------------------------------------

--
-- 表的结构 `pt_column`
--

CREATE TABLE IF NOT EXISTS `pt_column` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `title` varchar(30) NOT NULL COMMENT '栏目标题',
  `english_title` varchar(30) NOT NULL COMMENT '英语栏目标题',
  `url` varchar(100) NOT NULL COMMENT '链接',
  `icon` varchar(50) NOT NULL COMMENT '图标',
  `sort` int(6) NOT NULL DEFAULT '0' COMMENT '栏目排序',
  `ctime` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_comment`
--

CREATE TABLE IF NOT EXISTS `pt_comment` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `did` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `order_num` varchar(30) CHARACTER SET utf8 NOT NULL,
  `ctime` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `pt_comment`
--

INSERT INTO `pt_comment` (`id`, `mid`, `goods_id`, `did`, `name`, `order_num`, `ctime`) VALUES
(6, 1, 5, 4, '骏', '2015042836525', 1430289193),
(4, 1, 16, 5, '陈鹏', '4234234234', 1430218988),
(9, 1, 20, 8, '坤哥2', '143038144200000863', 1430387948),
(10, 1, 20, 4, '骏霖', '143038398700000469', 1430388171),
(11, 1, 41, 76, '莫勇', '143505733900007628', 1435111819);

-- --------------------------------------------------------

--
-- 表的结构 `pt_comment_detail`
--

CREATE TABLE IF NOT EXISTS `pt_comment_detail` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `comment_id` int(10) NOT NULL,
  `did` int(10) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `reply` text NOT NULL COMMENT '后台回复内容',
  `ctime` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_comment_detail`
--

INSERT INTO `pt_comment_detail` (`id`, `mid`, `comment_id`, `did`, `content`, `reply`, `ctime`) VALUES
(7, 1, 1, 4, '天空之旅真爽', '666', 1420281164),
(6, 1, 6, 4, '商家的服务太好了', 'rrrr', 1430289193),
(4, 1, 4, 5, '欠好了', '你机马说什么时候', 1430218988),
(8, 1, 1, 4, '真的爽啊', '废话', 1430291963),
(11, 1, 1, 4, '123', '', 1430294392),
(12, 1, 6, 4, '哈哈哈', 'dfdfdfd', 1430295537),
(13, 1, 6, 4, '123123', '44', 1430364589),
(15, 1, 9, 8, '不好玩', '怎么不好玩了？', 1430387948),
(16, 1, 10, 4, 'dfd ', '啊啊啊啊啊  ', 1430388171),
(17, 1, 6, 4, 'dfsd', '妮妮', 1430388294),
(18, 1, 10, 4, '232323', '666', 1430389866),
(19, 1, 6, 4, '急急急', '', 1430389951),
(20, 1, 9, 8, '455563', '金额 ', 1430389968),
(21, 1, 9, 8, '机号是的吗啡', '', 1430390010),
(22, 1, 11, 76, '空军建军节', '特哈哈\n', 1435111819);

-- --------------------------------------------------------

--
-- 表的结构 `pt_company`
--

CREATE TABLE IF NOT EXISTS `pt_company` (
  `mid` mediumint(8) unsigned NOT NULL COMMENT '公众模块ID',
  `company` varchar(50) NOT NULL COMMENT '企业或个人名称',
  `wx_number` varchar(50) NOT NULL COMMENT '公众帐号',
  `wx_name` varchar(50) NOT NULL COMMENT '公众帐号名称',
  `wx_ysnumber` varchar(50) NOT NULL COMMENT '微信原始帐号',
  `api_token` varchar(50) NOT NULL COMMENT '接口token',
  `api_key` char(32) NOT NULL COMMENT '接口key值',
  `appid` varchar(60) NOT NULL,
  `appsecret` varchar(60) NOT NULL,
  `oauth2_scope` varchar(20) NOT NULL DEFAULT '' COMMENT '高级接口，snsapi_userinfo,snsapi_base ',
  `expire_time` int(10) NOT NULL COMMENT '有效期时间',
  `ctime` int(10) unsigned NOT NULL COMMENT '记录创建时间',
  `disabled` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否禁用，1禁用，0启用',
  `footer_info` varchar(300) NOT NULL COMMENT '企业底部信息',
  `ewm_logo` varchar(100) NOT NULL COMMENT '二维码logo',
  `customer_service` varchar(200) NOT NULL COMMENT '人工客服关键字',
  `msg_token` varchar(250) NOT NULL COMMENT '消息模板tokey',
  `msg_time` int(10) unsigned NOT NULL COMMENT '有效期'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公司';

--
-- 转存表中的数据 `pt_company`
--

-- --------------------------------------------------------

--
-- 表的结构 `pt_company_org`
--

CREATE TABLE IF NOT EXISTS `pt_company_org` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `type` enum('area','province','city','distributor') NOT NULL COMMENT '类型',
  `name` varchar(50) NOT NULL COMMENT '组织名称',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `cate` varchar(5) NOT NULL COMMENT '类别排列'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司组织架构';

-- --------------------------------------------------------

--
-- 表的结构 `pt_config`
--

CREATE TABLE IF NOT EXISTS `pt_config` (
  `mid` int(10) unsigned NOT NULL,
  `key` varchar(50) NOT NULL,
  `val` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配置表';

--
-- 转存表中的数据 `pt_config`
--


-- --------------------------------------------------------

--
-- 表的结构 `pt_coupon`
--

CREATE TABLE IF NOT EXISTS `pt_coupon` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '优惠券名称',
  `amount` decimal(10,2) NOT NULL COMMENT '优惠券金额',
  `condition` decimal(10,2) NOT NULL COMMENT '使用条件',
  `img` varchar(100) NOT NULL COMMENT '优惠券图片',
  `fafang_start` int(10) unsigned NOT NULL COMMENT '发放开始时间',
  `fafang_end` int(10) unsigned NOT NULL COMMENT '发放结束时间',
  `use_start` int(10) unsigned NOT NULL COMMENT '使用开始时间',
  `use_end` int(10) unsigned NOT NULL COMMENT '使用结束时间',
  `desc` text COMMENT '说明',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1暂停，2删除',
  `get_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '领取次数',
  `used_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用次数',
  `ctime` int(10) unsigned NOT NULL COMMENT '记录创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='优惠券表';

--
-- 转存表中的数据 `pt_coupon`
--


-- --------------------------------------------------------

--
-- 表的结构 `pt_custom_menu`
--

CREATE TABLE IF NOT EXISTS `pt_custom_menu` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_custom_menu`
--

INSERT INTO `pt_custom_menu` (`id`, `mid`, `content`) VALUES
(1, 1, 'a:3:{i:0;a:2:{s:4:"name";s:12:"走进星雅";s:10:"sub_button";a:1:{i:1;a:3:{s:4:"name";s:12:"最新资讯";s:4:"type";s:4:"view";s:3:"url";s:63:"http://xingya.vsapp.cn/index.php/mobile/main/article_list?mid=1";}}}i:1;a:3:{s:4:"name";s:12:"星雅商城";s:4:"type";s:4:"view";s:3:"url";s:56:"http://xingya.vsapp.cn/index.php/mobile/goods/cate?mid=1";}i:2;a:2:{s:4:"name";s:12:"星雅服务";s:10:"sub_button";a:3:{i:0;a:3:{s:4:"name";s:12:"会员中心";s:4:"type";s:4:"view";s:3:"url";s:55:"http://xingya.vsapp.cn/index.php/mobile/user/zone?mid=1";}i:1;a:3:{s:4:"name";s:12:"我的订单";s:4:"type";s:4:"view";s:3:"url";s:58:"http://xingya.vsapp.cn/index.php/mobile/user/myorder?mid=1";}i:2;a:3:{s:4:"name";s:12:"我的积分";s:4:"type";s:4:"view";s:3:"url";s:58:"http://xingya.vsapp.cn/index.php/mobile/user/myscore?mid=1";}}}}');

-- --------------------------------------------------------

--
-- 表的结构 `pt_dealer`
--

CREATE TABLE IF NOT EXISTS `pt_dealer` (
  `id` int(10) unsigned NOT NULL,
  `area` varchar(3) NOT NULL COMMENT '大区对应码',
  `province` varchar(3) NOT NULL COMMENT '省对应码',
  `city` varchar(3) NOT NULL COMMENT '市对应码',
  `dealer` varchar(30) NOT NULL COMMENT '经销商名称'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='经销商表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_dy_activity`
--

CREATE TABLE IF NOT EXISTS `pt_dy_activity` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '题目',
  `type` tinyint(1) NOT NULL COMMENT '0单选题1多选题2问答题',
  `option_1` varchar(255) NOT NULL COMMENT '选项1',
  `option1_num` int(5) NOT NULL COMMENT '选项1支持率',
  `option_2` varchar(255) NOT NULL COMMENT '选项2',
  `option2_num` int(5) NOT NULL COMMENT '选项2支持率',
  `option_3` varchar(255) NOT NULL COMMENT '选项3',
  `option3_num` int(5) NOT NULL COMMENT '选项3支持率',
  `option_4` varchar(255) NOT NULL COMMENT '选项4',
  `option4_num` int(5) NOT NULL COMMENT '选项4支持率',
  `option_5` varchar(255) NOT NULL COMMENT '选项5',
  `option5_num` int(5) NOT NULL COMMENT '选项5支持率',
  `option_6` varchar(255) NOT NULL COMMENT '选项6',
  `option6_num` int(5) NOT NULL COMMENT '选项6支持率',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='调研活动';

-- --------------------------------------------------------

--
-- 表的结构 `pt_dy_join`
--

CREATE TABLE IF NOT EXISTS `pt_dy_join` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `aid` int(10) NOT NULL COMMENT '问答题id',
  `content` text NOT NULL COMMENT '题目对应的选项/问答题的答案，使用|||隔开',
  `take_in` int(5) NOT NULL DEFAULT '0' COMMENT '0未接纳大于0接纳赠送的积分',
  `ctime` int(10) NOT NULL COMMENT '调研时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户参与调研表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_dy_set`
--

CREATE TABLE IF NOT EXISTS `pt_dy_set` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `score` int(5) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='调研设置';

-- --------------------------------------------------------

--
-- 表的结构 `pt_dzp`
--

CREATE TABLE IF NOT EXISTS `pt_dzp` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `keyword` varchar(50) NOT NULL COMMENT '关键词',
  `keyword_return` varchar(200) NOT NULL DEFAULT '' COMMENT '发送关键词之后的回复',
  `name` varchar(50) NOT NULL COMMENT '活动名称',
  `intro` varchar(200) NOT NULL COMMENT '活动摘要',
  `dj_info` varchar(250) NOT NULL COMMENT '兑奖信息',
  `start_time` int(10) NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) NOT NULL COMMENT '活动结束时间',
  `act_desc` text NOT NULL COMMENT '活动说明',
  `zfcjhf` varchar(250) NOT NULL COMMENT '重复抽奖回复',
  `end_title` varchar(250) NOT NULL COMMENT '活动结束公告主题',
  `end_info` text NOT NULL COMMENT '活动结束说明',
  `prize1_name` varchar(50) NOT NULL COMMENT '一等奖名称',
  `prize1_num` int(10) NOT NULL COMMENT '一等奖数量',
  `prize1_percent` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '中奖概率',
  `prize1_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize2_name` varchar(50) NOT NULL COMMENT '二等奖名称',
  `prize2_num` int(10) NOT NULL COMMENT '二等奖数量',
  `prize2_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize2_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize3_name` varchar(50) NOT NULL COMMENT '三等奖名称',
  `prize3_num` int(10) NOT NULL COMMENT '三等奖数量',
  `prize3_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize3_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize4_name` varchar(50) NOT NULL COMMENT '四等奖名称',
  `prize4_num` int(10) NOT NULL COMMENT '四等奖数量',
  `prize4_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize4_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `moretime` decimal(10,3) NOT NULL DEFAULT '0.000',
  `user_times` int(10) NOT NULL COMMENT '每人最多允许抽奖次数',
  `mobile_name` varchar(50) NOT NULL COMMENT '手机号重命名',
  `prize_num_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0隐藏1显示，抽奖页面是否显示奖品数量',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0禁用，1启用',
  `ctime` int(10) NOT NULL COMMENT '添加时间',
  `view_num` int(10) NOT NULL DEFAULT '0' COMMENT '浏览数',
  `limit_type` varchar(10) NOT NULL DEFAULT 'day' COMMENT 'day每天,week每周,month每月,year每年',
  `limit_times` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '限制次数',
  `user_score` int(5) NOT NULL COMMENT '每次抽奖消耗积分数',
  `bannerimg` varchar(200) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='刮刮卡活动内容';

--
-- 转存表中的数据 `pt_dzp`
--

-- --------------------------------------------------------

--
-- 表的结构 `pt_dzp_log`
--

CREATE TABLE IF NOT EXISTS `pt_dzp_log` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `did` int(10) NOT NULL COMMENT '活动id',
  `uid` int(10) NOT NULL,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT 'dzp_prize的对应id为0则未中奖',
  `score` int(5) NOT NULL COMMENT '中奖获得的积分',
  `ctime` int(10) NOT NULL COMMENT '抽奖时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='中奖用户信息';

-- --------------------------------------------------------

--
-- 表的结构 `pt_dzp_prize`
--

CREATE TABLE IF NOT EXISTS `pt_dzp_prize` (
  `id` int(10) NOT NULL,
  `did` int(10) NOT NULL COMMENT '活动ID',
  `sn_num` varchar(25) NOT NULL COMMENT '奖品编号',
  `prize_index` tinyint(2) NOT NULL COMMENT '奖品等级1-6',
  `mid` int(10) NOT NULL,
  `ctime` int(10) NOT NULL COMMENT '添加时间',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '中奖用户',
  `etime` int(10) NOT NULL DEFAULT '0' COMMENT '中奖时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0有效，1被抽中，2奖品已发放',
  `card_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '中奖后的虚拟物ID',
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠方式ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='奖品信息';

-- --------------------------------------------------------

--
-- 表的结构 `pt_exchange`
--

CREATE TABLE IF NOT EXISTS `pt_exchange` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '兑换商品id',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1未发货，2已发货',
  `kd_num` varchar(20) NOT NULL COMMENT '快递单号',
  `logistics` varchar(10) NOT NULL COMMENT '快递公司',
  `kd_receiver` varchar(20) NOT NULL COMMENT '收货人姓名',
  `kd_address` varchar(200) NOT NULL COMMENT '收货人地址',
  `kd_mobile` varchar(20) NOT NULL COMMENT '收货人电话',
  `ctime` int(10) unsigned NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑奖信息表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_favorable`
--

CREATE TABLE IF NOT EXISTS `pt_favorable` (
  `fid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1一券一码',
  `atype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动类型',
  `cost` decimal(10,2) NOT NULL COMMENT '折扣',
  `min_charge` decimal(10,2) NOT NULL COMMENT '最低消费',
  `start_time` int(10) unsigned NOT NULL COMMENT '有效期开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '有效期结束时间',
  `fetch_limit` smallint(4) unsigned NOT NULL DEFAULT '1' COMMENT '领取限制',
  `intro` text NOT NULL COMMENT '使用说明'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠方式';

-- --------------------------------------------------------

--
-- 表的结构 `pt_footer_menu`
--

CREATE TABLE IF NOT EXISTS `pt_footer_menu` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `menu_name` varchar(40) NOT NULL COMMENT '底部菜单名',
  `menu_url` varchar(100) NOT NULL COMMENT '底部菜单链接',
  `rank` int(10) unsigned NOT NULL COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='底部菜单 ';

-- --------------------------------------------------------

--
-- 表的结构 `pt_ggk`
--

CREATE TABLE IF NOT EXISTS `pt_ggk` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `keyword` varchar(50) NOT NULL COMMENT '关键词',
  `keyword_return` varchar(200) NOT NULL DEFAULT '' COMMENT '发送关键词之后的回复',
  `name` varchar(50) NOT NULL COMMENT '活动名称',
  `intro` varchar(200) NOT NULL COMMENT '活动摘要',
  `dj_info` varchar(250) NOT NULL COMMENT '兑奖信息',
  `start_time` int(10) NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) NOT NULL COMMENT '活动结束时间',
  `act_desc` text NOT NULL COMMENT '活动说明',
  `zfcjhf` varchar(250) NOT NULL COMMENT '重复抽奖回复',
  `end_title` varchar(250) NOT NULL COMMENT '活动结束公告主题',
  `end_info` text NOT NULL COMMENT '活动结束说明',
  `prize1_name` varchar(50) NOT NULL COMMENT '一等奖名称',
  `prize1_num` int(10) NOT NULL COMMENT '一等奖数量',
  `prize1_percent` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '中奖概率',
  `prize1_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize2_name` varchar(50) NOT NULL COMMENT '二等奖名称',
  `prize2_num` int(10) NOT NULL COMMENT '二等奖数量',
  `prize2_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize2_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize3_name` varchar(50) NOT NULL COMMENT '三等奖名称',
  `prize3_num` int(10) NOT NULL COMMENT '三等奖数量',
  `prize3_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize3_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `prize4_name` varchar(50) NOT NULL COMMENT '四等奖名称',
  `prize4_num` int(10) NOT NULL COMMENT '四等奖数量',
  `prize4_percent` decimal(10,3) NOT NULL DEFAULT '0.000',
  `prize4_type` int(10) NOT NULL DEFAULT '0' COMMENT '0实物，大于0虚拟物品',
  `moretime` decimal(10,3) NOT NULL DEFAULT '0.000',
  `user_times` int(10) NOT NULL COMMENT '每人最多允许抽奖次数',
  `mobile_name` varchar(50) NOT NULL COMMENT '手机号重命名',
  `prize_num_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0隐藏1显示，抽奖页面是否显示奖品数量',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0禁用，1启用',
  `ctime` int(10) NOT NULL COMMENT '添加时间',
  `view_num` int(10) NOT NULL DEFAULT '0' COMMENT '浏览数',
  `limit_type` varchar(10) NOT NULL DEFAULT 'day' COMMENT 'day每天,week每周,month每月,year每年',
  `limit_times` mediumint(8) unsigned NOT NULL DEFAULT '1' COMMENT '限制次数',
  `user_score` int(5) NOT NULL COMMENT '每次抽奖消耗积分数',
  `bannerimg` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='刮刮卡活动内容';

-- --------------------------------------------------------

--
-- 表的结构 `pt_ggk_log`
--

CREATE TABLE IF NOT EXISTS `pt_ggk_log` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `did` int(10) NOT NULL COMMENT '活动id',
  `uid` int(10) NOT NULL,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT 'dzp_prize的对应id为0则未中奖',
  `score` int(5) NOT NULL COMMENT '中奖获得的积分',
  `ctime` int(10) NOT NULL COMMENT '抽奖时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='中奖用户信息';

-- --------------------------------------------------------

--
-- 表的结构 `pt_ggk_prize`
--

CREATE TABLE IF NOT EXISTS `pt_ggk_prize` (
  `id` int(10) NOT NULL,
  `did` int(10) NOT NULL COMMENT '活动ID',
  `sn_num` varchar(25) NOT NULL COMMENT '奖品编号',
  `prize_index` tinyint(2) NOT NULL COMMENT '奖品等级1-6',
  `mid` int(10) NOT NULL,
  `ctime` int(10) NOT NULL COMMENT '添加时间',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '中奖用户',
  `etime` int(10) NOT NULL DEFAULT '0' COMMENT '中奖时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0有效，1被抽中，2奖品已发放',
  `card_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '中奖后的虚拟物ID',
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠方式ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='刮刮卡奖品信息';

-- --------------------------------------------------------

--
-- 表的结构 `pt_goods`
--

CREATE TABLE IF NOT EXISTS `pt_goods` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `final_payment` decimal(10,2) NOT NULL COMMENT '尾款',
  `deduct_score` tinyint(1) NOT NULL,
  `days` smallint(4) NOT NULL,
  `from_place` varchar(50) NOT NULL,
  `to_place` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL DEFAULT '-1',
  `city` varchar(50) NOT NULL DEFAULT '-1',
  `depart_type` tinyint(1) NOT NULL,
  `depart_date` varchar(200) DEFAULT NULL,
  `cover` varchar(100) NOT NULL,
  `goods_img` text,
  `intro` text,
  `fee_include` text,
  `fee_not_include` text,
  `other` text,
  `ctime` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_goods`
--


-- --------------------------------------------------------

--
-- 表的结构 `pt_goods_cate`
--

CREATE TABLE IF NOT EXISTS `pt_goods_cate` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `images_url` varchar(100) NOT NULL,
  `pid` int(10) NOT NULL DEFAULT '0',
  `rank` int(10) NOT NULL DEFAULT '0',
  `ctime` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_goods_cate`
--

INSERT INTO `pt_goods_cate` (`id`, `mid`, `cname`, `images_url`, `pid`, `rank`, `ctime`) VALUES
(18, 1, '巴厘岛', '', 0, 0, 0),
(19, 1, '泰国', '', 0, 0, 0),
(20, 1, '韩国', '', 0, 0, 0),
(21, 1, '普吉岛', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `pt_goods_gi_cate`
--

CREATE TABLE IF NOT EXISTS `pt_goods_gi_cate` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(64) NOT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `first_letter` char(1) NOT NULL DEFAULT '',
  `en_name` varchar(32) NOT NULL DEFAULT '' COMMENT '英文名',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `weight` smallint(6) NOT NULL DEFAULT '1' COMMENT '权重'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='线路的地理类别';

-- --------------------------------------------------------

--
-- 表的结构 `pt_goods_new`
--

CREATE TABLE IF NOT EXISTS `pt_goods_new` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL COMMENT '线路名称',
  `gi_cate` smallint(6) NOT NULL COMMENT '所属地理分类',
  `goods_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '线路所属类型，1为先旅游后付费，2为自由行，3为特惠游',
  `price` int(11) NOT NULL COMMENT '价格，有些路线是有价格范围的，则表示最低价格',
  `final_fee` int(11) NOT NULL DEFAULT '0' COMMENT '尾款',
  `score` varchar(5) NOT NULL DEFAULT '10' COMMENT '积分或等级',
  `marking_pic` varchar(256) NOT NULL DEFAULT '' COMMENT '打分说明',
  `include_fee` varchar(1024) NOT NULL DEFAULT '' COMMENT '费用包含',
  `exclude` varchar(1024) NOT NULL DEFAULT '' COMMENT '费用不包含',
  `days_num` tinyint(4) NOT NULL COMMENT '白天数',
  `nights_num` tinyint(4) NOT NULL COMMENT '黑夜数',
  `ticket_and_visa` varchar(1024) NOT NULL DEFAULT '' COMMENT '机票与签证说明',
  `services_note` varchar(1024) NOT NULL DEFAULT '' COMMENT '服务流程说明',
  `services_promise` varchar(1024) NOT NULL DEFAULT '' COMMENT '服务承诺',
  `buy_tips` varchar(1024) NOT NULL DEFAULT '' COMMENT '申购须知',
  `tips` varchar(1024) NOT NULL DEFAULT '' COMMENT '特别提示',
  `ctime` int(11) NOT NULL COMMENT '创建时间',
  `is_big_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是大分类路线，1表示是',
  `belong_goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '如果是大分类路线中的小路线，则表示所属的大分类路线的id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='路线产品表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_goods_pics`
--

CREATE TABLE IF NOT EXISTS `pt_goods_pics` (
  `id` int(11) NOT NULL,
  `server` varchar(16) NOT NULL DEFAULT 'pic_server1' COMMENT '图片所在服务器名称，配置文件中要配置',
  `uri` varchar(256) NOT NULL COMMENT '图片路径',
  `note` varchar(512) NOT NULL DEFAULT '' COMMENT '图片描述',
  `goods_id` int(11) NOT NULL COMMENT '图片所属路线',
  `weight` smallint(6) NOT NULL DEFAULT '1' COMMENT '图片排序的权重',
  `ctime` int(11) NOT NULL COMMENT '图片提交的时间',
  `type` smallint(6) NOT NULL COMMENT '路线的图片类型'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='路线的图片表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_goods_price`
--

CREATE TABLE IF NOT EXISTS `pt_goods_price` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '线路ID',
  `price` int(11) NOT NULL COMMENT '成人价格',
  `kid_price` int(11) NOT NULL DEFAULT '0' COMMENT '儿童价格',
  `go_date` char(8) NOT NULL COMMENT '出发日期20150808格式'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='线路按日期价格表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_goods_xingcheng`
--

CREATE TABLE IF NOT EXISTS `pt_goods_xingcheng` (
  `id` int(11) NOT NULL,
  `googs_id` int(11) NOT NULL COMMENT '所属的线路id',
  `day` tinyint(3) unsigned NOT NULL COMMENT '第几天',
  `scenes` varchar(128) NOT NULL DEFAULT '' COMMENT '景点，多个景点用|分开，有顺序',
  `addr` varchar(256) NOT NULL DEFAULT '' COMMENT '当天所在地点，自由行用到',
  `note` varchar(512) NOT NULL DEFAULT '' COMMENT '当天的文字描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='线路行程表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_hp_log`
--

CREATE TABLE IF NOT EXISTS `pt_hp_log` (
  `id` int(11) NOT NULL COMMENT '合拍id',
  `mid` int(11) NOT NULL COMMENT '模型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `starname` varchar(10) NOT NULL COMMENT '合拍的明星',
  `img_url` varchar(255) NOT NULL COMMENT '合拍图片地址',
  `similarity` int(11) NOT NULL COMMENT '相似度'
) ENGINE=MyISAM AUTO_INCREMENT=2348 DEFAULT CHARSET=utf8 COMMENT='合拍记录';

--
-- 转存表中的数据 `pt_hp_log`
--

-- --------------------------------------------------------

--
-- 表的结构 `pt_huoyue_user`
--

CREATE TABLE IF NOT EXISTS `pt_huoyue_user` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `last_time` int(11) NOT NULL COMMENT '最后回复时间',
  `all_nums` int(11) NOT NULL DEFAULT '0' COMMENT '总回复次数',
  `ctime` int(11) NOT NULL COMMENT '第1次回复时间'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='活跃用户记录表';

--
-- 转存表中的数据 `pt_huoyue_user`
--

INSERT INTO `pt_huoyue_user` (`id`, `mid`, `uid`, `last_time`, `all_nums`, `ctime`) VALUES
(1, 38, 77828, 1416814905, 3, 1416814681);

-- --------------------------------------------------------

--
-- 表的结构 `pt_image_text`
--

CREATE TABLE IF NOT EXISTS `pt_image_text` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `image_text` text NOT NULL COMMENT '序列化图片标题',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `media_id` varchar(100) NOT NULL COMMENT '多图文上传后的标识',
  `ctime` int(10) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `pt_keyword_autoreply`
--

CREATE TABLE IF NOT EXISTS `pt_keyword_autoreply` (
  `kar_id` int(11) NOT NULL COMMENT 'ID',
  `mid` int(11) NOT NULL COMMENT '公众模块ID',
  `kar_name` varchar(100) NOT NULL COMMENT '名称',
  `keyword` varchar(200) DEFAULT NULL COMMENT '关键词，如:|A|B|C|...',
  `is_position` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否以地理位置为关键字，0否，1是',
  `type` tinyint(4) NOT NULL COMMENT '类别：1文本，2图文，3音频，4地理位置',
  `cate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0自动回复，1答题，2自定义菜单',
  `ctime` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COMMENT='关键词自动回复表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_keyword_autoreply_position`
--

CREATE TABLE IF NOT EXISTS `pt_keyword_autoreply_position` (
  `kap_id` int(11) NOT NULL COMMENT 'ID',
  `mid` mediumint(8) unsigned NOT NULL,
  `kar_id` int(11) NOT NULL COMMENT '关键词自动回复id,为0则是消息自动回复的数据',
  `f_imgurl` varchar(200) NOT NULL COMMENT '封面图片路径',
  `f_title` varchar(200) NOT NULL COMMENT '封面标题',
  `link` varchar(200) NOT NULL COMMENT '该自动回复链接',
  `longitude` float NOT NULL COMMENT '经度',
  `latitude` float NOT NULL COMMENT '纬度'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='关键词自动回复内容表（地理）';

-- --------------------------------------------------------

--
-- 表的结构 `pt_keyword_autoreply_pttext`
--

CREATE TABLE IF NOT EXISTS `pt_keyword_autoreply_pttext` (
  `kapt_id` int(11) NOT NULL COMMENT 'ID',
  `mid` mediumint(8) unsigned NOT NULL,
  `kar_id` int(11) NOT NULL COMMENT '关键词自动回复id,为0则是消息自动回复的数据',
  `f_imgurl` varchar(200) NOT NULL COMMENT '封面图片路径',
  `f_title` varchar(200) NOT NULL COMMENT '封面标题',
  `description` text NOT NULL COMMENT '消息图文回复内容',
  `link` varchar(200) NOT NULL COMMENT '该内容链接'
) ENGINE=MyISAM AUTO_INCREMENT=752 DEFAULT CHARSET=utf8 COMMENT='关键词自动回复内容表（图文）';

-- --------------------------------------------------------

--
-- 表的结构 `pt_keyword_autoreply_text`
--

CREATE TABLE IF NOT EXISTS `pt_keyword_autoreply_text` (
  `kart_id` int(11) NOT NULL COMMENT 'ID',
  `mid` mediumint(8) unsigned NOT NULL,
  `kar_id` int(11) NOT NULL COMMENT '关键词自动回复id,为0则是消息自动回复的数据',
  `content` text NOT NULL COMMENT '内容'
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COMMENT='关键词自动回复内容表（文本）';

-- --------------------------------------------------------

--
-- 表的结构 `pt_keyword_autoreply_video`
--

CREATE TABLE IF NOT EXISTS `pt_keyword_autoreply_video` (
  `kav_id` int(11) NOT NULL COMMENT 'ID',
  `mid` mediumint(8) unsigned NOT NULL,
  `kar_id` int(11) NOT NULL COMMENT '关键词自动回复id,为0则是消息自动回复的数据',
  `mp3_url` varchar(200) NOT NULL COMMENT '图片路径'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='关键词自动回复内容表（音频）';

-- --------------------------------------------------------

--
-- 表的结构 `pt_massive`
--

CREATE TABLE IF NOT EXISTS `pt_massive` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `type` enum('mpnews','text') NOT NULL COMMENT '1文本2单图文3多图文',
  `shop_id` int(10) unsigned NOT NULL COMMENT '门店ID',
  `cate` tinyint(1) NOT NULL COMMENT '1即时发送2定时发送',
  `content` text NOT NULL COMMENT '群发内容',
  `ftime` int(10) NOT NULL COMMENT '发送时间',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `pt_massive_imgtext`
--

CREATE TABLE IF NOT EXISTS `pt_massive_imgtext` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `massive_id` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1单图文2多图文',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `imgurl` varchar(100) NOT NULL COMMENT '图片地址',
  `link` varchar(100) NOT NULL COMMENT '链接',
  `desc` mediumtext NOT NULL COMMENT '描述',
  `rank` int(10) unsigned NOT NULL COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信自动回复-图文';

-- --------------------------------------------------------

--
-- 表的结构 `pt_massive_text`
--

CREATE TABLE IF NOT EXISTS `pt_massive_text` (
  `massive_id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `content` text NOT NULL COMMENT '回复内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='群发-文本';

-- --------------------------------------------------------

--
-- 表的结构 `pt_media`
--

CREATE TABLE IF NOT EXISTS `pt_media` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1图片2音频',
  `url` varchar(100) NOT NULL COMMENT '路径',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `name` varchar(50) NOT NULL COMMENT '名字',
  `media_id` varchar(100) NOT NULL COMMENT '媒体文件标识',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='关注回复上传的图片和音频表';

--
-- 转存表中的数据 `pt_media`
--

INSERT INTO `pt_media` (`id`, `mid`, `type`, `url`, `size`, `name`, `media_id`, `ctime`) VALUES
(56, 1, 1, '1/2015/0428/1430212833819.jpg', 48633, '', '', 1430212833),
(59, 1, 1, '1/2015/0522/1432291296519.png', 1223, '', '', 1432291296),
(60, 1, 1, '1/2015/0709/1436410478868.jpg', 136343, '', '', 1436410480),
(61, 1, 1, '1/2015/0709/1436410483565.jpg', 126038, '', '', 1436410485),
(62, 1, 1, '1/2015/0709/1436410493108.jpg', 190373, '', '', 1436410494),
(63, 1, 1, '1/2015/0709/1436410498369.jpg', 159949, '测试图片', '', 1436410499),
(64, 1, 1, '1/2015/0709/1436421830306.jpg', 165976, '1/2015/0709/1436421830306.jpg', '', 1436421831);

-- --------------------------------------------------------

--
-- 表的结构 `pt_model`
--

CREATE TABLE IF NOT EXISTS `pt_model` (
  `mid` mediumint(8) unsigned NOT NULL COMMENT '公众模块ID',
  `m_name` varchar(100) NOT NULL COMMENT '公众账号名称',
  `m_imgurl` varchar(200) NOT NULL COMMENT '图片logo',
  `company` varchar(50) NOT NULL COMMENT '企业名称',
  `wx_number` varchar(50) NOT NULL COMMENT '公众帐号',
  `wx_password` varchar(32) NOT NULL COMMENT '微信后台登录密码',
  `wx_name` varchar(100) NOT NULL COMMENT '公众帐号名称',
  `wx_ysnumber` varchar(50) NOT NULL COMMENT '微信原始帐号',
  `api_url` varchar(200) NOT NULL COMMENT '接口地址',
  `api_token` varchar(50) NOT NULL COMMENT '接口tokey',
  `bannerimg` text NOT NULL COMMENT 'banner图片',
  `bannerurl` text NOT NULL COMMENT '跳转链接',
  `wxmenu_appid` varchar(50) NOT NULL,
  `wxmenu_appsecret` varchar(50) NOT NULL,
  `access_token` varchar(512) NOT NULL COMMENT 'access_token',
  `atime` int(11) NOT NULL COMMENT 'access_token生成时间',
  `customer_service` varchar(200) NOT NULL COMMENT '转接人工客服',
  `attention_msg` varchar(200) NOT NULL COMMENT '企业底部信息',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `bg_color` tinyint(1) NOT NULL COMMENT '首页栏目背景颜色值',
  `st_color` varchar(6) NOT NULL DEFAULT 'fff' COMMENT '竖条色值',
  `disabled` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否禁用，1禁用，0启用'
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='公众模块';

--
-- 转存表中的数据 `pt_model`
--

INSERT INTO `pt_model` (`mid`, `m_name`, `m_imgurl`, `company`, `wx_number`, `wx_password`, `wx_name`, `wx_ysnumber`, `api_url`, `api_token`, `bannerimg`, `bannerurl`, `wxmenu_appid`, `wxmenu_appsecret`, `access_token`, `atime`, `customer_service`, `attention_msg`, `url`, `bg_color`, `st_color`, `disabled`) VALUES
(38, '合拍', '', '合拍', 'hp', '', '', '', 'http://hp.p.vsapp.cn/index.php/api/', 'vsapp', '[]', '["","",""]', '', '', '', 0, '人工客服|customer_service', '', '1411/1417088095864.mp3', 0, '', '0'),
(39, '唯品会', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 'fff', '0'),
(40, '雅兰', '', '雅兰公司', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 'fff', '0');

-- --------------------------------------------------------

--
-- 表的结构 `pt_mp3`
--

CREATE TABLE IF NOT EXISTS `pt_mp3` (
  `mp3_id` int(11) NOT NULL COMMENT 'ID',
  `mid` int(11) NOT NULL COMMENT '公众模块ID',
  `mp3_name` varchar(100) NOT NULL COMMENT '名称',
  `mp3_url` varchar(200) NOT NULL COMMENT '路径',
  `mp3_size` int(11) NOT NULL COMMENT '大小',
  `ctime` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='音频表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_my_prize`
--

CREATE TABLE IF NOT EXISTS `pt_my_prize` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1签到2积分兑换3碎片兑换奖品',
  `prize_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '奖品类型：0实物1碎片',
  `prize_id` int(5) NOT NULL COMMENT '奖品id',
  `num` tinyint(2) NOT NULL COMMENT '个数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1未发送2已发送3已领取',
  `ctime` int(10) NOT NULL COMMENT '获取时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='我的奖品';

-- --------------------------------------------------------

--
-- 表的结构 `pt_news`
--

CREATE TABLE IF NOT EXISTS `pt_news` (
  `news_id` int(11) unsigned NOT NULL,
  `news_cate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0普通新闻1促销新闻',
  `title` varchar(60) DEFAULT NULL,
  `content` text,
  `image_url` varchar(255) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `rank` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `ctime` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pt_news_cate`
--

CREATE TABLE IF NOT EXISTS `pt_news_cate` (
  `cid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `cname` varchar(50) NOT NULL COMMENT '类别名称',
  `rank` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻类别';

-- --------------------------------------------------------

--
-- 表的结构 `pt_news_read`
--

CREATE TABLE IF NOT EXISTS `pt_news_read` (
  `id` int(11) NOT NULL COMMENT '主键索引',
  `mid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `news_id` int(11) NOT NULL COMMENT '已读新闻id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='已读新闻';

-- --------------------------------------------------------

--
-- 表的结构 `pt_online_message`
--

CREATE TABLE IF NOT EXISTS `pt_online_message` (
  `id` int(10) NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `content` text NOT NULL COMMENT '内容',
  `reply_num` int(10) unsigned NOT NULL COMMENT '回复数',
  `is_reply` int(1) NOT NULL DEFAULT '1' COMMENT '1为未处理，2为已处理',
  `ctime` int(10) unsigned NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='在线留言回复表';

--
-- 转存表中的数据 `pt_online_message`
--

INSERT INTO `pt_online_message` (`id`, `mid`, `uid`, `content`, `reply_num`, `is_reply`, `ctime`) VALUES
(15, 1, 1, '测试一下', 6, 1, 1429154066),
(16, 1, 1, '撒旦法撒旦法斯蒂芬艾斯', 1, 1, 1429027200),
(17, 1, 3, '撒旦法撒旦法撒旦法撒旦发送到发送到', 0, 2, 1428027200),
(18, 1, 1, '我我我', 0, 1, 1429602870),
(19, 1, 1, '我要评论一下', 0, 1, 1430288603);

-- --------------------------------------------------------

--
-- 表的结构 `pt_online_reply`
--

CREATE TABLE IF NOT EXISTS `pt_online_reply` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT '用户',
  `reply_uid` int(10) unsigned NOT NULL COMMENT '被回复人',
  `message_id` int(10) unsigned NOT NULL COMMENT '所属留言ID',
  `content` text NOT NULL COMMENT '回复内容',
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所回复上级id',
  `is_admin` int(1) NOT NULL DEFAULT '0' COMMENT '1为管理员，0为用户',
  `is_read` int(1) NOT NULL DEFAULT '0' COMMENT '1为已读，0未读',
  `ctime` int(10) unsigned NOT NULL COMMENT '时间'
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='留言回复表';

--
-- 转存表中的数据 `pt_online_reply`
--

INSERT INTO `pt_online_reply` (`id`, `mid`, `uid`, `reply_uid`, `message_id`, `content`, `fid`, `is_admin`, `is_read`, `ctime`) VALUES
(64, 1, 3, 1, 15, '回复', 0, 1, 1, 1429154239),
(66, 1, 1, 3, 15, '123', 0, 0, 1, 1429601212),
(67, 1, 3, 1, 15, '大幅度', 66, 1, 1, 1429601990),
(68, 1, 3, 1, 15, '对数函数', 0, 1, 1, 1429602108),
(69, 1, 3, 1, 15, '0000', 0, 1, 1, 1429602174),
(70, 1, 3, 1, 15, '地方', 0, 1, 1, 1429602316),
(71, 1, 1, 3, 15, '2dd', 0, 0, 1, 1429602353),
(72, 1, 1, 3, 15, '2dd', 0, 0, 1, 1429602353),
(73, 1, 1, 3, 15, '2dd', 0, 0, 1, 1429602353),
(74, 1, 3, 1, 16, '大夫山', 0, 1, 1, 1429602527),
(75, 1, 1, 3, 16, '333', 0, 0, 1, 1429602559);

-- --------------------------------------------------------

--
-- 表的结构 `pt_order`
--

CREATE TABLE IF NOT EXISTS `pt_order` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `qudao_id` int(10) NOT NULL DEFAULT '0',
  `qudao_name` varchar(50) NOT NULL COMMENT '渠道名称',
  `qudao_deduct` decimal(10,2) NOT NULL COMMENT '渠道提成',
  `qudao_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '渠道提成金额',
  `order_num` varchar(25) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `buy_num` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `from_place` varchar(50) NOT NULL,
  `to_place` varchar(50) NOT NULL,
  `days` smallint(4) NOT NULL,
  `did` int(10) NOT NULL,
  `buyer_name` varchar(20) NOT NULL,
  `buyer_phone` varchar(20) NOT NULL,
  `buyer_idcard` varchar(18) NOT NULL,
  `jcode` varchar(16) NOT NULL,
  `order_time` int(10) NOT NULL,
  `order_date` date NOT NULL COMMENT '下单日期',
  `paid_time` int(10) NOT NULL DEFAULT '0',
  `expired_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `refund_reason` text NOT NULL,
  `refund_type` tinyint(1) NOT NULL,
  `refund_account` text NOT NULL,
  `refund_ctime` int(10) NOT NULL COMMENT '退款申请时间',
  `refund_etime` int(10) NOT NULL COMMENT '退款完成时间',
  `score_reduce` mediumint(8) NOT NULL DEFAULT '0' COMMENT '抵扣了多少积分',
  `score_add` mediumint(8) NOT NULL DEFAULT '0' COMMENT '赠送了多少积分'
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_order`
--

-- --------------------------------------------------------

--
-- 表的结构 `pt_payment`
--

CREATE TABLE IF NOT EXISTS `pt_payment` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `order_num` varchar(50) NOT NULL COMMENT '订单号',
  `amount` decimal(10,2) NOT NULL COMMENT '交易金额',
  `did` int(10) unsigned NOT NULL COMMENT '付款人ID',
  `name` varchar(20) NOT NULL COMMENT '付款人名称',
  `ctime` int(10) unsigned NOT NULL COMMENT '发起支付时间',
  `etime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成支付时间',
  `pay_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1支付宝，2财富通，3微信支付，4银联',
  `trade_no` varchar(50) NOT NULL COMMENT '交易号',
  `trade_status` varchar(20) NOT NULL COMMENT '交易状态',
  `notify_id` varchar(200) NOT NULL COMMENT '通知ID'
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付记录';

--
-- 转存表中的数据 `pt_payment`
--

-- --------------------------------------------------------

--
-- 表的结构 `pt_pending_member`
--

CREATE TABLE IF NOT EXISTS `pt_pending_member` (
  `id` int(11) NOT NULL,
  `mid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `car_num_pro` varchar(5) NOT NULL COMMENT '车牌省简称',
  `car_num_city` varchar(5) NOT NULL COMMENT '市简称',
  `car_num` varchar(10) NOT NULL COMMENT '车牌',
  `car_id` varchar(10) NOT NULL COMMENT '完整车牌',
  `password` char(32) NOT NULL,
  `ctime` int(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否已经匹配，1：匹配，0：没匹配'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机端金鹏达会员申请表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_permission`
--

CREATE TABLE IF NOT EXISTS `pt_permission` (
  `id` int(10) unsigned NOT NULL,
  `pkey` varchar(50) NOT NULL COMMENT '权限key，唯一',
  `name` varchar(50) NOT NULL COMMENT '权限名',
  `icon` varchar(50) NOT NULL COMMENT '图标',
  `url` varchar(100) NOT NULL COMMENT '链接',
  `show` tinyint(1) NOT NULL COMMENT '是否在菜单中显示，1显示，2隐藏',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '父ID',
  `ctime` int(10) unsigned DEFAULT NULL,
  `rank` int(4) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='权限表';

--
-- 转存表中的数据 `pt_permission`
--

INSERT INTO `pt_permission` (`id`, `pkey`, `name`, `icon`, `url`, `show`, `pid`, `ctime`, `rank`) VALUES
(1, 'mall_manage', '微商城', '', '', 1, 0, 1429899043, 9),
(2, 'data_manage', '数据统计', '', '', 1, 0, 1429900250, 6),
(10, 'goods_list', '路线管理', '', 'admin/goods/goods_list', 1, 1, 1430056203, 11),
(4, 'goods_add', '新增路线', '', 'admin/goods/goods_add', 1, 1, 1429900323, 10),
(5, 'visits', '流量统计', '', 'admin/statistics/visits', 1, 2, 1429900364, 7),
(6, 'qudao_data', '渠道数据', '', 'admin/statistics/qudao_data', 1, 2, 1429900398, 8),
(7, 'user_manage', '会员管理', '', '', 1, 0, 1429900416, 16),
(8, 'user_list', '所有会员', '', 'admin/user/user_list', 1, 7, 1430055715, 17),
(13, 'user_add', '添加会员', '', 'admin/user/user_add', 1, 7, 1430058209, 18),
(14, 'car_type', '会员等级设置', '', 'admin/user/card_rank_list', 1, 7, 1430058235, 19),
(15, 'mall_manage3', '积分管理', '', '', 1, 0, 1430061672, 22),
(16, 'sign_setting', '签到规则设置', '', 'admin/score/sign_setting', 1, 15, 1430061690, 23),
(17, 'score_goods', '积分抵扣设置', '', 'admin/score/score_deduction', 1, 15, 1430061705, 24),
(18, 'goods_cate', '类别管理', '', 'admin/goods/cate_list', 1, 1, 1430153066, 12),
(19, 'order_manage', '订单管理', '', 'admin/order/manage', 1, 1, 1430159757, 15),
(20, 'refund_list', '申请退款管理', '', 'admin/order/refund_list', 1, 1, 1430159790, 14),
(21, 'advert_manage', '广告管理', '', 'admin/advert/advert_list', 1, 1, 1430159810, 13),
(22, 'sys_manage', '系统首页', '', '', 1, 0, 1431074783, 1),
(23, 'sys_index', '系统首页', '', 'admin/main/right', 1, 22, 1431074817, 2),
(24, 'massive', '微信群发', '', 'admin/massive', 1, 1, 1431074839, 3),
(25, 'article', '微页面管理', '', 'admin/article/article_list/wpage', 1, 22, 1431074865, 4),
(26, 'pay_setting', '支付设置', '', 'admin/mall/pay', 1, 22, 1431074886, 5),
(27, 'send_scores', '活动送会员积分', '', 'admin/user/send_scores', 1, 7, 1431075076, 20),
(28, 'user_psw_reset', '修改会员密码', '', 'admin/user/psw_reset', 1, 7, 1431075101, 21),
(29, 'valueadd_service', '增值服务', '', '', 1, 0, 1431075342, 25),
(30, 'user_protocol', '用户协议', '', 'admin/setting/save/jpd_user_protocol', 1, 29, 1431075380, 26),
(31, 'company_intro', '公司介绍', '', 'admin/setting/save/company_intro', 0, 29, 1431075571, 27),
(32, 'reg_notice', '公司资讯', '', 'admin/setting/company_msg/company', 1, 29, 1431075594, 28),
(33, 'contact', '电话地址信息', '', 'admin/setting/contact', 1, 29, 1431075617, 29),
(34, 'bank_manage', '银行信息管理', '', 'admin/setting/bank_manage', 1, 29, 1431075643, 30),
(35, 'resource_manage', '素材管理', '', '', 1, 0, 1431075740, 31),
(36, 'res_imgtxt', '图文管理', '', 'admin/resource/imgtxt', 1, 35, 1431075800, 32),
(37, 'res_img', '图片管理', '', 'admin/resource/img', 1, 35, 1431075820, 33),
(38, 'res_voice', '语音管理', '', 'admin/resource/voice', 1, 35, 1431075839, 34),
(39, 'base_manage', '基础设置', '', '', 1, 0, 1431075857, 35),
(40, 'wxreply_attention', '关注回复', '', 'admin/wxreply/attention/1', 1, 39, 1431075876, 36),
(41, 'wxreply_message', '自动回复', '', 'admin/wxreply/attention/2', 1, 39, 1431076583, 37),
(42, 'wxreply_keyword', '关健字回复', '', 'admin/wxreply/keyword', 1, 39, 1431076608, 38),
(43, 'wxmenu', '自定义菜单', '', 'admin/menu/menu_list', 1, 39, 1431076633, 39),
(44, 'company_setting', '接口设置', '', 'admin/account/company_setting', 1, 39, 1431076654, 40),
(45, 'account_manage', '账号管理', '', '', 1, 0, 1431076688, 41),
(46, 'account_list', '管理账号', '', 'admin/account/account_list', 1, 45, 1431076708, 42),
(47, 'account_add', '添加账号', '', 'admin/account/account_add', 1, 45, 1431076728, 43),
(48, 'permission', '权限管理', '', 'admin/account/permission', 2, 45, 1431076746, 44),
(49, 'qudao_list', '渠道投放', '', 'admin/goods/qudao_list', 2, 1, 1431316665, 11),
(50, 'comment_manager', '评论管理', '', 'admin/goods/comment_manager', 2, 1, 1431316773, 12),
(51, 'qudao_data', '渠道数据', '', 'admin/goods/qudao_data', 2, 1, 1431316970, 13),
(52, 'goods_edit', '路线修改', '', 'admin/goods/goods_edit', 2, 1, 1431322931, 14),
(53, 'goods_del', '路线删除', '', 'admin/goods/goods_del', 2, 1, 1431323048, 15),
(54, 'qudao_detail', '渠道详情', '', 'admin/goods/qudao_detail', 2, 1, 1431324114, 16),
(55, 'qudao_block', '按渠道统计', '', 'admin/statistics/qudao_data', 2, 2, 1431419281, 9),
(56, 'account_edit', '修改账号', '', 'admin/account/account_edit', 2, 45, 1434019932, 45),
(57, 'mall_manage3', '积分获取设置', '', 'admin/score/score_setting', 1, 15, 1435215459, 46);

-- --------------------------------------------------------

--
-- 表的结构 `pt_prize_score`
--

CREATE TABLE IF NOT EXISTS `pt_prize_score` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `score` int(10) NOT NULL COMMENT '兑换所需积分数',
  `prize` varchar(100) NOT NULL COMMENT '奖品',
  `image_url` varchar(200) NOT NULL COMMENT '图片',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分兑奖';

-- --------------------------------------------------------

--
-- 表的结构 `pt_prize_sign`
--

CREATE TABLE IF NOT EXISTS `pt_prize_sign` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1实物2积分3碎片（碎片集齐可以换奖）',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `days` int(5) NOT NULL COMMENT '连续签到天数',
  `prize` varchar(100) NOT NULL COMMENT '奖品',
  `image_url` varchar(200) NOT NULL COMMENT '图片',
  `score` int(5) NOT NULL COMMENT '积分',
  `sp_num` tinyint(2) NOT NULL COMMENT '集齐碎片数',
  `sp_prize_id` int(10) NOT NULL COMMENT '碎片奖品id',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='连续签到奖品设置';

-- --------------------------------------------------------

--
-- 表的结构 `pt_qudao`
--

CREATE TABLE IF NOT EXISTS `pt_qudao` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `deduct_percent` decimal(10,2) NOT NULL,
  `ctime` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_qudao`
--

INSERT INTO `pt_qudao` (`id`, `mid`, `goods_id`, `name`, `deduct_percent`, `ctime`) VALUES
(1, 1, 5, 'www', '26.00', 1430191383),
(4, 1, 12, '5555', '67.00', 1430192401),
(3, 1, 12, 'dddd', '59.00', 1430192125),
(5, 1, 11, 'hello44', '60.00', 1430192422),
(6, 1, 16, 'ddd', '22.00', 1430269403),
(7, 1, 17, '坤哥', '10.00', 1430287006),
(8, 1, 18, 'aa', '10.00', 1430361397),
(9, 1, 20, 'ffffgf', '50.00', 1430365357),
(10, 1, 21, 'ewere', '122.00', 1430365681),
(11, 1, 15, 'kk', '10.00', 1430369583),
(12, 1, 20, 'were', '20.00', 1430373108),
(13, 1, 22, 'dffdf', '50.00', 1430384097),
(14, 1, 20, 'Ken', '100.00', 1430384143),
(15, 1, 19, 'wewe', '90.00', 1430401213),
(16, 1, 41, '34534534', '1.00', 1434015237),
(17, 1, 24, '新浪', '1.00', 1434015307),
(18, 1, 43, '新浪', '10.00', 1434091357),
(19, 1, 45, '订单', '1.00', 1434091456),
(20, 1, 46, '柏林', '1.00', 1435111131),
(24, 1, 52, '李先生', '5.00', 1440122253),
(23, 1, 52, '坤哥', '10.00', 1440122143),
(25, 1, 52, '地方', '12.00', 1440122606),
(28, 1, 49, '泰国轮播', '0.00', 1440388303),
(31, 1, 50, '普吉岛', '0.00', 1440388445),
(32, 1, 50, 'htf', '12.00', 1440495463);

-- --------------------------------------------------------

--
-- 表的结构 `pt_questions`
--

CREATE TABLE IF NOT EXISTS `pt_questions` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `active_id` int(10) NOT NULL COMMENT '活动ID',
  `title` varchar(200) NOT NULL COMMENT '测试题目',
  `options` text NOT NULL COMMENT '选项1',
  `image_url` varchar(50) NOT NULL COMMENT '图片地址',
  `rank` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='测试题表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_sales_promotion`
--

CREATE TABLE IF NOT EXISTS `pt_sales_promotion` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `begin_time` int(10) NOT NULL COMMENT '开始时间',
  `end_time` int(10) NOT NULL COMMENT '结束时间',
  `type` varchar(20) NOT NULL COMMENT '活动类型1抢购，2秒杀，3团购',
  `good_nums` int(10) NOT NULL COMMENT '活动商品数量',
  `cost_price` varchar(10) NOT NULL COMMENT '原价',
  `sales_price` varchar(10) NOT NULL COMMENT '促销价',
  `good_id` int(10) NOT NULL COMMENT '商品id',
  `good_img` varchar(100) NOT NULL COMMENT '商品图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `pt_sales_record`
--

CREATE TABLE IF NOT EXISTS `pt_sales_record` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `sale_id` int(10) NOT NULL COMMENT '抢购活动ID',
  `good_id` int(11) NOT NULL COMMENT '商品ID',
  `ctime` int(11) NOT NULL,
  `order_id` int(10) NOT NULL COMMENT '订单号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='抢购记录表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_scores`
--

CREATE TABLE IF NOT EXISTS `pt_scores` (
  `did` int(10) NOT NULL COMMENT '购买者ID，对应pt_user_data的主键',
  `mid` int(10) NOT NULL,
  `score` int(10) DEFAULT NULL COMMENT '当前剩余积分',
  `max_score` int(10) DEFAULT NULL COMMENT '累计积分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分表';

--
-- 转存表中的数据 `pt_scores`
--

INSERT INTO `pt_scores` (`did`, `mid`, `score`, `max_score`) VALUES
(2, 1, 115, 115),
(3, 1, 517, 517),
(5, 1, 87376, 882974),
(6, 1, 1026, 1026),
(7, 1, 331, 331),
(8, 1, 0, 890756),
(9, 1, 200, 200),
(10, 1, 118, 118),
(11, 1, 100, 100),
(12, 1, 200, 200),
(13, 1, 100, 100),
(14, 1, 200, 200),
(15, 1, 100, 100),
(16, 1, 200, 200),
(17, 1, 200, 200),
(18, 1, 889, 889),
(19, 1, 64, 64),
(20, 1, 1009, 1009),
(21, 1, 100, 100),
(22, 1, 100, 100),
(23, 1, 100, 100),
(24, 1, 100, 100),
(25, 1, 100, 100),
(26, 1, 100, 100),
(27, 1, 100, 100),
(28, 1, 100, 100),
(29, 1, 100, 100),
(30, 1, 100, 100),
(31, 1, 100, 100),
(32, 1, 100, 100),
(33, 1, 100, 100),
(34, 1, 100, 100),
(35, 1, 100, 100),
(36, 1, 100, 100),
(37, 1, 100, 100),
(38, 1, 100, 100),
(39, 1, 100, 100),
(40, 1, 100, 100),
(41, 1, 100, 100),
(42, 1, 100, 100),
(43, 1, 200, 200),
(44, 1, 200, 200),
(45, 1, 100, 100),
(46, 1, 909, 2810),
(47, 1, 63, 64),
(48, 1, 900000, 900000),
(49, 1, 64, 64),
(50, 1, 64, 64),
(51, 1, 1800066, 1800066),
(52, 1, 888800, 888800),
(53, 1, 899998, 901001),
(54, 1, 14, 14),
(55, 1, 1000, 1000),
(56, 1, 600, 600),
(57, 1, 123456, 123456),
(58, 1, 300, 300),
(59, 1, 14, 14),
(60, 1, 1200, 1200),
(61, 1, 13, 13),
(62, 1, 640006, 910009),
(63, 1, 100, 100),
(64, 1, 13, 13),
(65, 1, 0, 100),
(66, 1, 13, 13),
(67, 1, 13, 13),
(68, 1, 13, 13),
(69, 1, 99999, 99999),
(70, 1, 13, 13),
(71, 1, 13, 13),
(72, 1, 13, 13),
(73, 1, 13, 13),
(74, 1, 1000, 1000),
(75, 1, 200, 200),
(76, 1, 1000, 1000),
(77, 1, 1, 1),
(78, 1, 1000, 1000);

-- --------------------------------------------------------

--
-- 表的结构 `pt_score_add_setting`
--

CREATE TABLE IF NOT EXISTS `pt_score_add_setting` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `min_expense` int(10) NOT NULL COMMENT '消费最小金额',
  `score` int(10) NOT NULL COMMENT '消费1元，获取多少积分'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='积分获取设置表';

--
-- 转存表中的数据 `pt_score_add_setting`
--

INSERT INTO `pt_score_add_setting` (`id`, `mid`, `min_expense`, `score`) VALUES
(3, 1, 100, 1),
(2, 1, 2300, 100),
(5, 1, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pt_score_deduct_setting`
--

CREATE TABLE IF NOT EXISTS `pt_score_deduct_setting` (
  `mid` int(10) NOT NULL,
  `money` decimal(10,2) NOT NULL COMMENT '100个积分抵扣多少元人民币'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分抵扣设置表';

--
-- 转存表中的数据 `pt_score_deduct_setting`
--

INSERT INTO `pt_score_deduct_setting` (`mid`, `money`) VALUES
(1, '100.00');

-- --------------------------------------------------------

--
-- 表的结构 `pt_score_goods`
--

CREATE TABLE IF NOT EXISTS `pt_score_goods` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_desc` text COMMENT '商品描述',
  `cid` int(10) unsigned NOT NULL COMMENT '商品分类',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价只是显示不用于支付',
  `store` int(10) unsigned NOT NULL COMMENT '库存数量',
  `num_unit` varchar(10) NOT NULL COMMENT '数量单位',
  `score` int(8) NOT NULL DEFAULT '0' COMMENT '兑换需要积分',
  `sale_num` int(8) NOT NULL DEFAULT '0' COMMENT '销量',
  `disabled` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0上架， 1下架',
  `goods_img` varchar(30) NOT NULL COMMENT '显示商品图片',
  `other_img` varchar(300) NOT NULL COMMENT '商品详细页图片',
  `ctime` int(10) unsigned NOT NULL COMMENT '添加时间',
  `sketch` varchar(200) NOT NULL COMMENT '简述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分兑换商品表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_score_log`
--

CREATE TABLE IF NOT EXISTS `pt_score_log` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `did` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1后台充值或赠送，2购物返利,-1购物抵用',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='会员积分日志';

--
-- 转存表中的数据 `pt_score_log`
--

INSERT INTO `pt_score_log` (`id`, `mid`, `did`, `score`, `type`, `ctime`) VALUES
(1, 1, 2, 50, 15, 1430215020),
(2, 1, 2, 15, 4, 1430215075),
(6, 1, 6, 88, 1, 1430290020),
(7, 1, 5, 12, 1, 1430290094),
(8, 1, 3, 400, 1, 1430294077),
(9, 1, 3, 100, 1, 1430294092),
(10, 1, 7, 23, 1, 1430294499),
(11, 1, 3, 2, 1, 1430294507),
(12, 1, 7, 23, 1, 1430294550),
(13, 1, 8, 1, 1, 1430295105),
(14, 1, 9, 100, 1, 1430295533),
(15, 1, 10, 50, 1, 1430295977),
(16, 1, 10, 15, 1, 1430295997),
(17, 1, 10, 3, 1, 1430297208),
(18, 1, 11, 50, 1, 1430304537),
(19, 1, 12, 100, 1, 1430304537),
(20, 1, 13, 50, 1, 1430304835),
(21, 1, 14, 100, 1, 1430304835),
(23, 1, 15, 50, 1, 1430358433),
(24, 1, 16, 100, 1, 1430358471),
(25, 1, 17, 100, 1, 1430359147),
(26, 1, 18, 888, 1, 1430359381),
(27, 1, 20, 8, 1, 1430360466),
(28, 1, 20, 100, 1, 1430360484),
(29, 1, 20, 400, 1, 1430360502),
(30, 1, 20, 500, 1, 1430360511),
(31, 1, 20, 1, 1, 1430360573),
(33, 1, 18, 1, 1, 1430360573),
(34, 1, 21, 100, 1, 1430360883),
(35, 1, 22, 100, 1, 1430360884),
(36, 1, 23, 100, 1, 1430360992),
(37, 1, 24, 100, 1, 1430360992),
(38, 1, 25, 100, 1, 1430361080),
(39, 1, 26, 100, 1, 1430361080),
(40, 1, 27, 100, 1, 1430361121),
(41, 1, 28, 100, 1, 1430361121),
(42, 1, 29, 100, 1, 1430361192),
(43, 1, 30, 100, 1, 1430361192),
(44, 1, 31, 100, 1, 1430361302),
(45, 1, 32, 100, 1, 1430361302),
(46, 1, 33, 100, 1, 1430361365),
(47, 1, 34, 100, 1, 1430361365),
(48, 1, 35, 100, 1, 1430361657),
(49, 1, 36, 100, 1, 1430361657),
(50, 1, 37, 100, 1, 1430361735),
(51, 1, 38, 100, 1, 1430361735),
(52, 1, 39, 100, 1, 1430361883),
(53, 1, 40, 100, 1, 1430361883),
(54, 1, 41, 100, 1, 1430362594),
(55, 1, 42, 100, 1, 1430362594),
(56, 1, 43, 100, 1, 1430362690),
(57, 1, 44, 100, 1, 1430362690),
(58, 1, 8, -101, -1, 1430373356),
(59, 1, 8, 887790, 2, 1430373356),
(60, 1, 5, -900, -1, 1430373420),
(61, 1, 5, 910, 2, 1430373420),
(62, 1, 8, -88880, -1, 1430373465),
(63, 1, 8, -8880, -1, 1430373599),
(64, 1, 8, -8880, -1, 1430374001),
(65, 1, 7, 100, 1, 1430374834),
(66, 1, 9, 100, 1, 1430374834),
(67, 1, 12, 100, 1, 1430374834),
(68, 1, 14, 100, 1, 1430374834),
(69, 1, 16, 100, 1, 1430374835),
(70, 1, 17, 100, 1, 1430374835),
(71, 1, 44, 100, 1, 1430374835),
(72, 1, 43, 100, 1, 1430374835),
(73, 1, 8, -17760, -1, 1430376909),
(74, 1, 45, 100, 1, 1430377208),
(75, 1, 5, -910, -1, 1430377256),
(76, 1, 5, 879700, 2, 1430377256),
(77, 1, 5, -10000, -1, 1430377547),
(78, 1, 8, -390, -1, 1430378319),
(79, 1, 8, 961, 2, 1430378319),
(80, 1, 46, 1000, 2, 1430378564),
(81, 1, 46, -1000, -1, 1430378709),
(82, 1, 46, 900, 2, 1430378709),
(83, 1, 46, -900, -1, 1430378825),
(84, 1, 46, 910, 2, 1430378825),
(85, 1, 5, -10000, -1, 1430381839),
(86, 1, 46, -1, -1, 1430382982),
(87, 1, 5, -10000, -1, 1430384126),
(88, 1, 48, 900000, 2, 1430384155),
(89, 1, 8, -961, -1, 1430385531),
(90, 1, 8, 1904, 2, 1430385532),
(91, 1, 51, 1800000, 2, 1430703790),
(92, 1, 6, 50, 1, 1430720010),
(93, 1, 10, 50, 1, 1430720010),
(94, 1, 11, 50, 1, 1430720011),
(95, 1, 13, 50, 1, 1430720011),
(96, 1, 15, 50, 1, 1430720011),
(97, 1, 19, 50, 1, 1430720011),
(98, 1, 47, 50, 1, 1430720011),
(99, 1, 49, 50, 1, 1430720011),
(100, 1, 50, 50, 1, 1430720011),
(101, 1, 52, 888800, 2, 1430722859),
(102, 1, 55, 1000, 2, 1431333036),
(103, 1, 56, 600, 1, 1431411652),
(104, 1, 51, 66, 1, 1431591116),
(105, 1, 57, 123456, 1, 1432288033),
(106, 1, 58, 300, 2, 1432361256),
(107, 1, 60, 100, 1, 1432362177),
(108, 1, 60, 1000, 1, 1432362187),
(109, 1, 60, 100, 1, 1432362195),
(110, 1, 19, 1, 1, 1432362633),
(111, 1, 47, 1, 1, 1432362633),
(112, 1, 49, 1, 1, 1432362633),
(113, 1, 50, 1, 1, 1432362633),
(114, 1, 53, 1, 1, 1432362633),
(115, 1, 54, 1, 1, 1432362633),
(116, 1, 59, 1, 1, 1432362633),
(117, 1, 53, -1, -1, 1432687904),
(118, 1, 53, 1000, 2, 1432687904),
(119, 1, 62, 900000, 2, 1432719568),
(120, 1, 62, -90000, -1, 1432719568),
(121, 1, 62, -90000, -1, 1432719624),
(122, 1, 62, -90000, -1, 1432719630),
(123, 1, 62, -1, -1, 1432719714),
(124, 1, 62, -1, -1, 1432719735),
(125, 1, 62, -1, -1, 1432719744),
(126, 1, 62, 10, 1, 1432775846),
(127, 1, 62, 9999, 1, 1432775854),
(128, 1, 53, -1000, -1, 1432883012),
(129, 1, 53, 890000, 2, 1432883012),
(130, 1, 65, 100, 2, 1434014914),
(131, 1, 65, -100, -1, 1434014914),
(132, 1, 53, -1, -1, 1434015776),
(133, 1, 53, -1, -1, 1434015924),
(134, 1, 8, -1, -1, 1434019131),
(135, 1, 47, -1, -1, 1434020885),
(136, 1, 69, 99999, 1, 1434092119),
(137, 1, 53, 10000, 1, 1434092194),
(138, 1, 74, 1000, 1, 1434092204),
(139, 1, 75, 200, 1, 1434092258),
(140, 1, 63, 100, 1, 1434092268),
(141, 1, 19, 10, 1, 1434092291),
(142, 1, 47, 10, 1, 1434092291),
(143, 1, 49, 10, 1, 1434092291),
(144, 1, 50, 10, 1, 1434092291),
(145, 1, 54, 10, 1, 1434092291),
(146, 1, 59, 10, 1, 1434092291),
(147, 1, 61, 10, 1, 1434092292),
(148, 1, 64, 10, 1, 1434092292),
(149, 1, 66, 10, 1, 1434092292),
(150, 1, 67, 10, 1, 1434092292),
(151, 1, 68, 10, 1, 1434092292),
(152, 1, 70, 10, 1, 1434092292),
(153, 1, 71, 10, 1, 1434092292),
(154, 1, 72, 10, 1, 1434092292),
(155, 1, 73, 10, 1, 1434092292),
(156, 1, 19, 1, 1, 1434092563),
(157, 1, 47, 1, 1, 1434092563),
(158, 1, 49, 1, 1, 1434092563),
(159, 1, 50, 1, 1, 1434092563),
(160, 1, 54, 1, 1, 1434092563),
(161, 1, 59, 1, 1, 1434092563),
(162, 1, 61, 1, 1, 1434092563),
(163, 1, 64, 1, 1, 1434092563),
(164, 1, 66, 1, 1, 1434092563),
(165, 1, 67, 1, 1, 1434092563),
(166, 1, 68, 1, 1, 1434092563),
(167, 1, 70, 1, 1, 1434092563),
(168, 1, 71, 1, 1, 1434092563),
(169, 1, 72, 1, 1, 1434092563),
(170, 1, 73, 1, 1, 1434092563),
(171, 1, 19, 1, 1, 1434092563),
(172, 1, 47, 1, 1, 1434092563),
(173, 1, 49, 1, 1, 1434092563),
(174, 1, 50, 1, 1, 1434092563),
(175, 1, 54, 1, 1, 1434092563),
(176, 1, 59, 1, 1, 1434092563),
(177, 1, 61, 1, 1, 1434092563),
(178, 1, 64, 1, 1, 1434092563),
(179, 1, 66, 1, 1, 1434092563),
(180, 1, 67, 1, 1, 1434092563),
(181, 1, 68, 1, 1, 1434092563),
(182, 1, 70, 1, 1, 1434092563),
(183, 1, 71, 1, 1, 1434092564),
(184, 1, 72, 1, 1, 1434092564),
(185, 1, 73, 1, 1, 1434092564),
(186, 1, 76, 1000, 1, 1435115702),
(187, 1, 19, 1, 1, 1435115752),
(188, 1, 47, 1, 1, 1435115752),
(189, 1, 49, 1, 1, 1435115752),
(190, 1, 50, 1, 1, 1435115752),
(191, 1, 54, 1, 1, 1435115752),
(192, 1, 59, 1, 1, 1435115752),
(193, 1, 61, 1, 1, 1435115752),
(194, 1, 64, 1, 1, 1435115752),
(195, 1, 66, 1, 1, 1435115752),
(196, 1, 67, 1, 1, 1435115752),
(197, 1, 68, 1, 1, 1435115752),
(198, 1, 70, 1, 1, 1435115752),
(199, 1, 71, 1, 1, 1435115752),
(200, 1, 72, 1, 1, 1435115752),
(201, 1, 73, 1, 1, 1435115752),
(202, 1, 77, 1, 1, 1435115752),
(203, 1, 78, 1000, 1, 1436254919),
(204, 1, 5, -100, -1, 1441094128),
(205, 1, 5, 388, 2, 1441094128),
(206, 1, 5, -388, -1, 1441095497),
(207, 1, 5, 100, 2, 1441095497),
(208, 1, 5, 488, 2, 1441529413),
(209, 1, 5, 488, 2, 1441530434);

-- --------------------------------------------------------

--
-- 表的结构 `pt_setting`
--

CREATE TABLE IF NOT EXISTS `pt_setting` (
  `id` int(11) unsigned NOT NULL,
  `mid` mediumint(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `sitename` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='公司基础设置';

--
-- 转存表中的数据 `pt_setting`
--

INSERT INTO `pt_setting` (`id`, `mid`, `type`, `sitename`) VALUES
(1, 1, 'company', '123'),
(2, 1, 'case', '站点名称站点名称站点名称站点名称站点名称');

-- --------------------------------------------------------

--
-- 表的结构 `pt_shop`
--

CREATE TABLE IF NOT EXISTS `pt_shop` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `shop_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '门店类型，1为门店，2为活动',
  `name` varchar(50) NOT NULL COMMENT '门店名称',
  `phone` varchar(50) NOT NULL COMMENT '门店电话',
  `province` varchar(50) NOT NULL COMMENT '省/直辖市',
  `city` varchar(50) NOT NULL COMMENT '市/县/区',
  `address` varchar(200) NOT NULL COMMENT '门店地址',
  `content` text NOT NULL COMMENT '门店描述',
  `shop_num` mediumint(8) unsigned NOT NULL COMMENT '门店编号',
  `qrcode` varchar(100) NOT NULL COMMENT '门店二维码',
  `latitude` varchar(20) NOT NULL COMMENT '纬度',
  `longitude` varchar(20) NOT NULL COMMENT '经度',
  `cover` varchar(100) NOT NULL COMMENT '门店封面',
  `disabled` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1禁用，0启用',
  `ctime` int(10) unsigned NOT NULL,
  `code` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店';

-- --------------------------------------------------------

--
-- 表的结构 `pt_shopping_cart`
--

CREATE TABLE IF NOT EXISTS `pt_shopping_cart` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `number` smallint(5) unsigned NOT NULL COMMENT '购物数量',
  `goods_attr` varchar(200) DEFAULT NULL COMMENT '商品属性',
  `ctime` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COMMENT='购物车';

--
-- 转存表中的数据 `pt_shopping_cart`
--

INSERT INTO `pt_shopping_cart` (`id`, `mid`, `goods_id`, `user_id`, `number`, `goods_attr`, `ctime`) VALUES
(224, 1, 44, 26, 1, '', 1429806784),
(218, 1, 41, 24, 1, '', 1429789910);

-- --------------------------------------------------------

--
-- 表的结构 `pt_shopping_freight`
--

CREATE TABLE IF NOT EXISTS `pt_shopping_freight` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `min_num` int(5) NOT NULL COMMENT '最小数量',
  `max_num` int(5) NOT NULL COMMENT '最大数量',
  `money` float NOT NULL COMMENT '运费金额',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='运费';

-- --------------------------------------------------------

--
-- 表的结构 `pt_shopping_logistics`
--

CREATE TABLE IF NOT EXISTS `pt_shopping_logistics` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '物流名称',
  `state` text NOT NULL COMMENT '物流说明',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='物流设置';

-- --------------------------------------------------------

--
-- 表的结构 `pt_shopping_order`
--

CREATE TABLE IF NOT EXISTS `pt_shopping_order` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `min_money` float NOT NULL COMMENT '最小金额',
  `max_money` float NOT NULL COMMENT '最大金额',
  `reduce_money` float NOT NULL COMMENT '优惠金额',
  `coupon_num` varchar(50) NOT NULL COMMENT '优惠劵编号',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单消费规则';

-- --------------------------------------------------------

--
-- 表的结构 `pt_shopping_pay`
--

CREATE TABLE IF NOT EXISTS `pt_shopping_pay` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `pay_type` varchar(50) NOT NULL COMMENT '支付方式',
  `parameters` text NOT NULL COMMENT '参数',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付设置';

--
-- 转存表中的数据 `pt_shopping_pay`
--

INSERT INTO `pt_shopping_pay` (`id`, `mid`, `pay_type`, `parameters`, `ctime`) VALUES
(1, 1, 'weixin', 'a:2:{s:5:"mchid";s:10:"1220729301";s:6:"paykey";s:32:"4c45cdb2c20769b481f469952a952800";}', 1432291624),
(2, 1, 'alipay', 'a:3:{s:7:"account";s:11:"18503037497";s:14:"alipay_partner";s:16:"2088011278291243";s:10:"alipay_key";s:32:"fnprdfrc9xvhc017lcmnp5b7he4nus1g";}', 1432291628);

-- --------------------------------------------------------

--
-- 表的结构 `pt_shopping_set`
--

CREATE TABLE IF NOT EXISTS `pt_shopping_set` (
  `id` int(5) NOT NULL,
  `mid` int(10) NOT NULL,
  `consume_set` tinyint(1) NOT NULL DEFAULT '1' COMMENT '消费规则：0不开启1开启',
  `goods_user` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订单是否需要注册会员：0不需要1需要',
  `pay_type` varchar(255) NOT NULL COMMENT '支付方式：使用;分隔',
  `shipments_type` varchar(255) NOT NULL COMMENT '配送方式：使用;分隔',
  `logistics_set` tinyint(1) NOT NULL DEFAULT '1' COMMENT '发货物流：0不开启1开启',
  `logistics_name` varchar(255) NOT NULL COMMENT '物流名称：使用;分隔',
  `not_postage` int(10) NOT NULL COMMENT '包邮金额',
  `freight_set` tinyint(1) NOT NULL DEFAULT '0' COMMENT '运费设置：0不开启；1开启',
  `after_sale_set` tinyint(1) NOT NULL DEFAULT '0' COMMENT '售后保障设置：0不开启1开启',
  `after_sale_state` text NOT NULL COMMENT '售后保障说明',
  `del_goods_nums` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订单自动扣除库存:0不扣除1扣除',
  `show_goods_nums` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商品显示库存:0不显示1显示',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商城设置';

-- --------------------------------------------------------

--
-- 表的结构 `pt_shopping_user`
--

CREATE TABLE IF NOT EXISTS `pt_shopping_user` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `guanzhu_score` int(5) NOT NULL COMMENT '关注送积分',
  `guanzhu_coupon` varchar(50) NOT NULL COMMENT '关注送优惠劵号',
  `bind_score` int(5) NOT NULL COMMENT '注册送积分',
  `bind_coupon` varchar(50) NOT NULL COMMENT '注册送优惠劵号',
  `use_num` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员卡：0不启用1启用',
  `num_prefix` varchar(50) NOT NULL COMMENT '卡前缀',
  `order_user_discount` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单是否使用会员卡折扣：0不使用1使用',
  `get_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费获得积分：0不获取1获取',
  `pay_money` float NOT NULL COMMENT '每消费金额',
  `pay_score` int(5) NOT NULL COMMENT '消耗金额获取积分',
  `sign_in` int(5) NOT NULL COMMENT '每日签到送积分',
  `user_more_coupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '多张优惠劵：0不使用1使用',
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员设置';

-- --------------------------------------------------------

--
-- 表的结构 `pt_sign_log`
--

CREATE TABLE IF NOT EXISTS `pt_sign_log` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `days` int(2) NOT NULL COMMENT '连续签到天数',
  `is_get_prize` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0已经领取奖励1未领取',
  `ctime` int(10) NOT NULL COMMENT '最后一次签到时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='连续签到记录';

-- --------------------------------------------------------

--
-- 表的结构 `pt_solution`
--

CREATE TABLE IF NOT EXISTS `pt_solution` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `order_num` tinyint(1) NOT NULL COMMENT '测试结果序号',
  `product_id` varchar(200) NOT NULL COMMENT '推荐产品（可以多个）',
  `cid` int(10) NOT NULL COMMENT '商品类型',
  `active_id` int(10) NOT NULL COMMENT '活动ID',
  `title` varchar(100) NOT NULL COMMENT '结果的标题',
  `content` text NOT NULL COMMENT '结果内容',
  `image` varchar(50) NOT NULL COMMENT '图片URL'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='测试结果';

-- --------------------------------------------------------

--
-- 表的结构 `pt_sp_prize`
--

CREATE TABLE IF NOT EXISTS `pt_sp_prize` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `type` int(5) NOT NULL COMMENT '0实物大于0代金券id',
  `name` varchar(100) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `intro` text NOT NULL,
  `ctime` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='凑齐碎片的奖品';

-- --------------------------------------------------------

--
-- 表的结构 `pt_statistics`
--

CREATE TABLE IF NOT EXISTS `pt_statistics` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `pv` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问量',
  `transpond` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '转发量',
  `pv_num` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '设置访问量倍数',
  `transpond_num` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '设置转发量倍数',
  `ctime` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='统计表';

--
-- 转存表中的数据 `pt_statistics`
--

INSERT INTO `pt_statistics` (`id`, `mid`, `pv`, `transpond`, `pv_num`, `transpond_num`, `ctime`) VALUES
(1, 39, 34, 32, 2, 2, 1416880637),
(2, 39, 1, 1, 1, 1, 1416794237),
(3, 39, 1, 1, 1, 1, 1406794237),
(10, 39, 1, 1, 9, 21, 1416983654),
(11, 38, 1, 1, 3, 1, 1416993772),
(12, 38, 9, 0, 3, 1, 1417059244),
(13, 39, 8, 0, 10, 20, 1417059300),
(14, 38, 1863, 73, 3, 1, 1417104061),
(15, 39, 1, 0, 10, 20, 1417104061),
(16, 39, 1, 0, 10, 20, 1417190461),
(17, 38, 1889, 125, 3, 1, 1417190466),
(18, 38, 345, 17, 3, 1, 1417276800),
(19, 39, 1, 0, 10, 20, 1417276861),
(20, 39, 1, 0, 10, 20, 1417363261),
(21, 38, 323, 29, 3, 1, 1417363261),
(22, 39, 1, 0, 10, 20, 1417449661),
(23, 38, 95, 8, 3, 1, 1417449661),
(24, 39, 1, 0, 10, 20, 1417536061),
(25, 38, 582, 13, 3, 1, 1417536061),
(26, 38, 7863, 98, 3, 1, 1417622433),
(27, 39, 1, 0, 10, 20, 1417622461),
(28, 38, 5017, 127, 3, 1, 1417708813),
(29, 39, 1, 0, 10, 20, 1417708861),
(30, 38, 2158, 20, 3, 1, 1417795204),
(31, 39, 1, 0, 10, 20, 1417795261),
(32, 39, 1, 0, 10, 20, 1417881661),
(33, 38, 976, 11, 3, 1, 1417881661),
(34, 38, 13357, 3273, 3, 1, 1417968038),
(35, 39, 1, 0, 10, 20, 1417968061),
(36, 38, 115, 2, 3, 1, 1418054407),
(37, 39, 1, 0, 10, 20, 1418054463),
(38, 39, 1, 0, 10, 20, 1418140861),
(39, 38, 110, 5, 3, 1, 1418141243),
(40, 39, 1, 0, 10, 20, 1418227261),
(41, 38, 197, 5, 3, 1, 1418227968),
(44, 39, 1, 0, 10, 20, 1418313661),
(45, 38, 1784, 31, 3, 1, 1418313661),
(46, 38, 421, 7, 3, 1, 1418400061),
(47, 39, 1, 0, 10, 20, 1418400062),
(48, 38, 123, 2, 3, 1, 1418486461),
(49, 39, 1, 0, 10, 20, 1418486463),
(50, 39, 1, 0, 10, 20, 1418572861),
(51, 38, 292, 4, 3, 1, 1418573793),
(52, 38, 133, 5, 3, 1, 1418659261),
(53, 39, 1, 0, 10, 20, 1418659261),
(54, 39, 1, 0, 10, 20, 1418745663),
(55, 38, 81, 3, 3, 1, 1418745741),
(56, 38, 117, 12, 3, 1, 1418832062),
(57, 38, 87, 5, 3, 1, 1418918462),
(58, 39, 1, 0, 1, 1, 1418918462),
(59, 38, 38, 0, 3, 1, 1419004862),
(60, 39, 1, 0, 1, 1, 1419004862),
(61, 38, 55, 3, 3, 1, 1419091261),
(62, 39, 1, 0, 1, 1, 1419091261),
(63, 39, 1, 0, 1, 1, 1419177661),
(64, 38, 32, 3, 3, 1, 1419209883),
(65, 39, 1, 0, 1, 1, 1419264062),
(66, 38, 58, 0, 3, 1, 1419264064),
(67, 39, 1, 0, 1, 1, 1419350461),
(68, 38, 15, 0, 3, 1, 1419350461),
(69, 38, 12, 1, 3, 1, 1419436861),
(70, 39, 1, 0, 1, 1, 1419436867),
(71, 39, 1, 0, 1, 1, 1419523261),
(72, 38, 30, 0, 3, 1, 1419523267),
(73, 39, 1, 0, 1, 1, 1419609661),
(74, 38, 21, 0, 3, 1, 1419609661),
(75, 38, 3, 0, 3, 1, 1419696066),
(76, 39, 1, 0, 1, 1, 1419696066),
(77, 38, 22, 0, 3, 1, 1419782461),
(78, 39, 1, 0, 1, 1, 1419782466),
(79, 38, 13, 0, 3, 1, 1419868866),
(80, 39, 1, 0, 1, 1, 1419868871),
(81, 38, 18, 0, 3, 1, 1419955261),
(82, 39, 1, 0, 1, 1, 1419955261),
(83, 38, 24, 0, 3, 1, 1420041666),
(84, 39, 1, 0, 1, 1, 1420041676),
(85, 38, 5, 0, 3, 1, 1420128067),
(86, 39, 1, 0, 1, 1, 1420128072),
(87, 38, 3, 0, 3, 1, 1420214461),
(88, 39, 1, 0, 1, 1, 1420214476),
(89, 38, 13, 3, 3, 1, 1420300861),
(90, 39, 1, 0, 1, 1, 1420300866),
(91, 39, 1, 0, 1, 1, 1420387267),
(92, 38, 9, 0, 3, 1, 1420387281),
(93, 39, 1, 0, 1, 1, 1420473661),
(94, 38, 58, 5, 3, 1, 1420473666),
(95, 38, 1, 0, 3, 1, 1420560061),
(96, 39, 1, 0, 1, 1, 1420560061),
(97, 38, 26, 0, 3, 1, 1420646461),
(98, 39, 1, 0, 1, 1, 1420646461),
(99, 39, 1, 0, 1, 1, 1420732866),
(100, 38, 15, 0, 3, 1, 1420767498),
(101, 39, 1, 0, 1, 1, 1420819261),
(102, 38, 5, 0, 3, 1, 1420819261),
(103, 38, 1, 0, 3, 1, 1420905661),
(104, 39, 1, 0, 1, 1, 1420905661),
(105, 38, 8, 0, 3, 1, 1420992061),
(106, 39, 1, 0, 1, 1, 1420992061),
(107, 39, 1, 0, 1, 1, 1421078461),
(108, 38, 2, 0, 3, 1, 1421122361),
(109, 38, 6, 0, 3, 1, 1421164876),
(110, 38, 13, 0, 3, 1, 1421251262),
(111, 38, 10, 0, 3, 1, 1421337676),
(112, 39, 1, 0, 1, 1, 1421337686),
(113, 38, 8, 0, 3, 1, 1421424066),
(114, 39, 1, 0, 1, 1, 1421510476),
(115, 39, 1, 0, 1, 1, 1421596861),
(116, 38, 2, 0, 1, 1, 1421653204),
(117, 38, 13, 0, 1, 1, 1421683266),
(118, 39, 1, 0, 1, 1, 1421683276),
(119, 39, 1, 0, 1, 1, 1421769671),
(120, 38, 3, 0, 1, 1, 1421840930),
(121, 39, 1, 0, 1, 1, 1421856062),
(122, 38, 15, 0, 1, 1, 1421856062),
(123, 39, 1, 0, 1, 1, 1421942466),
(124, 38, 5, 0, 1, 1, 1421942468),
(125, 39, 1, 0, 1, 1, 1422028866),
(126, 38, 13, 0, 1, 1, 1422037313),
(127, 39, 1, 0, 1, 1, 1422115261),
(128, 38, 23, 0, 1, 1, 1422115261),
(129, 38, 8, 0, 1, 1, 1422201661),
(130, 39, 1, 0, 1, 1, 1422201671),
(131, 39, 1, 0, 1, 1, 1422288061),
(132, 38, 13, 0, 1, 1, 1422288066),
(133, 38, 1, 0, 1, 1, 1422374461),
(134, 39, 1, 0, 1, 1, 1422374461),
(135, 38, 12, 0, 1, 1, 1422460861),
(136, 39, 1, 0, 1, 1, 1422547263),
(137, 38, 5, 0, 1, 1, 1422595013),
(138, 39, 1, 0, 1, 1, 1422633661),
(139, 38, 7, 0, 1, 1, 1422633662),
(140, 38, 1, 0, 1, 1, 1422720062),
(141, 39, 1, 0, 1, 1, 1422720063),
(142, 38, 8, 0, 1, 1, 1422806461),
(143, 39, 1, 0, 1, 1, 1422806462),
(144, 38, 12, 0, 1, 1, 1422892861),
(145, 39, 1, 0, 1, 1, 1422892861),
(146, 38, 12, 0, 1, 1, 1422979261),
(147, 39, 1, 0, 1, 1, 1422979261),
(148, 38, 1, 0, 1, 1, 1423065662),
(149, 39, 1, 0, 1, 1, 1423065663),
(150, 39, 1, 0, 1, 1, 1423152061),
(151, 38, 9, 0, 1, 1, 1423152061),
(152, 39, 1, 0, 1, 1, 1423238463),
(153, 39, 1, 0, 1, 1, 1423324861),
(154, 38, 7, 1, 1, 1, 1423324861),
(155, 38, 3, 1, 1, 1, 1423411261),
(156, 39, 1, 0, 1, 1, 1423497663),
(157, 39, 1, 0, 1, 1, 1423584061),
(158, 38, 35, 0, 1, 1, 1423584061),
(159, 38, 1, 0, 1, 1, 1423670461),
(160, 39, 1, 0, 1, 1, 1423670461),
(161, 39, 1, 0, 1, 1, 1423756861),
(162, 38, 49, 3, 1, 1, 1423797466),
(163, 39, 1, 0, 1, 1, 1423929666),
(164, 39, 1, 0, 1, 1, 1424016063),
(165, 38, 6, 0, 1, 1, 1424023459),
(166, 38, 16, 0, 1, 1, 1424102461),
(167, 39, 1, 0, 1, 1, 1424102466),
(168, 39, 1, 0, 1, 1, 1424188861),
(169, 38, 1, 0, 1, 1, 1424188861),
(170, 38, 1, 0, 1, 1, 1424357522),
(171, 39, 1, 0, 1, 1, 1424361661),
(172, 38, 1, 0, 1, 1, 1424361662),
(173, 39, 1, 0, 1, 1, 1424448072),
(174, 38, 7, 0, 1, 1, 1424476798),
(175, 38, 6, 0, 1, 1, 1424534466),
(176, 39, 1, 0, 1, 1, 1424534473),
(177, 38, 1, 0, 1, 1, 1424620861),
(178, 39, 1, 0, 1, 1, 1424620861),
(179, 39, 1, 0, 1, 1, 1424707261),
(180, 38, 10, 0, 1, 1, 1424707264),
(181, 38, 21, 0, 1, 1, 1424793666),
(182, 39, 1, 0, 1, 1, 1424793666),
(183, 39, 1, 0, 1, 1, 1424880066),
(184, 38, 21, 0, 1, 1, 1424880076),
(185, 38, 42, 0, 1, 1, 1424966461),
(186, 39, 1, 0, 1, 1, 1424966461),
(187, 38, 1, 0, 1, 1, 1425052861),
(188, 39, 1, 0, 1, 1, 1425052865),
(189, 38, 11, 0, 1, 1, 1425139266),
(190, 39, 1, 0, 1, 1, 1425139276),
(191, 39, 1, 0, 1, 1, 1425225666),
(192, 38, 7, 0, 1, 1, 1425225667),
(193, 38, 3, 0, 1, 1, 1425312061),
(194, 38, 18, 0, 1, 1, 1425463937),
(195, 39, 1, 0, 1, 1, 1425484861),
(196, 38, 44, 0, 1, 1, 1425484861),
(197, 39, 1, 0, 1, 1, 1425571271),
(198, 38, 179, 0, 1, 1, 1425608045),
(199, 38, 15, 1, 1, 1, 1425657661),
(200, 39, 1, 0, 1, 1, 1425744061),
(201, 38, 5, 1, 1, 1, 1425746093),
(202, 38, 197, 0, 1, 1, 1425830461),
(203, 39, 1, 0, 1, 1, 1425830461),
(204, 38, 61, 0, 1, 1, 1425916862),
(205, 39, 1, 0, 1, 1, 1425916862),
(206, 39, 1, 0, 1, 1, 1426003262),
(207, 38, 40, 1, 1, 1, 1426029629),
(208, 39, 1, 0, 1, 1, 1426089661),
(209, 38, 12, 0, 1, 1, 1426089662),
(210, 38, 7, 0, 1, 1, 1426232506),
(211, 38, 4, 0, 1, 1, 1426303475),
(212, 38, 5, 0, 1, 1, 1426353976),
(213, 38, 6, 0, 1, 1, 1426438045),
(214, 38, 4, 0, 1, 1, 1426560045),
(215, 38, 7, 0, 1, 1, 1426669932),
(216, 38, 13, 0, 1, 1, 1426727536),
(217, 38, 16, 0, 1, 1, 1426896372),
(218, 38, 15, 0, 1, 1, 1426956699),
(219, 38, 12, 0, 1, 1, 1427089544),
(220, 38, 5, 0, 1, 1, 1427131288),
(221, 38, 8, 0, 1, 1, 1427278812),
(222, 38, 5, 0, 1, 1, 1427339176),
(223, 38, 3, 0, 1, 1, 1427450985),
(224, 38, 3, 0, 1, 1, 1427722784),
(225, 38, 28, 0, 1, 1, 1427761453),
(226, 38, 1, 0, 1, 1, 1427960825),
(227, 38, 7, 0, 1, 1, 1428042175),
(228, 38, 14, 0, 1, 1, 1428116917),
(229, 38, 3, 0, 1, 1, 1428288611),
(230, 38, 1, 0, 1, 1, 1428371226),
(231, 38, 12, 0, 1, 1, 1428450896),
(232, 38, 8, 0, 1, 1, 1428571186),
(233, 38, 2, 0, 1, 1, 1428654092),
(234, 38, 19, 0, 1, 1, 1428683946),
(235, 38, 8, 0, 1, 1, 1428863854),
(236, 38, 1, 0, 1, 1, 1429006131),
(237, 38, 20, 0, 1, 1, 1429067178),
(238, 38, 11, 0, 1, 1, 1429161049),
(239, 38, 2, 0, 1, 1, 1429273922),
(240, 38, 6, 0, 1, 1, 1429421722);

-- --------------------------------------------------------

--
-- 表的结构 `pt_travel_plan`
--

CREATE TABLE IF NOT EXISTS `pt_travel_plan` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `place` text NOT NULL,
  `transportation` text,
  `desc` text,
  `meals` text,
  `accommodation` text,
  `rank` smallint(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_travel_plan`
--

INSERT INTO `pt_travel_plan` (`id`, `mid`, `goods_id`, `place`, `transportation`, `desc`, `meals`, `accommodation`, `rank`) VALUES
(47, 1, 47, '全国各地|巴厘岛', '飞机', '全国各地自由出发，搭乘国际航班飞往巴厘岛。巴厘岛是世界上最漂亮而有特色的观光胜地之一，凭借着其得天独厚的自然景观、古老的文明与独特的地方民俗艺术、绝美的海滩、精致的手工艺术、曼妙的音乐舞蹈，这里几乎是一个人间的香格里拉。抵达后我们的华语导游以及司机用他们热情的笑容将你迎入完全巴厘风情的度假酒店休息。 \r\n注：巴厘岛时间同北京时间。', '不含餐', '精品酒店或晚度假酒店', 1),
(48, 1, 48, '深圳或香港|首尔', '飞机', '&nbsp;', '晚餐（机上享用）', '韩国四花酒店或同级', 1),
(55, 1, 49, '全国各地|曼谷', '飞机', '乘机前往泰国首都—曼谷，之后到达酒店休息', '自理', '绿宝石酒店或同级', 1),
(56, 1, 49, '拉玛王朝大皇宫|玉佛寺|长尾船游湄南河|阿兰达皇家御会馆', '汽车|汽车|汽车', '&nbsp;', '含早中晚', '东方大皇宫或同级', 2),
(57, 1, 49, '珠宝展示中心|皮革展示中心|东芭乐园|爱之城|暹罗音乐渔村', '汽车|汽车|汽车|汽车', '&nbsp;', '含早中晚', '东方大皇宫或同级', 3),
(59, 1, 50, '全国各地|普吉岛', '飞机', '搭乘泰国都市航空公司客机直飞前往普吉岛。抵达后入住酒店。', '早中晚：敬请自理', '巴东区安达凯拉酒店 ANDAKIRA HOTEL或参考酒店', 1),
(69, 1, 50, '攀牙湾|割喉群岛泛舟大自然之旅|登007岛|威尼斯文化村|Safari四合一毒蛇研究中心', '船舶|船舶|汽车|汽车', '&nbsp;', '早餐：酒店早餐     午餐：水上人家简餐     晚餐：王大福餐厅', '巴东区安达凯拉酒店 ANDAKIRA HOTEL或参考酒店wwwwwwwwwwwwwwwwd僧灌灌灌灌灌个看基本偶尔还回去外婆ihi哦亲问候和欧冠覅问哦风波微博 欧威狗尾巴佛网i宝覅U币额外i哦IQ而非 IEu粉笔无恶女 &nbsp;u个覅u我被u分别无比 &nbsp; &nbsp; &nbsp;i五二班个一u微博符文 &nbsp;&nbsp;', 2),
(60, 1, 49, '芭提雅| 金沙岛| 3D艺术馆|东方公主号|芭堤雅特色表演', '汽车|汽车|汽车|汽车', '&nbsp;', '含早中晚', '东方大皇宫或同级', 4),
(61, 1, 49, '芭堤雅|金佛寺土特产（乳胶/燕窝/特产） |毒蛇研究中心 KINGPOWER免税店', '汽车|汽车', '&nbsp;', '含早中晚餐', '国际五星或同级', 5),
(62, 1, 48, '首尔南怡岛|景福宫|青瓦台|涂鸦秀或其他表演', '汽车|汽车|汽车', '&nbsp;', '早餐（酒店外）  午餐（韩国料理）   晚餐（韩国料理）', '韩国四花酒店或同级', 2),
(63, 1, 48, '首尔|紫菜及韩服体验|北村韩屋村|清溪川|熊津蒲蕾水上乐园', '汽车|汽车|汽车|汽车', '&nbsp;', '早餐（酒店外）  午餐（韩国料理）   晚餐（韩国料理）', '韩国四花酒店或同级', 3),
(64, 1, 48, '自由活动（按照所签订的补充协议进行）|乐天免税+乐天世界|新罗免税店|明洞商业街', '汽车|汽车|汽车', '&nbsp;', '早餐（酒店外）   午餐（韩国料理）   晚餐（自理）', '韩国四花酒店或同级', 4),
(65, 1, 48, '首尔|深圳或香港', '飞机', '早晨前往【韩国土特产店（停留时间约1小时）】用早餐并自由购物活动，后乘坐客机返香港,团队抵香港机场后散团，行程完满结束。', '早餐（酒店外）  午餐（机上享用）', '温暖的家', 5),
(66, 1, 47, '南湾|玻璃底船+海龟岛情人崖下午茶咖啡梦工厂|金巴兰BBQ-库塔逛街', '汽车|汽车', '&nbsp;&nbsp;', '酒店早餐    午餐：中式料理      晚餐：金巴兰海鲜烧烤', '精品酒店', 2),
(67, 1, 47, '乌布皇宫|传统市场|海神庙-珠宝店|精油按摩|乳胶店（约60分钟）', '汽车|汽车|汽车|汽车', '&nbsp;', '酒店早餐  午餐：特色脏鸭餐 晚餐：中式料理', '海边度假村酒店', 3),
(68, 1, 47, '全天自由活动', '', '&nbsp;', '早餐：酒店自助餐   午餐：自理         晚餐：自理', '海边度假村酒店', 4),
(70, 1, 50, '快艇蓝钻岛（或帝王岛）|快艇大PP岛|情人沙滩|小PP岛快艇环游|海燕生态馆|泰式SPA', '船舶|船舶|船舶|汽车|汽车', '&nbsp;', '早餐：酒店早餐     午餐：蓝钻岛或PP岛简餐（离岛餐）       晚餐：女神养生火锅', '素帕莱度假村 Supalai resort and spa或参考海边酒店', 3),
(71, 1, 50, '世界金世纪录珍宝苑|海龙寺|泰南乳胶制品|国际人妖后表演', '汽车|汽车|汽车', '&nbsp;', '早餐：酒店早餐     中餐：水都自助餐      晚餐：渔人码头海鲜餐', '住宿：素帕莱度假村 Supalai resort and spa或参考海边酒店', 4),
(72, 1, 50, '普吉岛 ~皮具店|出发地', '飞机', '&nbsp;', '早餐：酒店早餐  午餐：敬请自理  晚餐：敬请自理', '温暖的家', 5),
(73, 1, 49, '曼谷|出发地', '飞机', '早餐后。自行抵达机场，返回温馨的家园！', '早餐：酒店内    午餐：视航班时间而定', '温暖的家', 6),
(74, 1, 47, '巴厘岛|出发地', '飞机', '早餐后于指定时间集合乘车前往巴厘岛机场乘坐印尼鹰航飞回全国各地国际机场。结束愉快旅程！！', '酒店早餐', '温暖的家', 5);

-- --------------------------------------------------------

--
-- 表的结构 `pt_user`
--

CREATE TABLE IF NOT EXISTS `pt_user` (
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `mid` int(10) NOT NULL COMMENT '公众模块ID',
  `openid` varchar(50) NOT NULL COMMENT '微信用户标识',
  `ctime` int(10) unsigned NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='微信公众用户表';

--
-- 转存表中的数据 `pt_user`
--

INSERT INTO `pt_user` (`uid`, `mid`, `openid`, `ctime`) VALUES
(21, 1, '0', 0),
(27, 1, 'ojpX_jig-gyi3_Q9fHXQ4rdHniQs', 1440486682);

-- --------------------------------------------------------

--
-- 表的结构 `pt_userinfo_ggk`
--

CREATE TABLE IF NOT EXISTS `pt_userinfo_ggk` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `mid` int(10) NOT NULL,
  `address` varchar(200) NOT NULL DEFAULT ''''''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='中奖用户信息';

-- --------------------------------------------------------

--
-- 表的结构 `pt_user_account`
--

CREATE TABLE IF NOT EXISTS `pt_user_account` (
  `uid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户';

-- --------------------------------------------------------

--
-- 表的结构 `pt_user_address`
--

CREATE TABLE IF NOT EXISTS `pt_user_address` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '收货人',
  `province` varchar(50) NOT NULL COMMENT '省/直辖市',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `area` varchar(50) NOT NULL COMMENT '区、县',
  `address` varchar(200) NOT NULL COMMENT '收货地址',
  `mobile` varchar(20) NOT NULL COMMENT '电话',
  `postcode` char(6) NOT NULL COMMENT '邮编',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1默认'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户收货地址';

--
-- 转存表中的数据 `pt_user_address`
--

INSERT INTO `pt_user_address` (`id`, `mid`, `uid`, `name`, `province`, `city`, `area`, `address`, `mobile`, `postcode`, `default`) VALUES
(1, 1, 1, 'king', '', '', '', '深圳市南山区', '18824649025', '', 1),
(2, 1, 24, '陈鹏', '广东省', '深圳市', '宝安区', '西丽共乐社区3巷1号', '13465768502', '', 1),
(3, 1, 24, '陈鹏', '广东省', '深圳市', '南山区', '西丽共乐社区3巷1号', '13465768502', '', 0),
(4, 1, 26, '陈鹏', '广东省', '深圳市', '南山区', '微尚互动', '13356254251', '', 0),
(5, 1, 23, '炎宗', '广东省', '深圳市', '宝安区', '西乡固戍', '13828751031', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `pt_user_collect`
--

CREATE TABLE IF NOT EXISTS `pt_user_collect` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_num` varchar(10) NOT NULL COMMENT '商品编码 ',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `url` varchar(100) NOT NULL COMMENT '链接地址',
  `type` enum('goods','news') NOT NULL COMMENT '收藏类型',
  `ctime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏';

-- --------------------------------------------------------

--
-- 表的结构 `pt_user_coupon`
--

CREATE TABLE IF NOT EXISTS `pt_user_coupon` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `coupon_id` int(10) unsigned NOT NULL COMMENT '优惠券ID',
  `uid` int(10) unsigned NOT NULL,
  `etime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用时间，0表示未使用',
  `ctime` int(10) unsigned NOT NULL COMMENT '领取时间'
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_user_coupon`
--

INSERT INTO `pt_user_coupon` (`id`, `mid`, `coupon_id`, `uid`, `etime`, `ctime`) VALUES
(15, 1, 3, 23, 0, 1429811912),
(16, 1, 1, 23, 0, 1429811971),
(14, 1, 1, 24, 0, 1429811703),
(13, 1, 3, 24, 0, 1429811694),
(12, 1, 3, 24, 0, 1429811684);

-- --------------------------------------------------------

--
-- 表的结构 `pt_user_data`
--

CREATE TABLE IF NOT EXISTS `pt_user_data` (
  `did` int(10) NOT NULL COMMENT '会员数据表        ',
  `mid` int(10) NOT NULL,
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `grade` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员等级1到3',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `idcard` varchar(18) NOT NULL COMMENT '身份证',
  `cardnum` varchar(20) NOT NULL COMMENT '会员卡号',
  `headimg` varchar(100) NOT NULL COMMENT '用户自己上传的图片',
  `ctime` int(10) NOT NULL COMMENT '之策时间'
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_user_data`
--

INSERT INTO `pt_user_data` (`did`, `mid`, `phone`, `password`, `grade`, `name`, `idcard`, `cardnum`, `headimg`, `ctime`) VALUES
(46, 1, '13823729527', 'd3fef3f02356e8ca095147c4067c52d0', 3, '测试章剑', '189078', '1430378081611', '', 1430378081),
(20, 1, '18682074562', 'e10adc3949ba59abbe56e057f20f883e', 3, 'Ken2', '123456', '1430360466559', '', 1430360466),
(4, 1, '18824649025', 'e10adc3949ba59abbe56e057f20f883e', 3, '骏霖', '188246', '1430217204570', '1/2015/0430/1430386072669.jpg', 1430217204),
(5, 1, '18718524266', '7036317bfa74b871c8687f0d6bf412f8', 3, '陈鹏', '133651', '1430205013109', '', 1430205013),
(6, 1, '13800138000', '202cb962ac59075b964b07152d234b70', 3, '哈哈', '25563x', '1430205643811', '', 1430205643),
(7, 1, '13828751033', 'e10adc3949ba59abbe56e057f20f883e', 2, '李炎宗', '456123', '1430294187119', '', 1430294187),
(8, 1, '18682074560', 'e10adc3949ba59abbe56e057f20f883e', 3, '坤哥2', '123458', '1430294933793', '1/2015/0429/1430296044320.jpg', 1430294933),
(9, 1, '18682074561', 'e10adc3949ba59abbe56e057f20f883e', 2, 'Ken', '123456', '1430295532412', '', 1430295532),
(10, 1, '13686645233', 'e10adc3949ba59abbe56e057f20f883e', 2, '测试', '123456', '1430295977248', '', 1430295977),
(11, 1, '13828759932', 'e10adc3949ba59abbe56e057f20f883e', 2, '张三', '465002', '14303045370', '', 1430304537),
(12, 1, '13828758833', 'd964173dc44da83eeafa3aebbee9a1a0', 2, '李四', '123456', '14303045371', '', 1430304537),
(13, 1, '13828759935', 'e10adc3949ba59abbe56e057f20f883e', 2, '张三', '465002', '14303048350', '', 1430304835),
(14, 1, '13828758899', 'd964173dc44da83eeafa3aebbee9a1a0', 2, '李四', '123456', '14303048351', '', 1430304835),
(15, 1, '13800165622', 'e10adc3949ba59abbe56e057f20f883e', 2, '张三一', '465002', '14303584330', '', 1430358433),
(16, 1, '13898745125', 'd964173dc44da83eeafa3aebbee9a1a0', 2, '李四无', '123456', '14303584711', '', 1430358471),
(17, 1, '18826536252', 'd964173dc44da83eeafa3aebbee9a1a0', 2, '四无', '123456', '14303591471', '', 1430359147),
(18, 1, '13828779660', '3cd152be579c6d7baa9f7f73cb6cc2eb', 3, '陈华明', '123456', '1430359194872', '', 1430359194),
(19, 1, '13828758838', '96e79218965eb72c92a549dd5a330112', 1, 'sss', '334444', '14303597392', '', 1430359739),
(45, 1, '13232323232', '202cb962ac59075b964b07152d234b70', 2, '测试', '323232', '1430373287999', '', 1430373287),
(44, 1, '13828758804', 'd964173dc44da83eeafa3aebbee9a1a0', 2, '李四4', '123456', '14303626903', '', 1430362690),
(43, 1, '13828758803', 'd964173dc44da83eeafa3aebbee9a1a0', 2, '李四3', '123456', '14303626902', '', 1430362690),
(47, 1, '13828751031', 'e10adc3949ba59abbe56e057f20f883e', 1, '宗宗', '123456', '1430381945416', '', 1430381945),
(48, 1, '18688988600', 'e10adc3949ba59abbe56e057f20f883e', 3, '伍侠', '161011', '1430384007845', '1/2015/0430/1430384042574.jpg', 1430384007),
(49, 1, '13254788999', '240f2d1988d2590ecd8f63c808f31c78', 1, 'dddd', '123456', '1430384856634', '', 1430384856),
(50, 1, '18682074563', 'e10adc3949ba59abbe56e057f20f883e', 1, 'Ken8', '123456', '1430386253325', '', 1430386253),
(51, 1, '15112263836', 'e10adc3949ba59abbe56e057f20f883e', 3, '杨毕', '187037', '1430703790166', '', 1430703790),
(52, 1, '18600243176', 'd070ba93b30f67858201a1b9b16e9864', 3, '陈鹏', '369854', '1430722859562', '', 1430722859),
(53, 1, '15920050616', 'e10adc3949ba59abbe56e057f20f883e', 3, 'Tommy', '188013', '1430738438290', '', 1430738438),
(54, 1, '18660671548', '202cb962ac59075b964b07152d234b70', 1, '2', '124578', '1430965007950', '', 1430965007),
(55, 1, '15935132936', 'e10adc3949ba59abbe56e057f20f883e', 3, '中国', '256210', '1431333036160', '', 1431333036),
(56, 1, '13969696556', 'e10adc3949ba59abbe56e057f20f883e', 3, 'jun', '656532', '1431411652905', '', 1431411652),
(57, 1, '15920050611', 'e10adc3949ba59abbe56e057f20f883e', 3, '1213', '133344', '1432288033607', '', 1432288033),
(58, 1, '13631255555', '34d61a4c35fa1da91b9cd793c75b41ee', 2, '13631255555', '112121', '1432361256336', '', 1432361256),
(59, 1, '13631298857', 'e6f42f8f7015da16b628faa3c53bd764', 1, '123', '080804', '1432361428457', '', 1432361428),
(60, 1, '13631298888', 'e10adc3949ba59abbe56e057f20f883e', 3, '刘育嘉', '123456', '1432362177430', '', 1432362177),
(61, 1, '12345678912', '73741a8c767a4db2d0ff6c208aa116ad', 1, '测试', '111111', '1432520647336', '', 1432520647),
(62, 1, '15399906652', 'e10adc3949ba59abbe56e057f20f883e', 3, '测试', '111111', '1432629536430', '1/2015/0527/1432719453402.jpg', 1432629536),
(63, 1, '13656565656', 'e10adc3949ba59abbe56e057f20f883e', 2, 'cc', '565656', '1432631844106', '', 1432631844),
(64, 1, '18787878787', '09576ca345d5fa93846760e5be818041', 1, '111', '878787', '1432631900169', '', 1432631900),
(65, 1, '34533453453', '91664abd9b3dbab285f106181a53b7ca', 2, 'e45yh4', '345543', '1434014913439', '', 1434014913),
(66, 1, '13880972979', '045d9d11551fcb42f4fc2403916003eb', 1, '浩然', '313550', '1434089803938', '', 1434089803),
(67, 1, '13316051905', 'f82ac9d62e3bd43406d73b09b87e1039', 1, '涛', '123456', '1434089879704', '', 1434089879),
(68, 1, '13838383447', 'c59f4bb06f9e323644cc01c83c7ac0e5', 1, 'h h j', '009123', '1434089916937', '', 1434089916),
(69, 1, '18520827282', 'e10adc3949ba59abbe56e057f20f883e', 3, '刘涛', '06183x', '1434089948459', '', 1434089948),
(70, 1, '13631671339', 'e10adc3949ba59abbe56e057f20f883e', 1, '余炳均', '148213', '1434089956335', '', 1434089956),
(71, 1, '18503037495', 'f673df3888bbb5cd58a284303945079b', 1, '丁香', '712710', '1434089960278', '', 1434089960),
(72, 1, '13807531025', 'e10adc3949ba59abbe56e057f20f883e', 1, '杜', '205622', '1434089979556', '', 1434089979),
(73, 1, '13510205052', 'd8f148f1b1428a07da4b2ee28d35656e', 1, '郑晓铃', '123456', '1434090051381', '', 1434090051),
(74, 1, '18826575803', 'ee20b32d6e5d51dd50ecda461b2ae387', 3, '袁露', '291529', '1434090093424', '', 1434090093),
(75, 1, '15817229306', '541db65970548f006cd97a86930c35c1', 2, '匡', '888888', '1434092165930', '', 1434092165),
(76, 1, '18825240274', 'd32c405ca01456de64d8dd60eca05a74', 3, '莫勇', '226133', '1435057128180', '', 1435057128),
(77, 1, '13800380012', 'd32c405ca01456de64d8dd60eca05a74', 1, '莫', '512233', '1435114342482', '', 1435114342),
(78, 1, '18566773114', '745412654d396cd4a29b451967d0bbe8', 3, '张三', '666666', '1435133116676', '', 1435133116),
(79, 1, '18596524125', '5ad6332a0139dc099f9abec355d98bb4', 1, '陈鹏', '698532', '1440475288340', '', 1440475288),
(80, 1, '18752423652', '61df1ba7ad1a17b173a65f16f7601a7d', 1, '陈鹏', '365248', '1440482832116', '', 1440482832),
(81, 1, '18782089303', '69731fe299669d8f7aa5a482f8cc8fa3', 1, '蔡忠池', '283394', '1440495901388', '', 1440495901),
(82, 1, '18612855017', '4438fc033f8aef433f9db5348b70e8e5', 1, 'icehome', '121117', '1440749790660', '', 1440749790),
(83, 1, '18124589554', 'e10adc3949ba59abbe56e057f20f883e', 1, '李舟', '050014', '1440753902129', '', 1440753902),
(84, 1, '34544566664', '639d4acf78b7b32b10eb61c7892b999c', 1, 'Gzhhhjzjjz', '564666', '1441184649963', '', 1441184649),
(85, 1, '12365478585', 'e31236860c1f5629403e11de6babc9e6', 1, '哦了了了了了', '124585', '1441184848981', '', 1441184848),
(86, 1, '13465768502', 'c0c11abdfcf5bb6362fbf1d679f94a90', 1, '陈鹏', '321456', '1441519902433', '', 1441519902),
(87, 1, '13530665756', 'e9e667ae1496fe7ac1ca0f5fcf49501e', 1, 'mika', '996552', '1441694524795', '', 1441694524),
(88, 1, '15633033172', '4438fc033f8aef433f9db5348b70e8e5', 1, '郝振桥', '121117', '1441703217675', '', 1441703217),
(89, 1, '13811889696', '6819c0107bfee4cca773a1c169bf314d', 1, 'zhb', '055277', '1441776373936', '', 1441776373),
(90, 1, '13590166034', 'e741eb1d622b86184ebef34e9bcc53ad', 1, '梁业辉', '854617', '1441858408194', '', 1441858408),
(91, 1, '13588888888', '21218cca77804d2ba1922c33e0151105', 1, 'tesy', '666666', '1444894524709', '', 1444894524);

-- --------------------------------------------------------

--
-- 表的结构 `pt_user_grade`
--

CREATE TABLE IF NOT EXISTS `pt_user_grade` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL COMMENT '等级名称',
  `name` varchar(50) NOT NULL COMMENT '等级',
  `min_score` int(10) NOT NULL COMMENT '最小积分，只要达到这个最新积分就自动升级',
  `desc` text NOT NULL COMMENT '特权描述'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员等级表';

--
-- 转存表中的数据 `pt_user_grade`
--

INSERT INTO `pt_user_grade` (`id`, `mid`, `name`, `min_score`, `desc`) VALUES
(1, 1, '普通卡', 10, '普通的卡'),
(2, 1, '白金卡', 100, '中等级别'),
(3, 1, '钻石白金卡', 500, '高级会员');

-- --------------------------------------------------------

--
-- 表的结构 `pt_user_location`
--

CREATE TABLE IF NOT EXISTS `pt_user_location` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `latitude` varchar(30) NOT NULL COMMENT '经度',
  `longitude` varchar(30) NOT NULL COMMENT '纬度',
  `ctime` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='纬度和经度表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_user_wxdata`
--

CREATE TABLE IF NOT EXISTS `pt_user_wxdata` (
  `uid` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `sex` tinyint(4) NOT NULL,
  `country` varchar(50) NOT NULL COMMENT '国家',
  `province` varchar(50) NOT NULL COMMENT '省份',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `wx_headimg` varchar(200) NOT NULL COMMENT '头像',
  `ctime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信用户信息';

-- --------------------------------------------------------

--
-- 表的结构 `pt_visits`
--

CREATE TABLE IF NOT EXISTS `pt_visits` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `uid` int(10) NOT NULL COMMENT '用户id',
  `shop_id` int(10) NOT NULL COMMENT '门店id',
  `ctime` int(10) NOT NULL COMMENT '时间段（每小时）',
  `nums` int(10) NOT NULL DEFAULT '0' COMMENT '访问量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问量统计表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_visits_good`
--

CREATE TABLE IF NOT EXISTS `pt_visits_good` (
  `id` int(10) NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品',
  `ctime` int(11) NOT NULL COMMENT '时间段（每小时）',
  `nums` int(11) unsigned NOT NULL COMMENT '访问量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品访问量统计表';

-- --------------------------------------------------------

--
-- 表的结构 `pt_wxreply`
--

CREATE TABLE IF NOT EXISTS `pt_wxreply` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `shop_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店ID，0表示默认',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `keyword` varchar(200) NOT NULL COMMENT '关健词',
  `type` tinyint(1) unsigned NOT NULL COMMENT '1文本，2音频，3文本',
  `cate` tinyint(1) unsigned NOT NULL COMMENT '1关注自动回复，2消息自动回复，3关健字自动回复',
  `ctime` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='微信自动回复设置';

--
-- 转存表中的数据 `pt_wxreply`
--

INSERT INTO `pt_wxreply` (`id`, `mid`, `shop_id`, `title`, `keyword`, `type`, `cate`, `ctime`) VALUES
(1, 1, 0, '', '', 1, 1, 1440486748),
(2, 1, 0, '', '', 1, 2, 1440486950);

-- --------------------------------------------------------

--
-- 表的结构 `pt_wxreply_imgtext`
--

CREATE TABLE IF NOT EXISTS `pt_wxreply_imgtext` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `wxreply_id` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `imgurl` varchar(100) NOT NULL COMMENT '图片地址',
  `link` varchar(100) NOT NULL COMMENT '链接',
  `desc` mediumtext NOT NULL COMMENT '描述',
  `rank` tinyint(1) unsigned NOT NULL COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信自动回复-图文';

-- --------------------------------------------------------

--
-- 表的结构 `pt_wxreply_text`
--

CREATE TABLE IF NOT EXISTS `pt_wxreply_text` (
  `wxreply_id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `content` text NOT NULL COMMENT '回复内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信自动回复-文本';

--
-- 转存表中的数据 `pt_wxreply_text`
--

INSERT INTO `pt_wxreply_text` (`wxreply_id`, `mid`, `content`) VALUES
(1, 1, '感谢关注'),
(2, 1, '欢迎光临');

-- --------------------------------------------------------

--
-- 表的结构 `pt_wxreply_voice`
--

CREATE TABLE IF NOT EXISTS `pt_wxreply_voice` (
  `wxreply_id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `voice_url` varchar(100) NOT NULL COMMENT '音频地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信自动回复-音频';

-- --------------------------------------------------------

--
-- 表的结构 `pt_wx_notice`
--

CREATE TABLE IF NOT EXISTS `pt_wx_notice` (
  `id` int(10) NOT NULL DEFAULT '0',
  `mid` int(10) NOT NULL,
  `appid` varchar(50) NOT NULL,
  `errortype` varchar(20) NOT NULL,
  `description` text NOT NULL COMMENT '错误描述',
  `alarmcontent` text NOT NULL COMMENT '错误详情',
  `timestamp` int(10) NOT NULL,
  `appsignature` varchar(50) NOT NULL,
  `signmethod` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信警告消息';

-- --------------------------------------------------------

--
-- 表的结构 `pt_wx_print`
--

CREATE TABLE IF NOT EXISTS `pt_wx_print` (
  `id` int(10) NOT NULL,
  `mid` int(10) NOT NULL,
  `publicuserid` int(10) NOT NULL COMMENT '微信主标识',
  `start_flag` varchar(10) NOT NULL COMMENT '启动标识',
  `quit_flag` varchar(10) NOT NULL COMMENT '退出标识',
  `ctime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信标识设置';

-- --------------------------------------------------------

--
-- 表的结构 `pt_wx_status`
--

CREATE TABLE IF NOT EXISTS `pt_wx_status` (
  `id` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `init_data` text NOT NULL COMMENT '初始化数据',
  `run_data` text NOT NULL COMMENT '实时数据',
  `etime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `ctime` int(10) unsigned NOT NULL COMMENT '开始时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信状态表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `admin_loginlog`
--
ALTER TABLE `admin_loginlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_active`
--
ALTER TABLE `pt_active`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_active_result`
--
ALTER TABLE `pt_active_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_actlog_ggk`
--
ALTER TABLE `pt_actlog_ggk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_admin`
--
ALTER TABLE `pt_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `shop_id` (`mid`,`shop_id`);

--
-- Indexes for table `pt_admin_log`
--
ALTER TABLE `pt_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `pt_adverts`
--
ALTER TABLE `pt_adverts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_answer`
--
ALTER TABLE `pt_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`,`active_id`,`question_id`);

--
-- Indexes for table `pt_area_and_shop`
--
ALTER TABLE `pt_area_and_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_shop` (`area_id`,`mid`,`shop_id`);

--
-- Indexes for table `pt_area_shop`
--
ALTER TABLE `pt_area_shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_article`
--
ALTER TABLE `pt_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`mid`,`cid`);

--
-- Indexes for table `pt_article_cate`
--
ALTER TABLE `pt_article_cate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_ask_log`
--
ALTER TABLE `pt_ask_log`
  ADD PRIMARY KEY (`ask_id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `pt_attr`
--
ALTER TABLE `pt_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_autoreply`
--
ALTER TABLE `pt_autoreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_bank`
--
ALTER TABLE `pt_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_banner`
--
ALTER TABLE `pt_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_barter_refund`
--
ALTER TABLE `pt_barter_refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `midIndex` (`mid`,`uid`,`order_id`);

--
-- Indexes for table `pt_card_data`
--
ALTER TABLE `pt_card_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fn` (`fid`,`num`);

--
-- Indexes for table `pt_car_brand`
--
ALTER TABLE `pt_car_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_car_series`
--
ALTER TABLE `pt_car_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_car_type`
--
ALTER TABLE `pt_car_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_cbg`
--
ALTER TABLE `pt_cbg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `ctime` (`ctime`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `pt_cbg_count`
--
ALTER TABLE `pt_cbg_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usesecond` (`usesecond`);

--
-- Indexes for table `pt_cbg_log`
--
ALTER TABLE `pt_cbg_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_cbg_prize`
--
ALTER TABLE `pt_cbg_prize`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `user_id` (`uid`),
  ADD KEY `aid` (`did`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `pt_column`
--
ALTER TABLE `pt_column`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_comment`
--
ALTER TABLE `pt_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`) USING BTREE,
  ADD KEY `did` (`did`) USING BTREE,
  ADD KEY `order_num` (`order_num`) USING BTREE,
  ADD KEY `ctime` (`ctime`) USING BTREE;

--
-- Indexes for table `pt_comment_detail`
--
ALTER TABLE `pt_comment_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`) USING BTREE,
  ADD KEY `did` (`did`) USING BTREE;

--
-- Indexes for table `pt_company`
--
ALTER TABLE `pt_company`
  ADD PRIMARY KEY (`mid`),
  ADD UNIQUE KEY `api_key` (`api_key`);

--
-- Indexes for table `pt_company_org`
--
ALTER TABLE `pt_company_org`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_config`
--
ALTER TABLE `pt_config`
  ADD PRIMARY KEY (`mid`,`key`);

--
-- Indexes for table `pt_coupon`
--
ALTER TABLE `pt_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_custom_menu`
--
ALTER TABLE `pt_custom_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_dealer`
--
ALTER TABLE `pt_dealer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_dy_activity`
--
ALTER TABLE `pt_dy_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_dy_join`
--
ALTER TABLE `pt_dy_join`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_dy_set`
--
ALTER TABLE `pt_dy_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_dzp`
--
ALTER TABLE `pt_dzp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `ctime` (`ctime`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `pt_dzp_log`
--
ALTER TABLE `pt_dzp_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_dzp_prize`
--
ALTER TABLE `pt_dzp_prize`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `user_id` (`uid`),
  ADD KEY `aid` (`did`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `pt_exchange`
--
ALTER TABLE `pt_exchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_favorable`
--
ALTER TABLE `pt_favorable`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `pt_footer_menu`
--
ALTER TABLE `pt_footer_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_ggk`
--
ALTER TABLE `pt_ggk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `ctime` (`ctime`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `pt_ggk_log`
--
ALTER TABLE `pt_ggk_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_ggk_prize`
--
ALTER TABLE `pt_ggk_prize`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `user_id` (`uid`),
  ADD KEY `aid` (`did`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `pt_goods`
--
ALTER TABLE `pt_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_goods_cate`
--
ALTER TABLE `pt_goods_cate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_goods_gi_cate`
--
ALTER TABLE `pt_goods_gi_cate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pt_goods_cate_code` (`code`),
  ADD KEY `pt_goods_gi_cate_index_name` (`name`),
  ADD KEY `pt_goods_cate_weight` (`weight`);

--
-- Indexes for table `pt_goods_new`
--
ALTER TABLE `pt_goods_new`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pt_goods_new_name` (`name`),
  ADD KEY `pt_goods_new_gi_cate` (`gi_cate`),
  ADD KEY `pt_goods_new_goods_type` (`goods_type`),
  ADD KEY `pt_goods_new_belong_goods_id` (`belong_goods_id`);

--
-- Indexes for table `pt_goods_pics`
--
ALTER TABLE `pt_goods_pics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pt_goods_pic_goods_id` (`goods_id`),
  ADD KEY `pt_goods_pic_type` (`type`);

--
-- Indexes for table `pt_goods_price`
--
ALTER TABLE `pt_goods_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pt_goods_price_goods_id` (`goods_id`),
  ADD KEY `pt_goods_price_go_data` (`go_date`);

--
-- Indexes for table `pt_goods_xingcheng`
--
ALTER TABLE `pt_goods_xingcheng`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pt_goods_xingcheng_goods_id` (`googs_id`),
  ADD KEY `pt_goods_xingcheng_day` (`day`);

--
-- Indexes for table `pt_hp_log`
--
ALTER TABLE `pt_hp_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_huoyue_user`
--
ALTER TABLE `pt_huoyue_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mid` (`mid`,`uid`);

--
-- Indexes for table `pt_image_text`
--
ALTER TABLE `pt_image_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_keyword_autoreply`
--
ALTER TABLE `pt_keyword_autoreply`
  ADD PRIMARY KEY (`kar_id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `pt_keyword_autoreply_position`
--
ALTER TABLE `pt_keyword_autoreply_position`
  ADD PRIMARY KEY (`kap_id`),
  ADD KEY `kar_id` (`kar_id`);

--
-- Indexes for table `pt_keyword_autoreply_pttext`
--
ALTER TABLE `pt_keyword_autoreply_pttext`
  ADD PRIMARY KEY (`kapt_id`),
  ADD KEY `kar_id` (`kar_id`);

--
-- Indexes for table `pt_keyword_autoreply_text`
--
ALTER TABLE `pt_keyword_autoreply_text`
  ADD PRIMARY KEY (`kart_id`),
  ADD KEY `kar_id` (`kar_id`);

--
-- Indexes for table `pt_keyword_autoreply_video`
--
ALTER TABLE `pt_keyword_autoreply_video`
  ADD PRIMARY KEY (`kav_id`),
  ADD KEY `kar_id` (`kar_id`);

--
-- Indexes for table `pt_massive`
--
ALTER TABLE `pt_massive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_massive_imgtext`
--
ALTER TABLE `pt_massive_imgtext`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wxreply_id` (`mid`,`massive_id`);

--
-- Indexes for table `pt_massive_text`
--
ALTER TABLE `pt_massive_text`
  ADD PRIMARY KEY (`massive_id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `pt_media`
--
ALTER TABLE `pt_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_model`
--
ALTER TABLE `pt_model`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `pt_mp3`
--
ALTER TABLE `pt_mp3`
  ADD PRIMARY KEY (`mp3_id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `pt_my_prize`
--
ALTER TABLE `pt_my_prize`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_news`
--
ALTER TABLE `pt_news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `pt_news_cate`
--
ALTER TABLE `pt_news_cate`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `pt_news_read`
--
ALTER TABLE `pt_news_read`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_online_message`
--
ALTER TABLE `pt_online_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_online_reply`
--
ALTER TABLE `pt_online_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_order`
--
ALTER TABLE `pt_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_num` (`order_num`),
  ADD KEY `goods_id` (`goods_id`) USING BTREE,
  ADD KEY `did` (`did`) USING BTREE,
  ADD KEY `paid_time` (`paid_time`) USING BTREE,
  ADD KEY `qudao_id` (`qudao_id`),
  ADD KEY `jcode` (`jcode`),
  ADD KEY `order_date` (`order_date`);

--
-- Indexes for table `pt_payment`
--
ALTER TABLE `pt_payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_num` (`order_num`),
  ADD KEY `did` (`did`),
  ADD KEY `etime` (`etime`);

--
-- Indexes for table `pt_pending_member`
--
ALTER TABLE `pt_pending_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `pt_permission`
--
ALTER TABLE `pt_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_prize_score`
--
ALTER TABLE `pt_prize_score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_prize_sign`
--
ALTER TABLE `pt_prize_sign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_qudao`
--
ALTER TABLE `pt_qudao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`) USING BTREE;

--
-- Indexes for table `pt_questions`
--
ALTER TABLE `pt_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active_id` (`active_id`);

--
-- Indexes for table `pt_sales_promotion`
--
ALTER TABLE `pt_sales_promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_sales_record`
--
ALTER TABLE `pt_sales_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_scores`
--
ALTER TABLE `pt_scores`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `pt_score_add_setting`
--
ALTER TABLE `pt_score_add_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_score_goods`
--
ALTER TABLE `pt_score_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`mid`,`cid`);

--
-- Indexes for table `pt_score_log`
--
ALTER TABLE `pt_score_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `pt_setting`
--
ALTER TABLE `pt_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_shop`
--
ALTER TABLE `pt_shop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_num` (`mid`,`shop_num`);

--
-- Indexes for table `pt_shopping_cart`
--
ALTER TABLE `pt_shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`mid`,`user_id`),
  ADD KEY `goods_id` (`mid`,`goods_id`);

--
-- Indexes for table `pt_shopping_freight`
--
ALTER TABLE `pt_shopping_freight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_shopping_logistics`
--
ALTER TABLE `pt_shopping_logistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_shopping_order`
--
ALTER TABLE `pt_shopping_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_shopping_pay`
--
ALTER TABLE `pt_shopping_pay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_shopping_set`
--
ALTER TABLE `pt_shopping_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_shopping_user`
--
ALTER TABLE `pt_shopping_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_sign_log`
--
ALTER TABLE `pt_sign_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_solution`
--
ALTER TABLE `pt_solution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_sp_prize`
--
ALTER TABLE `pt_sp_prize`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_statistics`
--
ALTER TABLE `pt_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_travel_plan`
--
ALTER TABLE `pt_travel_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`) USING BTREE;

--
-- Indexes for table `pt_user`
--
ALTER TABLE `pt_user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `openid` (`mid`,`openid`);

--
-- Indexes for table `pt_userinfo_ggk`
--
ALTER TABLE `pt_userinfo_ggk`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `pt_user_account`
--
ALTER TABLE `pt_user_account`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `pt_user_address`
--
ALTER TABLE `pt_user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid_uid` (`mid`,`uid`);

--
-- Indexes for table `pt_user_collect`
--
ALTER TABLE `pt_user_collect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`mid`,`uid`);

--
-- Indexes for table `pt_user_coupon`
--
ALTER TABLE `pt_user_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `etime` (`etime`);

--
-- Indexes for table `pt_user_data`
--
ALTER TABLE `pt_user_data`
  ADD PRIMARY KEY (`did`),
  ADD UNIQUE KEY `mid` (`mid`,`phone`);

--
-- Indexes for table `pt_user_grade`
--
ALTER TABLE `pt_user_grade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_user_location`
--
ALTER TABLE `pt_user_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid_uid` (`mid`,`uid`);

--
-- Indexes for table `pt_user_wxdata`
--
ALTER TABLE `pt_user_wxdata`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `pt_visits`
--
ALTER TABLE `pt_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`,`shop_id`,`uid`),
  ADD KEY `ctime` (`ctime`);

--
-- Indexes for table `pt_visits_good`
--
ALTER TABLE `pt_visits_good`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`,`goods_id`),
  ADD KEY `ctime` (`ctime`);

--
-- Indexes for table `pt_wxreply`
--
ALTER TABLE `pt_wxreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`mid`,`shop_id`);

--
-- Indexes for table `pt_wxreply_imgtext`
--
ALTER TABLE `pt_wxreply_imgtext`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wxreply_id` (`mid`,`wxreply_id`);

--
-- Indexes for table `pt_wxreply_text`
--
ALTER TABLE `pt_wxreply_text`
  ADD PRIMARY KEY (`wxreply_id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `pt_wxreply_voice`
--
ALTER TABLE `pt_wxreply_voice`
  ADD PRIMARY KEY (`wxreply_id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `pt_wx_notice`
--
ALTER TABLE `pt_wx_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pt_wx_print`
--
ALTER TABLE `pt_wx_print`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mid` (`mid`);

--
-- Indexes for table `pt_wx_status`
--
ALTER TABLE `pt_wx_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`,`mid`,`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `admin_loginlog`
--
ALTER TABLE `admin_loginlog`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3847;
--
-- AUTO_INCREMENT for table `pt_active`
--
ALTER TABLE `pt_active`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_active_result`
--
ALTER TABLE `pt_active_result`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_actlog_ggk`
--
ALTER TABLE `pt_actlog_ggk`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_admin`
--
ALTER TABLE `pt_admin`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pt_admin_log`
--
ALTER TABLE `pt_admin_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=550;
--
-- AUTO_INCREMENT for table `pt_adverts`
--
ALTER TABLE `pt_adverts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pt_answer`
--
ALTER TABLE `pt_answer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_area_and_shop`
--
ALTER TABLE `pt_area_and_shop`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_area_shop`
--
ALTER TABLE `pt_area_shop`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_article`
--
ALTER TABLE `pt_article`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `pt_article_cate`
--
ALTER TABLE `pt_article_cate`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pt_ask_log`
--
ALTER TABLE `pt_ask_log`
  MODIFY `ask_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=113668;
--
-- AUTO_INCREMENT for table `pt_attr`
--
ALTER TABLE `pt_attr`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_autoreply`
--
ALTER TABLE `pt_autoreply`
  MODIFY `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pt_bank`
--
ALTER TABLE `pt_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pt_banner`
--
ALTER TABLE `pt_banner`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_barter_refund`
--
ALTER TABLE `pt_barter_refund`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_card_data`
--
ALTER TABLE `pt_card_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_car_brand`
--
ALTER TABLE `pt_car_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID';
--
-- AUTO_INCREMENT for table `pt_car_series`
--
ALTER TABLE `pt_car_series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID';
--
-- AUTO_INCREMENT for table `pt_car_type`
--
ALTER TABLE `pt_car_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID';
--
-- AUTO_INCREMENT for table `pt_cbg`
--
ALTER TABLE `pt_cbg`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_cbg_count`
--
ALTER TABLE `pt_cbg_count`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `pt_cbg_log`
--
ALTER TABLE `pt_cbg_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_cbg_prize`
--
ALTER TABLE `pt_cbg_prize`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_column`
--
ALTER TABLE `pt_column`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_comment`
--
ALTER TABLE `pt_comment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pt_comment_detail`
--
ALTER TABLE `pt_comment_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `pt_company`
--
ALTER TABLE `pt_company`
  MODIFY `mid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公众模块ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pt_company_org`
--
ALTER TABLE `pt_company_org`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `pt_coupon`
--
ALTER TABLE `pt_coupon`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pt_custom_menu`
--
ALTER TABLE `pt_custom_menu`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pt_dealer`
--
ALTER TABLE `pt_dealer`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_dy_activity`
--
ALTER TABLE `pt_dy_activity`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_dy_join`
--
ALTER TABLE `pt_dy_join`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_dy_set`
--
ALTER TABLE `pt_dy_set`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_dzp`
--
ALTER TABLE `pt_dzp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pt_dzp_log`
--
ALTER TABLE `pt_dzp_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_dzp_prize`
--
ALTER TABLE `pt_dzp_prize`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_exchange`
--
ALTER TABLE `pt_exchange`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_favorable`
--
ALTER TABLE `pt_favorable`
  MODIFY `fid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_footer_menu`
--
ALTER TABLE `pt_footer_menu`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_ggk`
--
ALTER TABLE `pt_ggk`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_ggk_log`
--
ALTER TABLE `pt_ggk_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_ggk_prize`
--
ALTER TABLE `pt_ggk_prize`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_goods`
--
ALTER TABLE `pt_goods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `pt_goods_cate`
--
ALTER TABLE `pt_goods_cate`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `pt_goods_gi_cate`
--
ALTER TABLE `pt_goods_gi_cate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_goods_new`
--
ALTER TABLE `pt_goods_new`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_goods_pics`
--
ALTER TABLE `pt_goods_pics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_goods_price`
--
ALTER TABLE `pt_goods_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_goods_xingcheng`
--
ALTER TABLE `pt_goods_xingcheng`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_hp_log`
--
ALTER TABLE `pt_hp_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合拍id',AUTO_INCREMENT=2348;
--
-- AUTO_INCREMENT for table `pt_huoyue_user`
--
ALTER TABLE `pt_huoyue_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pt_image_text`
--
ALTER TABLE `pt_image_text`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_keyword_autoreply`
--
ALTER TABLE `pt_keyword_autoreply`
  MODIFY `kar_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=177;
--
-- AUTO_INCREMENT for table `pt_keyword_autoreply_position`
--
ALTER TABLE `pt_keyword_autoreply_position`
  MODIFY `kap_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pt_keyword_autoreply_pttext`
--
ALTER TABLE `pt_keyword_autoreply_pttext`
  MODIFY `kapt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=752;
--
-- AUTO_INCREMENT for table `pt_keyword_autoreply_text`
--
ALTER TABLE `pt_keyword_autoreply_text`
  MODIFY `kart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=224;
--
-- AUTO_INCREMENT for table `pt_keyword_autoreply_video`
--
ALTER TABLE `pt_keyword_autoreply_video`
  MODIFY `kav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `pt_massive`
--
ALTER TABLE `pt_massive`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_massive_imgtext`
--
ALTER TABLE `pt_massive_imgtext`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_media`
--
ALTER TABLE `pt_media`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `pt_model`
--
ALTER TABLE `pt_model`
  MODIFY `mid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公众模块ID',AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `pt_mp3`
--
ALTER TABLE `pt_mp3`
  MODIFY `mp3_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `pt_my_prize`
--
ALTER TABLE `pt_my_prize`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_news`
--
ALTER TABLE `pt_news`
  MODIFY `news_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT for table `pt_news_cate`
--
ALTER TABLE `pt_news_cate`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_news_read`
--
ALTER TABLE `pt_news_read`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键索引';
--
-- AUTO_INCREMENT for table `pt_online_message`
--
ALTER TABLE `pt_online_message`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `pt_online_reply`
--
ALTER TABLE `pt_online_reply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `pt_order`
--
ALTER TABLE `pt_order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `pt_payment`
--
ALTER TABLE `pt_payment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `pt_pending_member`
--
ALTER TABLE `pt_pending_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_permission`
--
ALTER TABLE `pt_permission`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `pt_prize_score`
--
ALTER TABLE `pt_prize_score`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_prize_sign`
--
ALTER TABLE `pt_prize_sign`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_qudao`
--
ALTER TABLE `pt_qudao`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `pt_questions`
--
ALTER TABLE `pt_questions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_sales_promotion`
--
ALTER TABLE `pt_sales_promotion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_sales_record`
--
ALTER TABLE `pt_sales_record`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_score_add_setting`
--
ALTER TABLE `pt_score_add_setting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pt_score_goods`
--
ALTER TABLE `pt_score_goods`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_score_log`
--
ALTER TABLE `pt_score_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=210;
--
-- AUTO_INCREMENT for table `pt_setting`
--
ALTER TABLE `pt_setting`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pt_shop`
--
ALTER TABLE `pt_shop`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_shopping_cart`
--
ALTER TABLE `pt_shopping_cart`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=225;
--
-- AUTO_INCREMENT for table `pt_shopping_freight`
--
ALTER TABLE `pt_shopping_freight`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_shopping_logistics`
--
ALTER TABLE `pt_shopping_logistics`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_shopping_order`
--
ALTER TABLE `pt_shopping_order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_shopping_pay`
--
ALTER TABLE `pt_shopping_pay`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pt_shopping_set`
--
ALTER TABLE `pt_shopping_set`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_shopping_user`
--
ALTER TABLE `pt_shopping_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_sign_log`
--
ALTER TABLE `pt_sign_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_solution`
--
ALTER TABLE `pt_solution`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_sp_prize`
--
ALTER TABLE `pt_sp_prize`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_statistics`
--
ALTER TABLE `pt_statistics`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `pt_travel_plan`
--
ALTER TABLE `pt_travel_plan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `pt_user`
--
ALTER TABLE `pt_user`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `pt_user_account`
--
ALTER TABLE `pt_user_account`
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_user_address`
--
ALTER TABLE `pt_user_address`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pt_user_collect`
--
ALTER TABLE `pt_user_collect`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_user_coupon`
--
ALTER TABLE `pt_user_coupon`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pt_user_data`
--
ALTER TABLE `pt_user_data`
  MODIFY `did` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员数据表        ',AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `pt_user_grade`
--
ALTER TABLE `pt_user_grade`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pt_user_location`
--
ALTER TABLE `pt_user_location`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_visits`
--
ALTER TABLE `pt_visits`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_visits_good`
--
ALTER TABLE `pt_visits_good`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_wxreply`
--
ALTER TABLE `pt_wxreply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pt_wxreply_imgtext`
--
ALTER TABLE `pt_wxreply_imgtext`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_wx_print`
--
ALTER TABLE `pt_wx_print`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_wx_status`
--
ALTER TABLE `pt_wx_status`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
