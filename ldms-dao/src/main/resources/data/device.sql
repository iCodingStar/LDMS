/*
Navicat MySQL Data Transfer

Source Server         : pp
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ldms

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-05-31 06:06:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` char(10) NOT NULL,
  `lab_id` char(10) DEFAULT NULL,
  `tea_id` char(10) DEFAULT NULL,
  `devtype_id` char(10) DEFAULT NULL,
  `sub_id` char(20) DEFAULT NULL,
  `name` char(50) DEFAULT NULL,
  `english_name` char(50) DEFAULT NULL,
  `model_id` char(30) DEFAULT NULL,
  `brand` char(50) DEFAULT NULL,
  `purchase_time` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `amount_used` int(11) DEFAULT '0',
  `per_price` float DEFAULT NULL,
  `sum_price` float DEFAULT NULL,
  `price_type` char(20) DEFAULT NULL,
  `bill` char(30) DEFAULT NULL,
  `unit_of_measurement` char(10) DEFAULT NULL,
  `fund_from` char(30) DEFAULT NULL,
  `property_from` char(30) DEFAULT NULL,
  `account_type` char(10) DEFAULT NULL,
  `purchase_type` char(30) DEFAULT NULL,
  `ps` text,
  PRIMARY KEY (`id`),
  KEY `FK_D_D_T` (`devtype_id`),
  KEY `FK_D_L` (`lab_id`),
  KEY `FK_D_S` (`sub_id`),
  KEY `FK_D_T` (`tea_id`),
  CONSTRAINT `FK_D_D_T` FOREIGN KEY (`devtype_id`) REFERENCES `device_type` (`id`),
  CONSTRAINT `FK_D_L` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`),
  CONSTRAINT `FK_D_S` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FK_D_T` FOREIGN KEY (`tea_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('D002', 'L01', '050002', '05031000', 'sub004', 'GPS 接收机', 'gps receiver', 'R6', '美国天宝公司', '2015-05-19', '2', '0', '2000', '4000', '原值', '14.01.06#0815', '台', '外部单位采购', '纵向项目经费', '记入', '中央政府采购协议供货', null);
INSERT INTO `device` VALUES ('D003', 'L01', '050004', '03040200', 'sub003', '全站仪', 'total station', 'SET230RK', '日本索佳公司', '2015-05-19', '3', '0', '3000', '9000', '原值', '14.01.06#0816', '台', '外部单位采购', '校级项目经费', '记入', '中央政府采购协议供货', null);
INSERT INTO `device` VALUES ('D004', 'L01', '050005', '03040200', 'sub003', '全站仪', 'total station', 'TCA2003', '瑞士徕卡测量系统公司', '2015-05-19', '2', '0', '4000', '8000', '原值', '14.01.06#0817', '台', '外部单位采购', '横向项目经费', '记入', '中央政府采购协议供货', null);
INSERT INTO `device` VALUES ('D005', 'L01', '050006', '03040200', 'sub003', '全站仪', 'total station', 'DTM－352L', '日本尼康公司', '2015-05-19', '1', '0', '5000', '5000', '原值', '16.05.26#0818', '台', '外部单位采购', '横向项目经费', '记入', '中央政府采购协议供货', null);
INSERT INTO `device` VALUES ('D006', 'L01', '050004', '03040200', 'sub003', '全站仪', '', 'DTM-350', '日本尼康公司', '2015-05-19', '1', '0', '2000', '2000', '原值', '16.05.26#0819', '台', '外部单位采购', '纵向项目经费', '记入', '中央政府采购协议供货', '');
INSERT INTO `device` VALUES ('D007', 'L01', '050002', '03040200', 'sub003', '全站仪', '', 'TC305', '瑞士徕卡公司', '2015-05-20', '1', '1', '2000', '2000', '原值', '16.05.26#0820', '台', '外部单位采购', '纵向项目经费', '记入', '中央政府采购协议供货', '');
INSERT INTO `device` VALUES ('D008', 'L01', '050003', '05031001', 'sub006', 'GPS 接收机', 'GPS receiver', 'Trimble 4700', '美国 Trimble 公司', '2015-05-21', '1', '1', '2000', '2000', '原值', '16.05.26#0821', '台', '外部单位采购', '纵向项目经费', '记入', '中央政府采购协议供货', '');
INSERT INTO `device` VALUES ('D009', 'L01', '050004', '05031001', 'sub003', '国产 GNSS', '', 'H32 GNSS RTK', '广州市中海达测绘仪器有限公司', '2015-05-22', '18', '4', '2000', '36000', '原值', '16.05.26#0822', '台', '外部单位采购', '纵向项目经费', '记入', '中央政府采购协议供货', '');
INSERT INTO `device` VALUES ('D010', 'L01', '050005', '05031001', 'sub003', '手持 GPS', '', 'Qmini AI', '广州市中海达测绘仪器有限公司', '2015-05-23', '60', '4', '2000', '120000', '原值', '16.05.26#0823', '台', '外部单位采购', '纵向项目经费', '记入', '中央政府采购协议供货', '');
INSERT INTO `device` VALUES ('D011', 'L01', '050006', '03010564', 'sub003', '手持测距仪', 'rangefinders with handles', 'BOSCH GLM 150', '广州市中海达测绘仪器有限公司', '2015-05-24', '10', '2', '2000', '20000', '原值', '16.05.26#0824', '台', '外部单位采购', '纵向项目经费', '记入', '中央政府采购协议供货', '');
