-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-03-07 11:11:35
-- 服务器版本： 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web`
--

-- --------------------------------------------------------

--
-- 表的结构 `lt_album`
--

CREATE TABLE IF NOT EXISTS `lt_album` (
  `al_id` int(11) NOT NULL COMMENT '主键',
  `al_name` varchar(64) NOT NULL COMMENT '相册名',
  `al_img` varchar(128) NOT NULL DEFAULT './Upload/Album/defauly.png' COMMENT '封面',
  `al_remark` varchar(256) NOT NULL COMMENT '描述',
  `al_time` int(10) NOT NULL COMMENT '添加时间',
  `al_hit` int(11) NOT NULL COMMENT '点击量',
  `al_view` int(11) NOT NULL COMMENT '显示，0不显示，1显示',
  `al_ip` varchar(16) NOT NULL COMMENT 'ip',
  `al_root` varchar(64) NOT NULL,
  `al_from` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='相册表';

--
-- 转存表中的数据 `lt_album`
--

INSERT INTO `lt_album` (`al_id`, `al_name`, `al_img`, `al_remark`, `al_time`, `al_hit`, `al_view`, `al_ip`, `al_root`, `al_from`) VALUES
(1, '青春博客相册测试', '/Upload/Album/1457317476.jpg', '青春博客相册测试', 1457317455, 5, 1, '127.0.0.1', 'admin', 'Win 7');

-- --------------------------------------------------------

--
-- 表的结构 `lt_album_c`
--

CREATE TABLE IF NOT EXISTS `lt_album_c` (
  `alc_id` int(11) NOT NULL COMMENT '主键',
  `alc_pid` int(11) NOT NULL COMMENT '相册ID',
  `alc_name` varchar(128) NOT NULL COMMENT '评论姓名',
  `alc_email` varchar(128) NOT NULL COMMENT '邮箱',
  `alc_url` varchar(128) NOT NULL COMMENT '域名',
  `alc_content` text NOT NULL COMMENT '内容',
  `alc_ip` varchar(16) NOT NULL COMMENT 'IP',
  `alc_time` int(10) NOT NULL COMMENT '时间',
  `alc_from` varchar(16) NOT NULL COMMENT '来自',
  `alc_img` varchar(128) NOT NULL DEFAULT './Head/default.png' COMMENT '头像',
  `alc_rname` varchar(128) NOT NULL COMMENT '回复人',
  `alc_rcontent` text NOT NULL COMMENT '回复文本',
  `alc_rtime` int(10) NOT NULL COMMENT '时间'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='相册评论表';

--
-- 转存表中的数据 `lt_album_c`
--

INSERT INTO `lt_album_c` (`alc_id`, `alc_pid`, `alc_name`, `alc_email`, `alc_url`, `alc_content`, `alc_ip`, `alc_time`, `alc_from`, `alc_img`, `alc_rname`, `alc_rcontent`, `alc_rtime`) VALUES
(2, 2, '广西玉林网友', '7313710150@qq.com', '', '[mr:/19][lxh:/59]这是博主的女友吗[mr:/65]', '171.106.222.190', 1450944804, 'Win 7', '/Public/Img/Portrait/9.jpg', 'admin', '[mr:/31]对啊', 1450945623),
(3, 2, '胡小柯', '574578479@qq.com', 'http://www.huxinchun.com', '原来你女朋友在这', '61.183.214.66', 1451751076, 'Win 7', '/Public/Img/Portrait/91.jpg', 'admin', '[mr:/11]', 1451871076),
(4, 2, '贫困山区的孩子', '1979933952@qq.com', 'www.qiuxiaopeng.cn', '我还是单身[mr:/37]', '115.183.253.136', 1452136172, 'Win 7', '/Public/Img/Portrait/8.jpg', 'admin', '[lxh:/0]面包会有的，爱情也会来的', 1452183160);

-- --------------------------------------------------------

--
-- 表的结构 `lt_article`
--

CREATE TABLE IF NOT EXISTS `lt_article` (
  `a_id` int(11) NOT NULL COMMENT '主键',
  `a_img` varchar(128) NOT NULL COMMENT '缩略图',
  `a_title` varchar(128) NOT NULL COMMENT '标题',
  `a_remark` varchar(256) NOT NULL COMMENT '描述',
  `a_keyword` varchar(64) NOT NULL COMMENT '关键词',
  `pid` int(11) NOT NULL COMMENT '栏目',
  `a_time` int(10) NOT NULL COMMENT '时间',
  `a_content` text NOT NULL COMMENT '内容',
  `a_view` int(11) NOT NULL COMMENT '显示，0为不显示，1为显示，2为推荐',
  `a_hit` int(11) NOT NULL COMMENT '点击量',
  `a_original` int(11) NOT NULL COMMENT '原创，0为不是，1为是',
  `a_from` varchar(128) NOT NULL COMMENT '来自',
  `a_author` varchar(32) NOT NULL COMMENT '作者',
  `a_ip` varchar(16) NOT NULL COMMENT 'IP',
  `a_num` int(11) NOT NULL COMMENT '文章评论数量'
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='文章表';

--
-- 转存表中的数据 `lt_article`
--

INSERT INTO `lt_article` (`a_id`, `a_img`, `a_title`, `a_remark`, `a_keyword`, `pid`, `a_time`, `a_content`, `a_view`, `a_hit`, `a_original`, `a_from`, `a_author`, `a_ip`, `a_num`) VALUES
(110, '/Upload/Thumb/1457318158.jpg', 'PHP实现下载TXT文件', '在项目有终于到一个问题，就是当我用a链接打开的是文件的时候大部分是可以下载的，在TXT的时候却是在浏览器中直接打开，于是在网上找了下下载TXT文件的方法', '下载TXT,PHP下载', 1, 1449643683, '<p>在项目有终于到一个问题，就是当我用a链接打开的是文件的时候大部分是可以下载的，在TXT的时候却是在浏览器中直接打开，于是在网上找了下下载TXT文件的方法</p><p>首先是看下效果图：</p><p style="text-align:center"><img src="/Upload/20151209/1449643851536989.png" title="1449643851536989.png" alt="blob.png"/></p><p>要实现的效果是：</p><p style="text-align:center"><img src="/Upload/20151209/1449643867176044.png" title="1449643867176044.png" alt="QQ截图20151209144614.png"/></p><p>这里用到的函数：</p><pre class="brush:php">&lt;?php\nfunction&nbsp;download($filename){\n//检测是否设置文件名和文件是否存在&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;((isset($filename))&amp;&amp;(file_exists($filename))){&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;header(&quot;Content-length:&nbsp;&quot;.filesize($filename));&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;header(&#39;Content-Type:&nbsp;application/octet-stream&#39;);&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;header(&#39;Content-Disposition:&nbsp;attachment;&nbsp;filename=&quot;&#39;&nbsp;.&nbsp;$filename&nbsp;.&nbsp;&#39;&quot;&#39;);&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;readfile(&quot;$filename&quot;);&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&quot;文件不存在!&quot;;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;\n}\ndownload(&#39;./now.txt&#39;);</pre><p><br/></p>', 2, 504, 1, 'Win 7', '隆航', '127.0.0.1', 0),
(111, '/Upload/Thumb/1457318150.jpg', 'include 和 require 引入的区别', '文件的包含中有四个写法：Include / include_once /Require /require_once。其中Include 和require都是把一个页面引入到当前页面.那么怎么来理解&quot;引入&quot;.就相当于把被包含文件的所有代码,替换include/require那一句.和直接把代码写在include那一句是一样的.Require作用也是把一个文件引入到当前文件.理解与include一样.', 'include,require,包含文件', 1, 1449735080, '<p>Include与require的区别<br/></p><p>答:include如果引入的文件不存在,试图继续往下执行,报一个warning</p><p>(如果你不介意之前的内容是否被包含，之后的内容都要执行，就使用include)</p><p>而require如果引入的文件不存在,报fatal error,不再继续执行.</p><p>(如果之前的内容一定要被包含，才允许继续执行之后的代码，就使用require)</p><p><br/></p><p>========================================================</p><p>Include/require 与 include_once /require_once的区别</p><p>_once 会自动判断文件是否已经引入,如果引入,不再重复执行.</p><p>即:保证被包含文件只可能被引入一次.</p><p>(如果包含的文件里有定义函数，那么被包含的文件只能被包含一次，如果多次包含，就会出现函数重定义的错误，php是不运行函数重定义的，会出现致命错误，之后代码不在运行)</p><p>=======================================================</p><p>有的文件不允许被包含多次?</p><p>可以用_once来控制,</p><p>但是,如果从文件的设计上,比较规范,能保证肯定不会出现多次包含的错误,</p><p>这种情况下 建议用include</p><p>因为include_once要检测之前有没有包含,效率没有include高</p><p>怎么来理解&quot;引入&quot;.</p><p><br/></p><p>就相当于把被包含文件的所有代码,替换include/require那一句.</p><p>和直接把代码写在include那一句是一样的.</p><p><br/></p><p>Require作用也是把一个文件引入到当前文件.</p><p>理解与include一样.</p><p><br/></p><p>Include与require的区别</p><p>答:include如果引入的文件不存在,试图继续往下执行,报一个warning</p><p>(如果你不介意之前的内容是否被包含，之后的内容都要执行，就使用include)</p><p>而require如果引入的文件不存在,报fatal error,不再继续执行.</p><p>(如果之前的内容一定要被包含，才允许继续执行之后的代码，就使用require)</p><p><br/></p><p>========================================================</p><p>Include/require 与 include_once /require_once的区别</p><p>_once 会自动判断文件是否已经引入,如果引入,不再重复执行.</p><p>即:保证被包含文件只可能被引入一次.</p><p>(如果包含的文件里有定义函数，那么被包含的文件只能被包含一次，如果多次包含，就会出现函数重定义的错误，php是不运行函数重定义的，会出现致命错误，之后代码不在运行)</p><p>=======================================================</p><p>有的文件不允许被包含多次?</p><p>可以用_once来控制,</p><p>但是,如果从文件的设计上,比较规范,能保证肯定不会出现多次包含的错误,</p><p>这种情况下 建议用include</p><p>因为include_once要检测之前有没有包含,效率没有include高</p><p><br/></p><p>require() 语句包含并运行指定文件，include()语句会获取指定文件中存在的所有文本/代码/标记，并复制到使用 include 语句的文件中。这两个函数有相似的功能，现在我们来讲讲他们包含文件的路径问题。</p><p><br/></p><blockquote><p>1 绝对路径、相对路径和未确定路径</p></blockquote><p>相对路径</p><p>相对路径指以.开头的路径，例如</p><p>./a/a.php (相对当前目录)</p><p>../common.inc.php (相对上级目录)，</p><p>绝对路径</p><p>绝对路径是以 / 开头或者windows下的 C:/ 类似的盘符开头的路径，全路径不用任何参考路径就可以唯一确定文件的最终地址。 例如</p><p>/apache/wwwroot/site/a/a.php</p><p>c:/wwwroot/site/a/a.php</p><p>未确定路径</p><p>凡是不以 . 或者 / 开头、也不是windows下 盘符:/ 开头的路径，例如</p><p>a/a.php</p><p>common.inc.php，</p><p>开始以为这也是相对路径，但在php的include/require包含机制中，这种类型的路径跟以 . 开头的相对路径处理是完全不同的。require &#39;./a.php&#39; 和 require &#39;a.php&#39; 是不同的!</p><p>下面分析这三种类型包含路径的处理方式：首先记住一个结论：如果包含路径为相对路径或者绝对径，则不会到include_path(php.ini 中定义的include_path环境变量，或者在程序中使用set_include_path(...)设置)中去查找该文件。</p><p>测试环境说明</p><p>注意：下面的讨论和结论基于这样的环境： 假设 A=http://www.xxx.com/app/test/a.php，再次强调下面的讨论是针对直接访问A的情况。</p><p><br/></p><blockquote><p>2. 相对路径：</p></blockquote><p>相对路径需要一个参考目录才能确定文件的最终路径，在包含解析中，不管包含嵌套多少层，这个参考目录是程序执行入口文件所在目录。</p><p>示例1</p><p>A中定义 require &#39;./b/b.php&#39;; // 则B=[SITE]/app/test/b/b.php</p><p>B中定义 require &#39;./c.php&#39;; // 则C=[SITE]/app/test/c.php 不是[SITE]/app/test/b/c.php</p><p><br/></p><p>示例2</p><p>A中定义 require &#39;./b/b.php&#39;; // 则B=[SITE]/app/test/b/b.php</p><p>B中定义 require &#39;../c.php&#39;; // 则C=[SITE]/app/c.php 不是 [SITE]/app/test/c.php</p><p><br/></p><p>示例3</p><p>A中定义 require &#39;../b.php&#39;; //则B=[SITE]/app/b.php</p><p>B中定义 require &#39;../c.php&#39;; //则C=[SITE]/app/c.php 不是 [SITE]/c.php</p><p><br/></p><p>示例4:</p><p>A中定义 require &#39;../b.php&#39;; // 则B=[SITE]/app/b.php</p><p>B中定义 require &#39;./c/c.php&#39;; / /则C=[SITE]/app/test/c/c.php 不是 [SITE]/app/c/c.php</p><p><br/></p><p>示例5</p><p>A中定义 require &#39;../inc/b.php&#39;; // 则B=[SITE]/app/inc/b.php</p><p>B中定义 require &#39;./c/c.php&#39;; // 则C还是=[SITE]/app/test/c/c.php 不是 [SITE]/app/inc/c/c.php</p><p><br/></p><p>示例6</p><p>A中定义 require &#39;../inc/b.php&#39;; // 则B=[SITE]/app/inc/b.php</p><p>B中定义 require &#39;./c.php&#39;; // 则C=[SITE]/app/test/c.php 不是 [SITE]/app/inc/c.php</p><p><br/></p><blockquote><p>3. 绝对路径</p></blockquote><p><br/></p><p>绝对路径的比较简单，不容易混淆出错，require|inclue 的就是对应磁盘中的文件。</p><p>require &#39;/wwwroot/xxx.com/app/test/b.php&#39;; // Linux中</p><p>require &#39;c:/wwwroot/xxx.com/app/test/b.php&#39;; // windows中</p><p>dirname(__FILE__)计算出来的也是一个绝对路径形式的目录，但是要注意__FILE__是一个Magic constants，不管在什么时候都等于写这条语句的php文件所在的绝对路径，因此dirname(__FILE__)也总是指向写这条语句的php文件所在的绝对路径，跟这个文件是否被其他文件包含使用没有任何关系。</p><p><br/></p><p>示例1</p><p>A中定义 require &#39;../b.php&#39;; // 则B=[SITE]/app/b.php</p><p>B中定义 require dirname(__FILE__).&#39;/c.php&#39;; // 则B=[SITE]/app/c.php</p><p><br/></p><p>示例2</p><p>A中定义 require &#39;../inc/b.php&#39;; // 则B=[SITE]/app/inc/b.php</p><p>B中定义 require dirname(__FILE__).&#39;/c.php&#39;; // 则B=[SITE]/app/inc/c.php 始终跟B在同一个目录</p><p><br/></p><p>结论：不管B是被A包含使用，还是直接被访问</p><p>B如果 require dirname(__FILE__).&#39;/c.php&#39;; // 则始终引用到跟B在同一个目录中的 c.php文件;</p><p>B如果 require dirname(__FILE__).&#39;/../c.php&#39;; // 则始终引用到B文件所在目录的父目录中的 c.php文件;</p><p>B如果 require dirname(__FILE__).&#39;/c/c.php&#39;; // 则始终引用到B文件所在目录的c子目录中的 c.php文件;</p><p><br/></p><blockquote><p>4. 未确定路径</p></blockquote><p><br/></p><p>首先在逐一用include_path中定义的包含目录来拼接[未确定路径]，找到存在的文件则包含成功退出，如果没有找到，则用执行 require语句的php文件所在目录来拼接[未确定路径]组成的全路径去查找该文件，如果文件存在则包含成功退出，否则表示包含文件不存在，出错。 未确定路径比较容易搞混不建议使用。</p><p><br/></p><blockquote><p>5. 解决方案</p></blockquote><p><br/></p><p>由于“相对路径”中的“参照目录”是执行入口文件所在目录，“未确定”路径也比较容易混淆，因此最好的解决方法是使用“绝对路径”; 例如b.php的内容如下，无论在哪里require b.php都是以b.php的路径为参照来require c.php的</p><p><br/></p><p>$dir = dirname(__FILE__);</p><p>require($dir . &#39;../c.php&#39;);</p><p><br/></p><p>或者定义一个通用函数 import.php，将其设置为“自动提前引入文件”，在php.ini做如下配置</p><p>更改配置项(必须)auto_prepend_file = &quot;C:xampphtdocsauto_prepend_file.php&quot;</p><p>更改配置项(可选)allow_url_include = On</p><p>import.php内容如下</p><pre class="brush:php">function&nbsp;import($path)&nbsp;{\n$old_dir&nbsp;=&nbsp;getcwd();&nbsp;//&nbsp;保存原“参照目录”\nchdir(dirname(__FILE__));&nbsp;//&nbsp;将“参照目录”更改为当前脚本的绝对路径\nrequire_once($path);\nchdir($old_dir);&nbsp;//&nbsp;改回原“参照目录”\n}</pre><p>这样就可以使用import()函数来require文件了，无论包含多少级“参照目录”都是当前文件</p><p><br/></p>', 2, 448, 0, 'Win 7', '隆航', '127.0.0.1', 0),
(112, '/Upload/Thumb/1450067094.jpg', '支付宝即时交易整合TP3.2', '因为公司的项目需要用到支付宝的即时交易，而且个人是有轻微强迫症，不太喜欢把不相关的集成到一起，所以这里单独整合了支付宝的即时交易，和担保交易很类似的，于是写下来方便之后再用。', '即时交易,支付宝', 1, 1450065488, '<p>做支付宝或者其他第三方的都需要去申请接口，需要自己的去申请的。</p><p><span style="color: rgb(255, 0, 0);">即时交易需要企业支付宝和备案号的网站，而且网站是建设的完全。</span></p><blockquote><p>注册地址：<a href="https://www.alipay.com/" _src="https://www.alipay.com/">https://www.alipay.com/</a> </p></blockquote><p>注册的时候选择企业版的支付宝，然后按照他的流程注册，注册完成后就可以去 <span style="color: rgb(255, 0, 0);">产品商店</span> 去签约 <span style="color: rgb(255, 0, 0);">即时交易&nbsp;</span>了</p><p style="text-align:center"><img src="/Upload/20151214/1450066035717394.png" title="1450066035717394.png" alt="blob.png"/></p><p>签约之后就是等待了，在这里就可以去整合支付宝了，等申请的 KEY 和 PID 下来就可以测试了。</p><p>支付宝签约后的即时交易下载包地址：（我自己留了一份）<a href="http://pan.baidu.com/s/1pJRcYvT" _src="http://pan.baidu.com/s/1pJRcYvT">http://pan.baidu.com/s/1pJRcYvT</a> </p><p>下载好之后解压-文件里面有详细的说明，这里目录我就不一一介绍了，自己看说明文档</p><p>第一步就是完成集成，所以需要做的是：</p><p style="text-align: center;"><img src="/Upload/20151214/1450066119162449.png" title="1450066119162449.png" alt="blob.png"/></p><blockquote><p>文件重命名</p></blockquote><pre class="brush:php">alipay_core.function.php&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Corefunction.php\nalipay_notify.class.php&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Notify.php\nalipay_submit.class.php&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Submit.php\nalipay_md5.function.php&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Md5function.php</pre><p>这样的话就符合TP的命名方式了。</p><blockquote><p>修改文件</p></blockquote><p>其中 Notify.php 和 Md5function.php 需要删除前面引入的两行代码</p><pre class="brush:php">require_once(&quot;alipay_core.function.php&quot;);\nrequire_once(&quot;alipay_md5.function.php&quot;);</pre><p>然后把文件放入&nbsp;<span style="color: rgb(255, 0, 0);">\\ThinkPHP\\Library\\Vendor\\Alipay</span> 目录下</p><blockquote><p>增加配置文件</p></blockquote><p>把 签名文件 <span style="color: rgb(255, 0, 0);">cacert.pem</span> 放在网站的跟目录</p><p>然后再对应需要支付的模块的conf/config.php中添加支付宝的参数：(没申请下来这里就先预留)</p><pre class="brush:php">	&#39;alipay_config&#39;		=&gt;	array(									//支付宝配置参数\n	&nbsp;&nbsp;&nbsp;&nbsp;&#39;partner&#39;&nbsp;		=&gt;	&#39;2088021447698852&#39;,&nbsp;&nbsp;&nbsp;					//这里是你在成功申请支付宝接口后获取到的PID；\n	&nbsp;&nbsp;&nbsp;&nbsp;&#39;key&#39;			=&gt;	&#39;m94r73neschynziad6kx3ovgu19p0ikn&#39;,		//这里是你在成功申请支付宝接口后获取到的Key\n	&nbsp;&nbsp;&nbsp;&nbsp;&#39;sign_type&#39;		=&gt;	strtoupper(&#39;MD5&#39;),\n	&nbsp;&nbsp;&nbsp;&nbsp;&#39;input_charset&#39;	=&gt;	strtolower(&#39;utf-8&#39;),\n	&nbsp;&nbsp;&nbsp;&nbsp;&#39;cacert&#39;		=&gt;	getcwd().&#39;\\\\cacert.pem&#39;,				//liunx这里需要注意&nbsp;\\\\&nbsp;和&nbsp;/&nbsp;在liunx的区别\n	&nbsp;&nbsp;&nbsp;&nbsp;&#39;transport&#39;		=&gt;	&#39;http&#39;,\n	&nbsp;&nbsp;&nbsp;&nbsp;&#39;seller_email&#39;	=&gt;	&#39;mingyu_lmy@foxmail.com&#39;,				//&nbsp;这里是你的收款账号，\n	),\n	\n	&#39;alipay&#39;&nbsp;&nbsp;	&nbsp;		=&gt;	array(\n		&#39;notify_url&#39;	=&gt;	&#39;http://www.7fei.wang/Home/Alipay/notifyurl&#39;,\n		&#39;return_url&#39;	=&gt;	&#39;http://www.7fei.wang/Home/Alipay/returnurl&#39;,	&nbsp;	\n	),</pre><blockquote><p>添加逻辑方法</p></blockquote><pre class="brush:php">&lt;?php\n//&nbsp;+----------------------------------------------------------------------\n//&nbsp;|&nbsp;ThinkPHP&nbsp;[&nbsp;WE&nbsp;CAN&nbsp;DO&nbsp;IT&nbsp;JUST&nbsp;THINK&nbsp;IT&nbsp;]\n//&nbsp;+----------------------------------------------------------------------\n//&nbsp;|&nbsp;Copyright&nbsp;(c)&nbsp;2015&nbsp;http://ming-yu.com&nbsp;All&nbsp;rights&nbsp;reserved.\n//&nbsp;+----------------------------------------------------------------------\n//&nbsp;|&nbsp;Licensed&nbsp;(&nbsp;http://www.apache.org/licenses/LICENSE-2.0&nbsp;)\n//&nbsp;+----------------------------------------------------------------------\n//&nbsp;|&nbsp;Author:&nbsp;long&nbsp;&lt;admin@loveteemo.com&gt;\n//&nbsp;+----------------------------------------------------------------------\nnamespace&nbsp;Home\\Controller;\nuse&nbsp;Think\\Controller;\nclass&nbsp;AlipayController&nbsp;extends&nbsp;Controller{\n	\n	/**\n	&nbsp;*&nbsp;函数说明：引入支付宝参数\n	&nbsp;*/\n	public&nbsp;function&nbsp;&nbsp;_initialize(){\n		vendor(&#39;Alipay.Corefunction&#39;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vendor(&#39;Alipay.Md5function&#39;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vendor(&#39;Alipay.Notify&#39;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vendor(&#39;Alipay.Submit&#39;);&nbsp;\n	}\n	\n	/**\n	&nbsp;*&nbsp;函数说明：生成订单-支付\n	&nbsp;*&nbsp;传递参数：\n	&nbsp;*&nbsp;$_POST[&#39;WIDout_trade_no&#39;];&nbsp;	商户订单号\n	&nbsp;*&nbsp;$_POST[&#39;WIDsubject&#39;];&nbsp;		订单名称&nbsp;必填\n	&nbsp;*&nbsp;$_POST[&#39;WIDtotal_fee&#39;];		付款金额&nbsp;必填\n	&nbsp;*&nbsp;$_POST[&#39;WIDbody&#39;];			订单描述&nbsp;&nbsp;\n	&nbsp;*&nbsp;$_POST[&#39;WIDshow_url&#39;];		商品展示地址&nbsp;\n	&nbsp;*/\n	//生成订单\n	public&nbsp;function&nbsp;dowithpay(){\n		if(!IS_POST){\n			$this-&gt;error(&quot;非法请求&quot;);\n		}\n		$info&nbsp;				=		xxx;//根据传递的订单号，信息查询\n		if(!$info){\n			$this-&gt;error(&quot;参数非法&quot;);\n		}&nbsp;\n		$alipay_config		=		C(&#39;alipay_config&#39;);		\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$payment_type&nbsp;		=&nbsp;		&quot;1&quot;;							//支付类型&nbsp;必填，不能修改&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$notify_url&nbsp;		=&nbsp;		C(&#39;alipay.notify_url&#39;);			//服务器异步通知页面路径&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$return_url&nbsp;		=&nbsp;		C(&#39;alipay.return_url&#39;);			//页面跳转同步通知页面路径\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$out_trade_no&nbsp;		=&nbsp;		$info[&#39;onumber&#39;];				//商户订单号&nbsp;商户网站订单系统中唯一订单号，必填\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$subject&nbsp;			=&nbsp;		$info[&#39;oname&#39;];					//订单名称&nbsp;必填\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$total_fee&nbsp;			=&nbsp;		$info[&#39;opay&#39;];					//付款金额&nbsp;必填\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$body&nbsp;				=&nbsp;		$info[&#39;oname&#39;];					//订单描述&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$show_url&nbsp;			=&nbsp;		&#39;&#39;;								//商品展示地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$anti_phishing_key&nbsp;	=&nbsp;		&quot;&quot;;								//防钓鱼时间戳\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$exter_invoke_ip&nbsp;	=&nbsp;		&quot;&quot;;								//非局域网的外网IP地址，如：221.0.0.1\n		/************************************************************/\n		$parameter&nbsp;			=&nbsp;		array(\n				&quot;service&quot;&nbsp;			=&gt;&nbsp;&quot;create_direct_pay_by_user&quot;,\n				&quot;partner&quot;&nbsp;			=&gt;&nbsp;trim($alipay_config[&#39;partner&#39;]),\n				&quot;seller_email&quot;&nbsp;		=&gt;&nbsp;trim($alipay_config[&#39;seller_email&#39;]),\n				&quot;payment_type&quot;		=&gt;&nbsp;$payment_type,\n				&quot;notify_url&quot;		=&gt;&nbsp;$notify_url,\n				&quot;return_url&quot;		=&gt;&nbsp;$return_url,\n				&quot;out_trade_no&quot;		=&gt;&nbsp;$out_trade_no,\n				&quot;subject&quot;			=&gt;&nbsp;$subject,\n				&quot;total_fee&quot;			=&gt;&nbsp;$total_fee,\n				&quot;body&quot;				=&gt;&nbsp;$body,\n				&quot;show_url&quot;			=&gt;&nbsp;$show_url,\n				&quot;anti_phishing_key&quot;	=&gt;&nbsp;$anti_phishing_key,\n				&quot;exter_invoke_ip&quot;	=&gt;&nbsp;$exter_invoke_ip,\n				&quot;_input_charset&quot;	=&gt;&nbsp;trim(strtolower($alipay_config[&#39;input_charset&#39;]))\n		);\n		//建立请求\n		$alipaySubmit&nbsp;		=&nbsp;		new&nbsp;\\AlipaySubmit($alipay_config);\n		$html_text&nbsp;			=&nbsp;		$alipaySubmit-&gt;buildRequestForm($parameter,&quot;get&quot;,&nbsp;&quot;确认&quot;);\n		echo&nbsp;$html_text;\n	}\n	\n	/**\n	&nbsp;*&nbsp;函数说明：支付宝回调异步函数\n	&nbsp;*&nbsp;附带操作数据库\n	&nbsp;*/\n	public&nbsp;function&nbsp;notifyurl(){		\n		header(&quot;Content-Type:text/html;charset=utf-8&quot;);&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$alipay_config		=	C(&#39;alipay_config&#39;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$alipayNotify&nbsp;		=&nbsp;	new&nbsp;\\AlipayNotify($alipay_config);\n		$verify_result&nbsp;		=	$alipayNotify-&gt;verifyNotify();			//计算得出通知验证结果\n		if($verify_result)&nbsp;{											//验证成功	\n			$out_trade_no&nbsp;	=	$_POST[&#39;out_trade_no&#39;];					//商户订单号			\n			$trade_no&nbsp;		=	$_POST[&#39;trade_no&#39;];						//支付宝交易号		\n			$trade_status&nbsp;	=	$_POST[&#39;trade_status&#39;];					//交易状态	\n		&nbsp;&nbsp;&nbsp;&nbsp;if($_POST[&#39;trade_status&#39;]&nbsp;==&nbsp;&#39;TRADE_FINISHED&#39;)&nbsp;{\n				//判断该笔订单是否在商户网站中已经做过处理\n					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序\n					//请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的\n					//如果有做过处理，不执行商户的业务程序\n					//用户登陆支付宝的时候把支付宝的订单存入数据库，而状态修改为&nbsp;98\n					//M(&#39;order&#39;)-&gt;where(array(&quot;onumber&quot;=&gt;$out_trade_no,&quot;ostatic&quot;=&gt;98))-&gt;save(array(&quot;ostatic&quot;=&gt;1,&quot;etime&quot;=&gt;time()));					\n				//注意：\n				//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知\n		&nbsp;&nbsp;&nbsp;&nbsp;}\n		&nbsp;&nbsp;&nbsp;&nbsp;else&nbsp;if&nbsp;($_POST[&#39;trade_status&#39;]&nbsp;==&nbsp;&#39;TRADE_SUCCESS&#39;)&nbsp;{\n				//判断该笔订单是否在商户网站中已经做过处理\n					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序\n					//请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的\n					//如果有做过处理，不执行商户的业务程序\n					M(&#39;order&#39;)-&gt;where(array(&quot;onumber&quot;=&gt;$out_trade_no,&quot;ostatic&quot;=&gt;0))-&gt;save(array(&quot;opaynumber&quot;=&gt;$trade_no,&quot;ostatic&quot;=&gt;1));\n					\n				//注意：\n				//付款完成后，支付宝系统发送该交易状态通知\n				//logResult(&quot;付款完成，订单号：&quot;.$out_trade_no&nbsp;.&quot;,支付宝交易号：&quot;.$trade_no.&quot;,交易状态：&quot;.$trade_status.&quot;&quot;);\n		&nbsp;&nbsp;&nbsp;&nbsp;}\n			echo&nbsp;&quot;success&quot;;												//请不要修改或删除\n		}else&nbsp;{\n		&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&quot;fail&quot;;												//验证失败\n		}\n	}\n\n	/**\n	&nbsp;*&nbsp;函数说明：支付宝成功支付后的转跳页面\n	&nbsp;*&nbsp;\n	&nbsp;*/\n	public&nbsp;function&nbsp;returnurl(){\n		header(&quot;Content-Type:text/html;charset=utf-8&quot;);&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$alipay_config		=	C(&#39;alipay_config&#39;);\n		$alipayNotify&nbsp;		=	new&nbsp;\\AlipayNotify($alipay_config);\n		$verify_result&nbsp;		=	$alipayNotify-&gt;verifyReturn();\n		if($verify_result)&nbsp;{											//验证成功\n			$out_trade_no&nbsp;	=	$_GET[&#39;out_trade_no&#39;];					//商户订单号\n			$trade_no&nbsp;		=	$_GET[&#39;trade_no&#39;];						//支付宝交易号\n			$trade_status	=	$_GET[&#39;trade_status&#39;];					//交易状态\n		&nbsp;&nbsp;&nbsp;&nbsp;if($_GET[&#39;trade_status&#39;]&nbsp;==&nbsp;&#39;TRADE_FINISHED&#39;&nbsp;||&nbsp;$_GET[&#39;trade_status&#39;]&nbsp;==&nbsp;&#39;TRADE_SUCCESS&#39;)&nbsp;{\n				redirect(U(&#39;Home/Member/orderpay&#39;,array(&quot;onumber&quot;=&gt;$out_trade_no)));\n		&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;		else&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			echo&nbsp;&quot;trade_status=&quot;.$_GET[&#39;trade_status&#39;];\n&nbsp;&nbsp;&nbsp;&nbsp;		}\n			echo&nbsp;&quot;验证成功&lt;br&nbsp;/&gt;&quot;;\n		}\n		else&nbsp;{\n		&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&quot;验证失败&quot;;\n		}\n	}\n		\n}</pre><p>到这里基本算完成了，需要等到申请的 KEY 和 PID 下来就可以测试了，需要注意的是：<br/></p><p><span style="color: rgb(255, 0, 0);">notifyurl需要在服务器上才能用，本地测试这里写的任何逻辑是无效的。</span></p><p>文章写到这里基本完成了，自己做过的东西拿出来分享，有疑问请留言告诉我，谢谢~</p>', 2, 555, 1, 'Win 7', '隆航', '111.172.247.5', 0),
(113, '/Upload/Thumb/1450245129.jpg', '2015年年度网络流行语，你肯定都说过~', '每年的年度流行语都体现了网友“城会玩”的一面，更重要的是网络流行语也给了大家一种新的吐槽方式。转眼之间2015年已经接近尾声了，那么今年\n的十大流行语到底是哪些呢？', '网络流行词,2015流行语', 1, 1450244175, '<p>每年的年度流行语都体现了网友“城会玩”的一面，更重要的是网络流行语也给了大家一种新的吐槽方式。转眼之间2015年已经接近尾声了，那么今年的十大流行语到底是哪些呢？<br/></p><blockquote><p>上交给国家</p></blockquote><p style="text-align: center;"><img src="/Upload/20151216/1450244360958620.jpg" title="1450244360958620.jpg" alt="1.jpg"/></p><p>“上交给国家”出自于《盗墓笔记》电视剧版中男主角吴邪的台词。原本应该是“盗墓”主角的吴邪，却口口声声要将所有看到的文物“上交国家”。</p><p style="text-align: center;"><img src="/Upload/20151216/1450244387184474.jpg" title="1450244387184474.jpg" alt="2.jpg"/></p><p>于是从开篇的牛头到随后出现的藏宝图，都逃脱不了“上交国家”的命运，由于这句话有悖于南派三叔原著中的情节和盗墓精神，</p><p style="text-align: center;"><img src="/Upload/20151216/1450244421291364.jpg" title="1450244421291364.jpg" alt="3.jpg"/></p><p><br/></p><p>所以引发原著粉和看剧党的大规模的吐槽，此句也由此流行起来啦~</p><blockquote><p>我的内心几乎是崩溃的</p></blockquote><p style="text-align:center"><img src="/Upload/20151216/1450244486324047.jpg" title="1450244486324047.jpg" alt="4.jpg"/></p><p><br/></p><p>2014年12月前后，90后漫画作者陈安妮以真实经历创作的《对不起，我只过1%生活》的漫画在网络上走红。后来支付宝用此来嘲讽WP用户选择百分之一的生活，结果遭WP用户反击“支付婊”。</p><p style="text-align:center"><img src="/Upload/20151216/1450244521831363.jpg" title="1450244521831363.jpg" alt="5.jpg"/></p><p>吓得支付宝马上发招聘信息招WP工程师了......</p><blockquote><p>吓死宝宝了</p></blockquote><p style="text-align:center"><img src="/Upload/20151216/1450244561814536.jpg" title="1450244561814536.jpg" alt="6.jpg"/></p><p>有人说是奔跑吧兄弟中王宝强说的吓死宝宝了……</p><p>也有人说是一位叫“宝宝”的LOL女主播先说出来的，她在主持中，现场抽奖，让画面随机选人头像，突然有一个很黑很肥的胖子出现在画面，然后她就说了句：“吓死宝宝了”之后这句话就被很多人用了！</p><p style="text-align:center"><img src="/Upload/20151216/1450244587929410.jpg" title="1450244587929410.jpg" alt="7.jpg"/></p><p>还有人说这句话本身是网上本就很流行的一句“吓死爹了”，是后来被网友改编成“吓死宝宝了”</p><blockquote><p>狗带“godie”<br/></p></blockquote><p style="text-align:center"><img src="/Upload/20151216/1450244665902921.jpg" title="1450244665902921.jpg" alt="8.jpg"/></p><p>“狗带”是“go die”的谐音，源自中国艺人黄子韬在一次演唱会上表演的灵魂Rap。<br/></p><p>被《暴走大事件》挖出后让广大网友玩坏~</p><blockquote><p>你们城里人真会玩<br/></p></blockquote><p style="text-align:center"><img src="/Upload/20151216/1450244693928574.jpg" title="1450244693928574.jpg" alt="9.jpg"/></p><p>&nbsp;<br/></p><p>早些时候，前EXO成员吴亦凡在上海某所大学拍摄电影，结果有人假扮吴亦凡让那些狗仔以为是吴亦凡本人，并且狗仔把照片上传到微博上，然后才发现并不是吴亦凡本人，之后就出来了这句你们城里人真会玩。</p><blockquote><p>然并卵</p></blockquote><p style="text-align:center"><img src="/Upload/20151216/1450244721672642.jpg" title="1450244721672642.jpg" alt="10.jpg"/>&nbsp;</p><p>这个词最早来自于某地方言，</p><p style="text-align:center"><img src="/Upload/20151216/1450244740586945.jpg" title="1450244740586945.jpg" alt="11.jpg"/></p><p>之后被《暴走大事件》里的张全蛋采用，凭借一个《质检leader张全蛋怒揭电视机行业内幕》让这个词迅速走红。</p><blockquote><p>我单方面宣布</p></blockquote><p style="text-align:center"><img src="/Upload/20151216/1450244767183222.jpg" title="1450244767183222.jpg" alt="12.jpg"/></p><p>一名女孩在观看NBA球赛时发现梅西就坐在起身后，她掩饰不住自己的兴奋，鼓起勇气要求与梅西合影，梅西答应了她的要求。之后女孩在自己的推特上宣布她将在2015年6月单方面与梅西结婚。之后也是没有逃脱广大网友的跟风恶搞，<br/></p><p>由此成为了网络流行用语......</p><blockquote><p>重要的事情说三遍<br/></p></blockquote><p style="text-align:center"><img src="/Upload/20151216/1450244787146843.jpg" title="1450244787146843.jpg" alt="13.jpg"/></p><p>出自动漫《潜行吧，奈亚子》用法：记得说三遍，说三遍，说三遍就好了，会有神奇的效果发生。其实我觉得这应该是出自骆宾王的《咏鹅》，“鹅，鹅，鹅”重要的事说三遍！！！<br/></p><blockquote><p>世界那么大<br/></p></blockquote><p style="text-align:center"><img src="/Upload/20151216/1450244810276411.jpg" title="1450244810276411.jpg" alt="14.jpg"/></p><p>“世界那么大，我想去看看”来源于郑州实验中学一位老师的最具情怀的辞职信，<br/></p><p>不久后该老师微博声称自己决定裸婚，过上幸福的生活~</p><blockquote><p>哔了狗了<br/></p></blockquote><p style="text-align:center"><img src="/Upload/20151216/1450244835756835.jpg" title="1450244835756835.jpg" alt="15.jpg"/></p><p>《暴走大事件》张全蛋在吐槽进口马桶圈时说的一句话。本来是一句R了狗了，由于说成R了狗了也会被后期哔音和谐。<br/></p><p>所以他就干脆说成了哔了狗了~</p><p style="text-align:center"><img src="/Upload/20151216/1450244856399730.jpg" title="1450244856399730.jpg" alt="16.jpg"/></p><p>以上就是2015年年度流行语啦，作为一名新潮的暴走小伙伴你是不是早就有听过啦？最后感谢一下度娘提供的帮助哦~按照每年的惯例，这些网络流行语我们就等着春晚见吧~</p>', 2, 481, 0, 'Win 7', '网络', '111.172.247.5', 0),
(114, '/Upload/Thumb/1451639362.jpg', '给博客添加节日雪花', '转眼就是2016年的圣诞和元旦到了，然后剩下的就是春节，节日多了当然气氛就要嗨起来嘛，这里给大家分享一个比较不错的雪花特效，简单、粗暴。需要的可以进来瞧瞧。', '雪花,jq特效', 1, 1451638806, '<p>二话不说先上效果图:</p><p style="text-align:center"><img src="/Upload/20160101/1451638951632614.png" title="1451638951632614.png" alt="QQ截图20160101170138.png"/></p><p>需要的朋友请看下面的说明，对JQ比较了解的朋友可以直接下载。</p><blockquote><p>下载地址：</p></blockquote><p><a href="http://pan.baidu.com/s/1mgO5nLY" _src="http://pan.baidu.com/s/1mgO5nLY">http://pan.baidu.com/s/1mgO5nLY</a>（也可以在下载区下载）</p><blockquote><p>操作方法</p></blockquote><ol class=" list-paddingleft-2" style="list-style-type: decimal;"><li><p>把下面代码加入需要显示的文件，因为我是公用底部，所以我添加在底部</p></li></ol><pre class="brush:html">&lt;!--&nbsp;新年雪花效果开始&nbsp;--&gt;\n&lt;style&nbsp;type=&#39;text/css&#39;&gt;\n.snowwrap,.snow-container{position:&nbsp;fixed;&nbsp;top:&nbsp;0;&nbsp;left:&nbsp;0;&nbsp;width:&nbsp;100%;&nbsp;height:&nbsp;100%;&nbsp;pointer-events:&nbsp;none;&nbsp;z-index:&nbsp;100001;}\n&lt;/style&gt;\n&lt;div&nbsp;class=&quot;snowwrap&quot;&gt;\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;class=&quot;snow-container&quot;&gt;&lt;/div&gt;\n&lt;/div&gt;\n&lt;!--&nbsp;新年雪花效果结束&nbsp;--&gt;</pre><p>2.引入核心JQ文件</p><pre class="brush:html">&lt;!--&nbsp;雪花效果JS&nbsp;--&gt;\n&lt;script&nbsp;src=&#39;__JS__/snow.js&#39;&gt;&lt;/script&gt;</pre><p>然后就可以看到效果了。具体请参考本博客现在的效果。<br/></p><blockquote><p>注意事项<br/></p></blockquote><ol class=" list-paddingleft-2" style="list-style-type: decimal;"><li><p>snow.js的2958行需要指定雪花图片的地址</p></li><li><p>需要在snow.js前面引入JQ文件</p></li></ol><p>应该没什么了，如果遇到问题可以留言和我说下。另外新版博客剩下后台的部分代码修改，预计春节发布2.0版本。</p><p>元旦到了2016年的新开始，祝大家新的一天学业有成，心想事成。</p>', 2, 459, 1, 'Win 7', '隆航', '58.53.107.63', 0),
(115, '/Upload/Thumb/1457318139.jpg', 'PHP获取时间戳的毫秒', 'php获取时间戳就是time()函数，那么当我们需要毫秒级别的时间的时候怎么获取呢?', '毫秒,PHP时间', 1, 1456495260, '<p>php获取时间的方式是time();<br/></p><p>那么如果是涉及游戏或者其他需要精细的时间，那么怎么获取呢？</p><pre class="brush:php">&nbsp;/**&nbsp;获取当前时间戳，精确到毫秒&nbsp;*/\nfunction&nbsp;microtime_float()\n{\n&nbsp;&nbsp;&nbsp;list($usec,&nbsp;$sec)&nbsp;=&nbsp;explode(&quot;&nbsp;&quot;,&nbsp;microtime());\n&nbsp;&nbsp;&nbsp;return&nbsp;((float)$usec&nbsp;+&nbsp;(float)$sec);\n}\n/**&nbsp;格式化时间戳，精确到毫秒，x代表毫秒&nbsp;*/\nfunction&nbsp;microtime_format($tag,&nbsp;$time)\n{\n&nbsp;&nbsp;&nbsp;list($usec,&nbsp;$sec)&nbsp;=&nbsp;explode(&quot;.&quot;,&nbsp;$time);\n&nbsp;&nbsp;&nbsp;$date&nbsp;=&nbsp;date($tag,$usec);\n&nbsp;&nbsp;&nbsp;return&nbsp;str_replace(&#39;x&#39;,&nbsp;$sec,&nbsp;$date);\n}</pre><p><br/>使用方法：<br/>1.&nbsp;获取当前时间戳(精确到毫秒)：microtime_float()<br/>2.&nbsp;时间戳转换时间：microtime_format(&#39;Y年m月d日&nbsp;H时i分s秒&nbsp;x毫秒&#39;,&nbsp;1270626578.66000000)&nbsp;<br/></p><p>这里需要用到的是list()函数</p><blockquote><p>list（）定义和用法</p></blockquote><p style="margin-top: 12px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 18px; font-family: Verdana, Arial, 宋体; font-size: 12px; white-space: normal; background-color: rgb(249, 249, 249);">list() 函数用于在一次操作中给一组变量赋值。</p><p class="note" style="margin-top: 12px; margin-bottom: 0px; padding: 0px; border: 0px; line-height: 18px; font-family: Verdana, Arial, 宋体; font-size: 12px; white-space: normal; background-color: rgb(249, 249, 249);"><span style="margin: 0px; padding: 0px; border: 0px; font-weight: bold;">注释：</span>该函数只用于数字索引的数组，且假定数字索引从 0 开始。</p><p><br/></p>', 2, 80, 1, 'Win 7', '隆航', '127.0.0.1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `lt_article_c`
--

CREATE TABLE IF NOT EXISTS `lt_article_c` (
  `ac_id` int(11) NOT NULL COMMENT '主键',
  `ac_pid` int(11) NOT NULL COMMENT '文章ID',
  `ac_name` varchar(128) NOT NULL COMMENT '昵称',
  `ac_email` varchar(128) NOT NULL COMMENT '邮箱',
  `ac_url` varchar(128) NOT NULL COMMENT '域名',
  `ac_content` text NOT NULL COMMENT '内容',
  `ac_img` varchar(128) NOT NULL COMMENT '头像',
  `ac_ip` varchar(16) NOT NULL COMMENT 'IP',
  `ac_from` varchar(64) NOT NULL COMMENT '来自',
  `ac_time` int(10) NOT NULL COMMENT '时间',
  `ac_rname` varchar(64) NOT NULL COMMENT '回复人',
  `ac_rtime` int(10) NOT NULL COMMENT '时间',
  `ac_rcontent` text NOT NULL COMMENT '回复文本'
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

--
-- 转存表中的数据 `lt_article_c`
--

INSERT INTO `lt_article_c` (`ac_id`, `ac_pid`, `ac_name`, `ac_email`, `ac_url`, `ac_content`, `ac_img`, `ac_ip`, `ac_from`, `ac_time`, `ac_rname`, `ac_rtime`, `ac_rcontent`) VALUES
(121, 113, '中国淋浴房著名品牌', '18306677553@163.com', 'http://www.gdshaleman.com', '你们城里人真会玩儿', '/Public/Img/Portrait/41.jpg', '113.69.100.202', 'Win 7', 1450772509, 'admin', 2015, '[mr:/65]'),
(123, 114, '胡小柯', '574578479@qq.com', 'http://www.huxinchun.com', '借用了，感谢博主', '/Public/Img/Portrait/61.jpg', '61.183.214.66', 'Win 7', 1451752302, 'admin', 2016, '[mr:/18] 不客气 谢谢支持'),
(124, 114, 'themebetter', 'i@themebetter.com', 'http://themebetter.com/', '应景！挺好的。', '/Public/Img/Portrait/62.jpg', '36.99.192.170', 'Win 8.1', 1452075823, 'admin', 2016, '谢谢支持'),
(128, 114, '新浪云领200云豆', 'www@qq.com', '新浪云领200云豆http://t.cn/R4WPeoE', '虽然很有意境，但还是感觉有点乱乱的~', '/Public/Img/Portrait/18.jpg', '58.56.176.57', 'Win 7', 1453168940, 'admin', 2016, '嗯，因为自己是做后端的，前段的设计是参考别人的修改的[mr:/50]，慢慢改进吧'),
(129, 113, '跨境电商', 'geekdeals@163.com', 'http://adoncn.com', '不错，感谢！', '/Public/Img/Portrait/56.jpg', '113.68.115.173', 'Win 7', 1453767610, 'admin', 2016, '[mr:/11]谢谢'),
(130, 114, '嘟嘟笔记', '840160384@qq.com', 'http://i-tangrui.com', '效果不错，不过可以看看我网站的雪花效果', 'http://q.qlogo.cn/qqapp/101232670/5FC49340A33717BE2BD372D90CB8E211/100', '60.255.32.24', 'Win 10', 1453803869, 'admin', 2016, '[mr:/18]好的，因为各种原因，很久没搭理博客了。一定会回访的'),
(131, 114, 'My sunshine静', 'loong@longif.com', '', '很应景不错呀', 'http://q.qlogo.cn/qqapp/101232670/EF09FCAE3A9BF3BC942E8A3A1CA15404/100', '14.150.165.115', 'Win 7', 1453865568, 'admin', 2016, '[mr:/31]网络收集整理的，下载中心有代码，需要的可以自行下载的'),
(132, 113, '跨境电商', 'geekdeals@163.com', 'http://adoncn.com', '[mr:/1]', '/Public/Img/Portrait/56.jpg', '113.68.118.239', 'Win 7', 1454989070, 'admin', 2016, '网络转载，谢谢支持~'),
(133, 114, '就爱网赚', 'jay19920406@sina.com', 'http://jiuaiwz.com/forum.php?mod=viewthread&amp;tid=228&amp;x=1', '不错不错', '/Public/Img/Portrait/55.jpg', '106.117.21.247', 'Win 7', 1455780910, 'admin', 2016, '谢谢支持~');

-- --------------------------------------------------------

--
-- 表的结构 `lt_gust`
--

CREATE TABLE IF NOT EXISTS `lt_gust` (
  `g_id` int(11) NOT NULL COMMENT '主键',
  `g_name` varchar(128) NOT NULL COMMENT '昵称',
  `g_email` varchar(128) NOT NULL COMMENT '邮箱',
  `g_img` varchar(128) NOT NULL COMMENT '头像',
  `g_url` varchar(128) NOT NULL COMMENT '域名',
  `g_content` text NOT NULL COMMENT '文本',
  `g_time` int(10) NOT NULL COMMENT '时间',
  `g_from` varchar(64) NOT NULL COMMENT '来自',
  `g_ip` varchar(16) NOT NULL COMMENT 'IP',
  `g_rname` varchar(64) NOT NULL COMMENT '回复人',
  `g_rtime` int(10) NOT NULL COMMENT '回复时间',
  `g_rcontent` text NOT NULL COMMENT '内容'
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='留言表';

--
-- 转存表中的数据 `lt_gust`
--

INSERT INTO `lt_gust` (`g_id`, `g_name`, `g_email`, `g_img`, `g_url`, `g_content`, `g_time`, `g_from`, `g_ip`, `g_rname`, `g_rtime`, `g_rcontent`) VALUES
(84, '柒爱博客', '16516034@qq.com', '/Public/Img/Portrait/70.jpg', 'www.chen101.cn', '博主的微信邮箱回复是怎么弄的呢？ 求告知哦www.chen101.cn', 1454213193, 'Win 7', '59.56.228.17', 'admin', 1456494865, '我用的是QQ邮箱来处理的哟'),
(85, '小小新', '2990018166@qq.com', '/Public/Img/Portrait/27.jpg', '', '新年快乐，胡新春博客给您拜年啦！', 1454903333, 'Win 8', '27.20.129.157', 'admin', 1456494901, '谢谢，也祝贵博客新年新气象哈~'),
(86, 'i wanna', '652018536@qq.com', 'http://q.qlogo.cn/qqapp/101232670/211D489C385590B81C06060E6D2712CC/100', '', '很漂亮的博客  学习一下！[mr:/2]', 1456300703, 'Win 7', '110.90.12.185', 'admin', 1456494914, '[mr:/4]谢谢支持'),
(87, '米粒博客', 'cc@meelege.com', '/Public/Img/Portrait/56.jpg', 'http://www.meelege.com', '漂亮得不要不要的  博主这是什么程序哇', 1456319241, 'Win 10', '223.73.33.141', 'admin', 1456494947, '程序是bootstrap3和thinkphp3.2自己写的哟。'),
(88, '小小', '870793197@qq.com', '/Public/Img/Portrait/28.jpg', 'http://www.xuexiaofeng.com', '看看', 1457266087, 'Win 10', '42.80.198.197', '', 0, ''),
(89, '小瑞', 'xrbk@xrbk.top', '/Public/Img/Portrait/84.jpg', '', '求博客源码', 1457286916, 'Win 10', '117.140.58.236', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `lt_link`
--

CREATE TABLE IF NOT EXISTS `lt_link` (
  `l_id` int(11) NOT NULL COMMENT '主键',
  `l_name` varchar(128) NOT NULL COMMENT '申请人',
  `l_email` varchar(128) NOT NULL COMMENT '邮箱',
  `l_url` varchar(128) NOT NULL COMMENT '域名',
  `l_content` text NOT NULL COMMENT '描述',
  `l_ip` varchar(16) NOT NULL COMMENT 'IP',
  `l_from` varchar(64) NOT NULL DEFAULT 'Win 7' COMMENT '来自',
  `l_time` int(10) NOT NULL COMMENT '时间',
  `l_sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序1为第一',
  `l_view` int(11) NOT NULL COMMENT '显示0不显示1为内页2位首页',
  `l_rname` varchar(64) NOT NULL COMMENT '回复人',
  `l_rtime` int(10) NOT NULL COMMENT '时间',
  `l_rcontent` text NOT NULL COMMENT '文本'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

--
-- 转存表中的数据 `lt_link`
--

INSERT INTO `lt_link` (`l_id`, `l_name`, `l_email`, `l_url`, `l_content`, `l_ip`, `l_from`, `l_time`, `l_sort`, `l_view`, `l_rname`, `l_rtime`, `l_rcontent`) VALUES
(2, '浅听风雨', '774694235@qq.com', 'http://toilove.com', '浅听风雨的个人博客', '', 'Win 7', 0, 1, 2, 'admin', 1449735703, '新版的给你的链接修改过来了。好好加油哈~'),
(19, '青春博客', '1@qq.com', 'http://loveteemo.com/', '青春博客', '', 'Win 7', 1445853389, 1, 2, 'admin', 1457317812, 'sss');

-- --------------------------------------------------------

--
-- 表的结构 `lt_log`
--

CREATE TABLE IF NOT EXISTS `lt_log` (
  `id` int(11) NOT NULL COMMENT '主键',
  `lname` varchar(64) NOT NULL COMMENT '用户名',
  `ltime` int(10) NOT NULL COMMENT '时间',
  `lip` varchar(16) NOT NULL COMMENT 'IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆日志表';

-- --------------------------------------------------------

--
-- 表的结构 `lt_picture`
--

CREATE TABLE IF NOT EXISTS `lt_picture` (
  `p_id` int(11) NOT NULL COMMENT '主键',
  `p_pid` int(11) NOT NULL COMMENT '相册ID',
  `p_img` varchar(128) NOT NULL COMMENT '路径',
  `p_thumb` varchar(128) NOT NULL COMMENT '缩略图',
  `p_remark` varchar(256) NOT NULL COMMENT '描述',
  `p_time` int(10) NOT NULL COMMENT '时间',
  `p_view` int(11) NOT NULL COMMENT '显示0为不显示1位显示',
  `p_root` varchar(64) NOT NULL COMMENT '添加人',
  `p_ip` varchar(16) NOT NULL COMMENT 'ip',
  `p_from` varchar(64) NOT NULL COMMENT '来自'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='图片表';

--
-- 转存表中的数据 `lt_picture`
--

INSERT INTO `lt_picture` (`p_id`, `p_pid`, `p_img`, `p_thumb`, `p_remark`, `p_time`, `p_view`, `p_root`, `p_ip`, `p_from`) VALUES
(1, 1, '/Upload/Album/1457317557.jpg', '/Upload/Thumb/1457317557.jpg', '青春博客相册测试', 1457317518, 1, 'admin', '127.0.0.1', 'Win 7');

-- --------------------------------------------------------

--
-- 表的结构 `lt_ppt`
--

CREATE TABLE IF NOT EXISTS `lt_ppt` (
  `pp_id` int(11) NOT NULL COMMENT '主键',
  `pp_img` varchar(128) NOT NULL DEFAULT '/Public/Img/ppt/p1.jpg' COMMENT '图片路径',
  `pp_url` varchar(128) NOT NULL COMMENT '图片指向路径',
  `pp_note` varchar(256) NOT NULL COMMENT '图片描述',
  `pp_time` int(11) NOT NULL COMMENT '添加时间',
  `pp_from` varchar(64) NOT NULL COMMENT '来自',
  `pp_ip` varchar(16) NOT NULL COMMENT '添加Ip',
  `pp_root` varchar(32) NOT NULL COMMENT '操作人',
  `pp_view` int(11) NOT NULL COMMENT '0为不显示1为显示'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='幻灯表';

--
-- 转存表中的数据 `lt_ppt`
--

INSERT INTO `lt_ppt` (`pp_id`, `pp_img`, `pp_url`, `pp_note`, `pp_time`, `pp_from`, `pp_ip`, `pp_root`, `pp_view`) VALUES
(1, '/Public/Img/ppt/20151217104210924.png', '', '阿里云九折优惠码：推荐码：4RDOKD', 1447204386, 'Win 7', '119.96.244.200', 'admin', 1),
(2, '/Public/Img/ppt/20151217104210924.png', '', '阿里云九折优惠码：推荐码：4RDOKD', 1447204505, 'Win 7', '119.96.244.200', 'admin', 1),
(3, '/Public/Img/ppt/20151217104210924.png', '', '阿里云九折优惠码：推荐码：4RDOKD', 1447204388, 'Win 7', '119.96.244.200', 'admin', 1);

-- --------------------------------------------------------

--
-- 表的结构 `lt_qq`
--

CREATE TABLE IF NOT EXISTS `lt_qq` (
  `q_id` int(11) NOT NULL COMMENT '主键',
  `q_name` varchar(128) NOT NULL COMMENT '昵称',
  `q_img` varchar(128) NOT NULL COMMENT '头像',
  `q_num` int(11) NOT NULL COMMENT '登陆次数',
  `q_ip` varchar(16) NOT NULL COMMENT 'IP',
  `q_time` int(10) NOT NULL COMMENT '时间'
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 COMMENT='QQ访客表';

--
-- 转存表中的数据 `lt_qq`
--

INSERT INTO `lt_qq` (`q_id`, `q_name`, `q_img`, `q_num`, `q_ip`, `q_time`) VALUES
(1, '堕落的龙少', 'http://q.qlogo.cn/qqapp/101232670/8261DD3B1BCDC7D6234C31079DFEC540/100', 2, '', 0),
(2, '我是兴高采烈', 'http://q.qlogo.cn/qqapp/101232670/7C8F797F30B08554A6E39A537F9A324B/100', 40, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `lt_say`
--

CREATE TABLE IF NOT EXISTS `lt_say` (
  `s_id` int(11) NOT NULL COMMENT '主键',
  `s_content` text NOT NULL COMMENT '文本',
  `s_from` varchar(64) NOT NULL COMMENT '来自',
  `s_ip` varchar(16) NOT NULL COMMENT 'IP',
  `s_time` int(10) NOT NULL COMMENT '时间',
  `s_view` int(11) NOT NULL COMMENT '显示0位不显示1为显示',
  `s_hit` int(11) NOT NULL COMMENT '点击量',
  `s_author` varchar(64) NOT NULL COMMENT '作者'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='说说表';

--
-- 转存表中的数据 `lt_say`
--

INSERT INTO `lt_say` (`s_id`, `s_content`, `s_from`, `s_ip`, `s_time`, `s_view`, `s_hit`, `s_author`) VALUES
(32, '<p>创业的艰辛第一步就打败了我<img src="http://img.baidu.com/hi/jx2/j_0016.gif"/></p>', 'Win 7', '119.79.30.2', 1450515661, 1, 5, '隆航');

-- --------------------------------------------------------

--
-- 表的结构 `lt_say_c`
--

CREATE TABLE IF NOT EXISTS `lt_say_c` (
  `sc_id` int(11) NOT NULL COMMENT '主键',
  `sc_pid` int(11) NOT NULL COMMENT '说说id',
  `sc_name` varchar(128) NOT NULL COMMENT '昵称',
  `sc_email` varchar(128) NOT NULL COMMENT '邮箱',
  `sc_url` varchar(128) NOT NULL COMMENT '域名',
  `sc_content` text NOT NULL COMMENT '文本',
  `sc_ip` varchar(16) NOT NULL COMMENT 'IP',
  `sc_img` varchar(128) NOT NULL COMMENT '头像',
  `sc_from` varchar(64) NOT NULL COMMENT '来自',
  `sc_time` int(10) NOT NULL COMMENT '时间',
  `sc_rname` varchar(64) NOT NULL COMMENT '回复人',
  `sc_rtime` int(10) NOT NULL COMMENT '时间',
  `sc_rcontent` text NOT NULL COMMENT '文本'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='说说评论';

--
-- 转存表中的数据 `lt_say_c`
--

INSERT INTO `lt_say_c` (`sc_id`, `sc_pid`, `sc_name`, `sc_email`, `sc_url`, `sc_content`, `sc_ip`, `sc_img`, `sc_from`, `sc_time`, `sc_rname`, `sc_rtime`, `sc_rcontent`) VALUES
(1, 32, '仇鹏', '1979933952@qq.com', '', '加油！！！！', '124.202.177.5', '/Public/Img/Portrait/31.jpg', 'Win 7', 1452948652, 'admin', 1456494373, '谢谢，因为各种原因没管理博客。[mr:/29]');

-- --------------------------------------------------------

--
-- 表的结构 `lt_system`
--

CREATE TABLE IF NOT EXISTS `lt_system` (
  `id` int(11) NOT NULL COMMENT '主键',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `title2` varchar(128) NOT NULL COMMENT '次级标题',
  `keyword` varchar(128) NOT NULL COMMENT '关键词',
  `remark` varchar(256) NOT NULL COMMENT '描述',
  `author` varchar(64) NOT NULL COMMENT '作者',
  `createtime` date NOT NULL COMMENT '创建时间',
  `icp` varchar(32) NOT NULL COMMENT '备案',
  `copy` varchar(128) NOT NULL COMMENT '版权',
  `footer` text NOT NULL COMMENT '统计',
  `hit` int(11) NOT NULL COMMENT '访问',
  `admin_img` varchar(128) NOT NULL COMMENT '管理员头像'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统基本表';

--
-- 转存表中的数据 `lt_system`
--

INSERT INTO `lt_system` (`id`, `title`, `title2`, `keyword`, `remark`, `author`, `createtime`, `icp`, `copy`, `footer`, `hit`, `admin_img`) VALUES
(1, '青春博客', '青春因为爱情而美丽', '青春,爱情,博客,thinkphp,bootstrap3', '青春因为爱情而美丽，青春就要有青春的活力，开源程序 LoveTeemo青春博客，欢迎来访~', '隆航', '2014-11-11', '鄂ICP备15000791号 ', '© 2014 - 2015 LoveTeemo博客 &amp; 版权所有 ', '<a href="http://loveteemo.com/index.php/Admin/Login/index" target="_blank">管理登陆</a>  | <script src="http://s95.cnzz.com/z_stat.php?id=1253899479&web_id=1253899479" language="JavaScript"></script>', 446694, '/Public/Img/icon/admin.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `lt_tag`
--

CREATE TABLE IF NOT EXISTS `lt_tag` (
  `t_id` int(11) NOT NULL COMMENT '主键',
  `t_name` varchar(128) NOT NULL COMMENT '栏目名称',
  `t_time` int(10) NOT NULL COMMENT '时间',
  `t_sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `t_view` int(11) NOT NULL COMMENT '显示0不显示1显示',
  `t_remark` varchar(256) NOT NULL COMMENT '描述',
  `t_ip` varchar(16) NOT NULL COMMENT 'IP',
  `t_from` varchar(64) NOT NULL COMMENT '来自',
  `t_root` varchar(64) NOT NULL COMMENT '操作人'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='栏目表';

--
-- 转存表中的数据 `lt_tag`
--

INSERT INTO `lt_tag` (`t_id`, `t_name`, `t_time`, `t_sort`, `t_view`, `t_remark`, `t_ip`, `t_from`, `t_root`) VALUES
(1, '学习笔记', 1447661369, 100, 1, '自己学习上的一些笔记总结和经验分享', '111.172.255.211', 'Win 7', 'admin'),
(2, '闲言碎语', 1447661410, 100, 1, '在生活中的感悟和偶尔的牢骚', '111.172.255.211', 'Win 7', 'admin'),
(3, '热点分享', 1447661457, 100, 1, '转载和整理一些互联网上的最新的资讯在博客上和大家分享', '111.172.255.211', 'Win 7', 'admin'),
(4, '博客相关', 1447661488, 100, 1, '博客上的一些更新和代码优化和调整的代码分享', '111.172.255.211', 'Win 7', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `lt_user`
--

CREATE TABLE IF NOT EXISTS `lt_user` (
  `u_id` int(11) NOT NULL COMMENT '主键',
  `u_name` varchar(64) NOT NULL COMMENT '用户名',
  `u_password` varchar(32) NOT NULL COMMENT '密码',
  `u_class` int(11) NOT NULL COMMENT '权限组1为最高2为编辑3为游客',
  `u_remark` varchar(256) NOT NULL COMMENT '用户描述',
  `u_email` varchar(128) NOT NULL COMMENT '邮箱',
  `u_time` datetime NOT NULL COMMENT '时间',
  `u_ip` varchar(16) NOT NULL COMMENT 'IP',
  `u_root` varchar(64) NOT NULL DEFAULT 'root' COMMENT '操作人'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `lt_user`
--

INSERT INTO `lt_user` (`u_id`, `u_name`, `u_password`, `u_class`, `u_remark`, `u_email`, `u_time`, `u_ip`, `u_root`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, '', '', '0000-00-00 00:00:00', '', 'root'),
(2, 'test', '098f6bcd4621d373cade4e832627b4f6', 2, '测试期间的测试账号', '775919499@qq.com', '2015-11-06 09:51:14', '111.172.245.58', 'root');

-- --------------------------------------------------------

--
-- 表的结构 `lt_version`
--

CREATE TABLE IF NOT EXISTS `lt_version` (
  `v_id` int(11) NOT NULL COMMENT '主键',
  `v_version` varchar(16) NOT NULL COMMENT '版本号',
  `v_remark` text NOT NULL COMMENT '描述',
  `v_time` int(10) NOT NULL COMMENT '时间',
  `v_view` int(11) NOT NULL COMMENT '0为不显示,1为显示',
  `v_ip` varchar(16) NOT NULL COMMENT 'IP',
  `v_author` varchar(64) NOT NULL COMMENT '作者'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='版本表';

--
-- 转存表中的数据 `lt_version`
--

INSERT INTO `lt_version` (`v_id`, `v_version`, `v_remark`, `v_time`, `v_view`, `v_ip`, `v_author`) VALUES
(1, 'V 2.0.01', '测试新版本发布', 1446774037, 1, '111.172.245.58', 'admin'),
(2, 'V 2.0.02', '修复内容', 1446775833, 1, '111.172.245.58', 'admin'),
(3, 'V 2.0.03', '/--------------------------------------------/\n在Home的Conf中添加TMPL_ACTION_ERROR指向404页面\n完成404的指向', 1447982732, 1, '111.172.255.211', 'admin'),
(4, 'V 2.0.4', '新增-下载模块-下载日志', 1449467826, 1, '111.172.247.5', 'admin'),
(5, 'V 2.0.5', '修复-QQ登陆-文章评论邮件样式-QQ登陆后评论-幻灯修改', 1449482254, 1, '111.172.247.5', 'admin'),
(6, 'V 2.0.6', '修复标题栏title的文字顺序', 1450251609, 1, '111.172.247.5', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lt_album`
--
ALTER TABLE `lt_album`
  ADD PRIMARY KEY (`al_id`);

--
-- Indexes for table `lt_album_c`
--
ALTER TABLE `lt_album_c`
  ADD PRIMARY KEY (`alc_id`);

--
-- Indexes for table `lt_article`
--
ALTER TABLE `lt_article`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `a_title` (`a_title`);

--
-- Indexes for table `lt_article_c`
--
ALTER TABLE `lt_article_c`
  ADD PRIMARY KEY (`ac_id`);

--
-- Indexes for table `lt_gust`
--
ALTER TABLE `lt_gust`
  ADD PRIMARY KEY (`g_id`);

--
-- Indexes for table `lt_link`
--
ALTER TABLE `lt_link`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `lt_log`
--
ALTER TABLE `lt_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lt_picture`
--
ALTER TABLE `lt_picture`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `lt_ppt`
--
ALTER TABLE `lt_ppt`
  ADD PRIMARY KEY (`pp_id`);

--
-- Indexes for table `lt_qq`
--
ALTER TABLE `lt_qq`
  ADD PRIMARY KEY (`q_id`);

--
-- Indexes for table `lt_say`
--
ALTER TABLE `lt_say`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `lt_say_c`
--
ALTER TABLE `lt_say_c`
  ADD PRIMARY KEY (`sc_id`);

--
-- Indexes for table `lt_system`
--
ALTER TABLE `lt_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lt_tag`
--
ALTER TABLE `lt_tag`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `lt_user`
--
ALTER TABLE `lt_user`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `lt_version`
--
ALTER TABLE `lt_version`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lt_album`
--
ALTER TABLE `lt_album`
  MODIFY `al_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lt_album_c`
--
ALTER TABLE `lt_album_c`
  MODIFY `alc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lt_article`
--
ALTER TABLE `lt_article`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `lt_article_c`
--
ALTER TABLE `lt_article_c`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `lt_gust`
--
ALTER TABLE `lt_gust`
  MODIFY `g_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `lt_link`
--
ALTER TABLE `lt_link`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `lt_log`
--
ALTER TABLE `lt_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `lt_picture`
--
ALTER TABLE `lt_picture`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lt_ppt`
--
ALTER TABLE `lt_ppt`
  MODIFY `pp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `lt_qq`
--
ALTER TABLE `lt_qq`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT for table `lt_say`
--
ALTER TABLE `lt_say`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `lt_say_c`
--
ALTER TABLE `lt_say_c`
  MODIFY `sc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lt_system`
--
ALTER TABLE `lt_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lt_tag`
--
ALTER TABLE `lt_tag`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lt_user`
--
ALTER TABLE `lt_user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lt_version`
--
ALTER TABLE `lt_version`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
