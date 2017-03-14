/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : jxnuoj

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2017-03-09 17:29:16
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of black_user
-- ----------------------------
INSERT INTO `black_user` VALUES ('1', '127.0.0', '1');
INSERT INTO `black_user` VALUES ('2', '127.0.0', '1');
INSERT INTO `black_user` VALUES ('3', '127.0.0', '1');
INSERT INTO `black_user` VALUES ('4', '127.0.0', '1');
INSERT INTO `black_user` VALUES ('5', '127.0.0', '1');
INSERT INTO `black_user` VALUES ('6', '127.0.0', '1');
INSERT INTO `black_user` VALUES ('7', '127.0.0', '1');
INSERT INTO `black_user` VALUES ('8', '127.0.0', '1');

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
INSERT INTO `contest_list` VALUES ('1', '第一场比赛', '1460440747', '1460445888', '密码', '正在比赛', '吴迎', 'wuying');
INSERT INTO `contest_list` VALUES ('2', '第二场比赛', '1460440999', '1460495111', '公开', '等待', '吴迎', null);

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
INSERT INTO `contest_problem` VALUES ('1', '1', '素数判定', '1000', '32768', '3', '0', '质数（prime number）又称素数，有无限个。一个大于1的自然数，除了1和它本身外，不能被其他自然数整除（除0以外）的数称之为素数（质数）；否则称为合数。\r\n在本题中，给定一个数n（-10000&lt;=n&lt;=10000），要求判断其是否为素数（0,1，负数都是非素数）。				', '测试数据有多组，每组输入一个数n。				', '对于每组输入,若是素数则输出yes，否则输入no。				', '-1\r\n13				', 'no\r\nyes				', '丁钦颖', '2014JXNU新生赛', '1', '1002');
INSERT INTO `contest_problem` VALUES ('2', '2', '绝对值排序', '1000', '32768', '5', '0', '输入n(n&lt;=100)个整数，按照绝对值从大到小排序后输出。题目保证对于每一个测试实例，所有的数的绝对值都不相等。				', '输入数据有多组，每组占一行，每行的第一个数字为n,接着是n个整数，n=0表示输入数据的结束，不做处理。				', '对于每个测试实例，输出排序后的结果，两个数之间用一个空格隔开。每个测试实例占一行。				', '3 3 -4 2\r\n4 0 1 2 -3\r\n0				', '-4 3 2\r\n-3 2 1 0				', '吴迎', '2014JXNU新生赛', '1', '1003');
INSERT INTO `contest_problem` VALUES ('3', '2', 'A变B', '1000', '32768', '1', '0', '给定两个正整数A,B（十进制）（0&lt;A,B&lt;2^31），把A，B转成二进制数表示后，问把A变成B至少需要改变多少位？\r\n例如：A=3，B=6，则A,B对应的二进制数分别是011,110，显然，把A的二进制变成B的二进制至少需要改变两位。				', '输入两个正整数A,B（0&lt;A,B&lt;2^31），输入有多组数据。				', '输出把A变成B至少需要改变多少位，每个数占一行。			', '3 6\r\n1 14				', '2\r\n4				', '吴迎', '2014JXNU新生赛', '1', '1004');
INSERT INTO `contest_problem` VALUES ('4', '1', 'A+B', '1000', '32768', '2', '0', '输入两个整数A,B(0&lt;=A,B&lt;=1000)。\r\n求A+B.				', '输入有多组数据。\r\n每组数组包括一行，每行有两个整数A,B，以空格隔开。				', '输出A+B的结果。\r\n每个结果占一行。				', '1 2\r\n3 4\r\n				', '3\r\n7\r\n				', '吴迎', '', '1', '1001');

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
INSERT INTO `contest_user_problem` VALUES ('1', '1', '1', '1001', '1460451795', '1', '14', '', '0', 'C++', 'wuying', 'code/wuying/1000_1.cpp');
INSERT INTO `contest_user_problem` VALUES ('2', '1', '1', '1000', '1460451803', '0', '13', '', '0', 'C++', 'wuying', 'code/wuying/1000_2.cpp');
INSERT INTO `contest_user_problem` VALUES ('3', '1', '1', '1000', '1460451814', '1', '9', '', '0', 'C++', 'wuying', 'code/wuying/1001_1.cpp');
INSERT INTO `contest_user_problem` VALUES ('4', '1', '1', '1002', '1460451825', '1', '10', '', '0', 'C++', 'wuying', 'code/wuying/1002_1.cpp');
INSERT INTO `contest_user_problem` VALUES ('5', '2', '1', '1003', '1460451803', '1', '13', '', '0', 'C++', 'wuying', 'code/wuying/1000_2.cpp');
INSERT INTO `contest_user_problem` VALUES ('6', '1', '1', '1001', '1460511529', '1', '13', '', '0', 'C++', 'wuying', 'contest/code/wuying/1001_2.cpp');
INSERT INTO `contest_user_problem` VALUES ('7', '1', '1', '1002', '1460600055', '1', '23', '', '2', 'C++', 'wuying', 'contest/code/wuying/1002_2.cpp');
INSERT INTO `contest_user_problem` VALUES ('8', '1', '1', '1001', '1460600188', '1', '19', '', '2', 'C++', 'wuying', 'contest/code/wuying/1002_2.cpp');
INSERT INTO `contest_user_problem` VALUES ('9', '1', '1', '1002', '1460600520', '1', '15', '', '2', 'C++', 'wuying', 'contest/code/wuying/1002_2.cpp');
INSERT INTO `contest_user_problem` VALUES ('10', '1', '1', '1003', '1460619034', '1', '20', '', '0', 'C++', 'wuying', 'contest/code/wuying/1003_1.cpp');
INSERT INTO `contest_user_problem` VALUES ('11', '1', '1', '1003', '1460619124', '1', '11', '', '0', 'C++', 'wuying', 'contest/code/wuying/1003_1.cpp');
INSERT INTO `contest_user_problem` VALUES ('12', '1', '2', '1003', '1460619235', '1', '11', '', '0', 'C++', 'wuying', 'contest/code/wuying/1003_2.cpp');
INSERT INTO `contest_user_problem` VALUES ('13', '1', '2', '1003', '1460619373', '0', '14', '', '5', 'C++', 'wuying', 'contest/code/wuying/1003_4.cpp');
INSERT INTO `contest_user_problem` VALUES ('14', '1', '2', '1003', '1460619379', '1', '12', '', '5', 'C++', 'wuying', 'contest/code/wuying/1003_5.cpp');
INSERT INTO `contest_user_problem` VALUES ('15', '1', '2', '1003', '1460619394', '1', '10', '', '1', 'C++', 'wuying', 'contest/code/wuying/1004_1.cpp');

-- ----------------------------
-- Table structure for label_info
-- ----------------------------
DROP TABLE IF EXISTS `label_info`;
CREATE TABLE `label_info` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `label_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of label_info
-- ----------------------------
INSERT INTO `label_info` VALUES ('1', '背包', '0');
INSERT INTO `label_info` VALUES ('2', '递推', '0');
INSERT INTO `label_info` VALUES ('3', '树形DP', '0');
INSERT INTO `label_info` VALUES ('4', '数位DP', '0');
INSERT INTO `label_info` VALUES ('5', '状压DP', '0');
INSERT INTO `label_info` VALUES ('6', '贪心', '0');
INSERT INTO `label_info` VALUES ('7', '递推', '0');
INSERT INTO `label_info` VALUES ('8', 'RMQ', '0');
INSERT INTO `label_info` VALUES ('9', 'splay', '0');
INSERT INTO `label_info` VALUES ('10', 'Treap', '0');
INSERT INTO `label_info` VALUES ('11', '后缀数组', '0');
INSERT INTO `label_info` VALUES ('12', '线段树', '0');
INSERT INTO `label_info` VALUES ('13', '树链剖分', '0');
INSERT INTO `label_info` VALUES ('14', '树状数组', '1');
INSERT INTO `label_info` VALUES ('15', '归并树', '0');
INSERT INTO `label_info` VALUES ('16', '可持久性线段树', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_msg
-- ----------------------------
INSERT INTO `login_msg` VALUES ('1', '127.0.0.1', '1460436833', '用户不存在', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('2', '127.0.0.1', '1460436838', '用户不存在', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('3', '127.0.0.1', '1460436873', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('4', '127.0.0.1', '1460440624', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('5', '127.0.0.1', '1460443026', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('6', '127.0.0.1', '1460443032', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('7', '127.0.0.1', '1460465044', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('8', '127.0.0.1', '1460465074', '登录成功', '本机地址CZ88.NET', 'admin', 'admin');
INSERT INTO `login_msg` VALUES ('9', '127.0.0.1', '1460465158', '退出成功', '本机地址CZ88.NET', 'admin', '');
INSERT INTO `login_msg` VALUES ('10', '127.0.0.1', '1460465173', '登录成功', '本机地址CZ88.NET', 'lixiaoke', 'shishabi');
INSERT INTO `login_msg` VALUES ('11', '127.0.0.1', '1460468667', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('12', '127.0.0.1', '1460509035', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('13', '127.0.0.1', '1460597588', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('14', '127.0.0.1', '1460620963', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('15', '127.0.0.1', '1460625215', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('16', '127.0.0.1', '1460714931', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('17', '127.0.0.1', '1460714936', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('18', '127.0.0.1', '1460719295', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('19', '127.0.0.1', '1460719300', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('20', '127.0.0.1', '1460719350', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('21', '127.0.0.1', '1461075845', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('22', '127.0.0.1', '1461075897', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('23', '127.0.0.1', '1461078828', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('24', '127.0.0.1', '1461078841', '登录成功', '本机地址CZ88.NET', 'admin', 'admin');
INSERT INTO `login_msg` VALUES ('25', '127.0.0.1', '1461080527', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying19931116');
INSERT INTO `login_msg` VALUES ('26', '127.0.0.1', '1461082886', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('27', '127.0.0.1', '1461082901', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying19931116');
INSERT INTO `login_msg` VALUES ('28', '127.0.0.1', '1461083729', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('29', '127.0.0.1', '1461083742', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying19931116');
INSERT INTO `login_msg` VALUES ('30', '127.0.0.1', '1461085922', '用户已被禁用', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('31', '127.0.0.1', '1461085935', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('32', '127.0.0.1', '1461086106', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('33', '127.0.0.1', '1461086122', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('34', '127.0.0.1', '1461086687', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('35', '127.0.0.1', '1461086700', '登录成功', '本机地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('36', '127.0.0.1', '1461200012', '密码错误', '本机地址CZ88.NET', 'admin', 'admin');
INSERT INTO `login_msg` VALUES ('37', '127.0.0.1', '1461200024', '登录成功', '本机地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('38', '127.0.0.1', '1461200864', '退出成功', '本机地址CZ88.NET', 'admin', '');
INSERT INTO `login_msg` VALUES ('39', '127.0.0.1', '1461201037', '登录成功', '本机地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('40', '127.0.0.1', '1461201063', '退出成功', '本机地址CZ88.NET', 'admin', '');
INSERT INTO `login_msg` VALUES ('41', '127.0.0.1', '1461201076', '登录成功', '本机地址CZ88.NET', 'test', 'testtest');
INSERT INTO `login_msg` VALUES ('42', '127.0.0.1', '1461201604', '退出成功', '本机地址CZ88.NET', 'test', '');
INSERT INTO `login_msg` VALUES ('43', '127.0.0.1', '1461416662', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('44', '127.0.0.1', '1461421986', '用户不存在', '本机地址CZ88.NET', '2222222222222222', '2222222222222222222222222');
INSERT INTO `login_msg` VALUES ('45', '127.0.0.1', '1461422003', '登录成功', '本机地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('46', '127.0.0.1', '1461422019', '退出成功', '本机地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('47', '127.0.0.1', '1461422035', '用户不存在', '本机地址CZ88.NET', '2222222222222', '222222222222222222222');
INSERT INTO `login_msg` VALUES ('48', '0.0.0.0', '1464674045', '密码错误', 'IANA保留地址CZ88.NET', 'admin', 'admin');
INSERT INTO `login_msg` VALUES ('49', '0.0.0.0', '1464674054', '登录成功', 'IANA保留地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('50', '0.0.0.0', '1464756926', '密码错误', 'IANA保留地址CZ88.NET', 'admin', 'adminjxnuacs');
INSERT INTO `login_msg` VALUES ('51', '0.0.0.0', '1464756934', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('52', '0.0.0.0', '1464763909', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('53', '0.0.0.0', '1464768640', '用户已被禁用', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('54', '0.0.0.0', '1464768747', '密码错误', 'IANA保留地址CZ88.NET', 'admin', 'admin');
INSERT INTO `login_msg` VALUES ('55', '0.0.0.0', '1464768757', '登录成功', 'IANA保留地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('56', '0.0.0.0', '1464769137', '退出成功', 'IANA保留地址CZ88.NET', 'admin', '');
INSERT INTO `login_msg` VALUES ('57', '0.0.0.0', '1464769144', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('58', '0.0.0.0', '1464769379', '退出成功', 'IANA保留地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('59', '0.0.0.0', '1464769386', '登录成功', 'IANA保留地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('60', '0.0.0.0', '1487731801', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('61', '0.0.0.0', '1487732961', '退出成功', 'IANA保留地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('62', '0.0.0.0', '1487732967', '密码错误', 'IANA保留地址CZ88.NET', 'admin', 'admin');
INSERT INTO `login_msg` VALUES ('63', '0.0.0.0', '1487732983', '登录成功', 'IANA保留地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('64', '0.0.0.0', '1487734126', '退出成功', 'IANA保留地址CZ88.NET', 'admin', '');
INSERT INTO `login_msg` VALUES ('65', '0.0.0.0', '1487734237', '密码错误', 'IANA保留地址CZ88.NET', 'admin', 'adminjxnuacs');
INSERT INTO `login_msg` VALUES ('66', '0.0.0.0', '1487734247', '密码错误', 'IANA保留地址CZ88.NET', 'admin', 'acmjxnuacm');
INSERT INTO `login_msg` VALUES ('67', '0.0.0.0', '1487734260', '登录成功', 'IANA保留地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('68', '0.0.0.0', '1487743007', '退出成功', 'IANA保留地址CZ88.NET', 'admin', '');
INSERT INTO `login_msg` VALUES ('69', '0.0.0.0', '1487743019', '登录成功', 'IANA保留地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('70', '0.0.0.0', '1487743025', '退出成功', 'IANA保留地址CZ88.NET', 'admin', '');
INSERT INTO `login_msg` VALUES ('71', '0.0.0.0', '1487743034', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('72', '0.0.0.0', '1487743497', '退出成功', 'IANA保留地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('73', '0.0.0.0', '1487743508', '登录成功', 'IANA保留地址CZ88.NET', 'admin', 'adminjxnuacm');
INSERT INTO `login_msg` VALUES ('74', '0.0.0.0', '1487836243', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('75', '0.0.0.0', '1487836275', '退出成功', 'IANA保留地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('76', '0.0.0.0', '1487836284', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('77', '0.0.0.0', '1487905644', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('78', '0.0.0.0', '1487928454', '退出成功', 'IANA保留地址CZ88.NET', 'wuying', '');
INSERT INTO `login_msg` VALUES ('79', '0.0.0.0', '1487928469', '密码错误', 'IANA保留地址CZ88.NET', 'admin', 'jxnuacsadmin');
INSERT INTO `login_msg` VALUES ('80', '0.0.0.0', '1487928481', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('81', '0.0.0.0', '1488249404', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('82', '0.0.0.0', '1488332934', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');
INSERT INTO `login_msg` VALUES ('83', '0.0.0.0', '1488532672', '登录成功', 'IANA保留地址CZ88.NET', 'wuying', 'wuying');

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
) ENGINE=InnoDB AUTO_INCREMENT=1099 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES ('1000', 'A+B', '1000', '32768', '46', '46', '输入两个整数A,B(0&lt;=A,B&lt;=1000)。\r\n求A+B.				', '输入有多组数据。\r\n每组数组包括一行，每行有两个整数A,B，以空格隔开。				', '输出A+B的结果。\r\n每个结果占一行。				', '1 2\r\n3 4\r\n				', '3\r\n7\r\n				', '吴迎', '2014JXNU新生赛', '1');
INSERT INTO `problem` VALUES ('1001', '素数判定', '1000', '32768', '42', '42', '质数（prime number）又称素数，有无限个。一个大于1的自然数，除了1和它本身外，不能被其他自然数整除（除0以外）的数称之为素数（质数）；否则称为合数。\r\n在本题中，给定一个数n（-10000&lt;=n&lt;=10000），要求判断其是否为素数（0,1，负数都是非素数）。				', '测试数据有多组，每组输入一个数n。				', '对于每组输入,若是素数则输出yes，否则输入no。				', '-1\r\n13				', 'no\r\nyes				', '丁钦颖', '2014JXNU新生赛', '1');
INSERT INTO `problem` VALUES ('1002', '绝对值排序', '1000', '32768', '34', '34', '输入n(n&lt;=100)个整数，按照绝对值从大到小排序后输出。题目保证对于每一个测试实例，所有的数的绝对值都不相等。				', '输入数据有多组，每组占一行，每行的第一个数字为n,接着是n个整数，n=0表示输入数据的结束，不做处理。				', '对于每个测试实例，输出排序后的结果，两个数之间用一个空格隔开。每个测试实例占一行。				', '3 3 -4 2\r\n4 0 1 2 -3\r\n0				', '-4 3 2\r\n-3 2 1 0				', '吴迎', '2014JXNU新生赛', '1');
INSERT INTO `problem` VALUES ('1003', 'A变B', '1000', '32768', '33', '33', '给定两个正整数A,B（十进制）（0&lt;A,B&lt;2^31），把A，B转成二进制数表示后，问把A变成B至少需要改变多少位？\r\n例如：A=3，B=6，则A,B对应的二进制数分别是011,110，显然，把A的二进制变成B的二进制至少需要改变两位。				', '输入两个正整数A,B（0&lt;A,B&lt;2^31），输入有多组数据。				', '输出把A变成B至少需要改变多少位，每个数占一行。			', '3 6\r\n1 14				', '2\r\n4				', '吴迎', '2014JXNU新生赛', '1');
INSERT INTO `problem` VALUES ('1004', 'A+B', '1000', '32768', '38', '35', '整数版的A+B做多了，难免会对其产生厌倦心理，今天我们来尝试下更有趣的分数A+B吧。令A=a/b,B=c/d;求A+B，并以最简分数形式输出结果,最简分数就是分子和分母不能有大于1的公因数的分数。例如给定2/4不是最简分数，因为它们有公因子2，而1/2就是最简分数了，因为它们没有大于1的公因子。', '第一行有一个正整数t，表示有t组测试数据。\n每组测试数据有四个正整数,a,b,c,d，它们分别用空格隔开。这四个正整数每个的取值范围都是[1,10^50]。', '以最简分数的形式输出A+B的结果，每个结果占一行。\n', '3\n1 1 1 1\n1 2 1 3\n2 4 3 6', '2/1\n5/6\n1/1', '吴迎', '2015 年 JXNU_ACS 算法组寒假第一次周赛', '1');
INSERT INTO `problem` VALUES ('1005', '稳定的排序', '1000', '32768', '31', '31', '我们知道，排序算法有很多种，不仅每种排序算法的复杂度不一样，而且每种排序算法的稳定性也不一定。稳定排序是指：待排序的记录序列中可能存在两个或两个以上关键字相等的记录。排序前的序列中Ri领先于Rj（即i<j）.若在排序后的序列中Ri仍然领先于Rj，则称所用的方法是稳定的。否则是不稳定的。现给出一些字符串和其对应的权值。现要求依据权值升序排序，请你写一个程序输出稳定的排序结果。\n例如：给定字符串和其对应的权值是：\nabc 2\nkdwycz 2\nMummyDing 1\n这里的权值即为关键字，由于abc和kdwycz对应的权值是相等的，但是排序前，abc排在kdwycz前面，那么排序后的abc也应该排在kdwycz的前面。\n故稳定的排序结果为：\nMummyDing 1\nabc 2\nkdwycz 2\n而结果：\nMummyDing 1\nkdwycz 2\nabc 2\n虽然满足按权值升序排序的要求，但是其排序结果是不稳定的。', '第一行是一个整数t表示有t组测试数据。\n每组测试数据的第一行是一个整数n(n<=10^5)。\n接下来有n行排序前的数据。\n每行包含一个字符串s和一个权值w，以空格隔开。s的长度小于等于10,w的范围是[1,2^31-1]。', '输出稳定排序后的结果。\n每组测试数据对应的输出结果包括n行。\n每行输出一个字符串和其对应的权值，它们之间以一个空格隔开。', '1\n3\nabc 2\nkdwycz 2\nMummyDing 1', 'MummyDing 1\nabc 2\nkdwycz 2', '吴迎', '2015 年 JXNU_ACS 算法组寒假第一次周赛', '1');
INSERT INTO `problem` VALUES ('1006', '第K小的数', '1000', '32768', '55', '55', '现有数组A和B，接下来进行如下操作。\n对于A中的每一个数，它都要与B中的每一个数分别相加且只加一次，相加的结果分别存入数组C中。\n也就是说，A和B中的元素两两相加可以得到数组C。\n例如A为[2,3]，B为[4,5].那么由A和B中的元素两两相加得到的数组C为[6,7,7,8]，显然C的数的长度等于A的长度乘以B的长度。\n现在给你数组A和B，求由A和B两两相加得到的数组C中，第K小的数字。', '输入的第一行为正整数t代表有t组测试数据。\n对于每组测试数据，输入的第一行为三个整数a，b， K：a，b代表将要输入数组A和B的长度。\n紧接着两行， 分别有a和b个数， 代表数组A和B中的元素。数组元素范围是[0,2^31-1],a,b的范围是[1,10^5]， K的范围是[1,a*b]。', '对应每组测试数据，\n输出由A和B中元素两两相加得到的数组c中第K小的数字。每个数字占一行。', '2\n2 2 3\n1 2\n3 4\n3 3 4\n1 2 7\n3 4 5', '5\n6', '吴迎', '2015 年 JXNU_ACS 算法组寒假第一次周赛', '1');
INSERT INTO `problem` VALUES ('1007', '盘古开天辟地', '1000', '32768', '37', '37', '话说上古时代，天地一片混沌。盘古经过了一万八千年的孕育才有了生命。当他有了知觉的那一刻，便迫不及待的睁开了眼睛。可是周围一片黑暗，他什么都看不见。急切间，他拔下自己的一颗牙齿，把它变成威力巨大的神斧，抡起来用力向周围劈砍。浑圆体破裂了，沉浮成两部分：一部分轻而清，一部分重而浊。轻而清者不断上升，变成了天；重而浊者不断下降，变成了地。盘古就这样头顶天脚踏地的诞生于天地之间。天刚诞生，顿时无边无际的天空就出现了许多Z型的闪电，他们将天空分成了许多部分。这时，小KD就在思考，如果知道闪电的数量，那么它们最多能将天空划分出多少区域呢？接下来请你编一个程序计算帮小KD计算出n个Z型闪电最多能将天空划分出多少个区域。为了方便考虑，每条Z型线可以认为是由两条平行的射线和一条线段组成。如下图是两个闪电最多把天空划分出12块区域的情况。', '第一行有一个正整数t，代表有t组测试数据。\n每组测试数据包含一个正整数n。n的范围是[1,10^10]', '对于给定的n,输出n条Z型线的最多能划分出多少区域。\n每个数据占一行。', '2\n1\n2', '2\n12', '吴迎', '2015 年 JXNU_ACS 算法组寒假第一次周赛', '1');
INSERT INTO `problem` VALUES ('1008', '数以稀为贵', '1000', '32768', '46', '46', '给出n个数，在这n个数当中有些数共出现过1次，有些数共出现过2次，有些数共出现3次......有些数出现过n次。\n物以稀为贵，所以现在小KD只对出现过1次的数感兴趣，他请你帮他编一个程序帮他找一下，并按升序输出。', '第一行有一个正整数t，代表共有t组测试数据。\n每组测试数据有两行，第一行输入一个n，表示有n个数，n的取值范围是[1,10^6]\n第二行有n个数字。每个数字的大小范围[1, 10^6]。', '每组数据对应的输出有两行。\n第一行输出一个整数，表示出现一次的数的个数。\n第二行按升序输出出现次数为一次的数字，两个数字之间用空格隔开。', '3\n5\n1 2 2 3 3\n7\n1 2 2 3 4 4 2\n2\n2 2', '1\n1\n2\n1 3\n0', '吴迎', '2015 年 JXNU_ACS 算法组寒假第一次周赛', '1');
INSERT INTO `problem` VALUES ('1009', '惩奸除恶', '1000', '32768', '31', '31', '有一个皇帝准备处决一批奸臣和小人，但是一起处决太没劲了，有一个大臣建议边玩游戏，边处决。这个游戏是：将这N个人坏人围成一圈顺序编号，从1号开始按1、2、3......顺序报数，报p者退出则立即处决，其余的人再从1、2、3开始报数，报p的人也立即处决，以此类推。请按处决顺序输出每个被处决的人的原序号。', '第一行是正整数t代表有t组测试数据。\n每组测试数据包括一个整数N(1<=N<=1000)及一个整数p(1<=p<=1000)。', '对于每一组数据，\n按处决顺序输出每个被处决的人的原序号，每个序号以一个空格隔开。', '1\n7 3', '3 6 2 7 5 1 4', '吴迎', '2015 年 JXNU_ACS 算法组寒假第一次周赛', '1');
INSERT INTO `problem` VALUES ('1010', '双重汉诺塔', '1000', '32768', '33', '33', '汉诺塔：汉诺塔（又称河内塔）问题是源于印度一个古老传说的益智玩具。大梵天创造世界的时候做了三根金刚石柱子，在一根柱子上从下往上按照大小顺序摞着64片黄金圆盘。大梵天命令婆罗门把圆盘从下面开始按大小顺序重新摆放在另一根柱子上。并且规定，在小圆盘上不能放大圆盘，在三根柱子之间一次只能移动一个圆盘。\n不过现在有2*n个圆盘，柱子还是三根，圆盘有n种不同的尺寸，每一种尺寸的圆盘有两个，如通常那样，在第一根柱子上从下往上按照大小顺序摞着2*n个圆盘。要求每次只能移动一个圆盘，且不能把较大的圆盘放在较小的上面，显然，圆盘可以放在同样大的圆盘上面。如果相同尺寸的圆盘是相互不可区分的，要把一个双重塔从第一根桩柱移动到第三根桩柱最少需要移动多少次？如下图，为n=3时，即第一根柱子上有2*3个圆盘的初始状态。本图片由小KD友情提供！', '输出数据的第一行是一个整数T，表示有T组测试数据\n每组测试数据有一个正整数n(1<=n<=60)，表示有2*n个圆盘。', '对于每组输入数据，输出最少要移动的次数。', '2\n1\n2', '2\n6', '吴迎', '2015 年 JXNU_ACS 算法组寒假第一次周赛', '1');
INSERT INTO `problem` VALUES ('1011', '趣味数学题', '1000', '32768', '33', '33', '今有一道非常有趣的数学题：\n已知x,y满足(x^2-x*y-y^2-1)*(x^2-x*y-y^2+1)=0\n对于给定的正整数k，试求z=x^2+y^2的最大值，其中\nx,y的取值范围都是[1,k]', '第一行有一个正整数t，代表有t组测试数据\n每组测试数据包含一个正整数k。', '对于给定的k,输出z的最大值，每个数据占一行。\nk的范围是[1,10^10]。', '2\n1\n2', '1\n5', '吴迎', '2015 年 JXNU_ACS 算法组寒假第一次周赛', '1');
INSERT INTO `problem` VALUES ('1012', '木材加工', '1000', '32768', '34', '34', '木材厂有一些原木，现在想把这些木头切割成一些长度相同的小段木头，需要得到的小段的数目是给定的。当然，我们希望得到的小段越长越好，你的任务是计算能够得到的小段木头的最大长度。木头长度的单位是cm。原木的长度都是正整数，我们要求切割得到的小段木头的长度也是正整数。\\n', '一行是两个正整数N和K(1 ≤ N ≤ 10000，1 ≤ K ≤ 10000)，N是原木的数目，K是需要得到的小段的数目。接下来的N行，每行有一个1到10000之间的正整数，表示一根原木的长度。\\n', '出能够切割得到的小段的最大长度。如果连1cm长的小段都切不出来，输出”0”。\\n', '3 7\\n232\\n124\\n456', '114\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1013', '字符串替换', '1000', '32768', '41', '41', '给定一个字符串S（S仅包含大小写字母），将S中的每个字母用规定的字母替换，并输出S经过替换后的结果。程序的输入是两个字符串，第一个字符串是给定的字符串S，第二个字符串S’由26个字母组成，它是a-z的任一排列，大小写不定，S’规定了每个字母对应的替换字母：S’中的第一个字母是字母A和a的替换字母，即S中的A用该字母的大写替换，S中的a用该字母的小写替换；S’中的第二个字母是字母B和b的替换字母，即S中的B用该字母的大写替换，S中的b用该字母的小写替换；…… 以此类推。', '输入包括两行，第一行是一个字符串S，第二行是一个字符串S\\\'。S字符串的长度不大于10000。', '输出替换后的字符串。\\n', 'abbccdd\\ncdbaefghijklmnopqrstuvwxyz', 'cddbba', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1014', '找第k大的数', '1000', '32768', '30', '30', '定一个无序正整数序列, 以及另一个数n (1<=n<=1000000), 然后以类似快速排序的方法找到序列中第n大的数（关于第n大的数：例如序列{1，2，3，4，5，6}中第3大的数是4）。\\n', '输入包括两行，第一行包括两个正整数n和k，n代表有n个正整数，k代表要查找第k大的数。\\n第二行有n个正整数。每个正整数的范围是1~1000000。\\n其中，n的范围是1~1000000，k的范围是1~n\\n', '输出第k大的数。\\n', '6 3\\n1 2 3 4 5 6', '4\\n\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1015', '国王放置 ', '1000', '32768', '31', '31', 'n*m的棋盘上放置k个国王，要求k个国王互相不攻击，有多少种不同的放置方法。假设国王放置在第(x,y)格，国王的攻击的区域是:(x-1,y-1), (x-1,y),(x-1,y+1),(x,y-1),(x,y+1),(x+1,y-1),(x+1,y),(x+1,y+1)。\\n', '输入包括三个数n,m,k，(0<n,m<5,0<k<n*m)含义如题面。\\n', '输出不同的放置方法，每个结果占一行。\\n\\n', '4 4 4', '7', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1016', '最大连续子段和', '1000', '32768', '33', '33', '给出一个数列（元素个数不多于100），数列元素均为负整数、正整数、0。请找出数列中的一个连续子数列，使得这个子数列中包含的所有元素之和最大，在和最大的前提下还要求该子数列包含的元素个数最多，并输出这个最大和以及该连续子数列中元素的个数。\\n', '输入包括两行，第一行为一个正整数n，代表有n个正整数。\\n第二行包括n个整数。每个整数的范围是-1000000~1000000。\\n', '输出最大和以及该连续子数列中元素的个数。这两个数之间用空格隔开，每结果占一行。\\n\\n样例输入：\\n5\\n4 -5 3 2 4\\n样例输出：\\n9 ', '最大连续子段和\\n题目描述：\\n给出一个数列（元素个数不多于100），数列元素均为负整数、正整数、0。请找出数列中的一个连续子数列，使得这个子数列中包含的所有元素之和最大，在和最大的前提下还要求该子数列包含的元素个数最多，并输出这个最大和以及该连续子数列中元素的个数。\\n\\n输入格式：\\n输入包括两行，第一行为一个正整数n，代表有n个正整数。\\n第二行包括n个整数。每个整数的范围是-1000000~1000000。\\n\\n输出格式：\\n输出最大和以及该连续子数列中元素的个数。这两个数之间用空格隔开，每结果占一行。\\n\\n样例输入：\\n5\\n4 -5 3 2 4\\n样例输出：\\n9 ', '最大连续子段和\\n题目描述：\\n给出一个数列（元素个数不多于100），数列元素均为负整数、正整数、0。请找出数列中的一个连续子数列，使得这个子数列中包含的所有元素之和最大，在和最大的前提下还要求该子数列包含的元素个数最多，并输出这个最大和以及该连续子数列中元素的个数。\\n\\n输入格式：\\n输入包括两行，第一行为一个正整数n，代表有n个正整数。\\n第二行包括n个整数。每个整数的范围是-1000000~1000000。\\n\\n输出格式：\\n输出最大和以及该连续子数列中元素的个数。这两个数之间用空格隔开，每结果占一行。\\n\\n样例输入：\\n5\\n4 -5 3 2 4\\n样例输出：\\n9 3', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1017', '哥德巴赫猜想', '1000', '32768', '34', '34', '哥德巴赫猜想是指，任一大于2的偶数都可写成两个质数之和。迄今为止，这仍然是一个著名的世界难题，被誉为数学王冠上的明珠。试编写程序，验证任一大于2且不超过n的偶数都能写成两个质数a和b之和。\\n', '输入一个正整数n。(4<=n<=100000)\\n', '输出a和b，要满足a<=b，如果有多种组合满足要求，则输出a最小的那个组合。\\n', '6', '3 ', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1018', '过河问题', '1000', '32768', '20', '20', '在一个月黑风高的夜晚，有一群人在河的右岸，想通过唯一的一根独木桥走到河的左岸。在这伸手不见五指的黑夜里，过桥时必须借助灯光来照明，不幸的是，他们只有一盏灯。另外，独木桥上最多承受两个人同时经过，否则将会坍塌。每个人单独过桥都需要一定的时间，不同的人需要的时间可能不同。两个人一起过桥时，由于只有一盏灯，所以需要的时间是较慢的那个人单独过桥时所花的时间。\\n', '现输入n（2≤n<100）和这n个人单独过桥时需要的时间，请计算总共最少需要多少时间，他们才能全部到达河的左岸。时间的范围是1~1000000。\\n', '输出最少时间。每个结果占一行。\\n', '3\\n1 2 4', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1019', '大整数开方', '1000', '32768', '43', '43', '输入一个正整数 n（1≤n<10^100），试用二分法计算它的平方根的整数部分。\\n', '输入一个正整数 n（1≤n<10^100）。\\n', '输出平方根的整数部分。\\n', '5', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1020', '子矩阵', '1000', '32768', '29', '29', '输入一个 n1*m1 的矩阵 a，和 n2*m2 的矩阵 b，问 a 中是否存在子矩阵和 b 相等。 若存在， 输出所有子矩阵左上角的坐标； 若不存在输出 “There is no answer” 。 \\n', '第一行是n1,m1。\\n然后接下来的n1行是n1*m1的矩阵。\\n紧接着是n2,m2。\\n最后n2行是n2*m2的矩阵。\\n其中，n1,m1,n2,m2的范围都是1~50。每个矩阵元素的范围都是int型范围内。\\n', '输出所有子矩阵左上角的坐标，输出顺序见样例。\\n\\n', '5 5\\n1 0 0 1 0\\n0 1 0 1 0\\n1 1 0 0 1\\n1 0 1 1 0\\n0 0 0 0 1\\n2 2\\n1 0\\n0 1', '1 1\\n2 4\\n3 2\\n4 ', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1021', '坐标统计', '1000', '32768', '32', '32', '输入 n 个整点在平面上的坐标。对于每个点，可以控制所有位于它左下方的点（即 x、\\ny 坐标都比它小），它可以控制的点的数目称为“战斗力”。依次输出每个点的战斗力，最后输出战斗力最高的点的编号（如果若干个点的战斗力并列最高，输出其中最大的编号）。\\n\\n', '输入的第一行是一个正整数n。(1=<n<=100)\\n接下来n行是n个点的坐标。每个坐标的范围都在int型范围之内。\\n', '依次输出每个点的战斗力，最后输出战斗力最高的点的编号。\\n', '5\\n1 2\\n3 4\\n5 6\\n7 8\\n9 10', '0\\n1\\n2\\n3\\n4\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1022', '排列数', '1000', '32768', '30', '30', '输入两个正整数 n，m（1<n<20,1<m<min(n,5)），在 1~n 中任取 m 个数，按字典序从小到大输出所有这样的排列。\\n', '输入两个正整数n,m。\\n', '输出所有排列。\\n', '3 2', '1 2\\n1 3\\n2 1\\n2 3\\n3 1\\n3 ', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1023', '二叉查找树', '1000', '32768', '32', '32', '二叉查找树具有如下性质：每个节点的值都大于其左子树上所有节点的值、小于其右子树上所有节点的值。试判断一棵树是否为二叉查找树。\\n', '输入的第一行包含一个整数 n，表示这棵树有 n 个顶点，编号分别为 1, 2, …, n，其中编号为 1 的为根结点。之后的第 i 行有三个数 value, left_child, right_child，分别表示编号为i的节点的关键字的值、左子节点的编号、右子节点的编号。\\n', '如果不存在左子节点或右子节 点，则用 0 代替。输出 1 表示这棵树是二叉查找树，输出 0 则表示不是。\\n', '5\\n7 2 3\\n5 4 5\\n9 0 0\\n2 0 0\\n6 0 0', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1024', '序列重排', '1000', '32768', '34', '34', '\\n全局数组变量 a 定义如下：\\n#define SIZE 100 \\nint a[SIZE], n;\\n它记录着一个长度为 n 的序列 a[1], a[2], …, a[n]。\\n现在需要一个函数，以整数 p (1 ≤ p ≤ n)为参数，实现如下功能：将序列 a 的前 p 个数与后 n – p 个数对调，且不改变这 p 个数（或 n – p 个数）之间的相对位置。例如，长度为 5 的序列 1, 2, 3, 4, 5，当 p = 2 时重排结果为 3, 4, 5, 1, 2。\\n', '第一行包括两个正整数n和p。(0<n<=100,0<p<=n)\\n接下来的一行包括n个正整数。每个正整数的范围是1~100\\n', '输出重排之后的数组。\\n\\n', '5 1\\n1 2 3 4 5', '3 4 5 1 ', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1025', '数字删除', '1000', '32768', '33', '33', '将字符串中的数字字符删除后输出。\\n\\n', '输入一个长度不超过1000000的字符串。字符串中包括大小写字母以及字符串。\\n\\n输入格式：\\n输出删除了数字字符之后的字符串。\\n\\n输入样例：\\nAbc35f6wwoo9\\n\\n输出样例：\\nAbcfww', '数字删除\\n\\n题目描述：\\n将字符串中的数字字符删除后输出。\\n\\n\\n输入格式：\\n输入一个长度不超过1000000的字符串。字符串中包括大小写字母以及字符串。\\n\\n输入格式：\\n输出删除了数字字符之后的字符串。\\n', 'Abc35f6wwoo9\\n', 'Abcfwwo', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1026', '最大子矩阵和', '1000', '32768', '35', '35', '给出m行n列的整数矩阵，求最大的子矩阵和（子矩阵不能为空）。 \\n输入第一行包含两个整数m和n，即矩阵的行数和列数。之后m行，每行n个整数，描述整个矩阵。程序最终输出最大的子矩阵和。\\n\\n', '第一行包括两个正整数n,m。(0<n,m<=100)\\n接下来的n行是一个n*m的矩阵。矩阵的每个元素都在int型范围之内。\\n', '输出最大的子矩阵和。\\n', '4 4\\n0 -2 -7 0\\n9 2 -6 2\\n-4 1 -4  1\\n-1 8  0 -2', '1', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1027', '中位数', '1000', '32768', '26', '26', '给定 n（n 为奇数且小于 1000）个整数，整数的范围在 0~m（0 < m < 2^31 ）\\n之间，请使用二分法求这 n 个整数的中位数。所谓中位数，是指将这 n 个数排序之后，\\n排在正中间的数。\\n', '第一行包括两个正整数n和m。(0<n<1000,且n为奇数)\\n第二行是n个正整数，每个正整数的范围都是int型。\\n', '输出中位数，结果占一行。\\n', '5 9\\n3 2 6 1 9', '3', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1028', '寻找路线', '1000', '32768', '35', '35', '小明在A点，他要到B点。从A到B有许多交错的路， 这些交错的路形成了有很多1*1的小正方形组成的长方形，长为l，宽为w。 他想知道A点到B点有几条最短路线可走。\\n', '两个正整数l和w（0 < w <= l <= 33）。\\n', 'A点到B点的 最短路线的条数。\\n', '3 2\\n', '10', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1029', '猜数字', '1000', '32768', '34', '34', '输入一个数字n(0 <= n <= 32768), 利用二分法猜到这个数字. \\n', '一个数字n\\n', '一共若干行, 一行两个数, 第一个数为猜的次数, 第二个数为猜的数字. \\n\\n输出样例：\\n24687\\n\\n输出样例：\\n1 16384\\n2 24576\\n3 28672\\n4 26624\\n5 25600\\n6 25088\\n7 24832\\n8 24704\\n9 24640\\n10 24672\\n11 24688\\n12 24680\\n13 24684\\n14 24686\\n15 2468', '猜数字\\n\\n题目描述：\\n输入一个数字n(0 <= n <= 32768), 利用二分法猜到这个数字. \\n\\n输入格式：\\n一个数字n\\n\\n输出格式：\\n一共若干行, 一行两个数, 第一个数为猜的次数, 第二个数为猜的数字. \\n', '24687\\n\\n输出样例：\\n1 16384\\n2 24576\\n3 28672\\n4 26624\\n5 25600\\n6 25088\\n7 24832\\n8 24704\\n9 24640\\n10 24672\\n11 24688\\n12 24680\\n13 24684\\n14 24686\\n15 24687', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1030', '打印日历 (2)', '1000', '32768', '30', '30', '已知2010-1-1是星期五, 给出年份与月份, 按照下列格式打印这个月的日历:\\nMarch 2016\\nSun     Mon     Tue     Wed     Thu     Fri     Sat\\n                1       2       3       4       5\\n6       7       8       9       10      11      12\\n13      14      15      16      17      18      19\\n20      21      22      23      24      25      26\\n27      28      29      30      31\\n\\n用Sun,  Mon, Tues, Wed, Thur, Fri, Sat表示星期日到星期六. \\n', '4个整数(y, m), 其中y(1900 <= n <= 2099)表示年份, m(1<=m<=12)表示月份, d(1<=d<=31)表示日期. \\n', '第一行, 打印星期天到星期六的符号.\\n第二行开始, 依次打印每一天的日期.\\n打印时使用制表符\\\'\\\\t\\\'间隔(如果1号不是星期天, 那么需要在第二行前添加\\\'\\\\t\\\'缩进), 每一行最后不要打印多余的制表符. 注意最后一天之后也是直接换行, 不要打印多余的制表符.\\n\\n样例输出：\\n2016 3\\n\\n样例输出：\\nSun     Mon     Tue     Wed     Thu     Fri     Sat\\n                1       2       3       4       5\\n6       7       8       9       10      11      12\\n13      14      15      16      17      18      19\\n20      21      22      23      24      25      26\\n27      28      29      30      3', '打印日历 (2)\\n\\n题目描述：\\n已知2010-1-1是星期五, 给出年份与月份, 按照下列格式打印这个月的日历:\\nMarch 2016\\nSun     Mon     Tue     Wed     Thu     Fri     Sat\\n                1       2       3       4       5\\n6       7       8       9       10      11      12\\n13      14      15      16      17      18      19\\n20      21      22      23      24      25      26\\n27      28      29      30      31\\n\\n用Sun,  Mon, Tues, Wed, Thur, Fri, Sat表示星期日到星期六. \\n\\n输入格式：\\n4个整数(y, m), 其中y(1900 <= n <= 2099)表示年份, m(1<=m<=12)表示月份, d(1<=d<=31)表示日期. \\n\\n输出格式：\\n第一行, 打印星期天到星期六的符号.\\n第二行开始, 依次打印每一天的日期.\\n打印时使用制表符\\\'\\\\t\\\'间隔(如果1号不是星期天, 那么需要在第二行前添加\\\'\\\\t\\\'缩进), 每一行最后不要打印多余的制表符. 注意最后一天之后也是直接换行, 不要打印多余的制表符.\\n\\n样例输出：\\n2016 3\\n\\n样例输出：\\nSun     Mon     Tue     Wed     Thu     Fri     Sat\\n                1       2       3       4       5\\n6       7       8       9       10      11      12\\n13      14      15      16      17      18      19\\n20      21      22      23      24      25      26\\n27      28      29      30      3', '打印日历 (2)\\n\\n题目描述：\\n已知2010-1-1是星期五, 给出年份与月份, 按照下列格式打印这个月的日历:\\nMarch 2016\\nSun     Mon     Tue     Wed     Thu     Fri     Sat\\n                1       2       3       4       5\\n6       7       8       9       10      11      12\\n13      14      15      16      17      18      19\\n20      21      22      23      24      25      26\\n27      28      29      30      31\\n\\n用Sun,  Mon, Tues, Wed, Thur, Fri, Sat表示星期日到星期六. \\n\\n输入格式：\\n4个整数(y, m), 其中y(1900 <= n <= 2099)表示年份, m(1<=m<=12)表示月份, d(1<=d<=31)表示日期. \\n\\n输出格式：\\n第一行, 打印星期天到星期六的符号.\\n第二行开始, 依次打印每一天的日期.\\n打印时使用制表符\\\'\\\\t\\\'间隔(如果1号不是星期天, 那么需要在第二行前添加\\\'\\\\t\\\'缩进), 每一行最后不要打印多余的制表符. 注意最后一天之后也是直接换行, 不要打印多余的制表符.\\n\\n样例输出：\\n2016 3\\n\\n样例输出：\\nSun     Mon     Tue     Wed     Thu     Fri     Sat\\n                1       2       3       4       5\\n6       7       8       9       10      11      12\\n13      14      15      16      17      18      19\\n20      21      22      23      24      25      26\\n27      28      29      30      31', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1031', '二次方程', '1000', '32768', '34', '34', '给出一个二次方程, 求出二次方程的解.\\n', '一个二次方程, 以\\\"a*x^2+b*x+c=0\\\"的格式输入. 其中a, b为系数, c为常数项. 变量名称为一个字母, 只能有一个变量. 等号右边只能是0. a!=0. 要是不符合要求, 输出\\\"Input error!\\\"(不包含引号).\\n', '二次方程的解.\\n若有2个不同的解, 输出\\nx1=...\\nx2=... (假设变量名称为x)\\n\\n若有2个相同的解, 输出\\nx=...\\n\\n若2个解为复数, 输出\\nx1=a+b*i\\nx2=a-b*i (x1, x2的顺序不能改变. a, b不是二次方程的系数)\\n\\n若方程格式错误, 输出\\nInput error!\\n\\n均保留6位小数.\\n\\n样例输入：\\n1*x^2+1*x-6=0\\n\\n样例输出：\\nx1=2.000000\\nx2=-3.00000', '二次方程\\n\\n题目描述：\\n给出一个二次方程, 求出二次方程的解.\\n\\n输入格式：\\n一个二次方程, 以\\\"a*x^2+b*x+c=0\\\"的格式输入. 其中a, b为系数, c为常数项. 变量名称为一个字母, 只能有一个变量. 等号右边只能是0. a!=0. 要是不符合要求, 输出\\\"Input error!\\\"(不包含引号).\\n\\n输出格式：\\n二次方程的解.\\n若有2个不同的解, 输出\\nx1=...\\nx2=... (假设变量名称为x)\\n\\n若有2个相同的解, 输出\\nx=...\\n\\n若2个解为复数, 输出\\nx1=a+b*i\\nx2=a-b*i (x1, x2的顺序不能改变. a, b不是二次方程的系数)\\n\\n若方程格式错误, 输出\\nInput error!\\n\\n均保留6位小数.\\n\\n样例输入：\\n1*x^2+1*x-6=0\\n\\n样例输出：\\nx1=2.000000\\nx2=-3.00000', '二次方程\\n\\n题目描述：\\n给出一个二次方程, 求出二次方程的解.\\n\\n输入格式：\\n一个二次方程, 以\\\"a*x^2+b*x+c=0\\\"的格式输入. 其中a, b为系数, c为常数项. 变量名称为一个字母, 只能有一个变量. 等号右边只能是0. a!=0. 要是不符合要求, 输出\\\"Input error!\\\"(不包含引号).\\n\\n输出格式：\\n二次方程的解.\\n若有2个不同的解, 输出\\nx1=...\\nx2=... (假设变量名称为x)\\n\\n若有2个相同的解, 输出\\nx=...\\n\\n若2个解为复数, 输出\\nx1=a+b*i\\nx2=a-b*i (x1, x2的顺序不能改变. a, b不是二次方程的系数)\\n\\n若方程格式错误, 输出\\nInput error!\\n\\n均保留6位小数.\\n\\n样例输入：\\n1*x^2+1*x-6=0\\n\\n样例输出：\\nx1=2.000000\\nx2=-3.000000', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1032', '三角形', '1000', '32768', '33', '33', 'n根棍子，棍子i的长度为Ai。想要从中选出3根棍子组成周长尽可能长的三角形。请输出最大周长，若无法组成三角形则输出0。\\n', '第一行是一个正整数n(3<=n<=1000000)，代表有n根棍子。\\n第二行有n个正整数，第i个正整数Ai代表第i根棍子的长度。\\n', '如果能组成三角形，则输出最长周长，如果不能组成三角形，输出0。\\n', '5\\n2 3 4 5 10', '1', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1033', '分蛋糕', '1000', '32768', '27', '27', '蛋糕\\n\\n\\n题目描述：\\n一次生日Party可能有p人或者q人参加,现准备有一个大蛋糕.问最少要将蛋糕切成多少块(每块大小不一定相等),才能使p人或者q人出席的任何一种情况,都能平均将蛋糕分食. \\n \\n', '每行有两个数p和q.\\n \\n', '输出最少要将蛋糕切成多少块.\\n \\n', '2 3\\n ', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1034', '数组中只出现一次的数字', '1000', '32768', '26', '26', '一个整型数组里除了1个数字之外，其他的数字都出现了两次。请写程序找出这个只出现一次的数字。\\n', '测试案例包括两行：\\n第一行包含一个整数n，表示数组大小。2<=n <= 10^6。\\n第二行包含n个整数，表示数组元素，元素均为int。\\n', '输出数组中只出现一次的数。输出结果占一行。\\n\\n样例输入：\\n7\\n2 4 3 3 2 5 5\\n\\n样例输出：', '数组中只出现一次的数字\\n\\n题目描述：\\n一个整型数组里除了1个数字之外，其他的数字都出现了两次。请写程序找出这个只出现一次的数字。\\n\\n输入格式：\\n测试案例包括两行：\\n第一行包含一个整数n，表示数组大小。2<=n <= 10^6。\\n第二行包含n个整数，表示数组元素，元素均为int。\\n\\n输出格式：\\n输出数组中只出现一次的数。输出结果占一行。\\n\\n样例输入：\\n7\\n2 4 3 3 2 5 5\\n\\n样例输出：', '数组中只出现一次的数字\\n\\n题目描述：\\n一个整型数组里除了1个数字之外，其他的数字都出现了两次。请写程序找出这个只出现一次的数字。\\n\\n输入格式：\\n测试案例包括两行：\\n第一行包含一个整数n，表示数组大小。2<=n <= 10^6。\\n第二行包含n个整数，表示数组元素，元素均为int。\\n\\n输出格式：\\n输出数组中只出现一次的数。输出结果占一行。\\n\\n样例输入：\\n7\\n2 4 3 3 2 5 5\\n\\n样例输出：\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1035', '数组中只出现奇数次的数字', '1000', '32768', '35', '35', '一个整型数组里除了两个数字之外，其他的数字都出现了偶数次。请写程序找出这两个只出现奇数次的数字。\\n', '测试案例包括两行：\\n第一行包含一个整数n，表示数组大小。2<=n <= 5*10^6。\\n第二行包含n个整数，表示数组元素，元素均为int。\\n', '按从小到大的顺序输出这两个数，结果占一行。\\n\\n样例输入：\\n2\\n1 2\\n\\n样例输出：\\n1 ', '数组中只出现奇数次的数字\\n\\n\\n题目描述：\\n一个整型数组里除了两个数字之外，其他的数字都出现了偶数次。请写程序找出这两个只出现奇数次的数字。\\n\\n输入格式：\\n测试案例包括两行：\\n第一行包含一个整数n，表示数组大小。2<=n <= 5*10^6。\\n第二行包含n个整数，表示数组元素，元素均为int。\\n\\n输出格式：\\n按从小到大的顺序输出这两个数，结果占一行。\\n\\n样例输入：\\n2\\n1 2\\n\\n样例输出：\\n1 ', '数组中只出现奇数次的数字\\n\\n\\n题目描述：\\n一个整型数组里除了两个数字之外，其他的数字都出现了偶数次。请写程序找出这两个只出现奇数次的数字。\\n\\n输入格式：\\n测试案例包括两行：\\n第一行包含一个整数n，表示数组大小。2<=n <= 5*10^6。\\n第二行包含n个整数，表示数组元素，元素均为int。\\n\\n输出格式：\\n按从小到大的顺序输出这两个数，结果占一行。\\n\\n样例输入：\\n2\\n1 2\\n\\n样例输出：\\n1 2', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1036', '最大整数', '1000', '32768', '39', '39', '设有n个正整数 (n<=100), 将它们连接成一排, 组成一个最大的多位整数.\\n例如: n=3时, 3个整数13, 312, 343连接成的最大整数为: 34331213\\n又如: n=4时, 4个整数7,13,4,246连接成的最大整数为: 7424613\\n', '输入有多组测试数据，对于每组测试数据：\\n第一行是一个正整数n,代表有n个数。\\n第二行包括n个正整数，每个正整数都在int型范围以内。\\n', '输出能拼成的最大整数，每个结果占一行。\\n', '3\\n13 312 343\\n', '34331213', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1037', 'N!(2)', '1000', '32768', '30', '30', '定N,求N！的位数。\\n', '入一个数n。(0<=a<=10^7)\\n', '！的位数。输出占一行。\\n', '00\\n', '58\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1038', '数组中的逆序对', '1000', '32768', '36', '36', '在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。', '每个测试案例包括两行：\\n第一行包含一个整数n，表示数组中的元素个数。其中1 <= n <= 10^5。\\n第二行包含n个整数，每个数组均为int类型。', '对应每个测试案例，输出一个整数，表示数组中的逆序对的总数。', '4\\n7 5 6 4', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1039', '整除问题', '1000', '32768', '30', '30', '给定n，a求最大的k，使n！可以被a^k整除但不能被a^(k+1)整除。\\n', '两个整数n(2<=n<=1000)，a(2<=a<=1000)', '一个整数.\\n', '6 10', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1040', '第K大公约数', '1000', '32768', '35', '35', '给定正整数A和B，求第k大的公约数。\\n', '入三个数A，B，k。(1<=A,B<=10^12，0<k<=10^3)\\n\\n输入格式：如果不存在，输出-1，否则输出第k大的公约数。\\n\\n输入样例：\\n2 4 2\\n输出样例：\\n', '第K大公约数\\n\\n题目描述：说给定正整数A和B，求第k大的公约数。\\n\\n输入格式：输入三个数A，B，k。(1<=A,B<=10^12，0<k<=10^3)\\n\\n输入格式：如果不存在，输出-1，否则输出第k大的公约数。\\n', '2 4 2', '1', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1041', '约数的个数', '1000', '32768', '30', '30', '输入1个整数,输出每个数的约数的个数', '\\n接下来的1行包括N个整数，其中每个数的范围为(1<=Num<=1000000000)\\n', '\\n输出1行，对应上面的一个数的约数的个数。', '12', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1042', '连号区间数  ', '1000', '32768', '39', '39', '小明这些天一直在思考这样一个奇怪而有趣的问题：\\n\\n在1~N的某个全排列中有多少个连号区间呢？这里所说的连号区间的定义是：\\n\\n如果区间[L, R] 里的所有元素（即此排列的第L个到第R个元素）递增排序后能得到一个长度为R-L+1的“连续”数列，则称这个区间连号区间。\\n\\n当N很小的时候，小明可以很快地算出答案，但是当N变大的时候，问题就不是那么简单了，现在小明需要你的帮助。\\n', '第一行是一个正整数N (1 <= N <= 1000), 表示全排列的规模。\\n\\n第二行是N个不同的数字Pi(1 <= Pi <= N)， 表示这N个数字的某一全排列。\\n', '输出一个整数，表示不同连号区间的数目。\\n', '4\\n3 2 4 1', '7', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1043', '加强版A+B', '1000', '32768', '26', '26', '在有一个简单的问题，给你两个正整数A和B，你需要计算出A+B。不过要注意哦，这两个正整数非常大。\\n', '输入两个正整数A和B，A和B的位数不超过100000。\\n', '输出A+B，结果占一行。\\n', '12345678909876543210123456789 1\\n', '1234567890987654321012345679', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1044', 'A-B', '1000', '32768', '38', '38', '在有一个简单的问题，给你两个正整数A和B，你需要计算出A-B。不过要注意哦，这两个正整数非常大。\\n', '输入两个正整数A和B，A和B的位数不超过100000。\\n', '输出A-B，结果占一行。\\n', '12345678909876543210123456789 1\\n', '1234567890987654321012345678', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1045', 'A*B', '1000', '32768', '36', '36', '在给你一个简单的问题，给你两个正整数A和B，你需要计算出A乘B。不过要注意哦，这A非常大，B是一个两位数。\\n', '输入两个正整数A和B，A的位数不超过10000。\\n\\n', '输出A*B的结果，结果占一行。\\n', '12345678909876543210123456789 1\\n', '1234567890987654321012345678', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1046', 'A除B', '1000', '32768', '38', '38', '在给你一个简单的问题，给你两个正整数A和B，你需要计算出A除B。不过要注意哦，这A非常大，B是一个两位数。\\n', '输入两个正整数A和B，A的位数不超过10000，B的位数不超过100位。\\n\\n', '输出A除B的结果，结果占一行。\\n', '12345678909876543210123456789 1\\n', '1234567890987654321012345678', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1047', 'A*B', '1000', '32768', '31', '31', '在给你一个的问题，给你两个正整数A和B，你需要计算出A乘B。不过要注意哦，这A和B都非常大。\\n', '输入两个正整数A和B，A和B的位数均不超过10000。\\n\\n', '输出A*B的结果，结果占一行。\\n', '1999999999999999999999999999999999999999999999999 12345678909876543210123456789\\n', '16200000134460001115', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1048', 'A*B', '1000', '32768', '26', '26', '在给你一个的问题，给你两个正整数A和B，你需要计算出A乘以B。不过要注意哦，这A和B都非常大。\\n', '输入两个正整数A和B，A和B的位数均不超过10000。\\n\\n', '输出A*B的结果，结果占一行。\\n', '1999999999999999999999999999999999999999999999999 12345678909876543210123456789\\n', '16200000134460001115', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1049', '大整数排序', '1000', '32768', '44', '44', '对N个长度最长可达到1000的数进行排序。', '输入第一行为一个整数N，(1<=N<=100)。\\n接下来的N行每行有一个数，数的长度范围为1<=len<=1000。\\n保证每个数都是一个正数。', '将给出的N个数从小到大进行排序，输出排序后的结果，每个数占一行。\\n样例输入：\\n3\\n11111111111111111111111111111\\n2222222222222222222222222222222222\\n33333333\\n样例输出：\\n33333333\\n11111111111111111111111111111\\n22222222222222222222222222222222', '大整数排序\\n\\n题目描述：\\n对N个长度最长可达到1000的数进行排序。\\n输入格式：\\n输入第一行为一个整数N，(1<=N<=100)。\\n接下来的N行每行有一个数，数的长度范围为1<=len<=1000。\\n保证每个数都是一个正数。\\n输出格式：\\n将给出的N个数从小到大进行排序，输出排序后的结果，每个数占一行。\\n样例输入：\\n3\\n11111111111111111111111111111\\n2222222222222222222222222222222222\\n33333333\\n样例输出：\\n33333333\\n11111111111111111111111111111\\n22222222222222222222222222222222', '大整数排序\\n\\n题目描述：\\n对N个长度最长可达到1000的数进行排序。\\n输入格式：\\n输入第一行为一个整数N，(1<=N<=100)。\\n接下来的N行每行有一个数，数的长度范围为1<=len<=1000。\\n保证每个数都是一个正数。\\n输出格式：\\n将给出的N个数从小到大进行排序，输出排序后的结果，每个数占一行。\\n样例输入：\\n3\\n11111111111111111111111111111\\n2222222222222222222222222222222222\\n33333333\\n样例输出：\\n33333333\\n11111111111111111111111111111\\n222222222222222222222222222222222', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1050', '丑数', '1000', '32768', '31', '31', '把只包含因子2、3和5的数称作丑数（Ugly Number）。例如6、8都是丑数，但14不是，因为它包含因子7。\\n习惯上我们把1当做是第一个丑数。求按从小到大的顺序的第N个丑数。\\n', '输入包括一个整数N(1<=N<=1500)。\\n', '输出第N个丑数。\\n', '3\\n', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1051', '和为S的连续正数序列', '1000', '32768', '47', '47', '小明很喜欢数学,有一天他在做数学作业时,要求计算出9~16的和,他马上就写出了正确答案是100。但是他并不满足于此,他在想究竟有多少种连续的正数序列的和为100(至少包括两个数)。没多久,他就得到另一组连续正数和为100的序列:18,19,20,21,22。现在把问题交给你,你能不能也很快的找出所有和为S的连续正数序列? Good Luck!\\n', '\\n输入包括1个整数S(S<=1,000,000)。\\n', '若不存在和为S的连续正数序列,则输出“Pity!”;否则,按照开始数字从小到大的顺序,输出所有和为S的连续正数序列。\\n', '4', 'Pity!', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1052', '开关问题', '1000', '32768', '19', '19', '\\n有n盏灯，编号1~n。一开始灯都是关着的，每个灯有一个开关，按奇数次为打开，按偶数次为关闭。我们先把编号为1的倍数的灯按一下开关，再把编号为2的倍数的灯按一下开关，依次下去，一直到把编号为n的倍数灯按一下，请问最后有多少盏灯是亮的？ \\n', '\\n输入为一个整数n(1≤n≤10^9 ) 。\\n', '\\n输出有多少灯是亮的，结果占一行。\\n', '1\\n', '1\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1053', '整数解', '1000', '32768', '30', '30', '有二个整数，它们加起来等于某个整数，乘起来又等于另一个整数，它们到底是真还是假，也就是这种整数到底存不存在，实在有点吃不准，你能快速回答吗？看来只能通过编程。\\n例如：\\nx + y = 9，x * y = 15 ? 找不到这样的整数x和y\\n1+4=5，1*4=4，所以，加起来等于5，乘起来等于4的二个整数为1和4\\n \\n', '输入数据为成对出现的整数n，m（0<n,m<10000），它们分别表示整数的和与积。\\n\\n ', '只需要对于每个n和m，输出“Yes”或者“No”，明确有还是没有这种整数就行了。\\n \\n', '9 15\\n', 'No', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1054', '整除的尾数', '1000', '32768', '40', '40', '\\n一个整数，只知道前几位，不知道最后二位，已知它可以被另一个整数整除，那么该数的末二位该是什么呢？\\n \\n', '输入数据包含二个整数a，b（0<a<10000, 10<b<100）。\\n \\n', '将满足条件的所有尾数在一行内输出，格式见样本输出。\\n', '200 40', '00 40 80\\n\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1055', '最简真分数', '1000', '32768', '33', '33', '给出n个正整数，任取两个数分别作为分子和分母组成最简真分数，编程求共有几个这样的组合。\\n', '输入包含n（n<=600）和n个不同的整数，整数大于1且小于等于1000。。\\n', '每行输出最简真分数组合的个数。\\n', '7\\n3 5 7 9 11 13 15\\n', '17 ', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1056', ' 简易版之最短距离', '1000', '32768', '34', '34', '寒假的时候想，小明要去拜访很多朋友，恰巧他所有朋友的家都处在坐标平面的X轴上。小明可以任意选择一个朋友的家开始访问，但是每次访问后他都必须回到出发点，然后才能去访问下一个朋友。\\n比如有4个朋友，对应的X轴坐标分别为1， 2， 3， 4。当小明选择坐标为2的点做为出发点时，则他最终需要的时间为 |1-2|+|2-2|+|3-2|+|4-2| = 4。\\n现在给出Ｎ个朋友的坐标，那么ACBOY应该怎么走才会花费时间最少呢？\\n \\n', '输入有2行，首先是一个正整数N（N <= 500)，表示有N个朋友，下一行是N个正整数，表示具体的坐标(所有数据均<=10000).\\n \\n', '请输出访问完所有朋友所花的最少时间，每个输出占一行。\\n \\n', '2 \\n2 4 \\n\\n \\n', '2\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1057', '和为n的等式', '1000', '32768', '37', '37', '给定一个数sum,和一个含n个数的数组。现在从中取出一些数。并把这些数相加得出一个和，问和为sum的等式有哪些？每个数组元素最多只能使用一次，要求输出所有满足条件(加数从大到小输出)的等式，并且不能重复。\\n', '第一行包括两个正整数sum(sum<=1000)和n(1<=n<=12)。\\n第二行是n个正整数，每个正整数的范围是1~100。\\n', '如果不存在等式，则输出一行字符串\\\'NONE\\\'。\\n否则输出满足条件的等式，具体格式见样例。\\n\\n', '4 6\\n4 3 2 2 1 1\\n', '4\\n3+1\\n2+2\\n2+1+1\\n\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1058', '带分数', '1000', '32768', '35', '35', '100 可以表示为带分数的形式：100 = 3 + 69258 / 714。\\n\\n还可以表示为：100 = 82 + 3546 / 197。\\n\\n注意特征：带分数中，数字1~9分别出现且只出现一次（不包含0）。\\n\\n类似这样的带分数，100 有 11 种表示法。  \\n', '从标准输入读入一个正整数N (N<1000000)\\n', '程序输出该数字用数码1~9不重复不遗漏地组成带分数表示的全部种数。\\n\\n注意：不要求输出每个表示，只统计有多少表示法！\\n', '100', '11', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1059', '第K小的取法', '1000', '32768', '29', '29', '给定一个含n个数的数组。现在从中取出一些数。并把这些数相加得出一个和。求所有取法对应的和中第K小的和。\\n', '第一行包括两个正整数n(1<=20)和k(1<=k<=2^n - 1)。\\n第二行是n个正整数，每个正整数保证在int型的范围内。\\n', '输出第K小的和。结果占一行。\\n\\n', '3 3\\n1 2 7\\n', '3\\n\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1060', '实数取模', '1000', '32768', '42', '42', '定两个实数a,b，计算a对b取模的结果。\\n', '入只有一行，包括两个实数a,b，均在double型范围内，数据保证b不为0。\\n', '出取模的结果，结果保留两位小数，每个结果占一行。\\n', '1.5 0.3\\n', '0.00\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1061', '买不到的数目', '1000', '32768', '29', '29', '买不到的数目\\n问题描述：\\n小明开了一家糖果店。他别出心裁：把水果糖包成4颗一包和7颗一包的两种。糖果不能拆包卖。\\n\\n小朋友来买糖的时候，他就用这两种包装来组合。当然有些糖果数目是无法组合出来的，比如要买 10 颗糖。\\n\\n你可以用计算机测试一下，在这种包装情况下，最大不能买到的数量是17。大于17的任何数字都可以用4和7组合出来。\\n\\n本题的要求就是在已知两个包装的数量时，求最大不能组合出的数字。如果不存在，则输出-1。\\n', '两个正整数，表示每种包装中糖的颗数(都不多于1000000000)\\n', '一个正整数，表示最大不能买到的糖数\\n', '4 7', '17', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1062', '变态跳台阶', '1000', '32768', '40', '40', '一只青蛙一次可以跳上1级台阶，也可以跳上2级……它也可以跳上n级。求该青蛙跳上一个n级的台阶总共有多少种跳法。', '输入可能包含多个测试样例，对于每个测试案例，\\n输入包括一个整数n(1<=n<=50)。', '对应每个测试案例，\\n输出该青蛙跳上一个n级的台阶总共有多少种跳法。', '6', '3', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1063', '抽签', '1000', '32768', '36', '36', '你的一位朋友提议玩一个游戏：将写有数字的n个纸片放入口袋，你可以从口袋中抽取4次纸片，每次记下纸片上的数字后都将其放回口袋中。如果这四个数字的和是m，就是你赢，否则就是你的朋友赢。你挑战了好几回，结果一次也没赢过，于是怒而撕破口袋，取出所有纸片，检查自己是否真的有赢的可能性。请你编一个程序，判断当纸片上所写的数字是K1,K2,K3...Kn时，是否存在抽取四次和为m的方案。如果存在，输出Yes；否则，输出No。\\n', '第一行，一个整数n。(1<=n<=1000)\\n第二行，一个整数m。(1<=m<=10^8)\\n第三行，n个整数Ki。(1<=Ki<=10^8)\\n', '\\n如果存在，输出Yes；否则，输出No。结果占一行。\\n', '3\\n10\\n1 3 5', 'Yes', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1064', '货币面值', '1000', '32768', '28', '28', '小虎是游戏中的一个国王，在他管理的国家中发行了很多不同面额的纸币，用这些纸币进行任意的组合可以在游戏中购买各种装备来提升自己。有一天，他突然很想知道这些纸币的组合不能表示的最小面额是多少，请聪明的你来帮助小虎来解决这个财政问题吧。', '输入包含多个测试用例，每组测试用例的第一行输入一个整数N（N<=1000000）表示流通的纸币面额数量，第二行是N个纸币的具体表示面额，取值[1，1000000000]。', '对于每组测试用例，输出一个整数，表示已经发行的所有纸币都不能表示的最小面额（已经发行的每个纸币面额最多只能使用一次,但面值可能有重复）。', '5\\n1 2 3 9 100', '7', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1065', '部分错排问题', '1000', '32768', '28', '28', '国庆期间,省城HZ刚刚举行了一场盛大的集体婚礼,为了使婚礼进行的丰富一些,司仪临时想出了有一个有意思的节目,叫做\\\"考新郎\\\",具体的操作是这样的:\\n首先,给每位新娘打扮得几乎一模一样,并盖上大大的红盖头随机坐成一排;\\n然后,让各位新郎寻找自己的新娘.每人只准找一个,并且不允许多人找一个.\\n最后,揭开盖头,如果找错了对象就要当众跪搓衣板...\\n\\n看来做新郎也不是容易的事情...\\n\\n假设一共有N对新婚夫妇,其中有M个新郎找错了新娘,求发生这种情况一共有多少种可能.\\n \\n', '输入包含两个整数N和M(1<M<=N<=20)。\\n \\n', '请输出一共有多少种发生这种情况的可能，输出占一行。\\n \\n', '2 2\\n\\n \\n', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1066', '首尾相连数组的最大子数组和', '1000', '32768', '34', '34', '给定一个由N个整数元素组成的数组arr，数组中有正数也有负数，这个数组不是一般的数组，其首尾是相连的。数组中一个或多个连续元素可以组成一个子数组，其中存在这样的子数组arr[i],…arr[n-1],arr[0],…,arr[j]，现在请你这个ACM_Lover用一个最高效的方法帮忙找出所有连续子数组和的最大值（如果数组中的元素全部为负数，则最大和为0，即一个也没有选）。', '输入包含多个测试用例，每个测试用例共有两行，第一行是一个整数n（1=<n<=1000000），表示数组的长度，第二行依次输入n个整数（整数绝对值不大于100）。', '对于每个测试用例，请输出子数组和的最大值。', '6\\n1 -2 3 5 -1 2', '1', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1067', '骨牌铺方格', '1000', '32768', '31', '31', '在2×n的一个长方形方格中,用一个1× 2的骨牌铺满方格,输入n ,输出铺放方案的总数.\\n例如n=3时,为2× 3方格，骨牌的铺放方案有三种,如下图：\\n', '输入包含一个整数n,表示该测试实例的长方形方格的规格是2×n (0<n<=50)。\\n ', '请输出铺放方案的总数，输出占一行。\\n \\n', '3\\n ', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1068', '倒序输出', '1000', '32768', '39', '39', '        给定一个数字N，M，递减打印最大的N位数到1的前M个数，例如给定2 5，则打印99 98 97 96 95。\\n    ', '	输入一个数字n,m。(n<=10^3,1<=m<=min(10^n,10^3))\\n', '\\n        依次递减打印最大N位数的前m个数，每个数都占一行。\\n', '1 9\\n', '9\\n8\\n7\\n6\\n5\\n4\\n3\\n2\\n1\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1069', '后a位数', '1000', '32768', '44', '44', '输入两个整数，输出x^y的后a位数。\\n', '数据包含3个正整数x,y,a。(1<=x<=10^10000，1<=y<=10^9,1<=a<=9)。\\n', '输出x^y的后a位数,不足a位用0补齐，每个结果占一行。\\n', '2 1 1\\n', '2', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1070', '折线分割平面', '1000', '32768', '22', '22', '我们看到过很多直线分割平面的题目，今天的这个题目稍微有些变化，我们要求的是n条折线分割平面的最大数目。比如，一条折线可以将平面分成两部分，两条折线最多可以将平面分成7部分，具体如下所示。\\n\\n', '每行包含一个整数n(0<n<=10000),表示折线的数量。\\n\\n ', '请输出平面的最大分割数，每个实例的输出占一行。\\n\\n \\n', '1\\n', '2\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1071', '数组中第K小的数字', '1000', '32768', '36', '36', '给定两个整型数组A和B。我们将A和B中的元素两两相加可以得到数组C。\\n譬如A为[1,2]，B为[3,4].那么由A和B中的元素两两相加得到的数组C为[4,5,5,6]。\\n现在给你数组A和B，求由A和B两两相加得到的数组C中，第K小的数字。', '输入的第一行为三个整数m，n， k(1<=m,n<=100000， 1<= k <= n *m)：n，m代表将要输入数组A和B的长度。\\n紧接着两行， 分别有m和n个数， 代表数组A和B中的元素。数组元素范围为[0,1e9]。\\n', '输出由A和B中元素两两相加得到的数组c中第K小的数字。\\n', '2 2 3\\n1 2\\n3 4\\n', '5', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1072', '方阵取数', '1000', '32768', '27', '27', '给出一个n*n的方阵，每个元素为整数。在这n*n的矩阵中取出n个元素，这n个元素中的任意两个元素既不能在同一行，也不能在同一列。\\n求取出的这n个数的和的最大值。\\n', '\\n第一行是一个整数n,表示接下来会给出n*n的方阵\\n接下来有n行，每行有n列。\\n方阵每个元素的范围是[1,10^9],n的范围是[1,14]。\\n', '输出每个方阵取出n个数的和的最大值。\\n输出占一行。\\n', '3\\n1 2 3\\n4 6 5\\n9 7 8\\n\\n', '18', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1073', '最大值最小化', '1000', '32768', '32', '32', '在印刷术发明之前，复制一本书是一个很困难的工作，工作量很大，而且需要大家的积极配合来抄写一本书，团队合作能力很重要。\\n当时都是通过招募抄写员来进行书本的录入和复制工作的, 假设现在要抄写m本书，编号为1,2,3...m, 每本书有1<=x<=100000页， 把这些书分配给k个抄写员，要求分配给某个抄写员的那些书的编号必须是连续的，每本书只能被一个抄写员抄写。每个抄写员的速度是相同的，你的任务就是找到一个最佳的分配方案，使得所有书能够被抄完的前提下，每个抄写员所抄写的页数最少。', '在第一行中，有两个整数m和 k， 1<=k<=m<=500。 在第二行中，有m个整数xi用空格分隔。 所有这些值都为正且小于100000。', '输出一行数字，代表最佳的分配方案全部抄写完毕每个抄写员所抄写的页数。', '9 3\\n100 200 300 400 500 600 700 800 900\\n', '1700', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1074', '汉诺塔II', '1000', '32768', '41', '41', '经典的汉诺塔问题经常作为一个递归的经典例题存在。可能有人并不知道汉诺塔问题的典故。汉诺塔来源于印度传说的一个故事，上帝创造世界时作了三根金刚石柱子，在一根柱子上从下往上按大小顺序摞着64片黄金圆盘。上帝命令婆罗门把圆盘从下面开始按大小顺序重新摆放在另一根柱子上。并且规定，在小圆盘上不能放大圆盘，在三根柱子之间一回只能移动一个圆盘。有预言说，这件事完成时宇宙会在一瞬间闪电式毁灭。也有人相信婆罗门至今仍在一刻不停地搬动着圆盘。恩，当然这个传说并不可信，如今汉诺塔更多的是作为一个玩具存在。Gardon就收到了一个汉诺塔玩具作为生日礼物。 \\n　　Gardon是个怕麻烦的人（恩，就是爱偷懒的人），很显然将64个圆盘逐一搬动直到所有的盘子都到达第三个柱子上很困难，所以Gardon决定作个小弊，他又找来了一根一模一样的柱子，通过这个柱子来更快的把所有的盘子移到第三个柱子上。下面的问题就是：当Gardon在一次游戏中使用了N个盘子时，他需要多少次移动才能把他们都移到第三个柱子上？很显然，在没有第四个柱子时，问题的解是2^N-1，但现在有了这个柱子的帮助，又该是多少呢？\\n \\n', '输入一个整数，代表盘子的数目N(1<=N<=64)。\\n \\n', '输出一个数，到达目标需要的最少的移动数。\\n \\n\\n', '12', '81\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1075', ' 矩阵翻转 ', '1000', '32768', '0', '0', 'Ciel有一个N*N的矩阵，每个格子里都有一个整数。\\n\\nN是一个奇数，设X = (N+1)/2。Ciel每次都可以做这样的一次操作：他从矩阵选出一个X*X的子矩阵，并将这个子矩阵中的所有整数都乘以-1。\\n\\n现在问你经过一些操作之后，矩阵中所有数的和最大可以为多少。\\n', '第一行为一个正整数N。\\n\\n接下来N行每行有N个整数，表示初始矩阵中的数字。每个数的绝对值不超过1000。\\n', '输出一个整数，表示操作后矩阵中所有数之和的最大值。', '3\\n-1 -1 1\\n-1 1 -1\\n1 -1 -1', '9', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1076', '绝对值排序', '1000', '32768', '0', '0', '输入n(n<=1000000)个整数，按照绝对值从大到小稳定排序后输出。\\n', '每行的第一个数字为n,接着是n个整数,每个整数均在int型的范围内。 \\n \\n', '输出排序后的结果，两个数之间用一个空格隔开。结果占一行。\\n \\n', '3 3 -4 2\\n', '-4 3 2\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1077', '翻硬币', '1000', '32768', '0', '0', '小明正在玩一个“翻硬币”的游戏。\\n\\n桌上放着排成一排的若干硬币。我们用 * 表示正面，用 o 表示反面（是小写字母，不是零）。\\n\\n比如，可能情形是：**oo***oooo\\n\\n如果同时翻转左边的两个硬币，则变为：oooo***oooo\\n\\n现在小明的问题是：如果已知了初始状态和要达到的目标状态，每次只能同时翻转相邻的两个硬币,那么对特定的局面，最少要翻动多少次呢？\\n\\n我们约定：把翻动相邻的两个硬币叫做一步操作，那么要求：\\n', '两行等长的字符串，分别表示初始状态和要达到的目标状态。每行的长度<5000000\\n', '一个整数，表示最小操作步数，如果无法做到则输出“NO”。\\n', '**********\\no****o****', '5', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1078', '位操作练习', '1000', '32768', '0', '0', '给出两个不大于65535的非负整数，判断其中一个的16位二进制表示形式，是否能由另一个的16位二进制表示形式经过循环左移若干位而得到。\\n\\n循环左移和普通左移的区别在于：最左边的那一位经过循环左移一位后就会被移到最右边去。比如：\\n1011 0000 0000 0001 经过循环左移一位后，变成 0110 0000 0000 0011, 若是循环左移2位，则变成 1100 0000 0000 0110', '每行有两个不大于65535的非负整数', '对于每一行的两个整数，输出一行，内容为YES或NO', '2 4', 'YES', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1079', '分糖果', '1000', '32768', '0', '0', '给从左至右排好队的小朋友们分糖果，\\n要求：\\n1.每个小朋友都有一个得分，任意两个相邻的小朋友，得分较高的所得的糖果必须大于得分较低的，相等则不作要求。\\n2.每个小朋友至少获得一个糖果。\\n求，至少需要的糖果数。', '输入由一个整数n（1<=n<=100000）开头，接下去一行包含n个整数，代表每个小朋友的分数Si（1<=Si<=10000）。', '输出一个整数，代表至少需要的糖果数。', '3\\n1 10 1', '4', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1080', '搬水果', '1000', '32768', '0', '0', '    在一个果园里，小明已经将所有的水果打了下来，并按水果的不同种类分成了若干堆，小明决定把所有的水果合成一堆。每一次合并，小明可以把两堆水果合并到一起，消耗的体力等于两堆水果的重量之和。当然经过 n‐1 次合并之后，就变成一堆了。小明在合并水果时总共消耗的体力等于每次合并所耗体力之和。\\n    假定每个水果重量都为 1，并且已知水果的种类数和每种水果的数目，你的任务是设计出合并的次序方案，使小明耗费的体力最少，并输出这个最小的体力耗费值。例如有 3 种水果，数目依次为 1，2，9。可以先将 1，2 堆合并，新堆数目为3，耗费体力为 3。然后将新堆与原先的第三堆合并得到新的堆，耗费体力为 12。所以小明总共耗费体力=3+12=15，可以证明 15 为最小的体力耗费值。', '    输入的第一行是一个整数 n(1<=n<=10000),表示水果的种类数。第二行包含 n 个整数，用空格分隔，第 i 个整数(1<=ai<=1000)是第 i 种水果的数目。', '输出一个整数并换行，这个值也就是最小的体力耗费值。输入数据保证这个值小于 2^31。', '3\\n9 1 2', '1', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1081', '数组中的逆序对', '1000', '32768', '0', '0', '在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。', '每个测试案例包括两行：\\n第一行包含一个整数n，表示数组中的元素个数。其中1 <= n <= 10^3。\\n第二行包含n个整数，每个数组均为int类型。', '对应每个测试案例，输出一个整数，表示数组中的逆序对的总数。', '4\\n7 5 6 4', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1082', '最大连续子序列乘积', '1000', '32768', '0', '0', '给定一个浮点数序列（可能有正数、0和负数），求出一个最大的连续子序列乘积。\\n', '输入的第一行仅包含正整数 n（n<=1000000），表示浮点数序列的个数。\\n第二行输入n个浮点数用空格分隔。\\n输入数据保证所有数字乘积在双精度浮点数表示的范围内。', '输出序列中最大的连续子序列乘积，若乘积为浮点数请保留2位小数，如果乘积为整数，则输出整数，如果最大乘积为负数，输出-1。\\n\\n样例输入：\\n7\\n-2.5 4 0 3 0.5 8 -1\\n样例输出：\\n1', '最大连续子序列乘积\\n题目描述：\\n给定一个浮点数序列（可能有正数、0和负数），求出一个最大的连续子序列乘积。\\n\\n输入格式：\\n输入的第一行仅包含正整数 n（n<=1000000），表示浮点数序列的个数。\\n第二行输入n个浮点数用空格分隔。\\n输入数据保证所有数字乘积在双精度浮点数表示的范围内。\\n输出格式：\\n输出序列中最大的连续子序列乘积，若乘积为浮点数请保留2位小数，如果乘积为整数，则输出整数，如果最大乘积为负数，输出-1。\\n\\n样例输入：\\n7\\n-2.5 4 0 3 0.5 8 -1\\n样例输出：\\n1', '最大连续子序列乘积\\n题目描述：\\n给定一个浮点数序列（可能有正数、0和负数），求出一个最大的连续子序列乘积。\\n\\n输入格式：\\n输入的第一行仅包含正整数 n（n<=1000000），表示浮点数序列的个数。\\n第二行输入n个浮点数用空格分隔。\\n输入数据保证所有数字乘积在双精度浮点数表示的范围内。\\n输出格式：\\n输出序列中最大的连续子序列乘积，若乘积为浮点数请保留2位小数，如果乘积为整数，则输出整数，如果最大乘积为负数，输出-1。\\n\\n样例输入：\\n7\\n-2.5 4 0 3 0.5 8 -1\\n样例输出：\\n12', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1083', '水仙花数', '1000', '32768', '0', '0', '春天是鲜花的季节，水仙花就是其中最迷人的代表，数学上有个水仙花数，他是这样定义的：\\n“水仙花数”是指一个三位数，它的各位数字的立方和等于其本身，比如：153=1^3+5^3+3^3。\\n现在要求输出所有在m和n范围内的水仙花数。\\n \\n', '输入占一行，包括两个整数m和n（100<=m<=n<=999）。\\n \\n', '输出所有在给定范围内的水仙花数，就是说，输出的水仙花数必须大于等于m,并且小于等于n，如果有多个，则要求从小到大排列在一行内输出，之间用一个空格隔开;\\n如果给定的范围内不存在水仙花数，则输出no;\\n每个测试实例的输出占一行。\\n \\n\\n样例输入：\\n100 120\\n\\n样例输出：\\nn', '水仙花数\\n\\n题目描述：\\n春天是鲜花的季节，水仙花就是其中最迷人的代表，数学上有个水仙花数，他是这样定义的：\\n“水仙花数”是指一个三位数，它的各位数字的立方和等于其本身，比如：153=1^3+5^3+3^3。\\n现在要求输出所有在m和n范围内的水仙花数。\\n \\n\\n输入格式：\\n输入占一行，包括两个整数m和n（100<=m<=n<=999）。\\n \\n\\n输出格式：\\n输出所有在给定范围内的水仙花数，就是说，输出的水仙花数必须大于等于m,并且小于等于n，如果有多个，则要求从小到大排列在一行内输出，之间用一个空格隔开;\\n如果给定的范围内不存在水仙花数，则输出no;\\n每个测试实例的输出占一行。\\n \\n\\n样例输入：\\n100 120\\n\\n样例输出：\\nn', '水仙花数\\n\\n题目描述：\\n春天是鲜花的季节，水仙花就是其中最迷人的代表，数学上有个水仙花数，他是这样定义的：\\n“水仙花数”是指一个三位数，它的各位数字的立方和等于其本身，比如：153=1^3+5^3+3^3。\\n现在要求输出所有在m和n范围内的水仙花数。\\n \\n\\n输入格式：\\n输入占一行，包括两个整数m和n（100<=m<=n<=999）。\\n \\n\\n输出格式：\\n输出所有在给定范围内的水仙花数，就是说，输出的水仙花数必须大于等于m,并且小于等于n，如果有多个，则要求从小到大排列在一行内输出，之间用一个空格隔开;\\n如果给定的范围内不存在水仙花数，则输出no;\\n每个测试实例的输出占一行。\\n \\n\\n样例输入：\\n100 120\\n\\n样例输出：\\nno', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1084', '简单计算器', '1000', '32768', '0', '0', '    读入一个只包含 +, -, *, / 的非负整数计算表达式，计算该表达式的值。\\n', '    输入占一行，不超过400个字符。运算符左右都有一个空格，没有非法表达式。\\n', '    对每个测试用例输出1行，即该表达式的值，精确到小数点后2位。\\n', '1 + 2\\n4 + 2 * 5 - 7 / 11\\n', '3.00\\n13.3', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1085', '高精度取模', '1000', '32768', '0', '0', '正如我们所知道的，大整数的运算总是非常令人烦恼，但是它对于我们的OI比赛很重要，今天，你的任务就是写一个程序去计算A%B，为了使得问题更简单，保证B不大于100000，这个难吗？肯定不难，我花了10分钟就解决了，而且我的程序不超过25行。\\n', '输入正整数A和B，A的位数不超过100000，B的大小不超过100000。即0<A<=10^100000,0<B<=100000。\\n', '输出A%B的结果。结果占一行。\\n', '152455856554521 9999\\n', '4887', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1086', 'N！', '1000', '32768', '0', '0', '给定一个N，你的任务是计算N！\\n', '个N。(0<=N<=10000)\\n', '！\\n\\n\\n\\n\\n输出样例：\\n100\\n\\n输出样例：\\n933262154439441526816992388562667004907159682643816214685929638952175999932299156089414639761565182862536979208272237582511852109168640000000000000000000000', 'N！\\n\\n题目描述：\\n给定一个N，你的任务是计算N！\\n\\n输入格式：一个N。(0<=N<=10000)\\n\\n输出格式：N！\\n\\n\\n\\n', '100\\n\\n输出样例：\\n9332621544394415268169923885626670049071596826438162146859296389521759999322991560894146397615651828625369792082722375825118521091686400000000000000000000000', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1087', '鸡兔同笼', '1000', '32768', '0', '0', '一个笼子里面关了鸡和兔子（鸡有2只脚，兔子有4只脚，没有例外）。已经知道了笼子里面脚的总数a，问笼子里面至少有多少只动物，至多有多少只动物。', '每组测试数据占1行，每行一个正整数a (a < 32768)', '输出包含两个正整数，第一个是最少的动物数，第二个是最多的动物数，两个正整数用一个空格分开\\n如果没有满足要求的答案，则输出两个0。\\n', '20', '5 1', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1088', ' 2的次幂表示 ', '1000', '32768', '0', '0', '　　任何一个正整数都可以用2进制表示，例如：137的2进制表示为10001001。\\n　　将这种2进制表示写成2的次幂的和的形式，令次幂高的排在前面，可得到如下表达式：137=2^7+2^3+2^0\\n　　现在约定幂次用括号来表示，即a^b表示为a（b）\\n　　此时，137可表示为：2（7）+2（3）+2（0）\\n　　进一步：7=2^2+2+2^0 （2^1用2表示）\\n　　3=2+2^0 \\n　　所以最后137可表示为：2（2（2）+2+2（0））+2（2+2（0））+2（0）\\n　　又如：1315=2^10+2^8+2^5+2+1\\n　　所以1315最后可表示为：\\n　　2（2（2+2（0））+2）+2（2（2+2（0）））+2（2（2）+2（0））+2+2（0）', '　　正整数（1<=n<=20000）', '　　符合约定的n的0，2表示（在表示中不能有空格）', '137', '2(2(2)+2+2(0))+2(2+2(0))+2(0)', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1089', 'A变B', '1000', '32768', '0', '0', '给定两个正整数A,B（十进制）（0<A,B<2^31），把A，B转成二进制数表示后，问把A变成B至少需要改变多少位？\\n例如：A=3，B=6，则A,B对应的二进制数分别是011,110，显然，把A的二进制变成B的二进制至少需要改变两位。', '输入两个正整数A,B（0<A,B<2^31），输入有多组数据。\\n', '输出把A变成B至少需要改变多少位，每个数占一行。\\n', '1 14', '2\\n\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1090', '亲和数', '1000', '32768', '0', '0', '古希腊数学家毕达哥拉斯在自然数研究中发现，220的所有真约数(即不是自身的约数)之和为： \\n\\n1+2+4+5+10+11+20+22+44+55+110＝284。 \\n\\n而284的所有真约数为1、2、4、71、 142，加起来恰好为220。人们对这样的数感到很惊奇，并称之为亲和数。一般地讲，如果两个数中任何一个数都是另一个数的真约数之和，则这两个数就是亲和数。 \\n\\n你的任务就编写一个程序，判断给定的两个数是否是亲和数\\n \\n', '输入数据每行包含两个整数A,B； 其中 0 <= A,B <= 600000 ;\\n \\n', '对于每个测试实例，如果A和B是亲和数的话输出YES，否则输出NO。\\n \\n', '220 284\\n输出格式：\\nYE', '亲和数\\n\\n\\n题目描述：\\n古希腊数学家毕达哥拉斯在自然数研究中发现，220的所有真约数(即不是自身的约数)之和为： \\n\\n1+2+4+5+10+11+20+22+44+55+110＝284。 \\n\\n而284的所有真约数为1、2、4、71、 142，加起来恰好为220。人们对这样的数感到很惊奇，并称之为亲和数。一般地讲，如果两个数中任何一个数都是另一个数的真约数之和，则这两个数就是亲和数。 \\n\\n你的任务就编写一个程序，判断给定的两个数是否是亲和数\\n \\n\\n输入格式：\\n输入数据每行包含两个整数A,B； 其中 0 <= A,B <= 600000 ;\\n \\n\\n输出格式：\\n对于每个测试实例，如果A和B是亲和数的话输出YES，否则输出NO。\\n \\n\\n输入样例：\\n220 284\\n输出格式：\\nYES', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1091', '分数二维数组之和', '1000', '32768', '0', '0', '我们定义如下矩阵:\\n1/1 1/2 1/3\\n1/2 1/1 1/2\\n1/3 1/2 1/1\\n矩阵对角线上的元素始终是1/1，对角线两边分数的分母逐个递增。\\n请求出这个矩阵的总和。\\n \\n', '每行给定正整数N (N<50000)，表示矩阵为 N*N。\\n \\n', '输出答案，保留2位小数。\\n \\n', '4', '8.8', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1092', '单词数', '1000', '32768', '0', '0', 'lily的好朋友xiaoou333最近很空，他想了一件没有什么意义的事情，就是统计一篇文章里不同单词的总数。下面你的任务是帮助xiaoou333解决这个问题。\\n \\n', '每组一行，每组就是一篇小文章。每篇小文章都是由小写字母和空格组成，没有标点符号，字符串长度不超过4000。\\n \\n', '每组只输出一个整数，其单独成行，该整数代表一篇文章里不同单词的总数。\\n \\n', 'you are my friend\\n \\n', '', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1093', '幸运数  ', '1000', '32768', '0', '0', '幸运数是波兰数学家乌拉姆命名的。它采用与生成素数类似的“筛法”生成\\n\\n。\\n首先从1开始写出自然数1,2,3,4,5,6,....\\n\\n1 就是第一个幸运数。\\n\\n我们从2这个数开始。把所有序号能被2整除的项删除，变为：\\n\\n1 _ 3 _ 5 _ 7 _ 9 ....\\n\\n把它们缩紧，重新记序，为：\\n\\n1 3 5 7 9 .... 。这时，3为第2个幸运数，然后把所有能被3整除的序号位置的数删去。注意，是序号位置，不是那个数本身能否被3整除!! 删除的应该是5，11, 17, ...\\n\\n此时7为第3个幸运数，然后再删去序号位置能被7整除的(19,39,...)\\n\\n最后剩下的序列类似：\\n\\n1, 3, 7, 9, 13, 15, 21, 25, 31, 33, 37, 43, 49, 51, 63, 67, 69, 73, 75, 79, ...\\n', '输入两个正整数m n, 用空格分开 (m < n < 1000*1000)', '程序输出 位于m和n之间的幸运数的个数（不包含m和n）。', '1 20', '5', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1094', '排列数  ', '1000', '32768', '0', '0', '　　0、1、2三个数字的全排列有六种，按照字母序排列如下：\\n　　012、021、102、120、201、210\\n　　输入一个数n\\n　　求0~9十个数的全排列中的第n个（第1个为0123456789）。', '　　一行，包含一个整数n', '　　一行，包含一组10个数字的全排列', '1', '0123456789', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1095', '蚂蚁感冒', '1000', '32768', '0', '0', '　　长100厘米的细长直杆子上有n只蚂蚁。它们的头有的朝左，有的朝右。\\n\\n　　每只蚂蚁都只能沿着杆子向前爬，速度是1厘米/秒。\\n\\n　　当两只蚂蚁碰面时，它们会同时掉头往相反的方向爬行。\\n\\n　　这些蚂蚁中，有1只蚂蚁感冒了。并且在和其它蚂蚁碰面时，会把感冒传染给碰到的蚂蚁。\\n\\n　　请你计算，当所有蚂蚁都爬离杆子时，有多少只蚂蚁患上了感冒。', '　　第一行输入一个整数n (1 < n < 50), 表示蚂蚁的总数。\\n\\n　　接着的一行是n个用空格分开的整数 Xi (-100 < Xi < 100), Xi的绝对值，表示蚂蚁离开杆子左边端点的距离。正值表示头朝右，负值表示头朝左，数据中不会出现0值，也不会出现两只蚂蚁占用同一位置。其中，第一个数据代表的蚂蚁感冒了。', '　　要求输出1个整数，表示最后感冒蚂蚁的数目。\\n', '3\\n5 -2 8', '1', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1096', '讨厌62', '1000', '32768', '0', '0', '杭州人称那些傻乎乎粘嗒嗒的人为62（音：laoer）。\\n杭州交通管理局经常会扩充一些的士车牌照，新近出来一个好消息，以后上牌照，不再含有不吉利的数字了，这样一来，就可以消除个别的士司机和乘客的心理障碍，更安全地服务大众。\\n不吉利的数字为所有含有4或62的号码。例如：\\n62315 73418 88914\\n都属于不吉利号码。但是，61152虽然含有6和2，但不是62连号，所以不属于不吉利数字之列。\\n你的任务是，对于每次给出的一个牌照区间号，推断出交管局今次又要实际上给多少辆新的士车上牌照了。\\n \\n', '输入的都是整数对n、m（0<n≤m<1000000）。\\n ', '对于每个整数对，输出一个不含有不吉利数字的统计个数，该数值占一行位置。\\n \\n', '1 100\\n', '8', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1097', '错误票据  ', '1000', '32768', '0', '0', '某涉密单位下发了某种票据，并要在年终全部收回。\\n\\n每张票据有唯一的ID号。全年所有票据的ID号是连续的，但ID的开始数码是随机选定的。\\n\\n因为工作人员疏忽，在录入ID号的时候发生了一处错误，造成了某个ID断号，另外一个ID重号。\\n\\n你的任务是通过编程，找出断号的ID和重号的ID。\\n\\n假设断号不可能发生在最大和最小号。\\n', '要求程序首先输入一个整数N(N<100)表示后面数据行数。\\n\\n接着读入N行数据。\\n\\n每行数据长度不等，是用空格分开的若干个（不大于100个）正整数（不大于100000），请注意行内和行末可能有多余的空格，你的程序需要能处理这些空格。\\n\\n每个整数代表一个ID号。\\n', '要求程序输出1行，含两个整数m n，用空格分隔。\\n\\n其中，m表示断号ID，n表示重号ID\\n', '6\\n164 178 108 109 180 155 141 159 104 182 179 118 137 184 115 124 125 129 168 196\\n172 189 127 107 112 192 103 131 133 169 158 \\n128 102 110 148 139 157 140 195 197\\n185 152 135 106 123 173 122 136 174 191 145 116 151 143 175 120 161 134 162 190\\n149 138 142 146 199 126 165 156 153 193 144 166 170 121 171 132 101 194 187 188\\n113 130 176 154 177 120 117 150 114 183 186 181 100 163 160 167 147 198 111 119', '105 120\\n', '吴迎', 'TCOJ', '1');
INSERT INTO `problem` VALUES ('1098', 'Find Q', '1000', '32768', '0', '0', 'Byteasar迷恋上了q这个字母。\\n\\n在他眼前有一个小写字母组成的字符串SS，他想找出SS的所有仅包含字母q的连续子串。\r\n但是这个字符串实在是太长了，你能写个程序帮助他吗？								', '输入包含一行一个小写字母组成字符串S，保证S的长度不超过100000。								', '输出一行一个整数，即仅包含字母q的连续子串的个数。\\n\\n								', 'quailtyqqq								', '7\\n								', '吴迎', 'TCOJ', '1');

-- ----------------------------
-- Table structure for problem_label
-- ----------------------------
DROP TABLE IF EXISTS `problem_label`;
CREATE TABLE `problem_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of problem_label
-- ----------------------------
INSERT INTO `problem_label` VALUES ('1', '1000', '1');
INSERT INTO `problem_label` VALUES ('2', '1001', '1');
INSERT INTO `problem_label` VALUES ('3', '1002', '2');
INSERT INTO `problem_label` VALUES ('4', '1003', '2');
INSERT INTO `problem_label` VALUES ('5', '1000', '2');
INSERT INTO `problem_label` VALUES ('6', '1003', '2');
INSERT INTO `problem_label` VALUES ('7', '1001', '5');
INSERT INTO `problem_label` VALUES ('8', '1006', '2');
INSERT INTO `problem_label` VALUES ('9', '1010', '7');
INSERT INTO `problem_label` VALUES ('10', '1008', '1');
INSERT INTO `problem_label` VALUES ('11', '1003', '14');
INSERT INTO `problem_label` VALUES ('12', '1004', '14');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wuying', 'wuying', '1', '1', '2548', '2554', '93', '江西师范大学', '88', '哈哈哈', '529194793@qq.com', '吴迎迎', '物联网', '吴迎', '0');
INSERT INTO `user` VALUES ('2', 'admin', 'adminjxnuacm', '1', '2', '7', '9', '2', '0', '2', '', '738949377@qq.com', 'ACM', '', '管理员', '0');
INSERT INTO `user` VALUES ('3', 'lixiaoke', 'shishabi', '1', '0', '0', '0', '0', '0', '0', '', '13027217007@163.com', '李晓科', '', '李晓科', '0');
INSERT INTO `user` VALUES ('4', 'test', 'testtest', '1', '0', '0', '0', '0', 'JXNU', '0', '哈哈', '18046710234@163.com', 'test', '计算机', 'test', '1461199967');

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
INSERT INTO `user_problem` VALUES ('2547', '1', '1000', '1488249477', '0', '108', '0', '51', 'C++', 'JXNU', 'code/wuying/1000_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2548', '1', '1001', '1488249492', '10', '38', '0', '51', 'C++', 'JXNU', 'code/wuying/1001_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2549', '1', '1002', '1488249503', '9', '40', '0', '51', 'C++', 'JXNU', 'code/wuying/1002_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2550', '1', '1003', '1488249513', '9', '44', '0', '51', 'C++', 'JXNU', 'code/wuying/1003_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2551', '1', '1004', '1488249524', '7', '37', '0', '51', 'C++', 'JXNU', 'code/wuying/1004_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2552', '1', '1005', '1488249535', '6', '39', '0', '51', 'C++', 'JXNU', 'code/wuying/1005_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2553', '1', '1006', '1488249545', '5', '41', '0', '51', 'C++', 'JXNU', 'code/wuying/1006_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2554', '1', '1007', '1488249555', '4', '37', '0', '51', 'C++', 'JXNU', 'code/wuying/1007_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2555', '1', '1008', '1488249567', '3', '38', '0', '51', 'C++', 'JXNU', 'code/wuying/1008_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2556', '1', '1009', '1488249576', '2', '41', '0', '51', 'C++', 'JXNU', 'code/wuying/1009_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2557', '1', '1010', '1488249585', '1', '40', '0', '51', 'C++', 'JXNU', 'code/wuying/1010_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2558', '1', '1011', '1488249596', '10', '37', '0', '51', 'C++', 'JXNU', 'code/wuying/1011_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2559', '1', '1012', '1488252107', '10', '38', '0', '3', 'C++', '吴迎_2012_江西师范大学(JXNU)', 'code/wuying/1012_1.cpp', '0');
INSERT INTO `user_problem` VALUES ('2560', '1', '1012', '1488252116', '10', '37', '0', '3', 'C++', '吴迎_2012_江西师范大学(JXNU)', 'code/wuying/1012_2.cpp', '0');
INSERT INTO `user_problem` VALUES ('2561', '1', '1012', '1488252123', '10', '35', '0', '3', 'C++', '吴迎_2012_江西师范大学(JXNU)', 'code/wuying/1012_3.cpp', '0');
INSERT INTO `user_problem` VALUES ('2562', '1', '1001', '1488335168', '8', '0', '0', '29', 'C++', '吴迎_2012_江西师范大学(JXNU)', 'code/wuying/1001_2.cpp', '0');
