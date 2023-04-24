/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : springbootvue

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 17/04/2023 10:21:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for msg_info
-- ----------------------------
DROP TABLE IF EXISTS `msg_info`;
CREATE TABLE `msg_info`  (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `from_user_id` int(6) NOT NULL COMMENT '消息发送者id',
  `from_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息发送者名称',
  `to_user_id` int(6) NOT NULL COMMENT '消息接收者id',
  `to_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息接收者名称',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `create_time` datetime NOT NULL COMMENT '消息发送时间',
  `un_read_flag` int(1) NOT NULL COMMENT '是否已读（1 已读）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 290 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of msg_info
-- ----------------------------
INSERT INTO `msg_info` VALUES (264, 21, '浩将军', 22, 'W女士', '？\n', '2023-04-14 09:17:14', 1);
INSERT INTO `msg_info` VALUES (265, 22, 'W女士', 21, '浩将军', '新衣服容易起球\n\n', '2023-04-14 09:17:22', 1);
INSERT INTO `msg_info` VALUES (266, 21, '浩将军', 22, 'W女士', 'W女士，你好\n', '2023-04-14 09:17:27', 1);
INSERT INTO `msg_info` VALUES (267, 22, 'W女士', 21, '浩将军', '你好\n', '2023-04-14 09:17:37', 1);
INSERT INTO `msg_info` VALUES (268, 21, '浩将军', 22, 'W女士', '我是浩\n将军', '2023-04-14 09:17:41', 1);
INSERT INTO `msg_info` VALUES (269, 21, '浩将军', 22, 'W女士', ' \n', '2023-04-14 09:17:47', 1);
INSERT INTO `msg_info` VALUES (270, 22, 'W女士', 21, '浩将军', '嘴张开，有急事\n', '2023-04-14 09:17:51', 1);
INSERT INTO `msg_info` VALUES (271, 21, '浩将军', 22, 'W女士', '？\n', '2023-04-15 06:45:36', 0);
INSERT INTO `msg_info` VALUES (272, 22, 'W女士', 21, '浩将军', '。\n', '2023-04-15 06:45:48', 0);
INSERT INTO `msg_info` VALUES (273, 1, 'admin', 2, 'zhangsan', '?\n', '2023-04-16 10:59:06', 1);
INSERT INTO `msg_info` VALUES (274, 18, 'W女士', 17, '浩将军', '？\n\n\n\n', '2023-04-16 12:08:42', 1);
INSERT INTO `msg_info` VALUES (275, 1, 'admin', 2, 'zhangsan', '？？\n', '2023-04-16 13:24:15', 1);
INSERT INTO `msg_info` VALUES (276, 1, 'admin', 18, 'W女士', '？？\n', '2023-04-16 13:26:13', 1);
INSERT INTO `msg_info` VALUES (277, 18, 'W女士', 17, '浩将军', '?\n', '2023-04-16 13:26:32', 1);
INSERT INTO `msg_info` VALUES (278, 1, 'admin', 18, 'W女士', '。。。\n', '2023-04-16 13:26:44', 1);
INSERT INTO `msg_info` VALUES (279, 18, 'W女士', 17, '浩将军', '..\n', '2023-04-16 13:26:50', 1);
INSERT INTO `msg_info` VALUES (280, 1, 'admin', 18, 'W女士', '》》》\n', '2023-04-16 13:38:11', 1);
INSERT INTO `msg_info` VALUES (281, 1, 'admin', 2, 'zhangsan', '、\n\n', '2023-04-16 13:41:50', 1);
INSERT INTO `msg_info` VALUES (282, 1, 'admin', 2, 'zhangsan', '、、\n', '2023-04-16 13:41:57', 1);
INSERT INTO `msg_info` VALUES (283, 18, 'W女士', 1, 'admin', '？\n', '2023-04-16 15:00:31', 1);
INSERT INTO `msg_info` VALUES (284, 1, 'admin11', 18, 'W女士', '、、\n', '2023-04-16 15:00:43', 1);
INSERT INTO `msg_info` VALUES (285, 1, 'admin11', 18, 'W女士', ' \n', '2023-04-16 15:30:54', 1);
INSERT INTO `msg_info` VALUES (286, 1, 'admin11', 18, 'W女士', ' \n', '2023-04-16 15:31:12', 1);
INSERT INTO `msg_info` VALUES (287, 1, 'admin11', 18, 'W女士', ' \n', '2023-04-16 15:31:23', 1);
INSERT INTO `msg_info` VALUES (288, 18, 'W女士', 1, 'admin', '？\n', '2023-04-16 23:08:23', 1);
INSERT INTO `msg_info` VALUES (289, 18, 'W女士', 1, 'admin', '。。\n', '2023-04-16 23:31:17', 0);

-- ----------------------------
-- Table structure for session_list
-- ----------------------------
DROP TABLE IF EXISTS `session_list`;
CREATE TABLE `session_list`  (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(6) NOT NULL COMMENT '所属用户',
  `to_user_id` int(6) NOT NULL COMMENT '到用户',
  `list_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会话名称',
  `un_read_count` int(6) NOT NULL COMMENT '未读消息数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会话列表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of session_list
-- ----------------------------
INSERT INTO `session_list` VALUES (44, 21, 22, 'W女士', 0);
INSERT INTO `session_list` VALUES (45, 22, 21, '浩将军', 0);
INSERT INTO `session_list` VALUES (66, 3, 1, 'admin', 0);
INSERT INTO `session_list` VALUES (68, 10, 1, 'admin', 0);
INSERT INTO `session_list` VALUES (70, 12, 1, 'admin', 0);
INSERT INTO `session_list` VALUES (72, 14, 1, 'admin', 0);
INSERT INTO `session_list` VALUES (74, 16, 1, 'admin', 0);
INSERT INTO `session_list` VALUES (75, 18, 17, '浩将军', 0);
INSERT INTO `session_list` VALUES (78, 16, 17, '浩将军', 0);
INSERT INTO `session_list` VALUES (79, 17, 18, 'W女士', 0);
INSERT INTO `session_list` VALUES (80, 2, 18, 'W女士', 0);
INSERT INTO `session_list` VALUES (81, 18, 2, 'zhangsan', 0);
INSERT INTO `session_list` VALUES (82, 2, 15, 'wqerrwq', 0);
INSERT INTO `session_list` VALUES (83, 15, 2, 'zhangsan', 0);
INSERT INTO `session_list` VALUES (84, 2, 16, '阿斯蒂芬', 0);
INSERT INTO `session_list` VALUES (85, 16, 2, 'zhangsan', 0);
INSERT INTO `session_list` VALUES (86, 2, 17, '浩将军', 0);
INSERT INTO `session_list` VALUES (87, 17, 2, 'zhangsan', 0);
INSERT INTO `session_list` VALUES (89, 18, 1, 'admin', 0);
INSERT INTO `session_list` VALUES (91, 2, 1, 'admin11', 0);
INSERT INTO `session_list` VALUES (93, 1, 4, 'wangwu', 0);
INSERT INTO `session_list` VALUES (94, 4, 1, 'admin11', 0);
INSERT INTO `session_list` VALUES (95, 1, 15, 'wqerrwq', 0);
INSERT INTO `session_list` VALUES (96, 15, 1, 'admin11', 0);
INSERT INTO `session_list` VALUES (97, 1, 16, '阿斯蒂芬', 0);
INSERT INTO `session_list` VALUES (98, 1, 11, '二十士大夫', 0);
INSERT INTO `session_list` VALUES (99, 11, 1, 'admin11', 0);
INSERT INTO `session_list` VALUES (100, 1, 14, 'wqerrwq', 0);
INSERT INTO `session_list` VALUES (104, 9, 1, 'admin11', 0);
INSERT INTO `session_list` VALUES (106, 19, 1, 'admin11', 0);
INSERT INTO `session_list` VALUES (108, 6, 1, 'admin11', 0);
INSERT INTO `session_list` VALUES (112, 17, 1, 'admin11', 0);
INSERT INTO `session_list` VALUES (115, 13, 1, 'admin11', 0);
INSERT INTO `session_list` VALUES (116, 1, 3, 'lisi', 0);
INSERT INTO `session_list` VALUES (117, 1, 18, 'W女士', 2);
INSERT INTO `session_list` VALUES (118, 1, 19, '111', 0);

-- ----------------------------
-- Table structure for x_menu
-- ----------------------------
DROP TABLE IF EXISTS `x_menu`;
CREATE TABLE `x_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `redirect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `is_leaf` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hidden` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_menu
-- ----------------------------
INSERT INTO `x_menu` VALUES (1, 'Layout', '/sys', '/sys/user', 'sysManage', '系统管理', 'userManage', 0, 'N', 0);
INSERT INTO `x_menu` VALUES (2, 'sys/user', 'user', NULL, 'userList', '用户列表', 'user', 1, 'Y', 0);
INSERT INTO `x_menu` VALUES (3, 'sys/role', 'role', NULL, 'roleList', '角色列表', 'roleManage', 1, 'Y', 0);
INSERT INTO `x_menu` VALUES (4, 'Layout', '/test', '/test/test2', 'test', '功能测试', 'form', 0, 'N', 0);
INSERT INTO `x_menu` VALUES (6, 'test/test2', 'test2', '', 'test2', '会话', 'form', 4, 'Y', 0);

-- ----------------------------
-- Table structure for x_role
-- ----------------------------
DROP TABLE IF EXISTS `x_role`;
CREATE TABLE `x_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_role
-- ----------------------------
INSERT INTO `x_role` VALUES (1, 'admin', '超级管理员');
INSERT INTO `x_role` VALUES (2, 'hr', '人事专员');
INSERT INTO `x_role` VALUES (3, 'normal', '普通员工');

-- ----------------------------
-- Table structure for x_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `x_role_menu`;
CREATE TABLE `x_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_role_menu
-- ----------------------------
INSERT INTO `x_role_menu` VALUES (1, 1, 1);
INSERT INTO `x_role_menu` VALUES (8, 1, 4);
INSERT INTO `x_role_menu` VALUES (9, 1, 6);
INSERT INTO `x_role_menu` VALUES (10, 1, 2);
INSERT INTO `x_role_menu` VALUES (11, 1, 5);
INSERT INTO `x_role_menu` VALUES (12, 1, 7);

-- ----------------------------
-- Table structure for x_user
-- ----------------------------
DROP TABLE IF EXISTS `x_user`;
CREATE TABLE `x_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user
-- ----------------------------
INSERT INTO `x_user` VALUES (1, 'admin11', '123456', 'super@aliyun.com', '18677778888', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (2, 'zhangsan', '123456', 'zhangsan@gmail.com', '13966667777', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (3, 'lisi', '123456', 'lisi@gmail.com', '13966667778', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (4, 'wangwu', '123456', 'wangwu@gmail.com', '13966667772', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (5, 'zhaoer', '123456', 'zhaoer@gmail.com', '13966667776', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (6, 'songliu', '123456', 'songliu@gmail.com', '13966667771', 1, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (9, '3214', NULL, '234@234.com', '234324234', NULL, NULL, 0);
INSERT INTO `x_user` VALUES (10, 'null2', NULL, '123@qq.hhl', '13276767754', NULL, NULL, 1);
INSERT INTO `x_user` VALUES (11, '二十士大夫', NULL, '10086@123.com', '18232432453', NULL, NULL, 0);
INSERT INTO `x_user` VALUES (12, '官场腐败你', NULL, '法国和', '法国和法国', NULL, NULL, 0);
INSERT INTO `x_user` VALUES (13, 'Lisir', NULL, '13322@qq.com', '18203561492', NULL, NULL, 0);
INSERT INTO `x_user` VALUES (14, 'wqerrwq', '$2a$10$wPYNpUPIae6mN29Ar8F5DuteXQfU8TN5bsBJZAmAq68Lis8RerYL.', '13322@qq.com', '18203561492', NULL, NULL, 1);
INSERT INTO `x_user` VALUES (15, 'wqerrwq', '$2a$10$b7SJRqvCGxAPn3hiJ4V4W.AlaH9slSLBR7m873GFtfz0plozBSKRq', '13322@qq.com', '18203561492', NULL, NULL, 1);
INSERT INTO `x_user` VALUES (16, '阿斯蒂芬', '$2a$10$64F6C6GkWS7h0BWZisjMSup95cJValT8TuIuWiqjOs49xw6WP5Lm6', '1332223@ss.com', '13225554332', NULL, NULL, 0);
INSERT INTO `x_user` VALUES (17, '浩将军', '123456', '1212@qQ.CWSA', '13241234132', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (18, 'W女士', '123456', '123@qq.com', '13241234132', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', 0);
INSERT INTO `x_user` VALUES (19, '111', '123456', '1232@q.ss', '13209873490', NULL, NULL, 0);

-- ----------------------------
-- Table structure for x_user_role
-- ----------------------------
DROP TABLE IF EXISTS `x_user_role`;
CREATE TABLE `x_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user_role
-- ----------------------------
INSERT INTO `x_user_role` VALUES (1, 1, 1);
INSERT INTO `x_user_role` VALUES (5, 1, 2);
INSERT INTO `x_user_role` VALUES (6, 2, 3);
INSERT INTO `x_user_role` VALUES (7, 17, 1);
INSERT INTO `x_user_role` VALUES (8, 18, 1);
INSERT INTO `x_user_role` VALUES (9, 2, 1);

SET FOREIGN_KEY_CHECKS = 1;
