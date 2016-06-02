/*
Navicat MySQL Data Transfer

Source Server         : pp
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ldms

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-05-31 06:06:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(10) NOT NULL,
  `lab_id` char(10) DEFAULT NULL,
  `tea_id` char(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `left_capacity` int(11) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `state` smallint(6) NOT NULL,
  `credit` float NOT NULL,
  `submit_time` date NOT NULL,
  `pass_time` date NOT NULL,
  `devices` varchar(200) DEFAULT NULL,
  `files` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `FK_L_P` (`lab_id`),
  KEY `FK_P_T` (`tea_id`),
  CONSTRAINT `FK_L_P` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`),
  CONSTRAINT `FK_P_T` FOREIGN KEY (`tea_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('P1605001', 'L01', '050003', '测绘实习', '2016-05-03', '2016-05-05', '5', '50', '1', '3.5', '2016-04-04', '2016-04-14', null, null, null);
INSERT INTO `project` VALUES ('P1605002', 'L02', '050004', '摄影测量实习', '2016-05-01', '2016-05-28', '60', '60', '1', '1.5', '2016-04-05', '2016-04-29', null, null, null);
INSERT INTO `project` VALUES ('P1605004', 'L04', '050003', '遥感实习', '2016-05-13', '2016-06-04', '30', '30', '1', '3', '2016-02-04', '2016-05-01', null, null, null);
INSERT INTO `project` VALUES ('P1605005', 'L05', '050006', '信工实习', '2016-04-28', '2016-05-22', '100', '100', '0', '2.5', '2016-03-08', '2016-04-07', null, null, null);
INSERT INTO `project` VALUES ('P1605006', 'L05', '050003', '信工实习', '2016-05-18', '2016-05-31', '49', '100', '0', '0', '2016-05-03', '2016-05-11', null, null, null);
