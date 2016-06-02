/*
Navicat MySQL Data Transfer

Source Server         : pp
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ldms

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-05-31 06:06:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for device_type
-- ----------------------------
DROP TABLE IF EXISTS `device_type`;
CREATE TABLE `device_type` (
  `id` char(10) NOT NULL,
  `name` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_type
-- ----------------------------
INSERT INTO `device_type` VALUES ('03010564', '测距仪');
INSERT INTO `device_type` VALUES ('03040200', '大地测量仪器');
INSERT INTO `device_type` VALUES ('05010000', '计算机');
INSERT INTO `device_type` VALUES ('05020000', '广播电视设备');
INSERT INTO `device_type` VALUES ('05020700', '电视中心配套设备');
INSERT INTO `device_type` VALUES ('05031000', '卫星通信设备');
INSERT INTO `device_type` VALUES ('05031001', 'GPS接收仪');
