/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : localhost
 Source Database       : travel

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : utf-8

 Date: 04/06/2019 18:32:09 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL,
  `spotId` varchar(255) DEFAULT NULL,
  `comParentId` int(11) DEFAULT NULL,
  `comDesc` varchar(255) DEFAULT NULL,
  `comLike` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '0国内1出境3定制',
  `countryName` varchar(255) DEFAULT NULL,
  `outBound` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `country`
-- ----------------------------
BEGIN;
INSERT INTO `country` VALUES ('1', '中国', '0');
COMMIT;

-- ----------------------------
--  Table structure for `discount`
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountName` varchar(255) DEFAULT NULL,
  `discountRate` varchar(255) DEFAULT NULL,
  `useCondition` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` varchar(255) DEFAULT NULL,
  `menuUri` varchar(255) DEFAULT NULL,
  `menuThumbnail` varchar(255) DEFAULT NULL,
  `menuOrder` int(11) DEFAULT NULL,
  `isLeaf` int(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `menuName` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `state` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `menu`
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('1', '1001', 'user', 'fa-list-alt', '1', '0', '0', '用户管理', null, null, '有效'), ('2', '1002', 'spot', 'fa-dot-circle-o', '2', '0', '0', '景点管理', null, null, '有效'), ('3', '1003', 'order', 'fa-dot-circle-o', '3', '0', '0', '订单管理', null, null, '有效'), ('4', '1004', 'commont', 'fa-dot-circle-o', '4', '0', '0', '评论管理', null, null, '有效'), ('5', '100101', 'user.regUserManager', null, '1', '1', '1', '注册用户管理', null, null, '有效'), ('7', '100201', 'spot.addSpot', null, '1', '1', '2', '新增景点', null, null, '有效'), ('8', '100202', 'spot.editSpot', null, '2', '1', '2', '编辑景点', null, null, '有效'), ('9', '100301', 'order.payConfig', null, '1', '1', '3', '普通订单管理', null, null, '有效'), ('10', '100302', 'order.payConfig', null, '2', '1', '3', '团购订单管理', null, null, '有效'), ('11', '100401', 'commont.payConfig', null, '1', '1', '4', '景点评论', null, null, '有效'), ('12', '1005', 'menu', 'fa-dot-circle-o', '5', '0', '0', '菜单管理', null, null, '有效'), ('13', '100501', 'menu.menuConfig', null, '1', '1', '12', '菜单配置管理', null, null, '有效');
COMMIT;

-- ----------------------------
--  Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketId` int(255) DEFAULT NULL,
  `userId` int(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `orderStatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `spot`
-- ----------------------------
DROP TABLE IF EXISTS `spot`;
CREATE TABLE `spot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spotName` varchar(255) DEFAULT NULL,
  `cityId` int(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `spotImg` varbinary(255) DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `spotDesc` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ticket`
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spotId` int(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `isGroup` int(11) DEFAULT NULL,
  `groupName` varchar(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL COMMENT '人数',
  `startTime` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `ticketName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `nickName` varchar(25) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `idCard` varchar(25) DEFAULT NULL,
  `discountId` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', null, '12345', '123143', null, '2019-03-14 19:40:46', null, null, null, null, null, null, '有效'), ('2', null, '1231', '123213', null, '2019-03-14 21:54:13', null, null, null, null, null, null, '有效'), ('3', null, '324', 'er', null, '2019-03-14 21:58:48', null, null, null, null, null, null, '有效'), ('4', null, '9', '909', null, '2019-03-14 22:04:05', null, null, null, null, null, null, '有效'), ('5', null, '534', '234', null, '2019-03-14 22:29:20', null, null, null, null, null, null, '有效'), ('6', null, '6464', '6564645', null, '2019-03-16 10:50:41', null, null, null, null, null, null, null), ('7', null, '202cb962ac59075b964b07152d234b70', '32423435234', null, '2019-03-16 14:31:09', null, null, null, null, null, null, null), ('8', null, '202cb962ac59075b964b07152d234b70', '43425426543', null, '2019-03-16 14:32:39', null, null, null, null, null, null, null), ('9', null, '202cb962ac59075b964b07152d234b70', '42342342543', null, '2019-03-16 14:33:35', null, null, null, null, null, null, null), ('10', null, '202cb962ac59075b964b07152d234b70', '35324523626', null, '2019-03-16 14:34:15', null, null, null, null, null, null, null), ('11', null, '202cb962ac59075b964b07152d234b70', '53453453453', null, '2019-03-16 14:35:04', null, null, null, null, null, null, null), ('12', null, '202cb962ac59075b964b07152d234b70', '53453454645', null, '2019-03-16 14:50:15', null, null, null, null, null, null, null), ('13', null, 'e10adc3949ba59abbe56e057f20f883e', '12464565476', null, '2019-03-16 15:10:04', null, null, null, null, null, null, null), ('14', '张三', 'e10adc3949ba59abbe56e057f20f883e', '18888888888', null, '2019-03-16 16:31:49', '2019-03-23 12:27:48', '大帅哥', null, '{\"province\":\"内蒙古\",\"city\":\"通辽\",\"area\":\"奈曼旗\",\"detail\":\"hg\"}', '67899798', null, '有效'), ('15', null, 'e10adc3949ba59abbe56e057f20f883e', '12222222222', null, '2019-03-17 14:47:35', null, null, null, null, null, null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
