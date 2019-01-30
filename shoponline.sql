/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : shoponline

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 30/01/2019 17:36:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_categories_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '2019-01-09 17:15:08', NULL, NULL, 'Quần jogger', NULL);
INSERT INTO `categories` VALUES (2, NULL, NULL, NULL, 'Áo longtee', NULL);

-- ----------------------------
-- Table structure for clothes
-- ----------------------------
DROP TABLE IF EXISTS `clothes`;
CREATE TABLE `clothes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clothes_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `FK_clothes_categories`(`category_id`) USING BTREE,
  CONSTRAINT `FK_clothes_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clothes
-- ----------------------------
INSERT INTO `clothes` VALUES (2, NULL, NULL, NULL, 'haha', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (3, NULL, NULL, '2019-01-30 10:02:13', 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (4, NULL, NULL, '2019-01-30 10:02:38', 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (5, NULL, NULL, '2019-01-30 10:02:50', 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (6, NULL, NULL, '2019-01-30 10:02:53', 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (7, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (8, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (9, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (10, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (11, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (12, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (13, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (14, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (15, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (16, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (17, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (18, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (19, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (20, NULL, NULL, NULL, 'quần jogger', 1, NULL, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc');
INSERT INTO `clothes` VALUES (22, '2019-01-30 15:26:52', '2019-01-30 15:26:52', NULL, 'sss', 2, 'Nam', 2222, 2222222, 1, 'https://firebasestorage.googleapis.com/v0/b/shopcode-cd861.appspot.com/o/images%2F2.JPG?alt=media&token=c92547b8-0b35-49d7-aceb-8461eab53ed5');
INSERT INTO `clothes` VALUES (23, '2019-01-30 15:29:19', '2019-01-30 15:29:19', NULL, '22', 1, 'Nam', 1, 1, 1, 'https://firebasestorage.googleapis.com/v0/b/shopcode-cd861.appspot.com/o/images%2Fserver.JPG?alt=media&token=40fe2ea8-4203-4375-91f1-45490d11c066');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clothe_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_images_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `fk_image_clothe`(`clothe_id`) USING BTREE,
  CONSTRAINT `fk_image_clothe` FOREIGN KEY (`clothe_id`) REFERENCES `clothes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (1, '2019-01-30 16:00:33', NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (2, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (3, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (4, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (5, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (6, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (7, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (8, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (9, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (10, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (11, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (12, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (13, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (14, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (15, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (16, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (17, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (18, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (19, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (20, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (21, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (22, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (23, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (24, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (25, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (26, NULL, NULL, NULL, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9Iv3G_HO1zlE-O5JK7NMXp3J1Fra0xRO9vv39Iep5icZyClSw4Ccvi9Di3TQvYKWodXXzTafpTA&usqp=CAc', 7);
INSERT INTO `images` VALUES (27, '2019-01-30 17:11:48', '2019-01-30 17:11:48', NULL, 'https://firebasestorage.googleapis.com/v0/b/shopcode-cd861.appspot.com/o/images%2Fserver.JPG?alt=media&token=f735ce8f-83e9-46de-9b43-f4dd382ea3ee', 8);
INSERT INTO `images` VALUES (28, '2019-01-30 17:14:48', '2019-01-30 17:14:48', NULL, 'https://firebasestorage.googleapis.com/v0/b/shopcode-cd861.appspot.com/o/images%2Fserver.JPG?alt=media&token=7c5dd19b-8a77-4a83-bc5e-d73c769d5041', 8);
INSERT INTO `images` VALUES (29, '2019-01-30 17:22:44', '2019-01-30 17:22:44', NULL, 'https://firebasestorage.googleapis.com/v0/b/shopcode-cd861.appspot.com/o/images%2Fcontractwindow.png?alt=media&token=6a3e6379-8634-47c5-924e-2ccd1cce672b', 8);
INSERT INTO `images` VALUES (30, '2019-01-30 17:24:26', '2019-01-30 17:24:26', NULL, 'https://firebasestorage.googleapis.com/v0/b/shopcode-cd861.appspot.com/o/images%2Fserver.JPG?alt=media&token=2836c27b-4699-4914-a954-0cccd4e08b97', 7);

SET FOREIGN_KEY_CHECKS = 1;
