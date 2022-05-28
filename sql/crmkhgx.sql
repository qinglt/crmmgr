/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_6666
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:6666
 Source Schema         : crmkhgx

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 27/12/2021 09:00:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom`  (
  `customId` int NOT NULL AUTO_INCREMENT,
  `customName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customFrom` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customWork` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customLevel` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`customId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom
-- ----------------------------
INSERT INTO `custom` VALUES (2, 'q', 'q', 'q', '白银会员', '12345678910', '12345678', 'q', 'q');
INSERT INTO `custom` VALUES (4, 'zbl', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (5, 'fds', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (7, 'a', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (8, 'hxy', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (9, 'a', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (11, 'a', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (12, 'a', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (13, 'a', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (14, 'a', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (15, 'b', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'd');
INSERT INTO `custom` VALUES (16, 'xy', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'cd');
INSERT INTO `custom` VALUES (17, 'afsdf', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (18, 'xy', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'd');
INSERT INTO `custom` VALUES (19, 'xy', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (20, 'yy', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (21, 'a', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (22, 'a', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (23, 'a', 'a', 'a', '白银会员', '12345678910', '12345678', 'a', 'a');
INSERT INTO `custom` VALUES (24, 'b', 'b', 'b', '白银会员', '12345678910', '12345678', 'b', 'b');
INSERT INTO `custom` VALUES (25, 'c', 'c', 'c', '白银会员', '12345678910', '12345678', 'c', 'c');
INSERT INTO `custom` VALUES (26, 'q', 'q', 'q', '白银会员', '12345678910', '12345678', 'q', 'q');
INSERT INTO `custom` VALUES (27, 's', 's', 's', '白银会员', '12345678910', '12345678', 's', 's');

-- ----------------------------
-- Table structure for deal
-- ----------------------------
DROP TABLE IF EXISTS `deal`;
CREATE TABLE `deal`  (
  `dealId` int NOT NULL AUTO_INCREMENT,
  `dealName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dealCustom` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dealPeople` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dealAddress` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dealPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dealTime` datetime NULL DEFAULT NULL,
  `dealWorker` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dealStock` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dealNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dealDetail` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dealState` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`dealId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000018 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deal
-- ----------------------------
INSERT INTO `deal` VALUES (1, 'q', 'q', 'q', 'q', 'q', NULL, '10000001', '1', '50', 'q', NULL);
INSERT INTO `deal` VALUES (2, 'q', 'q', 'q', 'q', 'q', '2021-12-17 19:35:30', '10000001', '1', '100', 'q', '已出库');
INSERT INTO `deal` VALUES (3, 'q', 'q', 'q', 'wxcwp', '18796466678', '2021-12-17 19:37:36', '10000001', 'qq', '100', 'q', '已出库');
INSERT INTO `deal` VALUES (4, 'q', 'q', 'q', 'wxcwp', '18796466678', '2021-12-17 19:38:18', '10000001', 'qq', '100', 'q', '已出库');
INSERT INTO `deal` VALUES (5, 'w', 'w', 'w', 'wxcwp', '18796466678', '2021-12-17 19:38:31', '10000001', 'w', '100', 'w', '已出库');
INSERT INTO `deal` VALUES (6, 'q', 'q', 'q', 'q', 'q', NULL, 'q', '1', '20', NULL, NULL);
INSERT INTO `deal` VALUES (7, 'q', 'q', 'q', 'q', 'q', '2021-12-14 00:00:00', '10000001', 'q', '100', 'q', '已出库');
INSERT INTO `deal` VALUES (8, 'q', 'q', 'q', 'q', 'q', '2021-12-14 00:00:00', '10000001', 'q', '100', 'q', '已出库');
INSERT INTO `deal` VALUES (9, 'q', 'q', 'q', 'q', 'q', '2021-12-14 00:00:00', '10000001', 'q', '100', 'q', 'q');
INSERT INTO `deal` VALUES (10, 'q', 'q', 'q', 'q11', '12343', '2021-12-14 00:00:00', '10000001', 'q', '100', 'q', 'q');
INSERT INTO `deal` VALUES (11, 'q', 'q', 'q', 'q', 'q', '2021-12-14 00:00:00', '10000001', 'q', '100', 'q', 'q');
INSERT INTO `deal` VALUES (12, 'q', 'q', 'q', 'wxcwp', '18796466678', '2021-12-14 00:00:00', '10000001', 'q', '100', 'q', 'q');
INSERT INTO `deal` VALUES (13, 'q', 'q', 'q', 'q432', 'q', '2021-12-14 00:00:00', '10000001', 'q', '100', 'q', 'q');
INSERT INTO `deal` VALUES (14, 'q', 'q', 'q', 'q', 'q', '2021-12-14 00:00:00', '10000001', 'q', '100', 'q', '已出库');
INSERT INTO `deal` VALUES (15, 'q', 'q', 'q', 'q', 'q', '2021-12-17 16:03:58', '10000001', 'q', '100', 'q', '已出库');
INSERT INTO `deal` VALUES (16, 'q', 'q', 'q', 'q', 'q', '2021-12-17 16:08:32', '10000001', 'q', '100', 'q', '已出库');
INSERT INTO `deal` VALUES (17, 'q', 'q', 'q', 'q', 'q', '2021-12-19 22:03:21', 'q', '1', '1', 'q', 'q');
INSERT INTO `deal` VALUES (18, 'q', 'q', 'qq', 'q11', '123456', '2021-12-19 22:14:13', '10000001', '1', '1', 'q', '未出库');
INSERT INTO `deal` VALUES (19, 'q', 'q', 'q', 'q', 'q', '2021-12-20 10:10:07', 'q', '1', '1', 'q', 'q');
INSERT INTO `deal` VALUES (10000016, 'qw', NULL, NULL, NULL, NULL, '2021-12-21 10:25:25', '10000002', NULL, NULL, NULL, NULL);
INSERT INTO `deal` VALUES (10000017, NULL, NULL, NULL, NULL, NULL, '2021-12-21 10:25:42', '10000002', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gly
-- ----------------------------
DROP TABLE IF EXISTS `gly`;
CREATE TABLE `gly`  (
  `glyId` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`glyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gly
-- ----------------------------
INSERT INTO `gly` VALUES (0001, '1912011082', '123456');
INSERT INTO `gly` VALUES (0002, '1912011085', '123456');

-- ----------------------------
-- Table structure for inform
-- ----------------------------
DROP TABLE IF EXISTS `inform`;
CREATE TABLE `inform`  (
  `informId` int NOT NULL AUTO_INCREMENT,
  `informTitle` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `informDetail` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `informTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`informId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inform
-- ----------------------------
INSERT INTO `inform` VALUES (1, 'q', '1、稳定性：系统会更新增加功能，不断修复 bug，使系统更加稳定', '2021-12-20 10:01:00');
INSERT INTO `inform` VALUES (2, 'q', 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', '2021-12-20 10:41:58');
INSERT INTO `inform` VALUES (3, 'qb', 'q', '2021-12-20 10:49:29');
INSERT INTO `inform` VALUES (4, 'qb', 'q', '2021-12-20 10:49:35');
INSERT INTO `inform` VALUES (5, 'b', 'q', '2021-12-20 10:49:40');
INSERT INTO `inform` VALUES (6, 'qq', 'q', '2021-12-20 10:50:05');
INSERT INTO `inform` VALUES (7, 'qq', 'q', '2021-12-20 10:50:05');
INSERT INTO `inform` VALUES (8, 'qq', 'q', '2021-12-20 10:50:05');
INSERT INTO `inform` VALUES (9, 'qq', 'q', '2021-12-20 10:50:05');
INSERT INTO `inform` VALUES (11, 'qq', 'q', '2021-12-20 10:50:05');
INSERT INTO `inform` VALUES (12, 'qq', 'q', '2021-12-20 10:50:05');

-- ----------------------------
-- Table structure for massage
-- ----------------------------
DROP TABLE IF EXISTS `massage`;
CREATE TABLE `massage`  (
  `msgId` int NOT NULL AUTO_INCREMENT,
  `msgWorker` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `msgDetail` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `msgTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`msgId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of massage
-- ----------------------------
INSERT INTO `massage` VALUES (1, 'w', 'wwwwwwwwwww', '2021-12-20 13:57:44');
INSERT INTO `massage` VALUES (2, 'e', 'eeeeeeeeeeee', '2021-12-20 13:57:55');
INSERT INTO `massage` VALUES (3, 'r', 'rrrrrrrrrrrrrrr', '2021-12-20 13:58:04');
INSERT INTO `massage` VALUES (4, 'tt', 'ttttttttttttttttt', '2021-12-20 13:58:14');
INSERT INTO `massage` VALUES (5, '10000001', NULL, '2021-12-20 14:52:05');
INSERT INTO `massage` VALUES (6, '10000001', NULL, '2021-12-20 14:52:14');
INSERT INTO `massage` VALUES (7, '10000001', NULL, '2021-12-20 14:53:27');
INSERT INTO `massage` VALUES (8, '10000001', '1111', '2021-12-20 14:54:32');
INSERT INTO `massage` VALUES (9, 'r', 'rrr', '2021-12-20 15:00:06');
INSERT INTO `massage` VALUES (10, 'u', 'uuuuuuu', '2021-12-20 15:01:46');
INSERT INTO `massage` VALUES (11, 'i', 'iiiiiiiiii', '2021-12-20 15:02:10');
INSERT INTO `massage` VALUES (12, 'p', 'pppppppp', '2021-12-20 15:04:43');
INSERT INTO `massage` VALUES (16, '10000001张炳玲', '哇哇哇哇哇', '2021-12-20 15:44:24');
INSERT INTO `massage` VALUES (17, '10000005云', '嘿嘿', '2021-12-21 16:19:27');
INSERT INTO `massage` VALUES (18, '10000006情', '1111', '2021-12-21 16:22:21');

-- ----------------------------
-- Table structure for out
-- ----------------------------
DROP TABLE IF EXISTS `out`;
CREATE TABLE `out`  (
  `outId` int NULL DEFAULT NULL,
  `outTitle` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `outcustomId` int NULL DEFAULT NULL,
  `outName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `outAddress` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `outPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of out
-- ----------------------------

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `stockId` int NOT NULL AUTO_INCREMENT,
  `stockUnit` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `stockName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `stockPrice` int NULL DEFAULT NULL,
  `stockOut` int NULL DEFAULT NULL,
  `stockLeft` int NULL DEFAULT NULL,
  PRIMARY KEY (`stockId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES (1, '箱', '雪碧', 100, 173, 779);
INSERT INTO `stock` VALUES (2, '箱', '可乐', 100, 100, 1000);
INSERT INTO `stock` VALUES (3, '箱', '农夫山泉', 40, 100, 1000);
INSERT INTO `stock` VALUES (4, '箱', '芬达', 100, 100, 1000);
INSERT INTO `stock` VALUES (5, 'kg', '时代的', 123, 123, 1234);
INSERT INTO `stock` VALUES (6, 'kg', 'dasada', 1232, 0, 2143);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11111', '11111');

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker`  (
  `workerId` int NOT NULL AUTO_INCREMENT,
  `workerName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `workerPwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `workerPost` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `workerPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `workerAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `workerHand` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'default.png',
  PRIMARY KEY (`workerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000007 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of worker
-- ----------------------------
INSERT INTO `worker` VALUES (10000001, '张炳玲', '111111', '推销员', '12345678910', '南京玄武', '5w2T0.jpg');
INSERT INTO `worker` VALUES (10000003, 'w', 'w', 'w', 'w', 'w', 'default.png');
INSERT INTO `worker` VALUES (10000004, 'r', 'r', 'r', 'r', 'r', 'default.png');
INSERT INTO `worker` VALUES (10000005, '云', '123456', '推销员', '1234567890', '金科', 'default.png');
INSERT INTO `worker` VALUES (10000006, '情', '123456', NULL, NULL, NULL, 'default.png');

-- ----------------------------
-- Triggers structure for table deal
-- ----------------------------
DROP TRIGGER IF EXISTS `update_stockOut`;
delimiter ;;
CREATE TRIGGER `update_stockOut` AFTER INSERT ON `deal` FOR EACH ROW BEGIN
UPDATE stock set stockOut = stockOut + new.dealNumber WHERE stockId = new.dealStock;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table deal
-- ----------------------------
DROP TRIGGER IF EXISTS `update_stockLeft`;
delimiter ;;
CREATE TRIGGER `update_stockLeft` AFTER INSERT ON `deal` FOR EACH ROW BEGIN
UPDATE stock set stockLeft = stockLeft - new.dealNumber where stockId = new.dealStock;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
