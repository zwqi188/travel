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

 Date: 03/24/2019 15:09:52 PM
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
  `realName` varchar(25) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `nickName` varchar(25) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `idCard` varchar(25) DEFAULT NULL,
  `discountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', null, '12345', null, '123143', null, '2019-03-14 19:40:46', null, null, null, null, null, null), ('2', null, '1231', null, '123213', null, '2019-03-14 21:54:13', null, null, null, null, null, null), ('3', null, '324', null, 'er', null, '2019-03-14 21:58:48', null, null, null, null, null, null), ('4', null, '9', null, '909', null, '2019-03-14 22:04:05', null, null, null, null, null, null), ('5', null, '534', null, '234', null, '2019-03-14 22:29:20', null, null, null, null, null, null), ('6', null, '6464', null, '6564645', null, '2019-03-16 10:50:41', null, null, null, null, null, null), ('7', null, '202cb962ac59075b964b07152d234b70', null, '32423435234', null, '2019-03-16 14:31:09', null, null, null, null, null, null), ('8', null, '202cb962ac59075b964b07152d234b70', null, '43425426543', null, '2019-03-16 14:32:39', null, null, null, null, null, null), ('9', null, '202cb962ac59075b964b07152d234b70', null, '42342342543', null, '2019-03-16 14:33:35', null, null, null, null, null, null), ('10', null, '202cb962ac59075b964b07152d234b70', null, '35324523626', null, '2019-03-16 14:34:15', null, null, null, null, null, null), ('11', null, '202cb962ac59075b964b07152d234b70', null, '53453453453', null, '2019-03-16 14:35:04', null, null, null, null, null, null), ('12', null, '202cb962ac59075b964b07152d234b70', null, '53453454645', null, '2019-03-16 14:50:15', null, null, null, null, null, null), ('13', null, 'e10adc3949ba59abbe56e057f20f883e', null, '12464565476', null, '2019-03-16 15:10:04', null, null, null, null, null, null), ('14', '张三', 'e10adc3949ba59abbe56e057f20f883e', null, '18888888888', null, '2019-03-16 16:31:49', '2019-03-23 12:27:48', '大帅哥', null, '{\"province\":\"内蒙古\",\"city\":\"通辽\",\"area\":\"奈曼旗\",\"detail\":\"hg\"}', '67899798', null), ('15', null, 'e10adc3949ba59abbe56e057f20f883e', null, '12222222222', null, '2019-03-17 14:47:35', null, null, null, null, null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `menu`
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('1', '1001', 'order', 'fa-list-alt', '1', '0', '0', '用户管理'), ('2', '1002', 'payInfo', 'fa-dot-circle-o', '2', '0', '0', '景点管理'), ('3', '1003', 'order2', 'fa-dot-circle-o', '3', '0', '0', '订单管理'), ('4', '1004', 'order2', 'fa-dot-circle-o', '4', '0', '0', '评论管理'), ('5', '100101', 'order.payment', null, '0', '1', '1', '订单支付情况查询'), ('6', '100102', 'order.paymentDetail', null, '1', '1', '1', '支付详情情况查询');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;