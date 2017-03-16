/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : jxnuoj

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2017-03-15 11:35:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for black_user
-- ----------------------------
DROP TABLE IF EXISTS `black_user`;
CREATE TABLE `black_user` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) CHARACTER SET utf8 NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of black_user
-- ----------------------------

-- ----------------------------
-- Table structure for contest_list
-- ----------------------------
DROP TABLE IF EXISTS `contest_list`;
CREATE TABLE `contest_list` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 NOT NULL,
  `status` varchar(100) CHARACTER SET utf8 NOT NULL,
  `anthor` varchar(100) CHARACTER SET utf8 NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of contest_list
-- ----------------------------

-- ----------------------------
-- Table structure for contest_problem
-- ----------------------------
DROP TABLE IF EXISTS `contest_problem`;
CREATE TABLE `contest_problem` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `contest_list_id` int(5) NOT NULL,
  `title` text NOT NULL,
  `time_limit` int(7) NOT NULL DEFAULT '1000',
  `memory_limit` int(7) NOT NULL DEFAULT '32768',
  `submissions` int(7) NOT NULL DEFAULT '0',
  `accepted` int(7) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `input` text NOT NULL,
  `output` text NOT NULL,
  `sample_input` text NOT NULL,
  `sample_output` text NOT NULL,
  `author` text NOT NULL,
  `source` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `contest_problem_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contest_problem
-- ----------------------------

-- ----------------------------
-- Table structure for contest_user_problem
-- ----------------------------
DROP TABLE IF EXISTS `contest_user_problem`;
CREATE TABLE `contest_user_problem` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `contest_user_id` int(6) NOT NULL,
  `contest_list_id` int(11) NOT NULL,
  `contest_problem_id` int(6) NOT NULL,
  `submit_time` int(11) NOT NULL,
  `judge_status` int(1) NOT NULL,
  `exe_time` varchar(6) NOT NULL DEFAULT '0',
  `exe_memory` varchar(6) NOT NULL,
  `code_len` int(6) NOT NULL,
  `language` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `filepath` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contest_user_problem
-- ----------------------------

-- ----------------------------
-- Table structure for label_info
-- ----------------------------
DROP TABLE IF EXISTS `label_info`;
CREATE TABLE `label_info` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `label_name` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label_info
-- ----------------------------
INSERT INTO `label_info` VALUES ('51', '水题', '0');
INSERT INTO `label_info` VALUES ('52', '数论', '0');

-- ----------------------------
-- Table structure for login_msg
-- ----------------------------
DROP TABLE IF EXISTS `login_msg`;
CREATE TABLE `login_msg` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) NOT NULL,
  `login_time` int(12) NOT NULL,
  `status` varchar(100) NOT NULL,
  `area` varchar(100) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_msg
-- ----------------------------
INSERT INTO `login_msg` VALUES ('89', '0.0.0.0', '1489545569', '退出成功', 'IANA保留地址CZ88.NET', 'wuying', '');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `time_limit` int(7) NOT NULL DEFAULT '1000',
  `memory_limit` int(7) NOT NULL DEFAULT '32768',
  `submissions` int(7) NOT NULL DEFAULT '0',
  `accepted` int(7) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `input` text NOT NULL,
  `output` text NOT NULL,
  `sample_input` text NOT NULL,
  `sample_output` text NOT NULL,
  `author` text NOT NULL,
  `source` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES ('1000', 'A+B', '1000', '32768', '0', '0', '给出两个整数A,B。计算A+B。', '有多组测试数据。\r\n每组数据包括两个整数A,B。(0&lt;A,B&lt;100)。', '对于每组测试数据，输出A+B的结果。每个结果占一行。', '1 2\r\n3 4\r\n5 6', '3\r\n7\r\n11', 'wuying', 'wuying', '1');
INSERT INTO `problem` VALUES ('1001', '后a位数', '1000', '32768', '0', '0', '输入两个整数，输出x^y的后a位数。\r\n', '第一行是一个整数t表示有t组测试数据。\r\n每组测试数据包含3个正整数x,y,a。(1&lt;=x&lt;=10^10000，1&lt;=y&lt;=10^9,1&lt;=a&lt;=9)。', '输出x^y的后a位数,每个结果占一行。', '2\r\n2 1 1\r\n1 1000000000 9', '2\r\n000000001', '吴迎', '吴迎', '1');

-- ----------------------------
-- Table structure for problem_label
-- ----------------------------
DROP TABLE IF EXISTS `problem_label`;
CREATE TABLE `problem_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of problem_label
-- ----------------------------
INSERT INTO `problem_label` VALUES ('41', '1', '51');
INSERT INTO `problem_label` VALUES ('42', '1001', '52');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2',
  `root` int(1) NOT NULL DEFAULT '0',
  `accepted` int(10) NOT NULL DEFAULT '0',
  `submissions` int(10) NOT NULL DEFAULT '0',
  `solve_problem` int(10) NOT NULL DEFAULT '0',
  `school` varchar(30) NOT NULL DEFAULT '0',
  `Submitted_problem` int(10) NOT NULL,
  `motto` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `major` varchar(30) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `register_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wuying', 'wuying', '1', '0', '0', '0', '0', '0', '0', '不想说话', '529194793@qq.com', '吴迎', '物联网', '吴迎', '0');
INSERT INTO `user` VALUES ('9', 'admin', 'acmadmin', '1', '0', '0', '0', '0', '江西师范大学', '0', '', '738949377@qq.com', '吴迎', '', '管理员', '1489548395');

-- ----------------------------
-- Table structure for user_problem
-- ----------------------------
DROP TABLE IF EXISTS `user_problem`;
CREATE TABLE `user_problem` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NOT NULL,
  `problem_id` int(6) NOT NULL,
  `submit_time` int(11) NOT NULL,
  `judge_status` int(1) NOT NULL,
  `exe_time` int(6) NOT NULL DEFAULT '0',
  `exe_memory` int(6) NOT NULL,
  `code_len` int(6) NOT NULL,
  `language` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `filepath` varchar(30) NOT NULL,
  `judge_results` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2563 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_problem
-- ----------------------------
