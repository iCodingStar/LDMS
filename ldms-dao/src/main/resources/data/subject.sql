/*
Navicat MySQL Data Transfer

Source Server         : pp
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ldms

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-05-31 06:07:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` char(20) NOT NULL,
  `name` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('sub001', '计算机');
INSERT INTO `subject` VALUES ('sub002', '软件工程');
INSERT INTO `subject` VALUES ('sub003', '测绘');
INSERT INTO `subject` VALUES ('sub004', '遥感');
INSERT INTO `subject` VALUES ('sub005', '信工');
INSERT INTO `subject` VALUES ('sub006', '地信');
