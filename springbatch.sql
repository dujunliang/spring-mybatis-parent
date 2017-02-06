/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : springbatch

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-02-06 18:30:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `permission_info`
-- ----------------------------
DROP TABLE IF EXISTS `permission_info`;
CREATE TABLE `permission_info` (
  `PERMISS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERMISS_NAME` varchar(20) NOT NULL,
  `PERMISS_TYPE` varchar(20) NOT NULL,
  `PERMISS_VAL` varchar(100) NOT NULL,
  `PERMISS_OWN_ID` varchar(20) NOT NULL,
  `PERMISS_SUPER_ID` varchar(20) NOT NULL,
  `PERMISS_SUPER_VAL` varchar(20) DEFAULT NULL,
  `IS_VALID` char(1) NOT NULL,
  `CREATE_DATE` varchar(20) DEFAULT NULL,
  `CREATE_USER` varchar(20) DEFAULT NULL,
  `LATEST_OP_DATE` varchar(20) DEFAULT NULL,
  `LATEST_OP_USER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PERMISS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission_info
-- ----------------------------
INSERT INTO `permission_info` VALUES ('1', '用户管理－新增', 'FUNCTION', 'user/add', '102', '100', '用户管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('2', '用户管理', 'MENU', 'user/userload.do', '100', '000', '系统管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('3', '权限管理', 'MENU', 'permiss/permissload.do', '200', '000', '系统管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('4', '用户管理－更新', 'FUNCTION', 'user/update', '101', '100', '用户管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('5', '权限管理－更新', 'FUNCTION', 'permiss/update', '201', '200', '权限管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('6', '权限管理－新增', 'FUNCTION', 'permiss/add', '202', '200', '权限管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('7', '用户管理－删除', 'FUNCTION', 'user/delete', '103', '100', '用户管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('8', '用户管理－搜索', 'FUNCTION', 'user/search', '104', '100', '用户管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('9', '用户管理－打印', 'FUNCTION', 'user/print', '105', '100', '用户管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('10', '权限管理－删除', 'FUNCTION', 'permiss/delete', '203', '200', '权限管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('11', '权限管理－搜索', 'FUNCTION', 'permiss/search', '204', '200', '权限管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('12', '角色管理', 'MENU', 'roles/rolesload.do', '300', '000', '系统管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('13', '角色管理－更新', 'FUNCTION', 'roles/update', '301', '300', '角色管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('14', '角色管理－新增', 'FUNCTION', 'roles/add', '302', '300', '角色管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('15', '角色管理－删除', 'FUNCTION', 'roles/delete', '303', '300', '角色管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('16', '角色管理－搜索', 'FUNCTION', 'roles/serch', '304', '300', '角色管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('21', '系统管理', 'MENU', 'admin/click', '000', '', 'ROOT', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('45', '用户管理－角色分配', 'FUNCTION', 'user/roledist', '108', '100', '用户管理', 'A', null, null, null, null);
INSERT INTO `permission_info` VALUES ('46', '角色管理－权限分配', 'FUNCTION', 'roles/permissdist', '205', '300', '角色管理', 'A', null, null, null, null);

-- ----------------------------
-- Table structure for `role_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `ROLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLENAME` varchar(20) NOT NULL,
  `IS_VALID` char(1) NOT NULL,
  `CREATE_USER` varchar(20) DEFAULT NULL,
  `CREATE_DATA` varchar(20) DEFAULT NULL,
  `LATEST_OP_DATE` varchar(20) DEFAULT NULL,
  `LATEST_OP_USER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '系统管理员', 'A', null, null, null, null);
INSERT INTO `role_info` VALUES ('2', '操作员', 'A', null, null, null, null);

-- ----------------------------
-- Table structure for `role_permiss_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_permiss_info`;
CREATE TABLE `role_permiss_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLEID` varchar(20) NOT NULL,
  `PERMISS_ID` varchar(20) NOT NULL,
  `IS_VALID` char(1) NOT NULL,
  `CREATE_USER` varchar(20) DEFAULT NULL,
  `CREATE_DATA` varchar(20) DEFAULT NULL,
  `LATEST_OP_DATE` varchar(20) DEFAULT NULL,
  `LATEST_OP_USER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permiss_info
-- ----------------------------
INSERT INTO `role_permiss_info` VALUES ('34', '2', '000', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('35', '2', '100', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('36', '2', '102', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('37', '2', '101', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('38', '2', '103', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('39', '2', '104', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('40', '2', '105', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('41', '2', '107', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('67', '1', '000', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('68', '1', '100', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('69', '1', '102', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('70', '1', '101', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('71', '1', '103', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('72', '1', '104', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('73', '1', '105', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('74', '1', '108', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('75', '1', '200', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('76', '1', '201', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('77', '1', '202', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('78', '1', '203', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('79', '1', '204', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('80', '1', '300', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('81', '1', '301', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('82', '1', '302', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('83', '1', '303', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('84', '1', '304', 'A', null, null, null, null);
INSERT INTO `role_permiss_info` VALUES ('85', '1', '205', 'A', null, null, null, null);

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `CREATE_USER` varchar(20) DEFAULT NULL,
  `CREATE_DATA` varchar(20) DEFAULT NULL,
  `IS_VALID` char(1) NOT NULL,
  `LATEST_OP_DATE` varchar(20) DEFAULT NULL,
  `LATEST_OP_USER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('2', 'Gavins', '123456', '739822714@qq.com', null, null, 'A', null, null);
INSERT INTO `user_info` VALUES ('3', 'Jasons', '123456', '739822714@qq.com', null, null, 'A', null, null);
INSERT INTO `user_info` VALUES ('5', 'Hanss', '123456', '739822714@qq.com', null, null, 'A', null, null);

-- ----------------------------
-- Table structure for `user_role_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_role_info`;
CREATE TABLE `user_role_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLEID` varchar(20) NOT NULL,
  `USERID` varchar(20) NOT NULL,
  `IS_VALID` char(1) NOT NULL,
  `CREATE_USER` varchar(20) DEFAULT NULL,
  `CREATE_DATA` varchar(20) DEFAULT NULL,
  `LATEST_OP_DATE` varchar(20) DEFAULT NULL,
  `LATEST_OP_USER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role_info
-- ----------------------------
INSERT INTO `user_role_info` VALUES ('1', '1', '5', 'A', null, null, null, null);
INSERT INTO `user_role_info` VALUES ('2', '2', '5', 'A', null, null, null, null);
INSERT INTO `user_role_info` VALUES ('4', '1', '2', 'A', null, null, null, null);
INSERT INTO `user_role_info` VALUES ('5', '2', '2', 'A', null, null, null, null);
