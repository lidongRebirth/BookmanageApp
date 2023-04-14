-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.20 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 libraryapp 的数据库结构
CREATE DATABASE IF NOT EXISTS `libraryapp` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libraryapp`;

-- 导出  表 libraryapp.bannertable 结构
CREATE TABLE IF NOT EXISTS `bannertable` (
  `picurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图照片的地址',
  `hint` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '一些提示性的话',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='banner表，当没有时app显示宣传的默认图片';

-- 正在导出表  libraryapp.bannertable 的数据：~1 rows (大约)
DELETE FROM `bannertable`;
INSERT INTO `bannertable` (`picurl`, `hint`, `id`) VALUES
	('微信图片_20201210172741.png', '图片1', 1);

-- 导出  表 libraryapp.bookinfo 结构
CREATE TABLE IF NOT EXISTS `bookinfo` (
  `bookid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书本二维码(ISBN)',
  `bookname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书名',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `publisher` varchar(50) DEFAULT NULL COMMENT '出版社',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '书籍简介',
  `stock` int NOT NULL COMMENT '库存(默认最低为0)',
  `totalstock` int NOT NULL COMMENT '总库存（用来记录总共数量，防止丢书还不知道原先多少本）',
  `category` bigint NOT NULL DEFAULT '0' COMMENT '类别(从类别表中获取)',
  `locationid` int NOT NULL COMMENT '馆藏位置(从馆藏表中获取),不同场馆的书不能互相换',
  `coverpic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '封面图片',
  `price` double DEFAULT NULL COMMENT '书本价格(方便丢书后赔偿)',
  `publishtime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '出版时间',
  PRIMARY KEY (`bookid`,`locationid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='书籍信息表，同一bookid，不同location，代表不同的书，不同场馆借的书不能混着还书';

-- 正在导出表  libraryapp.bookinfo 的数据：~21 rows (大约)
DELETE FROM `bookinfo`;
INSERT INTO `bookinfo` (`bookid`, `bookname`, `author`, `publisher`, `introduction`, `stock`, `totalstock`, `category`, `locationid`, `coverpic`, `price`, `publishtime`) VALUES
	('3017225', '战争论（全三卷）', '〔德〕克劳塞维茨著；中国人民解放军军事科学院译', '商务印书馆', NULL, 4, 5, 5, 1, 'image-20230211113937270.png', NULL, '1978'),
	('9787010009148', '毛泽东选集一至七卷', '毛泽东', '人民出版社', '毛泽东选集一至七卷', 8, 10, 1, 1, 'image-20230211105850981.png', NULL, '1991'),
	('9787101080759', '孙子兵法', '孙武', '中华书局', '《孙子兵法》十三篇涉及军事理论、实践各个方面，内容博大精深，思想深邃富瞻，逻辑缜密严谨，既是我国古代军事文化遗产中的瑰宝，又是我国优秀传统文化的重要组成部分。本书以杨炳安先生的《十一家注孙子校理》为底本，吸取古今整理、注释、校勘的优秀成果，对《孙子兵法》全文进行注译，每篇逐一题解，资料丰富，解说详尽，尤其是将孙子思想放在先秦诸子、先秦文化的大背景下加以阐发，颇多新论。这是一部学习、研读《孙子兵法》的优秀读本。', 9, 10, 5, 1, 'image-20230211113451977.png', NULL, '2011'),
	('9787111612100', '世界观: 现代人必须要懂的科学哲学和科学史', 'Richard DeWitt', '机械工业出版社', '从地心说到三大定律的跃迁，是人类世界观的一次次脱胎换骨！<br/>亚里士多德的世界观 以地球是宇宙中心为信条。<br/>牛顿世界观 把动者恒动当作真理。<br/>有没有可能我们现在拥有的世界观，最后也被证明为错误？<br/>有没有可能我们的世界观在子孙后代看来，也是陈旧而诡异？<br/>从科学哲学的根本问题，到科学史上的历史事件和哲学主题，彰显了历史、科学、哲学的无止境魅力。本书化繁为简，剖析根本，纵观西方科学两千年，探讨近代科学发展，特别是相对论、量子力学和演化论等理论给世界观带来的冲击和挑战。 它拥有的不仅是知识，更是一套新的认知体系。<br/>本书纵论西方科学两千年，探索科学的起源和思维的本质。这是每一个现代人都需要阅读、了解的关于科学的历史和哲理，有助于读者构建正确的世界观', 9, 10, 2, 1, 'image-20230211110929951.png', NULL, '2018'),
	('9787206041570', '一箭三雕 —— 中国当代资本大鳄发迹真幕', '余郑华 (花荣), 成刚', '吉林人民出版社', '.publisher:Jilin People\'s Publishing House.description:Paperback. Pub Date: Unknown in Publisher: Jilin People\'s Publishing House title: Contemporary Chinese capital predators fortune really curtain - kill three birds List Price: 17.00 yuan Author: Publisher: Jilin People\'s Publishing House Publication D...', 10, 10, 5, 1, 'image-20230211113523050.png', NULL, '2000'),
	('9787208171336', '置身事内 中国政府与经济发展', '兰小欢', '上海人民出版社', '【复旦经院“毕业课”解读经济生活背后的政府角色。罗永浩、刘格菘、张军、周黎安、王烁联袂推荐】', 8, 10, 6, 1, 'image-20230211114243479.png', NULL, '2021'),
	('9787214035738', '大分流：欧洲、中国及现代世界经济的发展', 'Kenneth Pomeranz, 彭慕兰', '江苏人民出版社', '这本“加州学派”的力作，尽管在国外学界频频获奖，但之所以在国内引起这样的轰动，是因为这本书以中国与欧洲双向交互比较的方法，再次触动了国人最敏感的老话题――我们这个长期以来在全球范围内一直保持领先的古老文明，到了近代究竟为什么突然“样样落后”地衰落了？', 9, 10, 6, 1, 'image-20230211114827192.png', NULL, '2003'),
	('9787219052167', '毛泽东与蒋介石', '叶永烈', '广西人民出版社', '《毛泽东与蒋介石》是收录“叶永烈精品书系”的“红色三部曲”中的第三部作品。蒋介石和毛泽东是国共两党的旗手，从二十世纪二十年代至七十年代，蒋介石和毛泽东的合作和斗争，就是半个世界的中国历史风云，就是国共两党的关系史。诚如美国决统尼克松所言：“半个世纪以来的中国史，在很大程度上是三个人的历史：一个是毛泽东，一个是周恩来，一个是蒋介石”。本书作者正是选择了这么一个特殊的视角，透过国共两党的领袖蒋介石和毛泽东以及周恩来的谈谈打打，打打谈谈，边谈边打，边打边谈，把半个世纪的中国历史风云浓缩于本书之中。<br />本书作者运用比较政治学的手法，对毛泽东与蒋介石都以平视的角度看待，不断将他们进行比较，比较他们的思想，比较他们的功过。从他们在二十世纪二十年代初识，比较到七十年代他们相继去世。', 9, 10, 1, 1, 'image-20230211105651098.png', NULL, '2005'),
	('9787222042094', '社会主义由西方到东方的演进 从马克思到邓小平的社会主义思想史考察', '张光明', '云南人民出版社', '《社会主义由西方到东方的演进:从马克思到邓小平的社会主义思想史考察》运用历史唯物主义的方法，对一个半世纪以来社会主义历程作批判性的反思，企图揭示隐藏在社会主义从西方到东方演进轨迹中的内在必然性，阐明马克思社会主义、苏俄社会主义和中国社会主义的基本原貌、逻辑联系和深层物质原因。', 10, 10, 1, 1, 'image-20230211105709323.png', NULL, '2004'),
	('9787506287104', '西方哲学史（修订第8版）: 从苏格拉底到萨特及其后', '[美]撒穆尔·伊诺克·斯通普夫, [美]詹姆斯·菲泽, 匡宏(译), 邓晓芒 等(译)', '世界图书出版公司', '本书自1966年初版以来，历经7次修订，成为英语世界最畅销的哲学史入门教材。尤其是它紧跟当代哲学和哲学史研究的最新发展，是一部既植根传统又向当代开放的哲学史，堪称当代西方哲学史的主流和典范之作。<br />作者以长短适当的篇幅，把西方两千多年的哲学思想作了一个清晰的展示。它兼采国内外书写哲学史的写法之长,善于抓住哲学家的主要思想实质进行阐述，态度客观、材料翔实且清晰明了，文笔平正而不失生动，能让读者对西方哲学的总体发展有一个准确的把握，为读者提供了一个简洁清晰、轻松易懂的哲学读本。', 10, 10, 2, 1, 'image-20230211110831815.png', NULL, '2009'),
	('9787506541435', '布局天下：中国古代军事地理大势', '饶胜文', '解放军出版社', '毛泽东军事文选', 9, 10, 5, 1, 'image-20230211113224413.png', NULL, NULL),
	('9787508669786', '世界的故事', '大卫·哈维', '中信出版集团', '本书是大卫·哈维过去半个世纪思考和研究成果之集萃。在本书中，大卫·哈维为读者搭建了理解世界运行规律的一般框架，试图通过一系列强大的理论工具来解释世界——世界经济发展不平衡、金融危机的城市根源、自然与社会变革之间的关系、资本的演化等。哈维还试图用其方法论和理论思考来解读中国最新的发展状况，探讨中国资本危机的空间转移、中国的基建浪潮以及城市化的背景和隐忧。', 8, 10, 2, 1, 'image-20230211135254000.png', NULL, '2016'),
	('9787508672069', '未来简史', '哈拉瑞Yuval Noah Harari, 林俊宏', '中信出版社', NULL, 8, 10, 2, 1, 'image-20230211111032790.png', NULL, '2017'),
	('9787508672960', '小岛经济学:鱼、美元和经济的故事', 'Peter D. Schiff, Andrew J. Schiff, 胡晓姣, 吕靖纬, 陈志超', '中信出版社', NULL, 10, 10, 6, 1, 'image-20230211114653448.png', NULL, '2017'),
	('9787513636124', '手把手教你读财报:财报是用来排除企业的', '唐朝', '中国经济出版社', NULL, 10, 10, 6, 1, 'image-20230211114210461.png', NULL, '2015'),
	('9787532736553', '他改变了中国：江泽民传', '罗伯特·劳伦斯·库恩', '上海译文出版社', '《他改变了中国：江泽民传》详尽介绍了江泽民同志的人生历程，尤其是阐述和评价了江泽民担任中国主要领导人的十多年中创立的历史功绩。在国内政治方面，书中着重叙述了 1989 年后，在中国政治、社会、经济出现难题的形势下，江泽民同志如何领导全国人民，保持社会稳定，加速经济发展，提高人民生活水平，并最终使中国发生了不可逆转的根本性转变。书中首次披露了若干重大事件与决策的史实细节。比如， 1979 年，江泽民同志在全国人大常委会上作了有关建立经济特区的报告，正是这个报告推动了中国设立经济特区的最终决策； 1992 年党的十四大召开前，江泽民同志提出用 “社会主义市场经济”这一概念来取代“社会主义经济体制”，并使之成为中国改革的新旗帜； 2000 年，江泽民同志提出了“三个代表”重要思想，这一思想最终被载入了党章，成为中国共产党在新世纪的指导思想。在国际政治方面，该书叙述了江泽民同志作为党和国家主要领导人，如何努力把中国塑造为充满生机和活力的备受尊重的政治大国、经济大国、文化大国和外交大国。书中还披露了若干重大外交事件的始末，例如在美国轰炸南联盟、南海撞机等事件中，江泽民如何运用其政治智慧，坚持国家立场，维护民族尊严，疏导公众情绪，平稳化解危机，保持社会稳定。', 10, 10, 1, 1, 'image-20230211105822935.png', NULL, '2004'),
	('9787535776136', '西方科学的起源：公元1450年之前宗教、哲学、体制背景下的欧洲科学传统', '[美]戴维·林德伯格, 张卜天(译)', '湖南科学技术出版社', '《科学源流译丛》之一。是论述近代以前西方科学的权威教材，也是一部非常优秀的科学史读物。它结合欧洲科学传统的哲学、宗教和体制背景，用一本书的篇幅深入浅出地介绍了从古希腊到中世纪晚期各个方面的科学成就，竭力避免从今天的科学观点出发来理解古代成就。1992年本书第一版问世后好评如潮。2007年，作者对该书做了重要修订，几乎每一页都有增补和调整，特别是扩充了关于拜占庭科学、美索不达米亚天文学、中世纪的炼金术和占星术等方面的内容，关于伊斯兰科学的一章和讨论中世纪对16、17世纪科学发展贡献的最后一章则完全重写。这本中译本即根据新版翻译而成。', 10, 10, 2, 1, 'image-20230211110650343.png', NULL, '2013'),
	('9787559431936', '月亮与六便士', '威廉．萨默塞特．毛姆 (William Somerset Maugham)', NULL, NULL, 10, 10, 9, 1, 'image-20230218164222939.png', NULL, NULL),
	('B00N9RPB28', '小狗钱钱', '〔德〕博多·舍费尔', '南海出版社', NULL, 9, 10, 6, 1, 'image-20230211115005688.png', NULL, '2014'),
	('B014CN0DM0', '《资本论》', '王峰明', '中国出版集团,中国民主法制出版社', NULL, 10, 10, 1, 1, 'image-20230211104719951.png', NULL, '2012'),
	('B09DSPKJVM', '战争艺术史(全4卷)', '汉斯·德尔布吕克', '中国出版集团', '破解2300年世界历史演变秘密的里程碑式巨作，囊括人类政治、社会、军事、战略、战术的知识宝库。真正看懂现代世界格局绕不开的重磅经典', 10, 10, 5, 1, 'image-20230211113656236.png', 50, '2021');

-- 导出  表 libraryapp.borrowhistorytable 结构
CREATE TABLE IF NOT EXISTS `borrowhistorytable` (
  `borrowid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借阅凭证ID，由UUID生成',
  `bookid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书本ID',
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借阅人',
  `borrowTime` varchar(50) NOT NULL DEFAULT '' COMMENT '借阅时间',
  `returnTime` varchar(50) DEFAULT NULL COMMENT '还书时间',
  `takeoutid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '取出书时的机器或管理员的id(取出书时写入)',
  `putinid` varchar(50) DEFAULT NULL COMMENT '归还书时的机器或管理员的id(还书时写入)',
  `locationid` int NOT NULL COMMENT '藏书的位置',
  PRIMARY KEY (`borrowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='历史借阅表，记录结束还书时间';

-- 正在导出表  libraryapp.borrowhistorytable 的数据：~0 rows (大约)
DELETE FROM `borrowhistorytable`;
INSERT INTO `borrowhistorytable` (`borrowid`, `bookid`, `userid`, `borrowTime`, `returnTime`, `takeoutid`, `putinid`, `locationid`) VALUES
	('376f29a4-16a1-48db-b63c-339fa5126b45', '9787010009148', '2019001', '1680853467699', NULL, NULL, NULL, 1),
	('3d9f0ecf-13b8-42c4-ab0d-be612c68f207', 'B00N9RPB28', '2019001', '1680853474530', '1680853541597', 'admin1', 'admin1', 1),
	('7d2a97e5-89c7-46e5-a31a-afae84c89cae', '9787208171336', '2019001', '1680853550523', NULL, NULL, NULL, 1),
	('c8a6beda-31fd-405d-aadf-1bd350f63e5e', '9787532736553', '2019001', '1680853633887', '1680853707575', NULL, NULL, 1);

-- 导出  表 libraryapp.borrowtable 结构
CREATE TABLE IF NOT EXISTS `borrowtable` (
  `borrowid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借阅凭证ID，由时间戳组成+用户id形成',
  `bookid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书本ID',
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借阅人',
  `borrowTime` varchar(50) NOT NULL DEFAULT '' COMMENT '借阅时间',
  `istakeout` tinyint NOT NULL DEFAULT '0' COMMENT '取书后还需要扫描才能取出；0代表false没扫没取出，1代表扫了取出',
  `locationid` int NOT NULL COMMENT '馆藏位置',
  `deadlineTime` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`bookid`,`userid`,`locationid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借阅表\r\n一本书一个人只能同时借一本';

-- 正在导出表  libraryapp.borrowtable 的数据：~0 rows (大约)
DELETE FROM `borrowtable`;
INSERT INTO `borrowtable` (`borrowid`, `bookid`, `userid`, `borrowTime`, `istakeout`, `locationid`, `deadlineTime`) VALUES
	('376f29a4-16a1-48db-b63c-339fa5126b45', '9787010009148', '2019001', '1680853467699', 0, 1, '1683445467699'),
	('7d2a97e5-89c7-46e5-a31a-afae84c89cae', '9787208171336', '2019001', '1680853550523', 0, 1, '1683445550523');

-- 导出  表 libraryapp.category 结构
CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` bigint NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `categoryname` varchar(50) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='书籍的类别表';

-- 正在导出表  libraryapp.category 的数据：~18 rows (大约)
DELETE FROM `category`;
INSERT INTO `category` (`categoryid`, `categoryname`) VALUES
	(1, '马克思主义、列宁主义、毛泽东思想、邓小平理论'),
	(2, '哲学、宗教'),
	(3, '社会科学总论'),
	(4, '政治、法律'),
	(5, '军事'),
	(6, '经济'),
	(7, '文化、科学、教育、体育'),
	(8, '语言、文字'),
	(9, '文学'),
	(10, '艺术'),
	(11, '历史、地理'),
	(12, '自然科学总论'),
	(13, '数理科学和化学'),
	(14, '天文学、地球科学'),
	(15, '生物科学'),
	(16, '医药、卫生'),
	(17, '农业科学'),
	(18, '工业技术');

-- 导出  表 libraryapp.collecttable 结构
CREATE TABLE IF NOT EXISTS `collecttable` (
  `userid` varchar(50) NOT NULL,
  `bookid` varchar(50) NOT NULL,
  `locationid` int NOT NULL,
  PRIMARY KEY (`userid`,`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户的收藏表';

-- 正在导出表  libraryapp.collecttable 的数据：~0 rows (大约)
DELETE FROM `collecttable`;
INSERT INTO `collecttable` (`userid`, `bookid`, `locationid`) VALUES
	('2019001', '9787010009148', 1),
	('2019001', '9787208171336', 1);

-- 导出  表 libraryapp.location 结构
CREATE TABLE IF NOT EXISTS `location` (
  `locationid` int NOT NULL AUTO_INCREMENT COMMENT '馆藏id',
  `locationname` varchar(50) NOT NULL COMMENT '馆藏名称',
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='馆藏地点表，用来记录有几个图书馆';

-- 正在导出表  libraryapp.location 的数据：~2 rows (大约)
DELETE FROM `location`;
INSERT INTO `location` (`locationid`, `locationname`) VALUES
	(1, '某大学旧校区'),
	(2, '某大学新校区');

-- 导出  表 libraryapp.mustreadbook 结构
CREATE TABLE IF NOT EXISTS `mustreadbook` (
  `bookid` varchar(50) NOT NULL COMMENT '书本id',
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='必读书籍（管理员添加的）';

-- 正在导出表  libraryapp.mustreadbook 的数据：~0 rows (大约)
DELETE FROM `mustreadbook`;
INSERT INTO `mustreadbook` (`bookid`) VALUES
	('9787010009148'),
	('9787208171336'),
	('B00N9RPB28');

-- 导出  表 libraryapp.newbooktable 结构
CREATE TABLE IF NOT EXISTS `newbooktable` (
  `bookid` varchar(50) NOT NULL COMMENT '新书的id',
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新书榜';

-- 正在导出表  libraryapp.newbooktable 的数据：~0 rows (大约)
DELETE FROM `newbooktable`;
INSERT INTO `newbooktable` (`bookid`) VALUES
	('9787208171336'),
	('9787214035738'),
	('9787508672069');

-- 导出  表 libraryapp.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID(学号)',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称(学生名)',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456' COMMENT '密码',
  `headpic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '123456' COMMENT '用户头像(存放本地图片地址)',
  `sex` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '性别(可以为空，男女中选择)',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `telphone` varchar(50) DEFAULT NULL COMMENT '电话',
  `role` varchar(50) NOT NULL DEFAULT '2' COMMENT '0：超级管理员1：管理员2：用户',
  `borrownum` int NOT NULL DEFAULT '0' COMMENT '已经借阅的书籍数量',
  `maxborrownum` int NOT NULL DEFAULT '6' COMMENT '最大可借阅的数量',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- 正在导出表  libraryapp.user 的数据：~7 rows (大约)
DELETE FROM `user`;
INSERT INTO `user` (`userid`, `username`, `password`, `headpic`, `sex`, `address`, `telphone`, `role`, `borrownum`, `maxborrownum`) VALUES
	('2019001', '高启强', '123456', '', '男', NULL, NULL, '2', 2, 6),
	('2019002', '高启盛', '123456', '99892b8e-14a3-4148-abf5-0c405e0ad4be_Screenshot_20220510-160215.png', '男', '', '', '2', 0, 6),
	('2019003', '李响', '123456', '', '男', NULL, NULL, '2', 0, 6),
	('2019004', '安欣', '123456', 'IMG_20210121_161603.jpg', '男', NULL, NULL, '2', 0, 6),
	('admin0', '超级管理员', '123456', '', '男', NULL, NULL, '0', 0, 6),
	('admin1', '管理员1', '123456', '05c2bbd9-90b8-4a63-9257-c00649cb6ddamypic.jpg', '男', NULL, NULL, '1', 0, 6),
	('admin2', '管理员2', '123456', '', '女', NULL, NULL, '1', 0, 6);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
