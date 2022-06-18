/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.200.
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 192.168.1.200:3306
 Source Schema         : cbt

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 26/05/2022 16:56:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL,
  `answer` json NOT NULL,
  `create_at` datetime(0) NOT NULL,
  `result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `time` int(0) NOT NULL COMMENT '时间',
  `user_id` int(0) NOT NULL COMMENT '用户主键',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `tp` smallint(0) NOT NULL DEFAULT 0 COMMENT '用户类型0是机器人、1代表用户',
  `source_type` int(0) NOT NULL DEFAULT 1 COMMENT '资源类型1表示文字、2、音频、3表示图片、4表示视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4675 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `amount` decimal(10, 2) NOT NULL,
  `days` int(0) NOT NULL DEFAULT 0 COMMENT '使用天数',
  `nums` int(0) NOT NULL DEFAULT 0 COMMENT '限制次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_uqi`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for emotion_diary
-- ----------------------------
DROP TABLE IF EXISTS `emotion_diary`;
CREATE TABLE `emotion_diary`  (
  `emotion_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '绑定用户表主键',
  `record_day` int(0) NOT NULL DEFAULT 0 COMMENT '记录日记是属于那一天',
  `scores` int(0) NOT NULL DEFAULT 0 COMMENT '当前记录心情分数',
  `create_at` int(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `emotion_type` int(0) NOT NULL COMMENT '情绪类别',
  PRIMARY KEY (`emotion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '情绪日记' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feel_diary
-- ----------------------------
DROP TABLE IF EXISTS `feel_diary`;
CREATE TABLE `feel_diary`  (
  `feel_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '绑定用户表主键',
  `record_day` int(0) NOT NULL DEFAULT 0 COMMENT '哪天记录的时间',
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '情绪类别(6大分类)',
  `feel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '情绪类别对应子项',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文字描述内容',
  `create_at` int(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `things` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应事务场景',
  PRIMARY KEY (`feel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '情绪日记（6.10号）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '\'分组ID\'',
  `score` smallint(0) NOT NULL DEFAULT 0 COMMENT '\'对应的分数\'',
  `answer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `tip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `society` smallint(0) NOT NULL DEFAULT 0 COMMENT '社会分',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_score_idx`(`group`, `score`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 431 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suggests
-- ----------------------------
DROP TABLE IF EXISTS `suggests`;
CREATE TABLE `suggests`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for time_capsule
-- ----------------------------
DROP TABLE IF EXISTS `time_capsule`;
CREATE TABLE `time_capsule`  (
  `capsule_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '关联到用户主键',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_at` int(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`capsule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '树洞时光胶囊' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for time_capsule_copy1
-- ----------------------------
DROP TABLE IF EXISTS `time_capsule_copy1`;
CREATE TABLE `time_capsule_copy1`  (
  `capsule_id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '关联到用户主键',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_at` int(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`capsule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '树洞时光胶囊' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `topic_id` int(0) NOT NULL DEFAULT 0,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组ID',
  `question` json NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `topic_id`(`topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户登录名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `wx_openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信平台的openid',
  `wx_headimgurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_register` int(0) NOT NULL DEFAULT 0 COMMENT '注册时间？',
  `time_last_login` int(0) NOT NULL DEFAULT 0 COMMENT '最后登录时间？',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `openid`(`wx_openid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_chat
-- ----------------------------
DROP TABLE IF EXISTS `user_chat`;
CREATE TABLE `user_chat`  (
  `user_id` bigint(0) NOT NULL,
  `module` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chat_id` bigint(0) NOT NULL DEFAULT 0,
  `stack` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 394 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_coupons
-- ----------------------------
DROP TABLE IF EXISTS `user_coupons`;
CREATE TABLE `user_coupons`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `amount` decimal(10, 2) NOT NULL,
  `start_date` date NOT NULL DEFAULT '2022-01-01',
  `end_date` date NOT NULL DEFAULT '2022-01-01',
  `days` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userIdx`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL DEFAULT 0,
  `headimgurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `sex` tinyint(0) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL DEFAULT '2000-01-01 00:00:00',
  `update_time` datetime(0) NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `userIdx`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_var
-- ----------------------------
DROP TABLE IF EXISTS `user_var`;
CREATE TABLE `user_var`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `time` bigint(0) NOT NULL DEFAULT 0,
  `user_id` bigint(0) NOT NULL,
  `key` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 250 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `openid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `unionid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `register_time` datetime(0) NOT NULL DEFAULT '2000-01-01 00:00:00',
  `last_login_time` datetime(0) NOT NULL DEFAULT '2000-01-01 00:00:00',
  `state` tinyint(0) NOT NULL DEFAULT 0 COMMENT '用来区分用户状态',
  `expire_time` date NOT NULL DEFAULT '2000-01-01' COMMENT '会员过期时间',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `source` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '来源',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `opUqe`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1029 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_token
-- ----------------------------
DROP TABLE IF EXISTS `wx_token`;
CREATE TABLE `wx_token`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `appid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_time` int(0) NOT NULL,
  `tp` tinyint(0) NOT NULL DEFAULT 0 COMMENT '0表示通用accetoken，1表示jsapi_ticket',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

create table wx_session_key (
    `id` bigint(0) NOT NULL AUTO_INCREMENT primary key ,
    `user_id` bigint(0) NOT NULL default 0,
    `openid` varchar(40) not null default '',
    `session_key` varchar(40) not null default '',
    unique index uniq(user_id)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


alter table results add topic_id int default 10010 not null;
insert into results(`group`, score, society, answer, tip,topic_id)
VALUES
    ('sas', 0, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 1, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 2, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 3, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 4, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 5, 0, '1,8,9','你的焦虑水平为轻度。生活无常，尤其近两年多，新冠病毒的肆虐几乎影响到我们所有人。你在生活中看来也有自己的一些焦虑情绪，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 6, 0, '10,6,11,12,9','你的焦虑水平为中度，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 7, 0, '10,6,29,9','你的焦虑水平为重度，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 8, 0, '10,6,29,9','你的焦虑水平为重度，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 9, 0, '10,6,29,9','你的焦虑水平为重度，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 10, 0, '10,6,29,9','你的焦虑水平为重度，希望小夏下面的一些建议能够帮助到你：',10020),


    ('isi', 0, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 1, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 2, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 3, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 4, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 5, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 6, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 7, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 8, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 9, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 10, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 11, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 12, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 13, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 14, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 15, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 16, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 17, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 18, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 19, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 20, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 21, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 22, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 23, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 24, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 25, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 26, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 27, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 28, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 29, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 30, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),


    ('bdi', 0, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 1, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 2, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 3, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 4, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 5, 0, '1,2,3,4','你的抑郁水平为轻度。很多人在人生的某些时刻都难免感到沮丧低落，尤其是身处现在这一瞬息万变的时代。希望小夏下面给您提供的一些小建议能够帮到你：',10040),
    ('bdi', 6, 0, '1,2,3,4','你的抑郁水平为轻度。很多人在人生的某些时刻都难免感到沮丧低落，尤其是身处现在这一瞬息万变的时代。希望小夏下面给您提供的一些小建议能够帮到你：',10040),
    ('bdi', 7, 0, '1,2,3,4','你的抑郁水平为轻度。很多人在人生的某些时刻都难免感到沮丧低落，尤其是身处现在这一瞬息万变的时代。希望小夏下面给您提供的一些小建议能够帮到你：',10040),
    ('bdi', 8, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 9, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 10, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 11, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 12, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 13, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 14, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 15, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 16, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 17, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 18, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 19, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 20, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 21, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 22, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 23, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 24, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 25, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 26, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 27, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 28, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 29, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 30, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 31, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 32, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 33, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 34, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040);

insert into suggests values (25, '你可以通过调整自己的行为，来进一步提升睡眠质量，规律锻炼，规律进餐，夜间避免过度饮用饮料，避免饮酒、吸烟，减少咖啡因的摄入。'),
(26, '良好的睡眠环境有助于我们保持良好的睡眠。确保你的卧室很舒适、夜间的温度适宜，且不受光线和声音的干扰。'),
(27, '良好的情绪有助于我们保持良好的睡眠。社会支持可以成为我们的铠甲。我们的家人、朋友、师长等，凡是愿意接纳、倾听我们的人，都属于我们的社会支持体系。多参加社会实践活动，平时多注意结交志同道合的好友，都有助于我们建立社会支持体系，能够有人分享我们的生命体验，接纳排解我们的不良情绪。'),
(29, '只有晚上有睡意或者到了规定的睡眠时间时，才上床休息；如果卧床后感觉到大约20分钟内无法入睡时（无需看表），离开卧室，进行一些放松活动，直到感觉有睡意再返回卧室睡觉；如果再次感觉到大约20分钟内仍然无法入睡时，重复上条策略，如果有必要，整晚都可重复该过程。'),
(30, '可考虑同时使用小夏的另外两个量表：《焦虑自评量表（SAS）》和《Beck抑郁自评量表（BDI）》进行测评，全面了解自己有无焦虑、抑郁等情绪问题。'),
(31, '建议你到专业的医疗机构进行心理健康检查。如果自感没有明显的情绪困扰，也可考虑到睡眠专科门诊寻求帮助。');

create table topic_category(
    id int not null primary key auto_increment,
    topic_id int not null default 0,
    title varchar(100) not null default '',
    introduce varchar(250) not null default '',
    guide varchar(250) not null default '',
    author varchar(300) not null default '',
    minute int not null default 0 comment '所需时间',
    color varchar(50) not null default '' comment '前端背景颜色',
    sort int not null default 0
)ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
insert into topic_category (topic_id, title, introduce,guide, author,minute,color,sort) VALUES (10020,'焦虑自评量表(SAS)','测试你的抑郁程度——美国著名心理学家Beck AT 编制，是目前使用最为广泛的抑郁程度评估量表之一，大量研究表明，该量表具有较高的灵敏度','共有20道题，请仔细阅读每一题，了解题目信息，然后|根据您最近一星期的实际感受|，选择每题下面适当的选项。','由华裔教授Zung编制（1971）；从量表构造的形式到具体评定的方法，都与抑郁自评量表(SDS)十分相似，是一种分析病人主观症状的相当简便的临床工具。',3,'#93B5DA',3),(10030,'失眠严重程度指数量表(ISI)','测试你的失眠严重程度——由加拿大查尔斯·莫兰教授等人编制，是目前使用最为广泛的失眠评估量表之一，广泛用于失眠筛查、评估失眠的治疗反应','共有7道题，请仔细阅读每一题，了解题目信息，然后|根据您最近两周或一个月的实际感受|，选择每题下面适当的选项。','失眠严重程度指数量表(ISI)是由加拿大的查尔斯·莫兰教授等人编制，是目前临床上使用最为广泛的失眠评估量表之一。',3,'#A0AFDF',2),(10040,'抑郁自评量表(BDI)','测试你的焦虑程度——由美国杜克大学医学院William W.K. Zung编制，是广泛用于心理咨询实践和焦虑状态筛查的主要工具之一','共有13道题，请仔细阅读每一题，了解题目的信息，然后|根据您此刻的实际感受|，选择每题下面适当的选项。','由BeckAJ编制，郑洪波、郑延平修订；',3,'#EACFA4',1);

create table chat_module(
    id int not null primary key auto_increment,
    title varchar(100) not null default '',
    module varchar(100) not null default '',
    module_name varchar(100) not null default '',
    click int not null default 1001,
    image varchar(200) not null default '',
    sort int not null default 0
)ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

insert into chat_module(title, module,module_name, click, image, sort) VALUES ('应对焦虑','anxiety','学习_焦虑',13420,'theme1',3),('缓解抑郁','depression','学习_抑郁',9320,'theme2',3),('改善睡眠','sleep','治疗_睡眠_情绪',1320,'theme3',2),('放松一下','relax','工具_放松_选择',5320,'theme4',1);


