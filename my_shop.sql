-- 小商城项目数据库管理
-- 表前缀: 'es_'
-- 字段前缀：表名的第一个字母_
create database if not exists shopping charset utf8; 

set names gbk;

use shopping;


-- 1,后台用户表--------------------------------------------------------------------------------
create table es_admin(
u_id mediumint unsigned primary key auto_increment,
u_username varchar(16) not null unique comment '用户名16位',
u_password varchar(32) not null comment 'md5加密',
u_nickname varchar(32) not null comment '用户昵称',
u_name char(5) not null comment '真实名字',
u_sex char(1) default 1 comment '1=男 0=女',
u_email varchar(32) comment '邮箱',
u_phone char(11) comment '11位手机数字',
u_qq char(12) comment '用户QQ',
u_addr varchar(64) comment '用户地址',
u_portrait varchar(128) default '' comment '用户头像path',
u_logintime int default 0 comment '最后一次登陆时间',
u_ip char(15) default '127.0.0.1' comment '用户登录ip'
)charset utf8;

-- 测试数据
insert into es_admin values
(null,'b',md5('b'),'小绵羊','郭靖',1,'aaa@163.com','13777778888','234567','江西省广州市福田区中关村28楼C4',default,'1234567890','192.168.1.1');

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------



-- 2,分类表-------------------------------------------------------------------------------------
create table es_category(
c_id mediumint unsigned primary key auto_increment,
c_name varchar(16) not null comment '商品分类名字',
c_parent_id int unsigned default 0 comment '父类id',
c_sort tinyint unsigned default 100 comment '商品排序',
c_desc varchar(16) default '' comment '分类描述'
)charset utf8;

-- 模拟数据-------------------------------------------------------------------------------------
insert into es_category values
(null,'图书',0,100,'无描述'),
(null,'htc手机',7,100,'无描述'),
(null,'音乐',0,10,'无描述'),
(null,'HTC_ONE8',2,10,'无描述'),
(null,'《小兵漂流记》',1,10,'无描述'),-- 5
(null,'小马过河',5,10,'无描述'),
(null,'手机数码',0,88,'无描述'),
(null,'《茶花女》',1,12,'无描述'),
(null,'iphone手机',7,43,'无描述'),
(null,'悲伤的秋千',9,43,'无描述'),-- 10
(null,'服装',0,33,'无描述'),
(null,'联想笔记本',13,13,'无描述'),
(null,'电脑办公',0,55,'无描述'),
(null,'iphone 5S',9,78,'无描述'),-- 14
(null,'鞋子',11,72,'无描述'),
(null,'短裤',11,8,'无描述'),
(null,'周杰伦-叶惠美',3,49,'无描述');-- 17

-- ------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------



-- 模拟数据--------------------------------------------------------------------------------
-- 3,session入库表------
create table es_session(
s_id char(32) not null primary key comment 'sessionid',
s_data text comment 'session内容',
s_expire int comment 'session生成时间'
)charset utf8 comment '最好用myisam引擎';


-- 4,商品表-----------8商品图片表------------------------------------------------------------
-- 商品表goods
create table es_goods(
g_id int primary key auto_increment,
g_name varchar(32) not null comment '商品名字',
g_price decimal(10,2) default 0.00 comment '商品价格',
c_id tinyint not null comment '商品分类',
g_inv int unsigned default 0 comment '商品库存',
g_sn char(6) not null unique comment '商品编号ss0001',
g_brand varchar(16) default '' comment '商品品牌',
g_barcode varchar(32) default '' comment '商品条码',
g_hot char(1) default 0 comment '是否热销1=true',
g_new char(1) default 1 comment '是否新品',
g_best char(1) default 0 comment '是否精品',
-- 这3个可以设置一下索引
g_onsail char(1) default 1 comment '是否上架',
g_desc text comment '商品描述',
g_click int unsigned default 9 comment '点击量',
g_sort tinyint unsigned default 50 comment '商品排序',
g_image varchar(64) default '' comment '图片名字',
g_thumb varchar(64) default '' comment '图片缩略图',
g_water varchar(64) default '' comment '图片水印'

)charset utf8;


insert into es_goods values (null,'佳能700D单反相机',5488,12,99,'ss0003','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'尼康小相机',5488,12,99,'ss0004','宏碁','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'联想笔记本电脑 高速独立显存',5488,12,99,'ss0005','戴尔','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'法姿韩版显瘦彩边时尚牛仔铅笔裤',5488,12,99,'ss0006','三星','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'Genius925纯银施华洛世奇水晶吊坠',5488,12,99,'ss0007','尼康','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'利仁2018M福满堂电饼铛 好用实惠',5488,12,99,'ss0008','小米','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'达派高档拉杆箱20寸 经典款式',5488,12,99,'ss0009','电源','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'利仁2018M福满堂电饼铛 好用实惠',5488,12,99,'ss0010','日入','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'爱国者MP4 全屏触摸多格式播放 4G',5488,12,99,'ss0011','三亚','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'达派高档拉杆箱20寸 经典款式',5488,12,99,'ss0012','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'多美滋金装金盾3阶段幼儿配方奶粉',5488,12,99,'ss0013','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'爱国者MP4 全屏触摸多格式播放 4G',5488,12,99,'ss0014','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'乐扣普通型保鲜盒圣诞7件套',5488,12,99,'ss0015','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'法国德菲丝松露精品巧克力500g/盒',5488,12,99,'ss0016','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'佳能700D单反相机',5488,12,99,'ss0017','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'多美滋金装金盾3阶段幼儿配方奶粉',5488,12,99,'ss0018','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'乐扣普通型保鲜盒圣诞7件套',5488,12,99,'ss0019','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
insert into es_goods values (null,'法国德菲丝松露精品巧克力500g/盒',5488,12,99,'ss0020','佳能','a11111222',1,0,1,1,'最好的相机',14,1,default,default,default);
-- ----------------------------------------------------------------------------------------------
-- ----------5,商品图片表-----------------
create table es_goods_image(
i_id mediumint unsigned not null primary key auto_increment,
i_pic varchar(150) not null comment '原图',
i_thumb_pic varchar(150) not null comment '缩略图(默认100*100)',
i_water_pic varchar(150) not null comment '水印图',
i_goods_id mediumint unsigned not null comment '对应的商品的id'
)engine=InnoDB charset=utf8 comment '商品图片表';


-- ----------------------------------------------------------------------------------------------
-- 6,新闻表-----------
create table es_news(
n_id int unsigned primary key auto_increment,
n_title varchar(64) not null comment '新闻标题',
n_content text not null comment '新闻内容',
n_author varchar(16) not null comment '作者',
n_type varchar(64) not null comment '新闻类型',
n_date int default 0 comment '新闻发布时间'
)charset utf8;

insert into es_news values (null,'苹果破产啦!!!','破产啦破产啦破产啦！','yeZi','3C数码',1876543210);
insert into es_news values (null,'赵本山不去春晚了','赵本山不去春晚了！','Mumu','娱乐新闻',1376543210);
insert into es_news values (null,'深圳可以入户','深圳好地方','yiad','地方新闻',1866543210);
insert into es_news values (null,'江西是个好地方','破产啦破产啦破产啦！','yeZi','3C数码',1876543210);
insert into es_news values (null,'广州不好玩','破产啦破产啦破产啦！','yeZi','3C数码',1816543210);
insert into es_news values (null,'床前明月光逛逛','破产啦破产啦破产啦！','yeZi','3C数码',1176543210);
insert into es_news values (null,'你看我有多深。','破产啦破产啦破产啦！','yeZi','3C数码',1376543210);
-----------------------------------------------------------------------------------------------


-- 7,用户留言表--------------
-- 于用户表建立外键连接，取得用户信息
create table es_messages(
m_id mediumint unsigned primary key auto_increment comment '留言板id',
m_title varchar(64) not null comment '留言主题',
m_content text not null comment '留言内容',
m_type tinyint unsigned default 0 comment '0：表示未回复 1：表示回复',
m_time int unsigned default 0 comment '留言时间',
m_ip char(15) default '127.0.0.1' comment '用户留言ip'
-- 建立外键user表
-- foreign key(m_id) references es_user(u_id)
)charset utf8;

insert into es_messages values(null,'传智播客有就业班信息展示啦，快来！','床前明月光逛逛,床前明月光逛逛',1,'1111111111',default);
insert into es_messages values(null,'习近平致电印度总统祝贺印共和国日！','床前明月光逛逛,床前明月光逛逛',1,'1111111111',default);
insert into es_messages values(null,'李克强：经济发展须按下改革快进键','床前明月光逛逛,床前明月光逛逛',1,'1111111111',default);
insert into es_messages values(null,'查了一下是正品,就是好，手机待电也还好','床前明月光逛逛,床前明月光逛逛',1,'1111111111',default);
insert into es_messages values(null,'不错,看起来还行的，还来这！','床前明月光逛逛,床前明月光逛逛',1,'1111111111',default);
insert into es_messages values(null,'是正品,暂时没发现什么质量问题','床前明月光逛逛,床前明月光逛逛',1,'1111111111',default);
insert into es_messages values(null,'这个东西质量怎么样？耐摔不。。','床前明月光逛逛,床前明月光逛逛',1,'1111111111',default);
-- ----------------------------------------------------------------------------------------------



-- 8,购物车------------
-- ----------------------------------------------------------------------------------------
drop table es_car;
create table es_car(
c_id int unsigned primary key auto_increment,
g_id int unsigned unique comment '产品的ID',
g_name varchar(64) comment '产品名字',
g_thumb varchar(128) default '' comment '产品缩略图',
c_num int unsigned comment '商品数量',
g_price decimal(10,2) comment '产品单价',
c_total decimal(10,2) comment '商品总价',
u_username varchar(32) comment '用户登陆的用户名信息'
)charset utf8;

-- 9,订单表------------
-- --------------------------------------------------------------------------------------
drop table es_order;
create table es_order(
o_id int primary key auto_increment,
o_hao char(6) not null comment '订单编号ss0001',
o_name varchar(255) not null comment '产品名字',
o_price varchar(255) comment '商品单价',
o_num varchar(255) comment '商品数量',
o_totle varchar(255) comment '所有的商品总价',
u_username varchar(32) comment '用户的登陆账号',
index(o_hao)-- 商品编号建立索引
)charset utf8;

insert into es_order values(null,'ss0001','aa',11,2,22,'ddd');
-- ----------------------------------------------------------------------------------------

-- 10,用户信息表---------
create table es_userinfo(
u_id int unsigned primary key auto_increment,
u_username varchar(32) comment '登录用户名',
u_name varchar(16) not null comment '用户姓名',
u_addr varchar(64) not null comment '用户地址',
u_phone char(11) not null comment '用户电话',
index(u_username)-- 用户名索引
)charset utf8;


-- ----------------------------------------------------------------------------------------

-- 11,商品评论表------------
create table es_comment(
c_id int unsigned primary key auto_increment,
u_username varchar(32) comment '用户名',
g_id int comment '商品id',
c_content text comment '评价内容',
c_time int comment '评价时间',
c_ip char(15) comment'这里可以用int类型，可以计算ip的地理位置',
index (g_id)
)charset utf8;

-- ----------------------------------------------------------------------------------------


-- 9用户积分表------------

-- 10后台权限表-----------








