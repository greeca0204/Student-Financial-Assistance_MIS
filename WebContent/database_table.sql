/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.4-m14 : Database - slgzzgldb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`slgzzgldb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `slgzzgldb`;

/*Table structure for table `tb_application` */

DROP TABLE IF EXISTS `tb_application`;

CREATE TABLE `tb_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请表id',
  `requestid` int(11) DEFAULT NULL COMMENT '外键，奖学金/助学金id',
  `stuid` int(11) DEFAULT NULL COMMENT '外键，学生id',
  `isCheck` tinyint(1) DEFAULT '0' COMMENT '是否审核，0：未审核，1：审核通过，2：审核未通过',
  `type` int(1) DEFAULT '0' COMMENT '申请类型，0，奖学金，1，助学金，2：岗位，',
  PRIMARY KEY (`id`),
  KEY `项目id` (`requestid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_class` */

DROP TABLE IF EXISTS `tb_class`;

CREATE TABLE `tb_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `name` varchar(20) DEFAULT NULL COMMENT '班级名称',
  `shortname` varchar(8) DEFAULT NULL COMMENT '班级简称',
  `description` varchar(256) DEFAULT NULL COMMENT '班级简介',
  `gradeid` int(11) DEFAULT NULL COMMENT '外键，年级外键',
  `collegeid` int(11) DEFAULT NULL COMMENT '外键，学院外键',
  `majorid` int(11) DEFAULT NULL COMMENT '外键，专业外键',
  PRIMARY KEY (`id`),
  KEY `年级外键` (`gradeid`),
  KEY `学院外键` (`collegeid`),
  KEY `专业外键` (`majorid`),
  CONSTRAINT `学院外键` FOREIGN KEY (`collegeid`) REFERENCES `tb_college` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `年级外键` FOREIGN KEY (`gradeid`) REFERENCES `tb_grade` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `专业外键` FOREIGN KEY (`majorid`) REFERENCES `tb_major` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_college` */

DROP TABLE IF EXISTS `tb_college`;

CREATE TABLE `tb_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学院id',
  `name` varchar(20) DEFAULT NULL COMMENT '学院名称',
  `shortname` varchar(8) DEFAULT NULL COMMENT '学院简称',
  `description` varchar(256) DEFAULT NULL COMMENT '学院简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_grade` */

DROP TABLE IF EXISTS `tb_grade`;

CREATE TABLE `tb_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '年级id',
  `name` varchar(20) DEFAULT NULL COMMENT '年纪名称',
  `description` varchar(256) DEFAULT NULL COMMENT '年级简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_grantship` */

DROP TABLE IF EXISTS `tb_grantship`;

CREATE TABLE `tb_grantship` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '奖学项目id',
  `name` varchar(20) DEFAULT NULL COMMENT '项目名称',
  `money` double DEFAULT '0' COMMENT '项目奖金',
  `request` varchar(128) DEFAULT NULL COMMENT '申请要求',
  `number` varchar(10) DEFAULT NULL COMMENT '人数说明',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请结束时间',
  `stype` varchar(10) DEFAULT '转账' COMMENT '奖金发放形式',
  `activition` tinyint(1) DEFAULT '1' COMMENT '是否可申请',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_job` */

DROP TABLE IF EXISTS `tb_job`;

CREATE TABLE `tb_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位id',
  `name` varchar(20) DEFAULT NULL COMMENT '岗位名称',
  `allNumber` int(11) DEFAULT '0' COMMENT '所需总人数',
  `worktime` varchar(40) DEFAULT NULL COMMENT '岗位工作时间描述',
  `workpoint` varchar(40) DEFAULT NULL COMMENT '岗位工作地址描述',
  `skills` varchar(128) DEFAULT NULL COMMENT '岗位技能需求',
  `interview` varchar(80) DEFAULT NULL COMMENT '面试时间地点说明',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `employer` varchar(40) DEFAULT NULL COMMENT '用人单位',
  `activition` tinyint(1) DEFAULT '0' COMMENT '是否可以申请',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_logs` */

DROP TABLE IF EXISTS `tb_logs`;

CREATE TABLE `tb_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `manager` int(11) DEFAULT NULL COMMENT '管理员id',
  `opttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `operation` varchar(128) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`id`),
  KEY `管理外键` (`manager`),
  CONSTRAINT `管理外键` FOREIGN KEY (`manager`) REFERENCES `tb_sysuser` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_major` */

DROP TABLE IF EXISTS `tb_major`;

CREATE TABLE `tb_major` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `name` varchar(20) DEFAULT NULL COMMENT '专业名称',
  `shortname` varchar(8) DEFAULT NULL COMMENT '专业简称',
  `description` varchar(256) DEFAULT NULL COMMENT '专业简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_message` */

DROP TABLE IF EXISTS `tb_message`;

CREATE TABLE `tb_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通告id',
  `title` varchar(40) DEFAULT NULL COMMENT '通告标题',
  `type` int(1) DEFAULT '0' COMMENT '目标类型，0：教师，1：学生',
  `target` int(11) DEFAULT '0' COMMENT '目标id',
  `details` text COMMENT '通知内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '失效时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_poorgrades` */

DROP TABLE IF EXISTS `tb_poorgrades`;

CREATE TABLE `tb_poorgrades` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '贫困生等级',
  `name` varchar(40) DEFAULT NULL COMMENT '等级名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_question` */

DROP TABLE IF EXISTS `tb_question`;

CREATE TABLE `tb_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问卷id',
  `title` varchar(40) DEFAULT '问卷调查' COMMENT '问卷标题',
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `endtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `description` varchar(80) DEFAULT NULL COMMENT '问卷简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_question_details` */

DROP TABLE IF EXISTS `tb_question_details`;

CREATE TABLE `tb_question_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问卷题目id',
  `questionid` int(11) DEFAULT NULL COMMENT '题目所在问卷id，外键',
  `sortid` int(11) DEFAULT NULL COMMENT '问题在问卷中的排序id',
  `title` text COMMENT '问卷题目',
  `type` int(1) DEFAULT '0' COMMENT '题目类型，0：单选，1：多选，2：填空',
  `answer` varchar(40) DEFAULT NULL COMMENT '回答',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_scholarship` */

DROP TABLE IF EXISTS `tb_scholarship`;

CREATE TABLE `tb_scholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '奖学项目id',
  `name` varchar(20) DEFAULT NULL COMMENT '项目名称',
  `money` double DEFAULT '0' COMMENT '项目奖金',
  `request` varchar(128) DEFAULT NULL COMMENT '申请要求',
  `number` varchar(10) DEFAULT NULL COMMENT '人数说明',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请结束时间',
  `stype` varchar(10) DEFAULT '转账' COMMENT '奖金发放形式',
  `activition` tinyint(1) DEFAULT '0' COMMENT '是否可申请',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_student` */

DROP TABLE IF EXISTS `tb_student`;

CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `accname` char(13) DEFAULT '2012034643020' COMMENT '学生学号',
  `password` varchar(20) NOT NULL DEFAULT '00000000' COMMENT '学生密码，最少8个字符，最多20个字符',
  `name` varchar(8) DEFAULT NULL COMMENT '学生姓名',
  `gender` char(1) DEFAULT 'M' COMMENT '学生性别，F:女生，M:男生',
  `classId` int(11) DEFAULT NULL COMMENT '外键，班级外键',
  `politicsstatus` varchar(8) DEFAULT '群众' COMMENT '政治面貌',
  `nationality` varchar(8) DEFAULT '汉族' COMMENT '民族',
  `identification` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(40) DEFAULT NULL COMMENT '家庭地址',
  `ispoor` tinyint(1) DEFAULT '0' COMMENT '外键，是否是贫困生',
  `awardandpubish` text COMMENT '奖惩情况',
  PRIMARY KEY (`id`),
  KEY `班级` (`classId`),
  KEY `贫困等级` (`ispoor`),
  CONSTRAINT `班级` FOREIGN KEY (`classId`) REFERENCES `tb_class` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_student_poorgrade` */

DROP TABLE IF EXISTS `tb_student_poorgrade`;

CREATE TABLE `tb_student_poorgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生贫困生资料id',
  `stuid` int(11) DEFAULT NULL COMMENT '学生id',
  `homepeople` int(11) DEFAULT '1' COMMENT '家庭人数',
  `homeincome` double DEFAULT '1000' COMMENT '家庭年收入',
  `poorgrade` int(11) DEFAULT NULL COMMENT '外键，平困生等级',
  PRIMARY KEY (`id`),
  KEY `外键` (`poorgrade`),
  KEY `学号约束` (`stuid`),
  CONSTRAINT `外键` FOREIGN KEY (`poorgrade`) REFERENCES `tb_poorgrades` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `学号约束` FOREIGN KEY (`stuid`) REFERENCES `tb_student` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_sysuser` */

DROP TABLE IF EXISTS `tb_sysuser`;

CREATE TABLE `tb_sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `accname` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(20) NOT NULL DEFAULT '00000000' COMMENT '用户密码，最少8个字符，最多20个字符',
  `name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `permission` int(1) NOT NULL DEFAULT '0' COMMENT '用户权限：0：无权限，1:系统管理员，2：人事管理人员，3：贫困生管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_teacher` */
LOCK TABLES `tb_sysuser` WRITE;

insert  into `tb_sysuser`(`id`,`accname`,`password`,`name`,`permission`) values (1,'admin','00000000','王小五',1),(2,'renshi','00000000','人事',2),(3,'pinkun','00000000','贫困',3),(4,'zhuxue','00000000','助学',4);

UNLOCK TABLES;

DROP TABLE IF EXISTS `tb_teacher`;

CREATE TABLE `tb_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教职工id',
  `accname` varchar(8) DEFAULT '20120001' COMMENT '教职工账号',
  `password` varchar(20) NOT NULL DEFAULT '00000000' COMMENT '教职工密码，最少8个字符，最多20个字符',
  `name` varchar(8) DEFAULT NULL COMMENT '教职工姓名',
  `classid` int(11) DEFAULT '0' COMMENT '教职工所带班级，0：不带任何班级',
  `department` varchar(20) DEFAULT NULL COMMENT '部门名称',
  `position` varchar(20) DEFAULT NULL COMMENT '职位',
  `positiontitle` varchar(20) DEFAULT NULL COMMENT '职称',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
