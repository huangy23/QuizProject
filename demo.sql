/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 02/01/2023 22:05:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '1', '1');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `massage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `starttime` datetime NULL DEFAULT NULL,
  `endtime` datetime NULL DEFAULT NULL,
  `recordid` int NULL DEFAULT NULL,
  `subjectname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (227, '12345678', '2023-01-02 19:48:42', '2023-01-02 19:52:35', 1, 'math', 'fail');
INSERT INTO `exam` VALUES (234, '12345678', '2023-01-02 20:02:11', '2023-01-02 20:02:34', 2001, 'physics', 'fail');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `grade` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, 'nice', 3);
INSERT INTO `feedback` VALUES (183, 'NICE', 5);
INSERT INTO `feedback` VALUES (202, 'nice', 5);
INSERT INTO `feedback` VALUES (215, 'nice', 4);
INSERT INTO `feedback` VALUES (228, 'nice', 4);

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (237);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int NOT NULL,
  `subjectid` int NULL DEFAULT NULL,
  `userchoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `examid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (222, 25, 'A', 1);
INSERT INTO `record` VALUES (223, 3, 'C', 1);
INSERT INTO `record` VALUES (224, 5, 'B', 1);
INSERT INTO `record` VALUES (225, 5, 'B', 1);
INSERT INTO `record` VALUES (226, 28, 'C', 1);
INSERT INTO `record` VALUES (229, 12, 'B', 2001);
INSERT INTO `record` VALUES (230, 12, 'C', 2001);
INSERT INTO `record` VALUES (231, 10, 'C', 2001);
INSERT INTO `record` VALUES (232, 8, 'B', 2001);
INSERT INTO `record` VALUES (233, 10, 'D', 2001);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `OptionA` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `OptionB` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `OptionC` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `OptionD` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `Answer` varchar(5) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci COMMENT = '试题信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (2, 'The largest of the following bases is ()', '227O', '1FFH', '1010001B', '789D', 'D', 'math');
INSERT INTO `subject` VALUES (3, '() is not a necessary working environment for microcomputers.', 'Constant temperature', 'Good grounding cable', 'Stay away from strong magnetic fields', 'Stable supply voltage', 'A', 'math');
INSERT INTO `subject` VALUES (4, '() is not a file.', 'equipment', 'document', 'Application program', 'window', 'D', 'math');
INSERT INTO `subject` VALUES (5, '() Does not belong to Word2003 document opening.', 'Read-write mode', 'Read-only mode', 'Backup mode', 'System mode', 'D', 'math');
INSERT INTO `subject` VALUES (6, '() The menu contains commands to set fonts.', 'format', 'edit', 'view', 'tool', 'A', 'physics');
INSERT INTO `subject` VALUES (8, 'The function of () is to feed information from outside the computer into the computer.', 'Input device', 'Output device', 'Floppy disk', 'Power cord', 'A', 'physics');
INSERT INTO `subject` VALUES (9, 'The main function of () is to connect the user\'s computer to the remote host and thus become the terminal of the remote host.', 'E-mail', 'FTP', 'Telnet', 'BBS', 'C', 'physics');
INSERT INTO `subject` VALUES (10, 'The () view mode does not paginate the document.', 'ordinary', 'On-line format', 'Page view', 'outline', 'B', 'physics');
INSERT INTO `subject` VALUES (12, '() is the external memory of a microcomputer.', 'RAM', 'ROM', 'disk', 'Virtual disk', 'C', 'physics');
INSERT INTO `subject` VALUES (13, '() is a device for storing programs and data.', 'Input device', 'memory', 'controller', 'Output device', 'B', 'chemistry');
INSERT INTO `subject` VALUES (14, 'NOVELLNETWARE is ()', 'Network operating system', 'Universal operating system', 'Real-time operating system', 'Time-sharing operating system', 'A', 'chemistry');
INSERT INTO `subject` VALUES (15, 'The means to prevent computer virus, wrong is ().', 'Make frequent backups of files on your hard drive\r\n\r\n ', 'Any disk that does not need to write any more data should be write protected', 'I\'m going to take all the dot COM and dot. EXE files are assigned the read-only property', 'Clean the disk', 'D', 'chemistry');
INSERT INTO `subject` VALUES (16, '32 in \"32-bit microcomputer\" refers to ().', 'Microcomputer model', 'Memory capacity', 'Storage unit', 'Machine word length', 'D', 'chemistry');
INSERT INTO `subject` VALUES (17, 'The type of microprocessor used in the Pentium microcomputer is ().', '80286', '80386', '80486', '80586', 'D', 'chemistry');
INSERT INTO `subject` VALUES (18, '\"Drawing\" program is WINDOWS98 an accessory program, can carry out simple graphics processing, the generated file for the bitmap file, extension name ().', 'BMP', 'CRH', 'EXE', 'GPH', 'A', 'chemistry');
INSERT INTO `subject` VALUES (19, 'In the Start menu, the logout command will be ().', 'Shut down system', 'Close the program on the current window', 'Close all open programs', 'None of the above is true', 'C', 'chemistry');
INSERT INTO `subject` VALUES (20, 'The file name displayed at the bottom of the File drop-down menu is ().', 'All files with the extension DOC', 'The file name you want to print', 'The file name being used', 'Documents that have recently been processed by Word', 'D', 'chemistry');
INSERT INTO `subject` VALUES (21, '\"Overflow\" generally refers to the () produced by the computer during the operation.', 'The amount of data exceeds the amount of memory', 'The amount of data exceeds the memory. The number of files exceeds the limit in the disk directory area', 'The number exceeds the range represented by the machine\'s bits', 'The number exceeds the range of the variable', 'C', 'chemistry');
INSERT INTO `subject` VALUES (22, '\"Computer software\" as used in the Computer Software Ordinance means ().', 'Computer program', 'Source program and target program', 'Source program', 'Computer programs and related documentation', 'D', 'chemistry');
INSERT INTO `subject` VALUES (23, '10BaseF means ().', '10Mbps broadband fiber network', '10Mbps baseband coaxial cable network', '10Mbps baseband fiber network', '10Mbps broadband coaxial cable network', 'C', 'chemistry');
INSERT INTO `subject` VALUES (24, 'In a microcomputer, the main machine consists of a microprocessor and ().', 'Arithmetic machine', 'Disk storage', 'Floppy disk memory', 'Internal memory', 'D', 'chemistry');
INSERT INTO `subject` VALUES (25, '1MB of storage capacity equals ().', 'Million bytes', 'Two to the 10th bytes', 'Two to the 20th bytes', '1000KB', 'C', 'math');
INSERT INTO `subject` VALUES (26, 'The layered structure of a 1nternet consists of () this four layer.', 'Application layer, transport layer, communication subnet layer, and physical layer', 'Application layer, presentation layer, transport layer, and network layer', 'The physical layer, data link layer, network layer, and transport layer', 'Network interface layer, network layer, transport layer, and application layer', 'D', 'math');
INSERT INTO `subject` VALUES (27, 'When changing the size of a window in WindowsXP, you should operate ().', 'The four corners or sides of a window', 'The button in the upper right corner of the window', 'Window\'s title bar', 'The control bar in the upper left corner of the window', 'A', 'math');
INSERT INTO `subject` VALUES (28, 'In WindowsXP, the size of the dialog box is ().', 'variable', 'Optionally set', 'fixed', 'It\'s related to different operations', 'D', 'math');
INSERT INTO `subject` VALUES (29, 'Test road test', 'Turn right', 'Turn left', 'forward', 'backward', 'D', 'math');
INSERT INTO `subject` VALUES (214, '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, '$2a$10$o0Hkz5nmAwfDBE/u2bybcOOYa4TT//Ur6jcXsrtk6hhtHDmhJcNDm', '12345678');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKa68196081fvovjhkek5m97n3y`(`role_id`) USING BTREE,
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
