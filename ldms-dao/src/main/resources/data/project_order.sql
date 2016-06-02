/*
Navicat MySQL Data Transfer

Source Server         : pp
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ldms

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-05-31 06:07:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for project_order
-- ----------------------------
DROP TABLE IF EXISTS `project_order`;
CREATE TABLE `project_order` (
  `id` char(10) NOT NULL,
  `pro_id` varchar(10) DEFAULT NULL,
  `stu_id` varchar(11) DEFAULT NULL,
  `score` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_O_S` (`stu_id`),
  KEY `FK_P_O` (`pro_id`),
  CONSTRAINT `FK_O_S` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FK_P_O` FOREIGN KEY (`pro_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_order
-- ----------------------------
INSERT INTO `project_order` VALUES ('PO00001', 'P1605001', '20131000003', '0');
INSERT INTO `project_order` VALUES ('PO00002', 'P1605002', '20131000002', '80');
INSERT INTO `project_order` VALUES ('PO00003', 'P1605002', '20131000003', '88');
INSERT INTO `project_order` VALUES ('PO00004', 'P1605002', '20131000004', '70');
INSERT INTO `project_order` VALUES ('PO00005', 'P1605002', '20131000005', '89');
INSERT INTO `project_order` VALUES ('PO00006', 'P1605004', '20131000006', '67');
INSERT INTO `project_order` VALUES ('PO00007', 'P1605004', '20131000007', '86');
INSERT INTO `project_order` VALUES ('PO00008', 'P1605005', '20131000008', '99');
INSERT INTO `project_order` VALUES ('PO00009', 'P1605006', '20131000009', '85');
INSERT INTO `project_order` VALUES ('PO00010', 'P1605004', '20131000010', '97');
