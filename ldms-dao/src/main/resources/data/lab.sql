/*
Navicat MySQL Data Transfer

Source Server         : pp
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ldms

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-05-31 06:06:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab` (
  `id` char(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `open_way` char(50) DEFAULT '预约开放',
  `manager` char(20) DEFAULT NULL,
  `use_way` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES ('L01', '测绘工程实验室', '246', '预约开放', '张纫兰', '面向全校的测量学专业实习');
INSERT INTO `lab` VALUES ('L02', '摄影测量实验室', '88', '预约开放', '张纫兰', '摄影测量教学实习');
INSERT INTO `lab` VALUES ('L03', '地理信息系统综合实验室', '50', '预约开放', '杨乃', '专业课程实习：GIS 软件工程等；客座教授讲座。');
INSERT INTO `lab` VALUES ('L04', '遥感数据采集与处理实验室', '32', '预约开放', '王红平', '专业课程实习：遥感软件与仪器使用、遥感原理与应用、遥感图像处理等');
INSERT INTO `lab` VALUES ('L05', '信息工程专业实验室', '33', '预约开放', '徐战亚', '专业课程实习：智能终端软件开发、导航定位原理等。');
INSERT INTO `lab` VALUES ('L06', '软件工程专业实验室', '96', '预约开放', '乐源', '专业课程实习：嵌入式系统、软件工程综合实习等；每年地信、遥感专业研究生复试机考、低年级学生 C++课外辅导、专业学生大创、毕业设计实习使用。');
