# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: learningweb
# Generation Time: 2018-05-31 14:08:22 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table addcourse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `addcourse`;

CREATE TABLE `addcourse` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `teacherid` varchar(50) NOT NULL COMMENT '教师id',
  `result` varchar(50) DEFAULT NULL COMMENT '审核结果',
  `course` varchar(50) NOT NULL COMMENT '课程名称',
  `precourseid1` varchar(50) DEFAULT NULL COMMENT '前趋课程id1',
  `precourseid2` varchar(50) DEFAULT NULL COMMENT '前趋课程id2',
  `precourseid3` varchar(50) DEFAULT NULL COMMENT '前趋课程id3',
  `precourseid4` varchar(50) DEFAULT NULL COMMENT '前趋课程id4',
  PRIMARY KEY (`id`),
  KEY `FK_addcourse_teacher` (`teacherid`),
  CONSTRAINT `FK_addcourse_teacher` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请加课表';

LOCK TABLES `addcourse` WRITE;
/*!40000 ALTER TABLE `addcourse` DISABLE KEYS */;

INSERT INTO `addcourse` (`id`, `teacherid`, `result`, `course`, `precourseid1`, `precourseid2`, `precourseid3`, `precourseid4`)
VALUES
	('8aa9e94f637c131701637c2a69030002','5','申请未通过','天文学','null','null','null','null');

/*!40000 ALTER TABLE `addcourse` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table administrator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;

INSERT INTO `administrator` (`id`, `username`, `password`)
VALUES
	('1','root','root'),
	('2','管理员2','root');

/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table association
# ------------------------------------------------------------

DROP TABLE IF EXISTS `association`;

CREATE TABLE `association` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `chapterid` varchar(50) NOT NULL COMMENT '章节id',
  `prochapterid` varchar(50) NOT NULL COMMENT '后继章节id',
  PRIMARY KEY (`id`),
  KEY `FK_association_chapter` (`chapterid`),
  KEY `FK_association_chapter_2` (`prochapterid`),
  CONSTRAINT `FK_association_chapter` FOREIGN KEY (`chapterid`) REFERENCES `chapter` (`id`),
  CONSTRAINT `FK_association_chapter_2` FOREIGN KEY (`prochapterid`) REFERENCES `chapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='章节关系表';

LOCK TABLES `association` WRITE;
/*!40000 ALTER TABLE `association` DISABLE KEYS */;

INSERT INTO `association` (`id`, `chapterid`, `prochapterid`)
VALUES
	('1','2','1'),
	('10','11','9'),
	('2','6','2'),
	('3','6','3'),
	('4','7','6'),
	('5','6','4'),
	('6','6','5'),
	('7','8','7'),
	('8','9','8'),
	('8aa9e94f637775b10163778a34260008','8aa9e94f637775b10163778606230004','8aa9e94f637775b1016377808fa80001'),
	('8aa9e94f637775b10163778a4ebb0009','8aa9e94f637775b10163778606230004','8aa9e94f637775b1016377852ce30002'),
	('8aa9e94f637775b10163778a64bd000a','8aa9e94f637775b10163778606230004','8aa9e94f637775b10163778599e00003'),
	('9','10','9');

/*!40000 ALTER TABLE `association` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table chapter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chapter`;

CREATE TABLE `chapter` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT '章节名称',
  `courseid` varchar(50) NOT NULL COMMENT '课程id',
  `number` varchar(50) NOT NULL COMMENT '章节编号',
  PRIMARY KEY (`id`),
  KEY `FK_db_数据结构chapter_db_course` (`courseid`),
  CONSTRAINT `FK_db_数据结构chapter_db_course` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程章节表';

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;

INSERT INTO `chapter` (`id`, `name`, `courseid`, `number`)
VALUES
	('1','线性表','1','1'),
	('10','内部排序','1','10'),
	('11','外部排序','1','11'),
	('2','链表','1','2'),
	('3','栈和队列','1','3'),
	('4','串','1','4'),
	('5','数组和广义表','1','5'),
	('6','树和二叉树','1','6'),
	('7','图','1','7'),
	('8','动态存储管理','1','8'),
	('8aa9e94f637775b1016377808fa80001','听','5','1'),
	('8aa9e94f637775b1016377852ce30002','说','5','2'),
	('8aa9e94f637775b10163778599e00003','读','5','3'),
	('8aa9e94f637775b10163778606230004','写','5','4'),
	('9','查找','1','9');

/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table chat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `studentid` varchar(50) NOT NULL DEFAULT '',
  `courseid` varchar(50) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(200) DEFAULT '',
  `content` text NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Chat_Student` (`studentid`),
  KEY `Chat_Course` (`courseid`),
  CONSTRAINT `Chat_Course` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`),
  CONSTRAINT `Chat_Student` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;

INSERT INTO `chat` (`id`, `studentid`, `courseid`, `time`, `title`, `content`, `status`)
VALUES
	('1','1','1','2018.5.19','这个章节不懂','老师讲的这个我不是很懂，有人会知道吗？','有效'),
	('402881e7639dbb5901639dbc4db50000','1','1','2018.5.27 02:35:53','课后作业','老师我们的课后习题答案什么时候发呢？','有效'),
	('402881e7639dc5b401639dc7df9f0000','1','13','2018.5.27 02:48:31','初级经济学','我的梦想就在经济学，我梦想着有一天我可以实现我的梦想！在那一天天肯定很蓝，一直到我成功的那一天！','有效'),
	('402881e7639dcc2c01639dd6b48c0002','3','1','2018.05.27 03:04:43','系统设置','请问你们的线性表的相关内容通过了测试了吗？为什么我没办法通过测试？','新'),
	('402881e7639dcc2c01639ddf01230004','3','1','2018.05.27 03:13:47','链表问题','请问你们知道单向链表和双向链表的区别吗？','新'),
	('402881e9639df73501639e04512d0000','1','1','2018.05.27 03:54:33','答案错误','我们最后的答案是不是错的？感觉不对劲。','新');

/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT '课程名',
  `teacherid` varchar(50) NOT NULL COMMENT '老师id',
  `picture` varchar(50) DEFAULT NULL COMMENT '头像',
  `introduction` varchar(50) DEFAULT '无' COMMENT '简介',
  `kind` varchar(50) NOT NULL DEFAULT '无' COMMENT '类型',
  PRIMARY KEY (`id`),
  KEY `FK_db_course_db_teacher` (`teacherid`),
  CONSTRAINT `FK_db_course_db_teacher` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表';

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;

INSERT INTO `course` (`id`, `name`, `teacherid`, `picture`, `introduction`, `kind`)
VALUES
	('1','数据结构','3','../img/WX20170624-040847.png','很好的数据结构','计算机'),
	('10','大学语文A2','5','../img/WX20170624-040847.png','大学语文','文学'),
	('11','初级历史','6','../img/WX20170624-040847.png','历史','历史'),
	('12','高级历史','6','../img/WX20170624-040847.png','高级历史','历史'),
	('13','初级经济学','7','../img/WX20170624-040847.png','很好的经济学','经济学'),
	('14','高级经济学','7','../img/WX20170624-040847.png','每个人都要学习的经济学','经济学'),
	('2','C语言','1','../img/WX20170624-040847.png','基础编程','计算机'),
	('3','计算机网络','2','../img/WX20170624-040847.png','考研科目之一','计算机'),
	('4','计算机组成','4','../img/WX20170624-040847.png','计算机专业必修课，你值得拥有','计算机'),
	('5','小学语文','5','../img/WX20170624-040847.png','小学生必修课','文学'),
	('6','初中语文','5','../img/WX20170624-040847.png','初中语文必修课','文学'),
	('7','高中语文','5','../img/WX20170624-040847.png','高中语文必修课','文学'),
	('8','大学语文A1','5','../img/WX20170624-040847.png','大学语文必修课','历史学'),
	('8aa9e94f637680b301637681bc560000','计算机组成高级','8aa9e94f637644a301637646fb030000','../img/WX20170624-040847.png','计算机组成的进阶课程','计算机'),
	('9','大学语文B','5','../img/WX20170624-040847.png','无','文学');

/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data`;

CREATE TABLE `data` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `chapterid` varchar(50) NOT NULL COMMENT '章节id',
  `kind` varchar(50) NOT NULL COMMENT '资料类型',
  PRIMARY KEY (`id`),
  KEY `FK_db_数据结构data_db_数据结构chapter` (`chapterid`),
  CONSTRAINT `FK_db_数据结构data_db_数据结构chapter` FOREIGN KEY (`chapterid`) REFERENCES `chapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程学习资料表';

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;

INSERT INTO `data` (`id`, `name`, `address`, `chapterid`, `kind`)
VALUES
	('1','链表','/data/链表.mp4','2','视频'),
	('2','链表ppt','/data/链表.html','2','ppt');

/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exam
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `chapterid` varchar(50) NOT NULL COMMENT '章节id',
  `answer` varchar(50) NOT NULL COMMENT '答案',
  `address` varchar(50) NOT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  KEY `FK_db_数据结构试题_db_数据结构chapter` (`chapterid`),
  CONSTRAINT `FK_db_数据结构试题_db_数据结构chapter` FOREIGN KEY (`chapterid`) REFERENCES `chapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程试题表';

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;

INSERT INTO `exam` (`id`, `chapterid`, `answer`, `address`)
VALUES
	('297e4783621dd4b401621dd69b5e0000','2','A,D,B,B,C','/data/examtest/链表.jpg');

/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table learn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `learn`;

CREATE TABLE `learn` (
  `id` varchar(50) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `courseid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__student` (`studentid`),
  KEY `FK__course` (`courseid`),
  CONSTRAINT `FK__course` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`),
  CONSTRAINT `FK__student` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生学习表';

LOCK TABLES `learn` WRITE;
/*!40000 ALTER TABLE `learn` DISABLE KEYS */;

INSERT INTO `learn` (`id`, `studentid`, `courseid`)
VALUES
	('1','1','1'),
	('2','2','5'),
	('3','3','11'),
	('4','1','13'),
	('4028808463b6670e0163b66841be0001','4028808463b6670e0163b667109d0000','1'),
	('4028808463b6670e0163b668780d0002','4028808463b6670e0163b667109d0000','13'),
	('402881e7639dcc2c01639dd33db30000','1','10'),
	('402881e7639dcc2c01639dd53c580001','3','1'),
	('4028abda6381123a016381144baf0001','1','2'),
	('5','4','5'),
	('8aa9e94f637775b10163777827ff0000','1','5');

/*!40000 ALTER TABLE `learn` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table progress
# ------------------------------------------------------------

DROP TABLE IF EXISTS `progress`;

CREATE TABLE `progress` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `studentid` varchar(50) NOT NULL COMMENT '学生id',
  `courseid` varchar(50) NOT NULL COMMENT '课程id',
  `chapterid` varchar(50) NOT NULL COMMENT '章节id',
  `examscore` varchar(50) NOT NULL COMMENT '测试成绩',
  PRIMARY KEY (`id`),
  KEY `FK_db_rateofprogress_db_student` (`studentid`),
  KEY `FK_db_rateofprogress_db_course` (`courseid`),
  KEY `FK_db_rateofprogress_db_数据结构chapter` (`chapterid`),
  CONSTRAINT `FK_db_rateofprogress_db_course` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_db_rateofprogress_db_student` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`),
  CONSTRAINT `FK_db_rateofprogress_db_数据结构chapter` FOREIGN KEY (`chapterid`) REFERENCES `chapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习进度表';

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;

INSERT INTO `progress` (`id`, `studentid`, `courseid`, `chapterid`, `examscore`)
VALUES
	('2','2','3','1','90'),
	('3','1','1','1','92'),
	('4028808463b64a3c0163b64a3ed70000','1','1','2','40'),
	('4028808463b6561e0163b6566f740000','1','1','2','20');

/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relation`;

CREATE TABLE `relation` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `courseid` varchar(50) NOT NULL COMMENT '课程id',
  `frontcourseid` varchar(50) NOT NULL COMMENT '前趋课程id',
  PRIMARY KEY (`id`),
  KEY `FK_relation_course` (`courseid`),
  KEY `FK_relation_course_2` (`frontcourseid`),
  CONSTRAINT `FK_relation_course` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_relation_course_2` FOREIGN KEY (`frontcourseid`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程关系表';

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;

INSERT INTO `relation` (`id`, `courseid`, `frontcourseid`)
VALUES
	('1','1','2'),
	('10','14','13'),
	('2','4','2'),
	('3','3','2'),
	('4','12','11'),
	('5','10','7'),
	('6','8','7'),
	('7','9','8'),
	('8','7','6'),
	('8aa9e94f6376ce50016376ceedf60000','8aa9e94f637680b301637681bc560000','4'),
	('9','6','5');

/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `name` varchar(50) NOT NULL COMMENT '昵称',
  `birthday` date DEFAULT NULL COMMENT '出生年月',
  `gendar` varchar(50) NOT NULL COMMENT '性别',
  `status` varchar(50) NOT NULL COMMENT '学历',
  `grade` varchar(50) NOT NULL COMMENT '年级',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `major` varchar(50) NOT NULL COMMENT '专业',
  `picture` varchar(50) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;

INSERT INTO `student` (`id`, `username`, `password`, `name`, `birthday`, `gendar`, `status`, `grade`, `email`, `major`, `picture`)
VALUES
	('1','root1','root','唐湘龙','2017-06-06','男',' 本科','2014',' 7993@qq.com','计算机','stuimg/女孩1.jpeg'),
	('2','root2','123456','余豪','2017-06-27','男','本科','3','1','计算机','stuimg/女孩2.jpg'),
	('3','root3','root','马灿','2017-06-24','男','本科','3','7933','计算机','stuimg/女孩2.jpg'),
	('4','root4','root','李冲','2017-06-24','男','本科','3','7933','计算机','stuimg/女孩2.jpg'),
	('4028808463b6670e0163b667109d0000','xin402','root1','AlexanderDan','2018-05-07','男','本科','2014','1668926294@qq.com','计算机','stuimg/deafault_avatar.png.jpg');

/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teacher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '工号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `gender` varchar(50) NOT NULL COMMENT '性别',
  `status` varchar(50) NOT NULL COMMENT '学历',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `major` varchar(50) NOT NULL COMMENT '专业',
  `picture` varchar(50) DEFAULT NULL COMMENT '头像',
  `introduction` varchar(50) DEFAULT '这个人很懒，什么也没有留下' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='老师表';

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;

INSERT INTO `teacher` (`id`, `username`, `name`, `password`, `gender`, `status`, `email`, `major`, `picture`, `introduction`)
VALUES
	('1','root1','王子健','root','男','硕士','123',' 计算机科学与技术',NULL,'自强不息'),
	('2','root2','方舟子','root','男','博士','fangzou@qq.com','计算机科学与技术',NULL,'专业打假'),
	('3','root3','雷军','root','男','大学','1234','计算机',NULL,'自强不息'),
	('4','root4','马化腾','root','男','大学','12345','计算机',NULL,'这个人很懒，什么也没有留下'),
	('5','root5','季羡林','root','男','大学','123456','汉语言文学',NULL,'这个人很懒，什么也没有留下'),
	('6','root6','易中天','root','男','大学','1234567','历史',NULL,'这个人很懒，什么也没有留下'),
	('7','root7','郎咸平','root','男','大学','123456789','经济学',NULL,'这个人很懒，什么也没有留下'),
	('8aa9e94f637644a301637646fb030000','root','哥特李','root','男','本科','gete163@qq.com','计算机',NULL,'这个人很懒，什么也没有留下');

/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
