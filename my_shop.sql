/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80046 (8.0.46)
 Source Host           : localhost:3306
 Source Schema         : adc_merchant

 Target Server Type    : MySQL
 Target Server Version : 80046 (8.0.46)
 File Encoding         : 65001

 Date: 29/07/2026 17:11:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户ID',
  `customer_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统产生编码KH000001自增',
  `customer_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '客户名称',
  `contact_person` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `contact_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '入驻时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_tenant_id_index`(`tenant_id` ASC) USING BTREE,
  INDEX `customer_code_index`(`customer_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'DFC后台客户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (934157334513688578, 928674125516390400, 'KH000001', '保利发展集团', '欧阳明月', '13002228886', '2026-07-20 15:52:06.000000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (934157334513688579, 928674125516390400, 'KH000002', '中建三局', '郭靖', '13002220001', '2026-07-20 15:52:06.000000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (934157334513688580, 928674125516390400, 'KH000003', '万科地产', '杨康乐', '13002221112', '2026-07-20 15:52:06.000000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (934157334513688581, 928674125516390400, 'KH000004', '金螳螂装饰', '李唐连', '13002220888', '2026-07-20 15:52:06.000000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (934157334513688582, 928674125516390400, 'KH000005', '碧桂园', '方笔元', '13002222965', '2026-07-20 15:52:06.000000', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户ID',
  `merchant_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统产生编码SJ000001自增',
  `merchant_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商家公司名称',
  `license_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '营业执照号/统一社会信用代码',
  `contact_person` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商家联系人姓名',
  `contact_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商家联系人电话',
  `main_category` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主营品类（如：基础建材）',
  `company_intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公司简介',
  `custom_fields` json NULL COMMENT '自定义字段',
  `merchant_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-正常',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '入驻时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `merchant_tenant_id_index`(`tenant_id` ASC) USING BTREE,
  INDEX `merchant_name_index`(`merchant_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '已注册的商家表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES (938757707622887425, 0, 'SJ000001', '测试商家有限公司', '91110000MA01BX5K8H', '韩立', '13800138666', '', '', NULL, 1, '2026-07-23 11:27:58.787315', 0, '2026-07-23 11:27:58.787315', 0, NULL, NULL);

-- ----------------------------
-- Table structure for merchant_activity_log
-- ----------------------------
DROP TABLE IF EXISTS `merchant_activity_log`;
CREATE TABLE `merchant_activity_log`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户ID',
  `operator_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作人ID',
  `operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `biz_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '业务模块类型 product/category/customer',
  `activity_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动类型如product_created',
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作类型 (INSERT/UPDATE/DELETE/LOGIN)',
  `biz_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '目标实体ID',
  `biz_label` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '高亮展示文本',
  `old_value` json NULL COMMENT '修改前的数据快照 (JSON格式)',
  `new_value` json NULL COMMENT '修改后的数据快照 (JSON格式)',
  `operator_status` tinyint NOT NULL DEFAULT 1 COMMENT '操作状态 (0:失败, 1:成功)',
  `error_msg` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '错误信息 (失败时记录)',
  `client_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '客户端IP',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户浏览器/设备信息',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '触发日志的API URL',
  `method_fun` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '触发日志的方法名',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '发生时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `merchant_activity_log_operator_id_index`(`operator_id` ASC) USING BTREE,
  INDEX `merchant_activity_log_biz_index`(`biz_type` ASC, `biz_id` ASC) USING BTREE,
  INDEX `merchant_activity_log_tenant_created_index`(`tenant_id` ASC, `created_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商家操作动态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant_activity_log
-- ----------------------------
INSERT INTO `merchant_activity_log` VALUES (935576910568890368, 928674125516390400, 874717515526340608, 'Found管理员', 'product', 'product_created', 'INSERT', 935576910426284033, '935576910426284033', NULL, NULL, 1, '', '', '', '', '', '2026-07-14 16:48:37.000000');
INSERT INTO `merchant_activity_log` VALUES (935577449994133504, 928674125516390400, 874717515526340608, 'Found管理员', 'category', 'category_visibility_updated', 'UPDATE', 934040764550430721, '灯具', NULL, NULL, 1, '', '', '', '', '', '2026-07-14 16:50:46.000000');
INSERT INTO `merchant_activity_log` VALUES (935578086425243648, 928674125516390400, 874717515526340608, 'Found管理员', 'product', 'product_created', 'INSERT', 935578086282637313, '935578086282637313', NULL, NULL, 1, '', '', '', '', '', '2026-07-14 16:53:18.004111');
INSERT INTO `merchant_activity_log` VALUES (935834945577041921, 928674125516390400, 874717515526340608, 'Found管理员', 'category', 'category_visibility_updated', 'UPDATE', 934040764550430721, '灯具', '{\"show_type\": 1}', '{\"show_type\": 1, \"customer_ids\": [934395499556089856, 934395263525826560, 934395384133038080]}', 1, '', '172.18.0.1', 'Apifox/1.0.0 (https://apifox.com)', '/v1/product-category/934040764550430721/visibility', 'App\\Service\\ProductCategoryService::App\\Service\\{closure}', '2026-07-15 09:53:57.000000');
INSERT INTO `merchant_activity_log` VALUES (935835685313859584, 928674125516390400, 874717515526340608, 'Found管理员', 'product', 'product_created', 'INSERT', 935835685175447553, '935835685175447553', NULL, '{\"category_id\": 934041753554731008, \"product_name\": \"吸顶灯 23X45mm\"}', 1, '', '172.18.0.1', 'Apifox/1.0.0 (https://apifox.com)', '/v1/product', 'App\\Service\\ProductService::App\\Service\\{closure}', '2026-07-15 09:56:54.365926');
INSERT INTO `merchant_activity_log` VALUES (935836787744731136, 928674125516390400, 874717515526340608, 'Found管理员', 'product', 'product_created', 'INSERT', 935836787551793153, '935836787551793153', NULL, '{\"brand_id\": 934036418639114240, \"short_desc\": \"吊顶灯，带风扇\", \"category_id\": 934041753554731008, \"product_name\": \"吸顶灯 23X45mm\", \"product_model\": \"YJL-XIDING-142\", \"product_status\": 1}', 1, '', '172.18.0.1', 'Apifox/1.0.0 (https://apifox.com)', '/v1/product', 'App\\Service\\ProductService::App\\Service\\{closure}', '2026-07-15 10:01:17.205070');
INSERT INTO `merchant_activity_log` VALUES (935837878137946112, 928674125516390400, 874717515526340608, 'Found管理员', 'product', 'product_created', 'INSERT', 935837877982756865, '935837877982756865', NULL, '{\"skus\": [{\"price\": \"99.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 10, \"sale_status\": 1, \"spec_value_ids\": [934113418577936384, 934121521205710848]}, {\"price\": \"4999.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 20, \"sale_status\": 1, \"spec_value_ids\": [934113418603102208, 934121521226682368]}, {\"price\": \"5999.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 20, \"sale_status\": 1, \"spec_value_ids\": [934113418632462336, 934121521251848192]}], \"media\": [{\"file_url\": \"https://cdn.example.com/main.jpg\", \"file_name\": \"main.jpg\", \"file_type\": \"image/jpeg\", \"media_type\": 1, \"sort_order\": 10}, {\"file_url\": \"https://cdn.example.com/detail.jpg\", \"media_type\": 2, \"sort_order\": 10}, {\"file_url\": \"https://video.example.com/demo.mp4\", \"media_type\": 3}, {\"file_url\": \"https://cdn.example.com/cert.pdf\", \"file_name\": \"资质.pdf\", \"file_type\": \"application/pdf\", \"media_type\": 4}], \"brand_id\": 934036418639114240, \"short_desc\": \"双人位工位桌\", \"category_id\": 934041753554731008, \"product_name\": \"工位桌\", \"product_model\": \"YJL-XWS-345\", \"product_status\": 1}', 1, '', '172.18.0.1', 'Apifox/1.0.0 (https://apifox.com)', '/v1/product', 'App\\Service\\ProductService::App\\Service\\{closure}', '2026-07-15 10:05:37.175661');
INSERT INTO `merchant_activity_log` VALUES (935838656013565952, 928674125516390400, 874717515526340608, 'Found管理员', 'category', 'category_visibility_updated', 'UPDATE', 934040764550430721, '灯具', '{\"show_type\": 1}', '{\"show_type\": \"1\", \"customer_apply_ids\": [\"934395499556089856\", \"934395263525826560\", \"934395384133038080\"]}', 1, '', '172.18.0.1', 'Apifox/1.0.0 (https://apifox.com)', '/v1/product-category/934040764550430721/visibility', 'App\\Service\\ProductCategoryService::App\\Service\\{closure}', '2026-07-15 10:08:42.635331');
INSERT INTO `merchant_activity_log` VALUES (936306966857551872, 928674125516390400, 874717515526340608, 'Found管理员', 'product', 'product_created', 'INSERT', 936306966652030977, '936306966652030977', NULL, '{\"skus\": [{\"price\": \"99.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 10, \"sale_status\": 1, \"spec_value_ids\": [934113418577936384, 934121521205710848]}, {\"price\": \"4999.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 20, \"sale_status\": 1, \"spec_value_ids\": [934113418603102208, 934121521226682368]}, {\"price\": \"5999.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 20, \"sale_status\": 1, \"spec_value_ids\": [934113418632462336, 934121521251848192]}], \"media\": [{\"file_url\": \"https://cdn.example.com/main.jpg\", \"file_name\": \"main.jpg\", \"file_type\": \"image/jpeg\", \"media_type\": 1, \"sort_order\": 10}, {\"file_url\": \"https://cdn.example.com/detail.jpg\", \"media_type\": 2, \"sort_order\": 10}, {\"file_url\": \"https://video.example.com/demo.mp4\", \"media_type\": 3}, {\"file_url\": \"https://cdn.example.com/cert.pdf\", \"file_name\": \"资质.pdf\", \"file_type\": \"application/pdf\", \"media_type\": 4}], \"brand_id\": 934036418639114240, \"short_desc\": \"墙纸花花\", \"category_id\": 934041753554731008, \"product_name\": \"强木墙布\", \"product_model\": \"YJL-QML-325\", \"product_status\": 1}', 1, '', '172.18.0.1', 'Apifox/1.0.0 (https://apifox.com)', '/v1/product', 'App\\Service\\ProductService::App\\Service\\{closure}', '2026-07-16 17:09:36.000000');
INSERT INTO `merchant_activity_log` VALUES (936569151802351616, 928674125516390400, 874717515526340608, 'Found管理员', 'product', 'product_created', 'INSERT', 936569151466807297, '936569151466807297', NULL, '{\"skus\": [{\"price\": \"99.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 10, \"sale_status\": 1, \"spec_value_ids\": [934113418577936384, 934121521205710848]}, {\"price\": \"4999.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 20, \"sale_status\": 1, \"spec_value_ids\": [934113418603102208, 934121521226682368]}, {\"price\": \"5999.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 20, \"sale_status\": 1, \"spec_value_ids\": [934113418632462336, 934121521251848192]}], \"media\": [{\"file_url\": \"https://cdn.example.com/main.jpg\", \"file_name\": \"main.jpg\", \"file_type\": \"image/jpeg\", \"media_type\": 1, \"sort_order\": 10}, {\"file_url\": \"https://cdn.example.com/detail.jpg\", \"media_type\": 2, \"sort_order\": 10}, {\"file_url\": \"https://video.example.com/demo.mp4\", \"media_type\": 3}, {\"file_url\": \"https://cdn.example.com/cert.pdf\", \"file_name\": \"资质.pdf\", \"file_type\": \"application/pdf\", \"media_type\": 4}], \"brand_id\": 934035802554576896, \"short_desc\": \"墙纸花花\", \"category_id\": 934041315296100352, \"product_name\": \"强木墙布\", \"product_model\": \"YJL-QML-325\", \"product_status\": 1}', 1, '', '172.18.0.1', 'Apifox/1.0.0 (https://apifox.com)', '/v1/product', 'App\\Service\\ProductService::App\\Service\\{closure}', '2026-07-17 10:31:26.000000');
INSERT INTO `merchant_activity_log` VALUES (937741144086081537, 928674125516390400, 923148100619575703, '', 'category', 'category_visibility_updated', 'UPDATE', 934040764550430721, '灯具', '{\"show_type\": 1}', '{\"show_type\": \"1\", \"customer_ids\": [\"934157334513688578\", \"934157334513688579\", \"934157334513688580\"]}', 1, '', '172.18.0.1', 'Apifox/1.0.0 (https://apifox.com)', '/v1/product-category/934040764550430721/visibility', 'App\\Service\\ProductCategoryService::App\\Service\\{closure}', '2026-07-20 16:08:31.000000');
INSERT INTO `merchant_activity_log` VALUES (938080543726440448, 928674125516390400, 923148100619575703, '', 'product', 'product_created', 'INSERT', 938080543575445505, '938080543575445505', NULL, '{\"skus\": [{\"price\": \"99.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 10, \"sale_status\": 1, \"spec_value_ids\": [934113418577936384, 934121521205710848]}, {\"price\": \"4999.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 20, \"sale_status\": 1, \"spec_value_ids\": [934113418603102208, 934121521226682368]}, {\"price\": \"5999.00\", \"volume\": \"0.0000\", \"weight\": \"0.00\", \"stock_num\": 10, \"sort_order\": 20, \"sale_status\": 1, \"spec_value_ids\": [934113418632462336, 934121521251848192]}], \"media\": [{\"file_key\": \"tgkvfile/dev/xxx.jpg\", \"file_url\": \"https://cdn.example.com/main.jpg\", \"extension\": \".jpg\", \"file_name\": \"main.jpg\", \"file_size\": \"10256\", \"file_type\": \"image/jpeg\", \"media_type\": 1, \"sort_order\": 10, \"storage_provider\": \"oss\"}, {\"file_key\": \"tgkvfile/dev/xxx.jpg\", \"file_url\": \"https://cdn.example.com/detail.jpg\", \"extension\": \".jpg\", \"file_size\": \"10256\", \"media_type\": 2, \"sort_order\": 10, \"storage_provider\": \"oss\"}, {\"file_key\": \"tgkvfile/dev/xxx.jpg\", \"file_url\": \"https://video.example.com/demo.mp4\", \"extension\": \".jpg\", \"file_size\": \"10256\", \"media_type\": 3, \"storage_provider\": \"oss\"}, {\"file_key\": \"tgkvfile/dev/xxx.jpg\", \"file_url\": \"https://cdn.example.com/cert.pdf\", \"extension\": \".jpg\", \"file_name\": \"资质.pdf\", \"file_size\": \"10256\", \"file_type\": \"application/pdf\", \"media_type\": 4, \"storage_provider\": \"oss\"}], \"filling\": \"羽绒21212\", \"brand_id\": 934035802554576896, \"short_desc\": \"墙纸花2121花\", \"category_id\": 934041315296100352, \"sort _order\": 1, \"product_name\": \"强木墙布1111212\", \"product_model\": \"YJL-QML-325\", \"product_status\": 1, \"material_quality\": \"棉麻1212\"}', 1, '', '172.18.0.1', 'Apifox/1.0.0 (https://apifox.com)', '/v1/product', 'App\\Service\\ProductService::App\\Service\\{closure}', '2026-07-21 14:37:10.000000');
INSERT INTO `merchant_activity_log` VALUES (938122824248532992, 928674125516390400, 923148100619575703, '', 'product', 'product_created', 'INSERT', 938122823904600065, '938122823904600065', NULL, '{\"skus\": [{\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 1, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445219524608\", \"934118417529802752\", \"934113418577936384\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 2, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445219524608\", \"934118417529802752\", \"934113418594713600\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 3, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445219524608\", \"934118417529802752\", \"934113418603102208\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 4, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445219524608\", \"934118417550774272\", \"934113418577936384\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 5, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445219524608\", \"934118417550774272\", \"934113418594713600\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 6, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445219524608\", \"934118417550774272\", \"934113418603102208\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 7, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445227913216\", \"934118417529802752\", \"934113418577936384\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 8, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445227913216\", \"934118417529802752\", \"934113418594713600\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 9, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445227913216\", \"934118417529802752\", \"934113418603102208\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 10, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445227913216\", \"934118417550774272\", \"934113418577936384\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 11, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445227913216\", \"934118417550774272\", \"934113418594713600\"]}, {\"price\": \"\", \"volume\": \"\", \"weight\": \"\", \"sort_order\": 12, \"spec_value\": \"\", \"market_price\": \"\", \"spec_value_ids\": [\"936574445227913216\", \"934118417550774272\", \"934113418603102208\"]}], \"media\": [{\"file_key\": \"tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg\", \"file_url\": \"https://tg-adc.oss-cn-shenzhen.aliyuncs.com/tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg?Expires=1784712310&OSSAccessKeyId=LTAI5tQe8vADsk9F5vEnsv8d&Signature=r5RtrBdffpvetvYGDaav97pCxFQ%3D\", \"extension\": \"jpg\", \"file_name\": \"9fd738cce14c4d11b8ba8c251af3be77 (3).jpg\", \"file_type\": \"jpg\", \"font_size\": 175978, \"media_type\": \"1\", \"sort_order\": 1, \"storage_provider\": \"oss\"}, {\"file_key\": \"tgkwfile/dev/11e1da4284e611f1aed5ba29ed563b64.png\", \"file_url\": \"https://tg-adc.oss-cn-shenzhen.aliyuncs.com/tgkwfile/dev/11e1da4284e611f1aed5ba29ed563b64.png?Expires=1784712310&OSSAccessKeyId=LTAI5tQe8vADsk9F5vEnsv8d&Signature=3A8OXcCNnBs%2FJZnk9Hy5lFvahds%3D\", \"extension\": \"png\", \"file_name\": \"8e032ce9-17fc-4fc8-814c-1816467157b7.png\", \"file_type\": \"png\", \"font_size\": 1581227, \"media_type\": \"2\", \"sort_order\": 1, \"storage_provider\": \"oss\"}, {\"file_key\": \"tgkwfile/dev/1207485e84e611f18e62ba29ed563b64.pdf\", \"file_url\": \"https://tg-adc.oss-cn-shenzhen.aliyuncs.com/tgkwfile/dev/1207485e84e611f18e62ba29ed563b64.pdf?Expires=1784712310&OSSAccessKeyId=LTAI5tQe8vADsk9F5vEnsv8d&Signature=5VQWheql2wUEdWldvAS0sZM1ceI%3D\", \"extension\": \"pdf\", \"file_name\": \"DFC下载安装教程指引V6.2.pdf\", \"file_type\": \"pdf\", \"font_size\": 504024, \"media_type\": \"4\", \"sort_order\": 1, \"storage_provider\": \"oss\"}, {\"file_url\": \"https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4\", \"media_type\": 3}], \"filling\": \"测试222\", \"brand_id\": \"934033463898746881\", \"short_desc\": \"测试111\", \"category_id\": \"936672897291042817\", \"product_name\": \"测试1\", \"product_model\": \"测试1\", \"product_status\": true}', 1, '', '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '/v1/product', 'App\\Service\\ProductService::App\\Service\\{closure}', '2026-07-21 17:25:10.000000');

-- ----------------------------
-- Table structure for merchant_apply
-- ----------------------------
DROP TABLE IF EXISTS `merchant_apply`;
CREATE TABLE `merchant_apply`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户ID',
  `customer_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '客户ID',
  `customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标客户名称（企业库名称）',
  `apply_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '申请编号（SA + 14位时间 + 8位hex，共 24 位）',
  `status_label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态文案；closed 展示为「不可申请」',
  `merchant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家ID(用户ID)',
  `apply_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '申请状态:0=待审核, 1=已通过, 2=未通过, 3=不可申请',
  `audit_date` datetime(6) NULL DEFAULT NULL COMMENT '审批日期',
  `audit_remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '审批备注',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_apply_tenant_id_index`(`tenant_id` ASC) USING BTREE,
  INDEX `customer_apply_status_index`(`apply_status` ASC) USING BTREE,
  INDEX `merchant_apply_customer_id_index`(`customer_id` ASC) USING BTREE,
  INDEX `merchant_apply_merchant_id_index`(`merchant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业客户入驻申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant_apply
-- ----------------------------
INSERT INTO `merchant_apply` VALUES (934157334513688577, 928674125516390400, 934157334513688582, '碧桂园', 'SA20260725112537886ccfe1', '待审核', 923148100619575703, 0, NULL, '', '2026-07-10 18:47:44.353746', 874717515526340608, '2026-07-20 17:20:02.634136', 923148100619575703, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934394108359979009, 928674125516390400, 934157334513688578, '保利发展集团', 'SA202607251125378a233acb', '已通过', 923148100619575703, 1, NULL, '', '2026-07-11 10:28:35.638612', 874717515526340608, '2026-07-20 17:22:50.733241', 923148100619575703, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934394665355161600, 928674125516390400, 934157334513688580, '万科地产', 'SA2026072511253741af5ca1', '未通过', 0, 2, NULL, '', '2026-07-11 10:30:48.434223', 874717515526340608, '2026-07-11 10:30:48.434223', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934395028950986752, 928674125516390400, 934157334513688581, '金螳螂装饰', 'SA2026072511253798466c09', '未通过', 0, 2, NULL, '', '2026-07-11 10:32:15.122726', 874717515526340608, '2026-07-11 10:32:15.122726', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934395263525826560, 928674125516390400, 934157334513688582, '碧桂园', 'SA202607251125370928338f', '已通过', 0, 1, NULL, '', '2026-07-11 10:33:11.049934', 874717515526340608, '2026-07-11 10:33:11.049934', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934395384133038080, 928674125516390400, 934157334513688578, '保利发展集团', 'SA20260725112537c093f620', '已通过', 0, 1, NULL, '', '2026-07-11 10:33:39.804788', 874717515526340608, '2026-07-11 10:33:39.804788', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934395499556089856, 928674125516390400, 934157334513688578, '保利发展集团', 'SA20260725112537bb81a4fb', '未通过', 0, 2, NULL, '', '2026-07-11 10:34:07.323097', 874717515526340608, '2026-07-11 10:34:07.323097', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934395613154619392, 928674125516390400, 934157334513688578, '保利发展集团', 'SA2026072511253712ebdc6c', '已通过', 0, 1, NULL, '', '2026-07-11 10:34:34.407768', 874717515526340608, '2026-07-11 10:34:34.407768', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934395773951651840, 928674125516390400, 934157334513688578, '保利发展集团', 'SA20260725112537730d516f', '未通过', 0, 2, NULL, '', '2026-07-11 10:35:12.744747', 874717515526340608, '2026-07-11 10:35:12.744747', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934396023655346176, 928674125516390400, 934157334513688578, '保利发展集团', 'SA202607251125379f395eac', '已通过', 0, 1, NULL, '', '2026-07-11 10:36:12.278767', 874717515526340608, '2026-07-11 10:36:12.278767', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934396162751049728, 928674125516390400, 934157334513688578, '保利发展集团', 'SA2026072511253733d0f832', '未通过', 0, 2, NULL, '', '2026-07-11 10:36:45.441399', 874717515526340608, '2026-07-11 10:36:45.441399', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934396288374648832, 928674125516390400, 934157334513688578, '保利发展集团', 'SA202607251125376cb226c8', '待审核', 0, 0, NULL, '', '2026-07-11 10:37:15.392621', 874717515526340608, '2026-07-11 10:37:15.392621', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (934398882178379776, 928674125516390400, 934157334513688578, '保利发展集团', 'SA20260725112537cf6dae65', '待审核', 0, 0, NULL, '', '2026-07-11 10:47:33.803380', 874717515526340608, '2026-07-11 10:47:33.803380', 874717515526340608, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (937731919683313665, 928674125516390400, 934157334513688578, '保利发展集团', 'SA202607251125371ae371f1', '待审核', 0, 0, NULL, '', '2026-07-20 15:31:51.871223', 923148100619575703, '2026-07-20 15:31:51.871223', 923148100619575703, NULL, NULL);
INSERT INTO `merchant_apply` VALUES (937759009828831233, 928674125516390400, 934157334513688579, '中建三局', 'SA202607251125378addbf06', '已通过', 923148100619575703, 1, NULL, '', '2026-07-20 17:19:30.664151', 923148100619575703, '2026-07-20 17:19:30.664151', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (5, '2026_07_10_100548_create_tenant_order_seq_table', 1);
INSERT INTO `migrations` VALUES (6, '2026_07_10_102933_create_product_brand_table', 1);
INSERT INTO `migrations` VALUES (7, '2026_07_10_115105_create_product_category_table', 2);
INSERT INTO `migrations` VALUES (8, '2026_07_10_164511_create_product_specification_table', 3);
INSERT INTO `migrations` VALUES (9, '2026_07_10_172654_create_product_specification_value_table', 3);
INSERT INTO `migrations` VALUES (10, '2026_07_11_082845_create_customer_apply_table', 4);
INSERT INTO `migrations` VALUES (11, '2026_07_11_110823_create_product_table', 5);
INSERT INTO `migrations` VALUES (12, '2026_07_11_143354_create_product_media_table', 5);
INSERT INTO `migrations` VALUES (13, '2026_07_11_164519_create_product_category_customer_table', 6);
INSERT INTO `migrations` VALUES (14, '2026_07_13_094710_create_product_sku_table', 7);
INSERT INTO `migrations` VALUES (15, '2026_07_13_102801_create_product_sku_spec_value_table', 7);
INSERT INTO `migrations` VALUES (16, '2026_07_13_171243_create_product_material_table', 8);
INSERT INTO `migrations` VALUES (18, '2026_07_14_163828_create_merchant_activity_table', 9);
INSERT INTO `migrations` VALUES (19, '2026_07_17_170600_add_material_quality_and_filling_to_product_table', 10);
INSERT INTO `migrations` VALUES (20, '2026_07_20_153745_create_customer_table', 11);
INSERT INTO `migrations` VALUES (21, '2026_07_20_162734_alter_product_category_customer_use_customer_id', 12);
INSERT INTO `migrations` VALUES (22, '2026_07_21_085127_rename_customer_apply_to_merchant_apply', 13);
INSERT INTO `migrations` VALUES (23, '2026_07_21_142358_add_oss_fields_to_product_media_table', 14);
INSERT INTO `migrations` VALUES (25, '2026_07_23_103718_create_merchant_table', 15);
INSERT INTO `migrations` VALUES (26, '2026_07_25_112200_add_fields_to_merchant_apply_table', 16);
INSERT INTO `migrations` VALUES (27, '2026_07_28_160000_create_product_address_table', 17);
INSERT INTO `migrations` VALUES (28, '2026_07_28_165236_add_shipping_location_to_product_table', 18);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户id',
  `auto_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统产生编码SP000001自增',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `product_model` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品型号',
  `category_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品分类ID',
  `brand_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '品牌ID',
  `material_quality` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '材质',
  `filling` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '填充',
  `shipping_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品发货地',
  `short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品简短描述',
  `main_image_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主图URL',
  `product_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 0=已下架 1=已上架',
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_tenant_id_index`(`tenant_id` ASC) USING BTREE,
  INDEX `product_category_id_index`(`category_id` ASC) USING BTREE,
  INDEX `product_brand_id_index`(`brand_id` ASC) USING BTREE,
  INDEX `product_auto_code_index`(`auto_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (934449702043369472, 928674125516390400, 'SP000002', '简约头层牛皮直排沙发', 'YJL-SF-801', 934041753554731008, 934035068526211072, '', '', '广东省 深圳市', '三人位沙发', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-11 14:09:30.206302', 874717515526340608, '2026-07-13 16:29:14.152204', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (934451529212215296, 928674125516390400, 'SP000003', '北欧轻奢实木餐椅', 'YJL-SF-222', 934048467125489665, 934035068526211072, '', '', '广东省 深圳市', '实木餐椅', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-11 14:16:45.835134', 874717515526340608, '2026-07-11 14:16:45.840425', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (934451791549153280, 928674125516390400, 'SP000004', '意式极简岩板伸缩餐桌', 'RN-CZ-12', 934048467125489665, 934035068526211072, '', '', '广东省 深圳市', 'RN-意式极简岩板伸缩餐桌-12', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-11 14:17:48.382829', 874717515526340608, '2026-07-11 14:17:48.394694', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (935122614282870784, 928674125516390400, 'SP000005', '纳帕真皮沙发贵妃椅', 'YJL-SF-101', 934048467125489665, 934035068526211072, '', '', '广东省 深圳市', '三人位沙发', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-13 10:43:24.987020', 874717515526340608, '2026-07-13 10:43:24.994196', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (935126090643668993, 928674125516390400, 'SP000006', 'iphone18系列苹果官方', 'YJL-PHONE-101', 934041753554731008, 934036418639114240, '', '', '广东省 深圳市', 'iphone 2026新款', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-13 10:57:13.814807', 874717515526340608, '2026-07-13 10:57:13.823688', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (935576910426284033, 928674125516390400, 'SP000007', '戴尔Dell电脑笔记本一台', 'YJL-PC-122', 934041753554731008, 934036418639114240, '', '', '广东省 深圳市', 'Dell电脑 2026新款', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-14 16:48:37.626590', 874717515526340608, '2026-07-14 16:48:37.634384', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (935578086282637313, 928674125516390400, 'SP000008', '货架2米 X 2米', 'YJL-HUO-142', 934041753554731008, 934036418639114240, '', '', '广东省 深圳市', '书架货架 2026新款', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-14 16:53:17.973597', 874717515526340608, '2026-07-14 16:53:17.980653', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (935835685175447553, 928674125516390400, 'SP000009', '吸顶灯 23X45mm', 'YJL-XIDING-142', 934041753554731008, 934036418639114240, '', '', '广东省 深圳市', '吊顶灯，带风扇', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-15 09:56:54.335192', 874717515526340608, '2026-07-15 09:56:54.343617', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (935836787551793153, 928674125516390400, 'SP000010', '吸顶吊灯长条 66X33mm', 'YJL-XIDING-145', 934041753554731008, 934036418639114240, '', '', '广东省 深圳市', '吊顶灯，带风扇', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-15 10:01:17.175326', 874717515526340608, '2026-07-15 10:01:17.184661', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (935837877982756865, 928674125516390400, 'SP000011', '工位桌', 'YJL-XWS-345', 934041753554731008, 934036418639114240, '', '', '广东省 深圳市', '双人位工位桌', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 0, 0, '2026-07-15 10:05:37.141995', 874717515526340608, '2026-07-15 10:05:37.149774', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (936306966652030977, 928674125516390400, 'SP000012', '强木墙布', 'YJL-QML-325', 934041753554731008, 934036418639114240, '', '', '广东省 深圳市', '墙纸花花', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 0, 0, '2026-07-16 17:09:36.597241', 874717515526340608, '2026-07-16 17:09:36.609889', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (936569151466807297, 928674125516390400, 'SP000013', '强木墙布', 'YJL-QML-325', 934041315296100352, 934035802554576896, '', '', '广东省 深圳市', '墙纸花花', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 0, 0, '2026-07-17 10:31:26.331517', 874717515526340608, '2026-07-17 10:31:26.352544', 874717515526340608, NULL, NULL);
INSERT INTO `product` VALUES (938080543575445505, 928674125516390400, 'SP000014', '强木墙布1111212', 'YJL-QML-325', 934041315296100352, 934035802554576896, '棉麻1212', '羽绒21212', '广东省 深圳市', '墙纸花2121花', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 1, 0, '2026-07-21 14:37:10.287805', 923148100619575703, '2026-07-21 14:37:10.296211', 923148100619575703, NULL, NULL);
INSERT INTO `product` VALUES (938122823904600065, 928674125516390400, 'SP000015', '测试修改1', '测试1', 936672897291042817, 934033463898746881, '', '测试222', '502920 503440', '测试111', 'https://tg-adc.oss-cn-shenzhen.aliyuncs.com/tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg?Expires=1784712310&OSSAccessKeyId=LTAI5tQe8vADsk9F5vEnsv8d&Signature=r5RtrBdffpvetvYGDaav97pCxFQ%3D', 1, 0, '2026-07-21 17:25:10.701905', 923148100619575703, '2026-07-29 10:17:34.753958', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for product_address
-- ----------------------------
DROP TABLE IF EXISTS `product_address`;
CREATE TABLE `product_address`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户id',
  `province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '城市（发货地，页面展示：广东广州=省+市拼接）',
  `full_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '完整详细发货地址（备用扩展）',
  `contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `contact_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `addr_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1=启用 2=停用',
  `addr_sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序号',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '逻辑删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_address_tenant_id_index`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_city`(`city` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品管理-发货地管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_address
-- ----------------------------
INSERT INTO `product_address` VALUES (934033463898746882, 928674125516390400, '广东省', '深圳市', '', '古龙', '18811885588', 1, 0, '2026-07-28 16:03:46.000000', NULL, '2026-07-28 16:12:12.745682', 923148100619575703, NULL, NULL);
INSERT INTO `product_address` VALUES (940640162680262657, 928674125516390400, '江西省', '南昌市', '', '金庸', '19929934995', 1, 0, '2026-07-28 16:08:11.033453', 923148100619575703, '2026-07-28 16:08:11.033453', 923148100619575703, NULL, NULL);
INSERT INTO `product_address` VALUES (940901500975439873, 928674125516390400, '海南省', '三亚市', '', '测试1', '18811885588', 1, 0, '2026-07-29 09:26:38.938052', 923148100619575703, '2026-07-29 09:28:44.025276', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for product_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户id',
  `brand_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统产生编码BR000001自增',
  `brand_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '英文别名（可选）',
  `is_system` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否系统预设 不可删 1=系统预设 0=自定义',
  `is_show` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 0=隐藏 1=显示',
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `brand_remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `brand_tenant_id_index`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '品牌管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_brand
-- ----------------------------
INSERT INTO `product_brand` VALUES (934033463898746881, 928674125516390400, 'BR000001', '日丰', '', 0, 1, 0, '', '2026-07-10 10:35:31.299074', 874717515526340608, '2026-07-10 10:35:31.299074', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934033530621734912, 928674125516390400, 'BR000002', '三清山', '', 0, 1, 3, '无', '2026-07-10 10:35:47.205738', 874717515526340608, '2026-07-10 10:44:10.180627', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934033606282784768, 928674125516390400, 'BR000003', '巴比兔', '', 0, 1, 0, '', '2026-07-10 10:36:05.267887', 874717515526340608, '2026-07-10 10:36:05.267887', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934035068526211072, 928674125516390400, 'BR000004', '木林森', '', 0, 1, 2, '', '2026-07-10 10:41:53.871100', 874717515526340608, '2026-07-10 10:41:53.871100', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934035802554576896, 928674125516390400, 'BR000005', '飞利浦', '', 0, 1, 5, '备注11', '2026-07-10 10:44:48.878761', 874717515526340608, '2026-07-10 10:45:33.508155', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934036174971023360, 928674125516390400, 'BR000006', '家具', '', 0, 1, 6, '备注11', '2026-07-10 10:46:17.667773', 874717515526340608, '2026-07-10 10:46:17.667773', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934036227555012608, 928674125516390400, 'BR000007', '厨卫设施', '', 0, 1, 8, '备注11', '2026-07-10 10:46:30.205165', 874717515526340608, '2026-07-10 10:46:30.205165', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934036275881783296, 928674125516390400, 'BR000008', '基础建材', '', 0, 1, 9, '备注11', '2026-07-10 10:46:41.727058', 874717515526340608, '2026-07-10 10:46:41.727058', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934036362200559616, 928674125516390400, 'BR000009', '马自达', '', 0, 1, 9, '备注11', '2026-07-10 10:47:02.306970', 874717515526340608, '2026-07-10 10:47:02.306970', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934036418639114240, 928674125516390400, 'BR000010', '梅赛德斯车队', '', 0, 1, 11, '备注11111', '2026-07-10 10:47:15.762493', 874717515526340608, '2026-07-10 10:47:15.762493', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934036535316262912, 928674125516390400, 'BR000011', 'DELL', '', 0, 1, 12, '商品管理  >  品牌管理', '2026-07-10 10:47:43.581560', 874717515526340608, '2026-07-10 10:47:43.581560', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934036655688593408, 928674125516390400, 'BR000012', '现代简约吊灯', '', 0, 1, 13, '商品管理  >  品牌管理', '2026-07-10 10:48:12.280881', 874717515526340608, '2026-07-10 10:48:12.280881', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (934054956368097281, 928674125516390400, 'BR000013', '现代简约吊灯123', '', 0, 1, 13, '商品管理  >  品牌管理', '2026-07-10 12:00:55.515141', 874717515526340608, '2026-07-10 12:00:55.515141', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (936573925436207105, 928674125516390400, 'BR000014', '中国华为', '', 0, 1, 18, '商品管理  >  品牌管理', '2026-07-17 10:50:24.531943', 874717515526340608, '2026-07-17 10:50:24.531943', 874717515526340608, NULL, NULL);
INSERT INTO `product_brand` VALUES (938497272168419329, 928674125516390400, 'BR000015', '测试品牌1', '', 0, 1, 0, '测试品牌1', '2026-07-22 18:13:06.127030', 923148100619575703, '2026-07-22 18:13:06.127030', 923148100619575703, NULL, NULL);
INSERT INTO `product_brand` VALUES (938497448148832256, 928674125516390400, 'BR000016', '测试品牌2', '', 0, 1, 0, '测试品牌2', '2026-07-22 18:13:48.080061', 923148100619575703, '2026-07-22 18:22:47.547443', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户id',
  `category_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统产生编码FL000001自增',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级分类ID 0是一级分类',
  `level` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '级别 1=一级 2=二级 3=三级',
  `product_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品数量 冗余',
  `unit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数量单位',
  `show_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '可见性类型 0=全部可见 1=指定客户可见 2=指定客户不可见',
  `cat_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 0=隐藏 1=显示',
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `cat_remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_tenant_id_index`(`tenant_id` ASC) USING BTREE,
  INDEX `category_parent_id_index`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (934040764550430721, 928674125516390400, 'FL000001', '灯具', 0, 1, 3, '包', 1, 1, 10, '备注', '2026-07-10 11:04:31.910519', 874717515526340608, '2026-07-20 16:08:31.134527', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (934040931877994496, 928674125516390400, 'FL000002', '基础建材', 0, 1, 3, '包', 1, 1, 10, '备注', '2026-07-10 11:05:11.803746', 874717515526340608, '2026-07-10 11:05:11.803746', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (934041129131917312, 928674125516390400, 'FL000003', '吊灯', 934040764550430721, 2, 3, '包', 1, 1, 10, '备注', '2026-07-10 11:05:58.832579', 874717515526340608, '2026-07-10 11:05:58.832579', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (934041239530192896, 928674125516390400, 'FL000004', '落地灯', 934040764550430721, 2, 3, '包', 1, 1, 10, '备注', '2026-07-10 11:06:25.155086', 874717515526340608, '2026-07-10 11:06:25.155086', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (934041315296100352, 928674125516390400, 'FL000005', '水晶吊灯', 934041129131917312, 3, 5, '包', 1, 1, 10, '备注', '2026-07-10 11:06:43.217694', 874717515526340608, '2026-07-21 14:37:10.317159', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (934041347617406976, 928674125516390400, 'FL000006', '现代简约吊灯', 934041129131917312, 3, 3, '包', 1, 1, 10, '备注', '2026-07-10 11:06:50.922469', 874717515526340608, '2026-07-10 11:06:50.922469', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (934041413799329792, 928674125516390400, 'FL000007', '北欧落地灯', 934041239530192896, 3, 3, '包', 1, 1, 10, '备注', '2026-07-10 11:07:06.701680', 874717515526340608, '2026-07-10 11:07:06.701680', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (934041441582399488, 928674125516390400, 'FL000008', '阅读落地灯', 934041239530192896, 3, 3, '包', 1, 1, 10, '备注', '2026-07-10 11:07:13.325820', 874717515526340608, '2026-07-10 11:07:13.325820', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (934041753554731008, 928674125516390400, 'FL000009', '机械设备', 0, 1, 10, '包', 1, 1, 10, '备注', '2026-07-10 11:08:27.706440', 874717515526340608, '2026-07-16 17:09:36.640038', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (934041823750602752, 928674125516390400, 'FL000010', '家具2222', 0, 1, 3, '件', 1, 1, 11, '备注1', '2026-07-10 11:08:44.441305', 874717515526340608, '2026-07-21 10:37:26.846772', 923148100619575703, NULL, NULL);
INSERT INTO `product_category` VALUES (934048467125489665, 928674125516390400, 'FL000011', '现代化北欧家具', 0, 1, 2, '件', 1, 1, 11, '备注1实木的现代化北欧家具', '2026-07-10 11:35:08.346923', 874717515526340608, '2026-07-17 10:48:22.489085', 874717515526340608, NULL, NULL);
INSERT INTO `product_category` VALUES (936672897291042817, 928674125516390400, 'FL000001', '家具1111', 0, 1, 1, '包', 1, 1, 10, '备注', '2026-07-17 17:23:41.271180', 932557398109851648, '2026-07-21 17:25:10.779170', 932557398109851648, NULL, NULL);
INSERT INTO `product_category` VALUES (936679218253975553, 928674125516390400, 'FL000012', '家具3241', 0, 1, 0, '包', 1, 1, 10, '备注', '2026-07-17 17:48:48.292901', 923148100619575703, '2026-07-17 17:48:48.292901', 923148100619575703, NULL, NULL);
INSERT INTO `product_category` VALUES (938451702569586689, 928674125516390400, 'FL000013', '苹果手机', 0, 1, 0, '部', 1, 1, 10, '备注', '2026-07-22 15:12:01.488928', 923148100619575703, '2026-07-22 15:12:01.488928', 923148100619575703, NULL, NULL);
INSERT INTO `product_category` VALUES (938464124298682369, 928674125516390400, 'FL000014', '茅台衣柜', 0, 1, 0, '台', 1, 1, 11, '备注12123123213', '2026-07-22 16:01:23.055778', 923148100619575703, '2026-07-22 16:01:23.055778', 923148100619575703, NULL, NULL);
INSERT INTO `product_category` VALUES (938470166495588353, 928674125516390400, 'FL000015', '测试品牌111', 936672897291042817, 2, 0, '', 1, 1, 0, '', '2026-07-22 16:25:23.627439', 923148100619575703, '2026-07-22 16:43:59.820409', 923148100619575703, NULL, NULL);
INSERT INTO `product_category` VALUES (938471756422017024, 928674125516390400, 'FL000016', '茅台衣柜1111', 0, 1, 0, '台1', 1, 1, 111, '备注12123123213', '2026-07-22 16:31:42.694451', 923148100619575703, '2026-07-22 16:31:42.694451', 923148100619575703, NULL, NULL);
INSERT INTO `product_category` VALUES (938472432560603137, 928674125516390400, 'FL000017', '科勒', 0, 1, 0, '台1', 1, 1, 111, '备注12123123213', '2026-07-22 16:34:23.900054', 923148100619575703, '2026-07-22 16:34:23.900054', 923148100619575703, NULL, NULL);
INSERT INTO `product_category` VALUES (938473054030626816, 928674125516390400, 'FL000018', '测试2', 936672897291042817, 2, 0, '', 1, 1, 0, '', '2026-07-22 16:36:52.068292', 923148100619575703, '2026-07-22 16:36:52.068292', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for product_category_customer
-- ----------------------------
DROP TABLE IF EXISTS `product_category_customer`;
CREATE TABLE `product_category_customer`  (
  `category_id` bigint UNSIGNED NOT NULL COMMENT '分类ID',
  `customer_id` bigint UNSIGNED NOT NULL COMMENT '客户入驻申请ID',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户ID',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`category_id`, `customer_id`) USING BTREE,
  INDEX `category_customer_tenant_id_index`(`tenant_id` ASC) USING BTREE,
  INDEX `category_customer_apply_id_index`(`customer_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类客户可见性关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category_customer
-- ----------------------------
INSERT INTO `product_category_customer` VALUES (934040764550430721, 934157334513688578, 928674125516390400, '2026-07-20 16:08:31.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (934040764550430721, 934157334513688579, 928674125516390400, '2026-07-20 16:08:31.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (934040764550430721, 934157334513688580, 928674125516390400, '2026-07-20 16:08:31.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (934041315296100352, 934157334513688578, 928674125516390400, '2026-07-22 17:24:14.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (934041315296100352, 934157334513688579, 928674125516390400, '2026-07-22 17:24:14.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (934041315296100352, 934157334513688580, 928674125516390400, '2026-07-22 17:24:14.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (934041823750602752, 934157334513688578, 928674125516390400, '2026-07-22 16:42:49.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (934041823750602752, 934157334513688579, 928674125516390400, '2026-07-22 16:42:49.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938451702569586689, 934157334513688578, 928674125516390400, '2026-07-22 15:12:01.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938451702569586689, 934157334513688579, 928674125516390400, '2026-07-22 15:12:01.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938464124298682369, 934157334513688578, 928674125516390400, '2026-07-22 16:01:23.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938464124298682369, 934157334513688579, 928674125516390400, '2026-07-22 16:01:23.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938470166495588353, 934157334513688578, 928674125516390400, '2026-07-22 16:43:59.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938470166495588353, 934157334513688579, 928674125516390400, '2026-07-22 16:43:59.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938470166495588353, 934157334513688580, 928674125516390400, '2026-07-22 16:43:59.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938472432560603137, 934157334513688578, 928674125516390400, '2026-07-22 16:34:23.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938472432560603137, 934157334513688579, 928674125516390400, '2026-07-22 16:34:23.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938473054030626816, 934157334513688578, 928674125516390400, '2026-07-22 16:36:52.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938473054030626816, 934157334513688579, 928674125516390400, '2026-07-22 16:36:52.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938473054030626816, 934157334513688580, 928674125516390400, '2026-07-22 16:36:52.000000', 923148100619575703);
INSERT INTO `product_category_customer` VALUES (938473054030626816, 934157334513688582, 928674125516390400, '2026-07-22 16:36:52.000000', 923148100619575703);

-- ----------------------------
-- Table structure for product_material
-- ----------------------------
DROP TABLE IF EXISTS `product_material`;
CREATE TABLE `product_material`  (
  `product_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `material_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '物料ID',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户ID',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`product_id`, `material_id`) USING BTREE,
  INDEX `material_material_id_index`(`material_id` ASC) USING BTREE,
  INDEX `product_material_tenant_id_index`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品关联物料表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_material
-- ----------------------------
INSERT INTO `product_material` VALUES (934449702043369472, 934449702043369473, 928674125516390400, '2026-07-14 16:12:32.000000', 874717515526340608);
INSERT INTO `product_material` VALUES (934449702043369472, 934449702043369474, 928674125516390400, '2026-07-14 16:12:32.000000', 874717515526340608);
INSERT INTO `product_material` VALUES (934449702043369472, 934449702043369475, 928674125516390400, '2026-07-14 16:12:32.000000', 874717515526340608);

-- ----------------------------
-- Table structure for product_media
-- ----------------------------
DROP TABLE IF EXISTS `product_media`;
CREATE TABLE `product_media`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `product_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `media_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型 1=主图 2=详情图 3=视频 4=资质文件 5=其他附件',
  `file_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '文件URL',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原始文件名',
  `file_key` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '存储键/路径',
  `storage_provider` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储提供方local,oss等',
  `extension` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件拓展名',
  `file_size` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '字节大小',
  `file_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'MimeType',
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `media_product_id_index`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品图文资质附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_media
-- ----------------------------
INSERT INTO `product_media` VALUES (934449702060146688, 934449702043369472, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-11 14:09:30.207846', 874717515526340608, '2026-07-11 14:09:30.207846', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934449702064340992, 934449702043369472, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-11 14:09:30.208947', 874717515526340608, '2026-07-11 14:09:30.208947', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934449702068535296, 934449702043369472, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-11 14:09:30.209829', 874717515526340608, '2026-07-11 14:09:30.209829', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934449702072729600, 934449702043369472, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-11 14:09:30.210701', 874717515526340608, '2026-07-11 14:09:30.210701', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934451529216409600, 934451529212215296, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-11 14:16:45.835912', 874717515526340608, '2026-07-11 14:16:45.835912', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934451529220603904, 934451529212215296, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-11 14:16:45.836587', 874717515526340608, '2026-07-11 14:16:45.836587', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934451529224798208, 934451529212215296, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-11 14:16:45.837103', 874717515526340608, '2026-07-11 14:16:45.837103', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934451529224798209, 934451529212215296, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-11 14:16:45.837587', 874717515526340608, '2026-07-11 14:16:45.837587', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934451791565930496, 934451791549153280, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-11 14:17:48.384655', 874717515526340608, '2026-07-11 14:17:48.384655', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934451791574319104, 934451791549153280, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-11 14:17:48.386609', 874717515526340608, '2026-07-11 14:17:48.386609', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934451791578513408, 934451791549153280, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-11 14:17:48.388028', 874717515526340608, '2026-07-11 14:17:48.388028', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (934451791586902016, 934451791549153280, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-11 14:17:48.389513', 874717515526340608, '2026-07-11 14:17:48.389513', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935122614303842304, 935122614282870784, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-13 10:43:24.988279', 874717515526340608, '2026-07-13 10:43:24.988279', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935122614308036608, 935122614282870784, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-13 10:43:24.989231', 874717515526340608, '2026-07-13 10:43:24.989231', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935122614312230912, 935122614282870784, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-13 10:43:24.990250', 874717515526340608, '2026-07-13 10:43:24.990250', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935122614316425216, 935122614282870784, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-13 10:43:24.991121', 874717515526340608, '2026-07-13 10:43:24.991121', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935126090660446208, 935126090643668993, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-13 10:57:13.816154', 874717515526340608, '2026-07-13 10:57:13.816154', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935126090660446209, 935126090643668993, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-13 10:57:13.817019', 874717515526340608, '2026-07-13 10:57:13.817019', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935126090668834816, 935126090643668993, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-13 10:57:13.818337', 874717515526340608, '2026-07-13 10:57:13.818337', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935126090673029120, 935126090643668993, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-13 10:57:13.819671', 874717515526340608, '2026-07-13 10:57:13.819671', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935576910438866944, 935576910426284033, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-14 16:48:37.627844', 874717515526340608, '2026-07-14 16:48:37.627844', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935576910443061248, 935576910426284033, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-14 16:48:37.628615', 874717515526340608, '2026-07-14 16:48:37.628615', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935576910447255552, 935576910426284033, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-14 16:48:37.629243', 874717515526340608, '2026-07-14 16:48:37.629243', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935576910447255553, 935576910426284033, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-14 16:48:37.629837', 874717515526340608, '2026-07-14 16:48:37.629837', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935578086299414528, 935578086282637313, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-14 16:53:17.974728', 874717515526340608, '2026-07-14 16:53:17.974728', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935578086303608832, 935578086282637313, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-14 16:53:17.975458', 874717515526340608, '2026-07-14 16:53:17.975458', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935578086307803136, 935578086282637313, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-14 16:53:17.976278', 874717515526340608, '2026-07-14 16:53:17.976278', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935578086311997440, 935578086282637313, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-14 16:53:17.977088', 874717515526340608, '2026-07-14 16:53:17.977088', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935835685196419072, 935835685175447553, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-15 09:56:54.337295', 874717515526340608, '2026-07-15 09:56:54.337295', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935835685200613376, 935835685175447553, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-15 09:56:54.338357', 874717515526340608, '2026-07-15 09:56:54.338357', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935835685204807680, 935835685175447553, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-15 09:56:54.339316', 874717515526340608, '2026-07-15 09:56:54.339316', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935835685204807681, 935835685175447553, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-15 09:56:54.340022', 874717515526340608, '2026-07-15 09:56:54.340022', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935836787627290624, 935836787551793153, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-15 10:01:17.177159', 874717515526340608, '2026-07-15 10:01:17.177159', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935836787627290625, 935836787551793153, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-15 10:01:17.177920', 874717515526340608, '2026-07-15 10:01:17.177920', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935836787631484928, 935836787551793153, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-15 10:01:17.178585', 874717515526340608, '2026-07-15 10:01:17.178585', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935836787635679232, 935836787551793153, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-15 10:01:17.179125', 874717515526340608, '2026-07-15 10:01:17.179125', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935837878003728384, 935837877982756865, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-15 10:05:37.143822', 874717515526340608, '2026-07-15 10:05:37.143822', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935837878007922688, 935837877982756865, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-15 10:05:37.144894', 874717515526340608, '2026-07-15 10:05:37.144894', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935837878012116992, 935837877982756865, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-15 10:05:37.145524', 874717515526340608, '2026-07-15 10:05:37.145524', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (935837878016311296, 935837877982756865, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-15 10:05:37.146108', 874717515526340608, '2026-07-15 10:05:37.146108', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (936306966689779712, 936306966652030977, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-16 17:09:36.601102', 874717515526340608, '2026-07-16 17:09:36.601102', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (936306966698168320, 936306966652030977, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-16 17:09:36.603750', 874717515526340608, '2026-07-16 17:09:36.603750', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (936306966702362624, 936306966652030977, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-16 17:09:36.604344', 874717515526340608, '2026-07-16 17:09:36.604344', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (936306966702362625, 936306966652030977, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-16 17:09:36.604960', 874717515526340608, '2026-07-16 17:09:36.604960', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (936569151512944640, 936569151466807297, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'local', '', 0, 'image/jpeg', 10, '2026-07-17 10:31:26.334829', 874717515526340608, '2026-07-17 10:31:26.334829', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (936569151529721856, 936569151466807297, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkwfile/dev/161b77f484e511f195d2be73f578e392.jpg', 'local', '', 0, '', 10, '2026-07-17 10:31:26.338195', 874717515526340608, '2026-07-17 10:31:26.338195', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (936569151538110464, 936569151466807297, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 30, '2026-07-17 10:31:26.340869', 874717515526340608, '2026-07-17 10:31:26.340869', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (936569151546499072, 936569151466807297, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'local', '', 0, 'application/pdf', 40, '2026-07-17 10:31:26.342099', 874717515526340608, '2026-07-17 10:31:26.342099', 874717515526340608, NULL, NULL);
INSERT INTO `product_media` VALUES (938080543604805632, 938080543575445505, 1, 'https://cdn.example.com/main.jpg', 'main.jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'oss', '.jpg', 10256, 'image/jpeg', 10, '2026-07-21 14:37:10.289530', 923148100619575703, '2026-07-21 14:37:10.289530', 923148100619575703, NULL, NULL);
INSERT INTO `product_media` VALUES (938080543613194240, 938080543575445505, 2, 'https://cdn.example.com/detail.jpg', '', 'tgkvfile/dev/xxx.jpg', 'oss', '.jpg', 10256, '', 10, '2026-07-21 14:37:10.291066', 923148100619575703, '2026-07-21 14:37:10.291066', 923148100619575703, NULL, NULL);
INSERT INTO `product_media` VALUES (938080543617388544, 938080543575445505, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', 'tgkvfile/dev/xxx.jpg', 'oss', '.jpg', 10256, '', 30, '2026-07-21 14:37:10.292061', 923148100619575703, '2026-07-21 14:37:10.292061', 923148100619575703, NULL, NULL);
INSERT INTO `product_media` VALUES (938080543617388545, 938080543575445505, 4, 'https://cdn.example.com/cert.pdf', '资质.pdf', 'tgkwfile/dev/166ae89884e511f1861bbe73f578e392.pdf', 'oss', '.jpg', 10256, 'application/pdf', 40, '2026-07-21 14:37:10.292861', 923148100619575703, '2026-07-21 14:37:10.292861', 923148100619575703, NULL, NULL);
INSERT INTO `product_media` VALUES (938122823925571584, 938122823904600065, 1, 'https://tg-adc.oss-cn-shenzhen.aliyuncs.com/tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg?Expires=1784712310&OSSAccessKeyId=LTAI5tQe8vADsk9F5vEnsv8d&Signature=r5RtrBdffpvetvYGDaav97pCxFQ%3D', '9fd738cce14c4d11b8ba8c251af3be77 (3).jpg', 'tgkwfile/dev/11c4be3a84e611f1934dba29ed563b64.jpg', 'oss', 'jpg', 0, 'jpg', 10, '2026-07-21 17:25:10.703367', 923148100619575703, '2026-07-21 18:48:37.973433', 923148100619575703, NULL, NULL);
INSERT INTO `product_media` VALUES (938122823929765888, 938122823904600065, 2, 'https://tg-adc.oss-cn-shenzhen.aliyuncs.com/tgkwfile/dev/11e1da4284e611f1aed5ba29ed563b64.png?Expires=1784712310&OSSAccessKeyId=LTAI5tQe8vADsk9F5vEnsv8d&Signature=3A8OXcCNnBs%2FJZnk9Hy5lFvahds%3D', '8e032ce9-17fc-4fc8-814c-1816467157b7.png', 'tgkwfile/dev/11e1da4284e611f1aed5ba29ed563b64.png', 'oss', 'png', 0, 'png', 20, '2026-07-21 17:25:10.704281', 923148100619575703, '2026-07-21 18:48:37.975142', 923148100619575703, NULL, NULL);
INSERT INTO `product_media` VALUES (938122823929765889, 938122823904600065, 4, 'https://tg-adc.oss-cn-shenzhen.aliyuncs.com/tgkwfile/dev/1207485e84e611f18e62ba29ed563b64.pdf?Expires=1784712310&OSSAccessKeyId=LTAI5tQe8vADsk9F5vEnsv8d&Signature=5VQWheql2wUEdWldvAS0sZM1ceI%3D', 'DFC下载安装教程指引V6.2.pdf', 'tgkwfile/dev/1207485e84e611f18e62ba29ed563b64.pdf', 'oss', 'pdf', 0, 'pdf', 30, '2026-07-21 17:25:10.705012', 923148100619575703, '2026-07-21 18:48:37.976476', 923148100619575703, NULL, NULL);
INSERT INTO `product_media` VALUES (938122823933960192, 938122823904600065, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 40, '2026-07-21 17:25:10.705881', 923148100619575703, '2026-07-21 18:48:37.978808', 923148100619575703, '2026-07-21 18:48:37.978783', NULL);
INSERT INTO `product_media` VALUES (938143825954947073, 938122823904600065, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 40, '2026-07-21 18:48:37.977838', 923148100619575703, '2026-07-21 18:49:27.354467', 923148100619575703, '2026-07-21 18:49:27.354446', NULL);
INSERT INTO `product_media` VALUES (938144033052901376, 938122823904600065, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 40, '2026-07-21 18:49:27.353798', 923148100619575703, '2026-07-21 18:51:10.667970', 923148100619575703, '2026-07-21 18:51:10.667944', NULL);
INSERT INTO `product_media` VALUES (938144466383224832, 938122823904600065, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 40, '2026-07-21 18:51:10.667044', 923148100619575703, '2026-07-29 10:17:34.752261', 923148100619575703, '2026-07-29 10:17:34.752238', NULL);
INSERT INTO `product_media` VALUES (940914317984137217, 938122823904600065, 3, 'https://s1.xiaomiev.com/activity-outer-assets/0328/images/yu7_20260521/pc/2-full.mp4', '', '', 'local', '', 0, '', 40, '2026-07-29 10:17:34.751382', 923148100619575703, '2026-07-29 10:17:34.751382', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户id',
  `product_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `sku_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SKU编码(如SKU000001)（唯一，用于订单、仓储）',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '销售价',
  `market_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '划线价/市场价',
  `cost_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本价',
  `stock_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存数量',
  `weight` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '重量(KG)',
  `volume` decimal(10, 4) UNSIGNED NOT NULL DEFAULT 0.0000 COMMENT '体积(m³)',
  `sale_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '销售状态 0下架 1上架',
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sku_code_unique`(`sku_code` ASC) USING BTREE,
  INDEX `sku_tenant_id_index`(`tenant_id` ASC) USING BTREE,
  INDEX `sku_product_id_index`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品SKU价格主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku` VALUES (935122614341591040, 928674125516390400, 935122614282870784, 'SKU000001', 4999.00, 6999.00, 0.00, 11, 0.00, 0.0000, 1, 10, '2026-07-13 10:43:24.999222', 874717515526340608, '2026-07-13 10:43:24.999222', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935122614370951168, 928674125516390400, 935122614282870784, 'SKU000002', 3999.00, 5599.00, 0.00, 21, 0.00, 0.0000, 1, 20, '2026-07-13 10:43:25.005230', 874717515526340608, '2026-07-13 10:43:25.005230', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935126090702389248, 928674125516390400, 935126090643668993, 'SKU000003', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 10, '2026-07-13 10:57:13.827592', 874717515526340608, '2026-07-13 10:57:13.827592', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935126090727555072, 928674125516390400, 935126090643668993, 'SKU000004', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-13 10:57:13.833462', 874717515526340608, '2026-07-13 10:57:13.833462', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935126090744332288, 928674125516390400, 935126090643668993, 'SKU000005', 5999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-13 10:57:13.838043', 874717515526340608, '2026-07-13 10:57:13.838043', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935576910493392896, 928674125516390400, 935576910426284033, 'SKU000006', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 10, '2026-07-14 16:48:37.641475', 874717515526340608, '2026-07-14 16:48:37.641475', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935576910514364416, 928674125516390400, 935576910426284033, 'SKU000007', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-14 16:48:37.647075', 874717515526340608, '2026-07-14 16:48:37.647075', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935576910543724544, 928674125516390400, 935576910426284033, 'SKU000008', 5999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-14 16:48:37.653782', 874717515526340608, '2026-07-14 16:48:37.653782', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935578086345551872, 928674125516390400, 935578086282637313, 'SKU000009', 99.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 10, '2026-07-14 16:53:17.987496', 874717515526340608, '2026-07-14 16:53:17.987496', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935578086379106304, 928674125516390400, 935578086282637313, 'SKU000010', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-14 16:53:17.994376', 874717515526340608, '2026-07-14 16:53:17.994376', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935578086400077824, 928674125516390400, 935578086282637313, 'SKU000011', 5999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-14 16:53:17.999135', 874717515526340608, '2026-07-14 16:53:17.999135', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935835685246750720, 928674125516390400, 935835685175447553, 'SKU000012', 99.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 10, '2026-07-15 09:56:54.351283', 874717515526340608, '2026-07-15 09:56:54.351283', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935835685276110848, 928674125516390400, 935835685175447553, 'SKU000013', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-15 09:56:54.357706', 874717515526340608, '2026-07-15 09:56:54.357706', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935835685292888064, 928674125516390400, 935835685175447553, 'SKU000014', 5999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-15 09:56:54.361807', 874717515526340608, '2026-07-15 09:56:54.361807', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935836787677622272, 928674125516390400, 935836787551793153, 'SKU000015', 99.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 10, '2026-07-15 10:01:17.190878', 874717515526340608, '2026-07-15 10:01:17.190878', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935836787698593792, 928674125516390400, 935836787551793153, 'SKU000016', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-15 10:01:17.195750', 874717515526340608, '2026-07-15 10:01:17.195750', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935836787723759616, 928674125516390400, 935836787551793153, 'SKU000017', 5999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-15 10:01:17.201184', 874717515526340608, '2026-07-15 10:01:17.201184', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935837878049865728, 928674125516390400, 935837877982756865, 'SKU000018', 99.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 10, '2026-07-15 10:05:37.155851', 874717515526340608, '2026-07-15 10:05:37.155851', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935837878079225856, 928674125516390400, 935837877982756865, 'SKU000019', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-15 10:05:37.162837', 874717515526340608, '2026-07-15 10:05:37.162837', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (935837878108585984, 928674125516390400, 935837877982756865, 'SKU000020', 5999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-15 10:05:37.169511', 874717515526340608, '2026-07-15 10:05:37.169511', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (936306966761082880, 928674125516390400, 936306966652030977, 'SKU000021', 99.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 10, '2026-07-16 17:09:36.620224', 874717515526340608, '2026-07-16 17:09:36.620224', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (936306966807220224, 928674125516390400, 936306966652030977, 'SKU000022', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-16 17:09:36.631015', 874717515526340608, '2026-07-16 17:09:36.631015', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (936306966828191744, 928674125516390400, 936306966652030977, 'SKU000023', 5999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-16 17:09:36.635882', 874717515526340608, '2026-07-16 17:09:36.635882', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (936569151634579456, 928674125516390400, 936569151466807297, 'SKU000024', 99.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 10, '2026-07-17 10:31:26.367355', 874717515526340608, '2026-07-17 10:31:26.367355', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (936569151689105408, 928674125516390400, 936569151466807297, 'SKU000025', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-17 10:31:26.377986', 874717515526340608, '2026-07-17 10:31:26.377986', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (936569151739437056, 928674125516390400, 936569151466807297, 'SKU000026', 5999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-17 10:31:26.392029', 874717515526340608, '2026-07-17 10:31:26.392029', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku` VALUES (938080543646748672, 928674125516390400, 938080543575445505, 'SKU000027', 99.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 10, '2026-07-21 14:37:10.300979', 923148100619575703, '2026-07-21 14:37:10.300979', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938080543680303104, 928674125516390400, 938080543575445505, 'SKU000028', 4999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-21 14:37:10.309216', 923148100619575703, '2026-07-21 14:37:10.309216', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938080543705468928, 928674125516390400, 938080543575445505, 'SKU000029', 5999.00, 0.00, 0.00, 10, 0.00, 0.0000, 1, 20, '2026-07-21 14:37:10.314192', 923148100619575703, '2026-07-21 14:37:10.314192', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122823963320320, 928674125516390400, 938122823904600065, 'SKU000030', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 1, '2026-07-21 17:25:10.713493', 923148100619575703, '2026-07-21 17:25:10.713493', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122823988486144, 928674125516390400, 938122823904600065, 'SKU000031', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 2, '2026-07-21 17:25:10.719979', 923148100619575703, '2026-07-21 17:25:10.719979', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824030429184, 928674125516390400, 938122823904600065, 'SKU000032', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 3, '2026-07-21 17:25:10.729475', 923148100619575703, '2026-07-21 17:25:10.729475', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824051400704, 928674125516390400, 938122823904600065, 'SKU000033', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 4, '2026-07-21 17:25:10.734154', 923148100619575703, '2026-07-21 17:25:10.734154', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824072372224, 928674125516390400, 938122823904600065, 'SKU000034', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 5, '2026-07-21 17:25:10.740012', 923148100619575703, '2026-07-21 17:25:10.740012', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824097538048, 928674125516390400, 938122823904600065, 'SKU000035', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 6, '2026-07-21 17:25:10.745198', 923148100619575703, '2026-07-21 17:25:10.745198', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824114315264, 928674125516390400, 938122823904600065, 'SKU000036', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 7, '2026-07-21 17:25:10.749944', 923148100619575703, '2026-07-21 17:25:10.749944', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824135286784, 928674125516390400, 938122823904600065, 'SKU000037', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 8, '2026-07-21 17:25:10.755080', 923148100619575703, '2026-07-21 17:25:10.755080', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824156258304, 928674125516390400, 938122823904600065, 'SKU000038', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 9, '2026-07-21 17:25:10.759919', 923148100619575703, '2026-07-21 17:25:10.759919', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824177229824, 928674125516390400, 938122823904600065, 'SKU000039', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 10, '2026-07-21 17:25:10.764721', 923148100619575703, '2026-07-21 17:25:10.764721', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824198201344, 928674125516390400, 938122823904600065, 'SKU000040', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 11, '2026-07-21 17:25:10.769721', 923148100619575703, '2026-07-21 17:25:10.769721', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku` VALUES (938122824219172864, 928674125516390400, 938122823904600065, 'SKU000041', 0.00, 0.00, 0.00, 0, 0.00, 0.0000, 1, 12, '2026-07-21 17:25:10.774999', 923148100619575703, '2026-07-21 17:25:10.774999', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for product_sku_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `product_sku_spec_value`;
CREATE TABLE `product_sku_spec_value`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `sku_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联SKU表ID product_sku.id',
  `spec_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联规格维度ID product_specification.id',
  `spec_value_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联规格值ID product_specification_value.id',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sku_spec_value_unique`(`sku_id` ASC, `spec_id` ASC, `spec_value_id` ASC) USING BTREE,
  INDEX `sku_spec_sku_id_index`(`sku_id` ASC) USING BTREE,
  INDEX `sku_spec_value_id_index`(`spec_value_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'SKU-规格值关联中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_sku_spec_value
-- ----------------------------
INSERT INTO `product_sku_spec_value` VALUES (935122614358368256, 935122614341591040, 934121521176350720, 934121521205710848, '2026-07-13 10:43:25.002015', 874717515526340608, '2026-07-13 10:43:25.002015', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935122614379339776, 935122614370951168, 934121521176350720, 934121521243459584, '2026-07-13 10:43:25.006513', 874717515526340608, '2026-07-13 10:43:25.006513', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935126090714972160, 935126090702389248, 934109584896000001, 934113418577936384, '2026-07-13 10:57:13.829212', 874717515526340608, '2026-07-13 10:57:13.829212', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935126090714972161, 935126090702389248, 934121521176350720, 934121521205710848, '2026-07-13 10:57:13.829885', 874717515526340608, '2026-07-13 10:57:13.829885', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935126090735943680, 935126090727555072, 934109584896000001, 934113418603102208, '2026-07-13 10:57:13.834524', 874717515526340608, '2026-07-13 10:57:13.834524', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935126090735943681, 935126090727555072, 934121521176350720, 934121521226682368, '2026-07-13 10:57:13.834996', 874717515526340608, '2026-07-13 10:57:13.834996', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935126090756915200, 935126090744332288, 934109584896000001, 934113418632462336, '2026-07-13 10:57:13.839057', 874717515526340608, '2026-07-13 10:57:13.839057', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935126090756915201, 935126090744332288, 934121521176350720, 934121521251848192, '2026-07-13 10:57:13.839550', 874717515526340608, '2026-07-13 10:57:13.839550', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935576910505975808, 935576910493392896, 934109584896000001, 934113418577936384, '2026-07-14 16:48:37.643410', 874717515526340608, '2026-07-14 16:48:37.643410', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935576910510170112, 935576910493392896, 934121521176350720, 934121521205710848, '2026-07-14 16:48:37.644061', 874717515526340608, '2026-07-14 16:48:37.644061', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935576910526947328, 935576910514364416, 934109584896000001, 934113418603102208, '2026-07-14 16:48:37.648210', 874717515526340608, '2026-07-14 16:48:37.648210', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935576910526947329, 935576910514364416, 934121521176350720, 934121521226682368, '2026-07-14 16:48:37.648794', 874717515526340608, '2026-07-14 16:48:37.648794', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935576910556307456, 935576910543724544, 934109584896000001, 934113418632462336, '2026-07-14 16:48:37.655099', 874717515526340608, '2026-07-14 16:48:37.655099', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935576910556307457, 935576910543724544, 934121521176350720, 934121521251848192, '2026-07-14 16:48:37.655781', 874717515526340608, '2026-07-14 16:48:37.655781', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935578086366523392, 935578086345551872, 934109584896000001, 934113418577936384, '2026-07-14 16:53:17.990150', 874717515526340608, '2026-07-14 16:53:17.990150', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935578086370717696, 935578086345551872, 934121521176350720, 934121521205710848, '2026-07-14 16:53:17.991036', 874717515526340608, '2026-07-14 16:53:17.991036', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935578086387494912, 935578086379106304, 934109584896000001, 934113418603102208, '2026-07-14 16:53:17.995516', 874717515526340608, '2026-07-14 16:53:17.995516', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935578086391689216, 935578086379106304, 934121521176350720, 934121521226682368, '2026-07-14 16:53:17.996070', 874717515526340608, '2026-07-14 16:53:17.996070', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935578086408466432, 935578086400077824, 934109584896000001, 934113418632462336, '2026-07-14 16:53:18.000491', 874717515526340608, '2026-07-14 16:53:18.000491', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935578086412660736, 935578086400077824, 934121521176350720, 934121521251848192, '2026-07-14 16:53:18.001230', 874717515526340608, '2026-07-14 16:53:18.001230', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935835685267722240, 935835685246750720, 934109584896000001, 934113418577936384, '2026-07-15 09:56:54.354206', 874717515526340608, '2026-07-15 09:56:54.354206', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935835685267722241, 935835685246750720, 934121521176350720, 934121521205710848, '2026-07-15 09:56:54.354902', 874717515526340608, '2026-07-15 09:56:54.354902', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935835685284499456, 935835685276110848, 934109584896000001, 934113418603102208, '2026-07-15 09:56:54.358615', 874717515526340608, '2026-07-15 09:56:54.358615', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935835685288693760, 935835685276110848, 934121521176350720, 934121521226682368, '2026-07-15 09:56:54.359102', 874717515526340608, '2026-07-15 09:56:54.359102', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935835685301276672, 935835685292888064, 934109584896000001, 934113418632462336, '2026-07-15 09:56:54.362779', 874717515526340608, '2026-07-15 09:56:54.362779', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935835685305470976, 935835685292888064, 934121521176350720, 934121521251848192, '2026-07-15 09:56:54.363342', 874717515526340608, '2026-07-15 09:56:54.363342', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935836787690205184, 935836787677622272, 934109584896000001, 934113418577936384, '2026-07-15 10:01:17.192412', 874717515526340608, '2026-07-15 10:01:17.192412', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935836787690205185, 935836787677622272, 934121521176350720, 934121521205710848, '2026-07-15 10:01:17.192916', 874717515526340608, '2026-07-15 10:01:17.192916', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935836787711176704, 935836787698593792, 934109584896000001, 934113418603102208, '2026-07-15 10:01:17.197216', 874717515526340608, '2026-07-15 10:01:17.197216', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935836787711176705, 935836787698593792, 934121521176350720, 934121521226682368, '2026-07-15 10:01:17.197985', 874717515526340608, '2026-07-15 10:01:17.197985', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935836787732148224, 935836787723759616, 934109584896000001, 934113418632462336, '2026-07-15 10:01:17.202280', 874717515526340608, '2026-07-15 10:01:17.202280', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935836787732148225, 935836787723759616, 934121521176350720, 934121521251848192, '2026-07-15 10:01:17.202927', 874717515526340608, '2026-07-15 10:01:17.202927', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935837878062448640, 935837878049865728, 934109584896000001, 934113418577936384, '2026-07-15 10:05:37.157889', 874717515526340608, '2026-07-15 10:05:37.157889', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935837878066642944, 935837878049865728, 934121521176350720, 934121521205710848, '2026-07-15 10:05:37.158819', 874717515526340608, '2026-07-15 10:05:37.158819', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935837878091808768, 935837878079225856, 934109584896000001, 934113418603102208, '2026-07-15 10:05:37.164354', 874717515526340608, '2026-07-15 10:05:37.164354', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935837878096003072, 935837878079225856, 934121521176350720, 934121521226682368, '2026-07-15 10:05:37.165245', 874717515526340608, '2026-07-15 10:05:37.165245', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935837878121168896, 935837878108585984, 934109584896000001, 934113418632462336, '2026-07-15 10:05:37.171404', 874717515526340608, '2026-07-15 10:05:37.171404', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (935837878125363200, 935837878108585984, 934121521176350720, 934121521251848192, '2026-07-15 10:05:37.172339', 874717515526340608, '2026-07-15 10:05:37.172339', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936306966790443008, 936306966761082880, 934109584896000001, 934113418577936384, '2026-07-16 17:09:36.625437', 874717515526340608, '2026-07-16 17:09:36.625437', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936306966794637312, 936306966761082880, 934121521176350720, 934121521205710848, '2026-07-16 17:09:36.626649', 874717515526340608, '2026-07-16 17:09:36.626649', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936306966819803136, 936306966807220224, 934109584896000001, 934113418603102208, '2026-07-16 17:09:36.632199', 874717515526340608, '2026-07-16 17:09:36.632199', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936306966819803137, 936306966807220224, 934121521176350720, 934121521226682368, '2026-07-16 17:09:36.632823', 874717515526340608, '2026-07-16 17:09:36.632823', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936306966840774656, 936306966828191744, 934109584896000001, 934113418632462336, '2026-07-16 17:09:36.637497', 874717515526340608, '2026-07-16 17:09:36.637497', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936306966844968960, 936306966828191744, 934121521176350720, 934121521251848192, '2026-07-16 17:09:36.638166', 874717515526340608, '2026-07-16 17:09:36.638166', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936569151668133888, 936569151634579456, 934109584896000001, 934113418577936384, '2026-07-17 10:31:26.371754', 874717515526340608, '2026-07-17 10:31:26.371754', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936569151672328192, 936569151634579456, 934121521176350720, 934121521205710848, '2026-07-17 10:31:26.373045', 874717515526340608, '2026-07-17 10:31:26.373045', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936569151705882624, 936569151689105408, 934109584896000001, 934113418603102208, '2026-07-17 10:31:26.380206', 874717515526340608, '2026-07-17 10:31:26.380206', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936569151710076928, 936569151689105408, 934121521176350720, 934121521226682368, '2026-07-17 10:31:26.381136', 874717515526340608, '2026-07-17 10:31:26.381136', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936569151772991488, 936569151739437056, 934109584896000001, 934113418632462336, '2026-07-17 10:31:26.396088', 874717515526340608, '2026-07-17 10:31:26.396088', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (936569151777185792, 936569151739437056, 934121521176350720, 934121521251848192, '2026-07-17 10:31:26.397265', 874717515526340608, '2026-07-17 10:31:26.397265', 874717515526340608, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (938080543663525888, 938080543646748672, 934109584896000001, 934113418577936384, '2026-07-21 14:37:10.303796', 923148100619575703, '2026-07-21 14:37:10.303796', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (938080543667720192, 938080543646748672, 934121521176350720, 934121521205710848, '2026-07-21 14:37:10.304765', 923148100619575703, '2026-07-21 14:37:10.304765', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (938080543692886016, 938080543680303104, 934109584896000001, 934113418603102208, '2026-07-21 14:37:10.310481', 923148100619575703, '2026-07-21 14:37:10.310481', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (938080543692886017, 938080543680303104, 934121521176350720, 934121521226682368, '2026-07-21 14:37:10.311008', 923148100619575703, '2026-07-21 14:37:10.311008', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (938080543713857536, 938080543705468928, 934109584896000001, 934113418632462336, '2026-07-21 14:37:10.315547', 923148100619575703, '2026-07-21 14:37:10.315547', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (938080543718051840, 938080543705468928, 934121521176350720, 934121521251848192, '2026-07-21 14:37:10.316130', 923148100619575703, '2026-07-21 14:37:10.316130', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318017691648, 938122823963320320, 934109584896000001, 934113418577936384, '2026-07-29 10:17:34.758502', 923148100619575703, '2026-07-29 10:17:34.758502', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318021885952, 938122823963320320, 934118417513025537, 934118417529802752, '2026-07-29 10:17:34.759316', 923148100619575703, '2026-07-29 10:17:34.759316', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318021885953, 938122823963320320, 936574445181775872, 936574445219524608, '2026-07-29 10:17:34.759928', 923148100619575703, '2026-07-29 10:17:34.759928', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318042857472, 938122823988486144, 934109584896000001, 934113418594713600, '2026-07-29 10:17:34.764066', 923148100619575703, '2026-07-29 10:17:34.764066', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318042857473, 938122823988486144, 934118417513025537, 934118417529802752, '2026-07-29 10:17:34.764744', 923148100619575703, '2026-07-29 10:17:34.764744', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318047051776, 938122823988486144, 936574445181775872, 936574445219524608, '2026-07-29 10:17:34.765449', 923148100619575703, '2026-07-29 10:17:34.765449', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318063828992, 938122824030429184, 934109584896000001, 934113418603102208, '2026-07-29 10:17:34.769258', 923148100619575703, '2026-07-29 10:17:34.769258', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318063828993, 938122824030429184, 934118417513025537, 934118417529802752, '2026-07-29 10:17:34.769923', 923148100619575703, '2026-07-29 10:17:34.769923', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318068023296, 938122824030429184, 936574445181775872, 936574445219524608, '2026-07-29 10:17:34.770516', 923148100619575703, '2026-07-29 10:17:34.770516', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318080606208, 938122824051400704, 934109584896000001, 934113418577936384, '2026-07-29 10:17:34.773701', 923148100619575703, '2026-07-29 10:17:34.773701', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318084800512, 938122824051400704, 934118417513025537, 934118417550774272, '2026-07-29 10:17:34.774261', 923148100619575703, '2026-07-29 10:17:34.774261', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318084800513, 938122824051400704, 936574445181775872, 936574445219524608, '2026-07-29 10:17:34.774782', 923148100619575703, '2026-07-29 10:17:34.774782', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318097383424, 938122824072372224, 934109584896000001, 934113418594713600, '2026-07-29 10:17:34.777742', 923148100619575703, '2026-07-29 10:17:34.777742', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318101577728, 938122824072372224, 934118417513025537, 934118417550774272, '2026-07-29 10:17:34.778586', 923148100619575703, '2026-07-29 10:17:34.778586', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318105772032, 938122824072372224, 936574445181775872, 936574445219524608, '2026-07-29 10:17:34.779266', 923148100619575703, '2026-07-29 10:17:34.779266', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318118354944, 938122824097538048, 934109584896000001, 934113418603102208, '2026-07-29 10:17:34.782287', 923148100619575703, '2026-07-29 10:17:34.782287', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318118354945, 938122824097538048, 934118417513025537, 934118417550774272, '2026-07-29 10:17:34.782815', 923148100619575703, '2026-07-29 10:17:34.782815', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318122549248, 938122824097538048, 936574445181775872, 936574445219524608, '2026-07-29 10:17:34.783507', 923148100619575703, '2026-07-29 10:17:34.783507', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318135132160, 938122824114315264, 934109584896000001, 934113418577936384, '2026-07-29 10:17:34.786651', 923148100619575703, '2026-07-29 10:17:34.786651', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318139326464, 938122824114315264, 934118417513025537, 934118417529802752, '2026-07-29 10:17:34.787207', 923148100619575703, '2026-07-29 10:17:34.787207', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318139326465, 938122824114315264, 936574445181775872, 936574445227913216, '2026-07-29 10:17:34.787762', 923148100619575703, '2026-07-29 10:17:34.787762', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318151909376, 938122824135286784, 934109584896000001, 934113418594713600, '2026-07-29 10:17:34.790833', 923148100619575703, '2026-07-29 10:17:34.790833', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318156103680, 938122824135286784, 934118417513025537, 934118417529802752, '2026-07-29 10:17:34.791313', 923148100619575703, '2026-07-29 10:17:34.791313', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318156103681, 938122824135286784, 936574445181775872, 936574445227913216, '2026-07-29 10:17:34.791989', 923148100619575703, '2026-07-29 10:17:34.791989', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318172880896, 938122824156258304, 934109584896000001, 934113418603102208, '2026-07-29 10:17:34.795327', 923148100619575703, '2026-07-29 10:17:34.795327', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318172880897, 938122824156258304, 934118417513025537, 934118417529802752, '2026-07-29 10:17:34.795932', 923148100619575703, '2026-07-29 10:17:34.795932', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318177075200, 938122824156258304, 936574445181775872, 936574445227913216, '2026-07-29 10:17:34.796504', 923148100619575703, '2026-07-29 10:17:34.796504', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318189658112, 938122824177229824, 934109584896000001, 934113418577936384, '2026-07-29 10:17:34.799632', 923148100619575703, '2026-07-29 10:17:34.799632', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318193852416, 938122824177229824, 934118417513025537, 934118417550774272, '2026-07-29 10:17:34.800219', 923148100619575703, '2026-07-29 10:17:34.800219', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318193852417, 938122824177229824, 936574445181775872, 936574445227913216, '2026-07-29 10:17:34.800749', 923148100619575703, '2026-07-29 10:17:34.800749', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318210629632, 938122824198201344, 934109584896000001, 934113418594713600, '2026-07-29 10:17:34.804110', 923148100619575703, '2026-07-29 10:17:34.804110', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318210629633, 938122824198201344, 934118417513025537, 934118417550774272, '2026-07-29 10:17:34.804630', 923148100619575703, '2026-07-29 10:17:34.804630', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318214823936, 938122824198201344, 936574445181775872, 936574445227913216, '2026-07-29 10:17:34.805209', 923148100619575703, '2026-07-29 10:17:34.805209', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318227406848, 938122824219172864, 934109584896000001, 934113418603102208, '2026-07-29 10:17:34.808338', 923148100619575703, '2026-07-29 10:17:34.808338', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318227406849, 938122824219172864, 934118417513025537, 934118417550774272, '2026-07-29 10:17:34.808948', 923148100619575703, '2026-07-29 10:17:34.808948', 923148100619575703, NULL, NULL);
INSERT INTO `product_sku_spec_value` VALUES (940914318231601152, 938122824219172864, 936574445181775872, 936574445227913216, '2026-07-29 10:17:34.809806', 923148100619575703, '2026-07-29 10:17:34.809806', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for product_specification
-- ----------------------------
DROP TABLE IF EXISTS `product_specification`;
CREATE TABLE `product_specification`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户id',
  `spec_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统产生编码GL000001自增',
  `spec_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `spec_remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `spec_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 0=隐藏 1=显示',
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `specification_tenant_id_index`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '规格主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_specification
-- ----------------------------
INSERT INTO `product_specification` VALUES (934109584896000001, 928674125516390400, 'GL000001', '颜色', '商品的外观颜色，是区分款式最直接的方式之一', 1, 0, '2026-07-10 15:37:59.959261', 874717515526340608, '2026-07-10 15:37:59.959261', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification` VALUES (934110239475859456, 928674125516390400, 'GL000002', '材质', '服装、鞋帽等商品的号型，决定大小和适穿范围', 1, 0, '2026-07-10 15:40:36.021867', 874717515526340608, '2026-07-10 15:40:36.021867', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification` VALUES (934110438239731712, 928674125516390400, 'GL000003', '尺寸', 'XS, S, M, L, XL；鞋码 36, 37, 38', 1, 0, '2026-07-10 15:41:23.411036', 874717515526340608, '2026-07-10 15:41:23.411036', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification` VALUES (934118417513025537, 928674125516390400, 'GL000004', '容量', '液体、食品、日化等商品的净含量', 1, 0, '2026-07-10 16:13:05.819049', 874717515526340608, '2026-07-10 16:13:05.819049', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification` VALUES (934120777819852800, 928674125516390400, 'GL000005', '净含量', '数码、家电等商品的性能配置参数', 1, 0, '2026-07-10 16:22:28.558690', 874717515526340608, '2026-07-10 16:22:28.558690', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification` VALUES (934121521176350720, 928674125516390400, 'GL000006', '处理器型号', '可以根据商品特性创建的自定义规格，例如版型、口味、材质等', 1, 0, '2026-07-10 16:25:25.790862', 874717515526340608, '2026-07-10 16:25:25.790862', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification` VALUES (934121672418758656, 928674125516390400, 'GL000007', '标准尺码', '男版/女版、香草味/巧克力味、纯棉/涤纶', 1, 0, '2026-07-10 16:26:01.847960', 874717515526340608, '2026-07-10 16:26:01.847960', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification` VALUES (936574445181775872, 928674125516390400, 'GL000008', '款式', '新旧款任意挑选', 1, 0, '2026-07-17 10:52:28.446306', 874717515526340608, '2026-07-17 10:52:28.446306', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification` VALUES (938500810579742720, 928674125516390400, 'GL000009', '显卡型号1', '规则1', 1, 0, '2026-07-22 18:27:09.745581', 923148100619575703, '2026-07-22 18:27:49.628762', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for product_specification_value
-- ----------------------------
DROP TABLE IF EXISTS `product_specification_value`;
CREATE TABLE `product_specification_value`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键(雪花ID)',
  `spec_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联规格ID',
  `value_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统产生编码GV000001自增',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规格值（如“红色”、“实木”）',
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `value_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 0=隐藏 1=显示',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) NULL DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `spec_value_spec_id_index`(`spec_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '规格值表-规格值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_specification_value
-- ----------------------------
INSERT INTO `product_specification_value` VALUES (934109584912777216, 934109584896000001, 'GV000001', '米白色', 10, 1, '2026-07-10 15:37:59.962367', 874717515526340608, '2026-07-10 15:37:59.962367', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934109584925360128, 934109584896000001, 'GV000002', '深咖色', 9, 1, '2026-07-10 15:37:59.965038', 874717515526340608, '2026-07-10 15:47:32.791913', 874717515526340608, '2026-07-10 15:47:32.791887', NULL);
INSERT INTO `product_specification_value` VALUES (934110239488442368, 934110239475859456, 'GV000003', '亚克力板', 10, 1, '2026-07-10 15:40:36.024384', 874717515526340608, '2026-07-10 15:40:36.024384', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934110239496830976, 934110239475859456, 'GV000004', '实木', 9, 1, '2026-07-10 15:40:36.026409', 874717515526340608, '2026-07-10 15:40:36.026409', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934110239505219584, 934110239475859456, 'GV000005', '玻璃', 11, 1, '2026-07-10 15:40:36.028370', 874717515526340608, '2026-07-10 15:40:36.028370', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934110239513608192, 934110239475859456, 'GV000006', '塑料', 12, 1, '2026-07-10 15:40:36.031215', 874717515526340608, '2026-07-10 15:40:36.031215', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934110438252314624, 934110438239731712, 'GV000007', '450 × 520 × 820（座高460）', 10, 1, '2026-07-10 15:41:23.414211', 874717515526340608, '2026-07-10 15:41:23.414211', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934110438264897536, 934110438239731712, 'GV000008', '1800 × 850 × 750（座高420）', 9, 1, '2026-07-10 15:41:23.416513', 874717515526340608, '2026-07-10 15:41:23.416513', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934110438273286144, 934110438239731712, 'GV000009', '2100 × 850 × 750（座高420）', 11, 1, '2026-07-10 15:41:23.418662', 874717515526340608, '2026-07-10 15:41:23.418662', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934111987531743232, 934109584896000001, 'GV000012', '新增色', 8, 1, '2026-07-10 15:47:32.791105', 874717515526340608, '2026-07-10 15:53:13.996273', 874717515526340608, '2026-07-10 15:53:13.996243', NULL);
INSERT INTO `product_specification_value` VALUES (934113418577936384, 934109584896000001, 'GV000013', '黄色', 8, 1, '2026-07-10 15:53:13.979798', 874717515526340608, '2026-07-10 15:53:13.979798', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934113418594713600, 934109584896000001, 'GV000014', '绿色', 8, 1, '2026-07-10 15:53:13.982589', 874717515526340608, '2026-07-10 15:53:13.982589', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934113418603102208, 934109584896000001, 'GV000015', '青蓝色', 8, 1, '2026-07-10 15:53:13.985585', 874717515526340608, '2026-07-10 15:53:13.985585', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934113418619879424, 934109584896000001, 'GV000016', '天青色', 8, 1, '2026-07-10 15:53:13.988652', 874717515526340608, '2026-07-10 15:53:13.988652', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934113418632462336, 934109584896000001, 'GV000017', '粉色', 8, 1, '2026-07-10 15:53:13.991223', 874717515526340608, '2026-07-10 15:53:13.991223', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934113418645045248, 934109584896000001, 'GV000018', '深咖色', 8, 1, '2026-07-10 15:53:13.995497', 874717515526340608, '2026-07-10 15:53:13.995497', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934118417529802752, 934118417513025537, 'GV000019', '128G', 13, 1, '2026-07-10 16:13:05.821861', 874717515526340608, '2026-07-10 16:13:05.821861', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934118417542385664, 934118417513025537, 'GV000020', '256G', 19, 1, '2026-07-10 16:13:05.823986', 874717515526340608, '2026-07-10 16:13:05.823986', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934118417550774272, 934118417513025537, 'GV000021', '512G', 14, 1, '2026-07-10 16:13:05.826582', 874717515526340608, '2026-07-10 16:13:05.826582', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934118417559162880, 934118417513025537, 'GV000022', '1024G', 15, 1, '2026-07-10 16:13:05.828968', 874717515526340608, '2026-07-10 16:13:05.828968', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934120777828241408, 934120777819852800, 'GV000023', '100g', 13, 1, '2026-07-10 16:22:28.560970', 874717515526340608, '2026-07-10 16:22:28.560970', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934120777840824320, 934120777819852800, 'GV000024', '200g', 19, 1, '2026-07-10 16:22:28.563586', 874717515526340608, '2026-07-10 16:22:28.563586', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934120777849212928, 934120777819852800, 'GV000025', '500g', 14, 1, '2026-07-10 16:22:28.566148', 874717515526340608, '2026-07-10 16:22:28.566148', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934120777861795840, 934120777819852800, 'GV000026', '1024g', 15, 1, '2026-07-10 16:22:28.569220', 874717515526340608, '2026-07-10 16:22:28.569220', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934121521205710848, 934121521176350720, 'GV000027', 'i3处理器', 13, 1, '2026-07-10 16:25:25.796806', 874717515526340608, '2026-07-10 16:25:25.796806', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934121521226682368, 934121521176350720, 'GV000028', 'i5处理器', 19, 1, '2026-07-10 16:25:25.801854', 874717515526340608, '2026-07-10 16:25:25.801854', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934121521243459584, 934121521176350720, 'GV000029', 'i7处理器', 14, 1, '2026-07-10 16:25:25.804468', 874717515526340608, '2026-07-10 16:25:25.804468', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934121521251848192, 934121521176350720, 'GV000030', 'i9处理器', 15, 1, '2026-07-10 16:25:25.806669', 874717515526340608, '2026-07-10 16:25:25.806669', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (934121672431341568, 934121672418758656, 'GV000031', '40码', 13, 1, '2026-07-10 16:26:01.851612', 874717515526340608, '2026-07-10 16:26:01.851612', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (936574445219524608, 936574445181775872, 'GV000032', '2026款', 13, 1, '2026-07-17 10:52:28.453700', 874717515526340608, '2026-07-17 10:52:28.453700', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (936574445227913216, 936574445181775872, 'GV000033', '2027新款', 19, 1, '2026-07-17 10:52:28.456202', 874717515526340608, '2026-07-17 10:52:28.456202', 874717515526340608, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (938500810592325632, 938500810579742720, 'GV000034', '1060', 1, 1, '2026-07-22 18:27:09.750016', 923148100619575703, '2026-07-22 18:27:09.750016', 923148100619575703, NULL, NULL);
INSERT INTO `product_specification_value` VALUES (938500810609102848, 938500810579742720, 'GV000035', '2070', 2, 1, '2026-07-22 18:27:09.753452', 923148100619575703, '2026-07-22 18:27:09.753452', 923148100619575703, NULL, NULL);

-- ----------------------------
-- Table structure for tenant_order_seq
-- ----------------------------
DROP TABLE IF EXISTS `tenant_order_seq`;
CREATE TABLE `tenant_order_seq`  (
  `tenant_id` bigint UNSIGNED NOT NULL COMMENT '租户ID',
  `seq_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '序列类型',
  `current_order` int NOT NULL DEFAULT 0 COMMENT '当前租户内的连续序号',
  `updated_at` datetime(6) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`tenant_id`, `seq_type`) USING BTREE,
  INDEX `tenant_order_seq_tenant_id_seq_type_index`(`tenant_id` ASC, `seq_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_order_seq
-- ----------------------------
INSERT INTO `tenant_order_seq` VALUES (928674125516390400, 'product', 15, '2026-07-21 17:25:10.000000');
INSERT INTO `tenant_order_seq` VALUES (928674125516390400, 'product_brand', 16, '2026-07-22 18:13:48.000000');
INSERT INTO `tenant_order_seq` VALUES (928674125516390400, 'product_category', 18, '2026-07-22 16:36:52.000000');
INSERT INTO `tenant_order_seq` VALUES (928674125516390400, 'product_sku', 41, '2026-07-21 17:25:10.000000');
INSERT INTO `tenant_order_seq` VALUES (928674125516390400, 'product_specification', 9, '2026-07-22 18:27:09.000000');
INSERT INTO `tenant_order_seq` VALUES (928674125516390400, 'product_specification_value', 35, '2026-07-22 18:27:09.000000');

-- ----------------------------
-- Table structure for user_project
-- ----------------------------
DROP TABLE IF EXISTS `user_project`;
CREATE TABLE `user_project`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键(雪花ID)',
  `user_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户',
  `project_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'project名字',
  `desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `post` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位',
  `in_at` datetime NULL DEFAULT NULL COMMENT '入时间',
  `created_at` datetime(6) NULL DEFAULT NULL COMMENT '加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户-项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_project
-- ----------------------------
INSERT INTO `user_project` VALUES (1, '阳再', 'project', '项目经理', 'PHP后端', '2025-05-30 15:29:56', NULL);
INSERT INTO `user_project` VALUES (2, '阳再', 'req', '需求中心', 'PHP后端', '2025-05-30 15:29:56', NULL);
INSERT INTO `user_project` VALUES (3, '虞意', 'clm', 'clm客户关系管理', 'PHP后端', '2025-05-30 15:29:56', NULL);
INSERT INTO `user_project` VALUES (4, '陈进', 'clm', 'clm客户关系管理', 'PHP后端', '2025-09-25 15:33:10', NULL);
INSERT INTO `user_project` VALUES (6, '叶萍', 'fiance', '业财一体', 'PHP后端', '2025-05-30 15:29:56', NULL);
INSERT INTO `user_project` VALUES (10, '杨松', 'merchant', '商家中心', 'PHP后端', '2026-06-02 15:15:37', NULL);
INSERT INTO `user_project` VALUES (13, '林泉', 'knowledge', '知识库', 'PHP后端', '2026-03-11 15:31:14', NULL);
INSERT INTO `user_project` VALUES (14, '林泉', 'work-order', '工单中心', 'PHP后端', '2026-03-11 15:31:14', NULL);
INSERT INTO `user_project` VALUES (15, '林泉', 'work-hour', '工时中心', 'PHP后端', '2026-03-11 15:31:14', NULL);
INSERT INTO `user_project` VALUES (16, '林泉', 'revisit', '回访中心', 'PHP后端', '2026-03-11 15:31:14', NULL);
INSERT INTO `user_project` VALUES (17, '林泉', 'calendar', '日历中心', 'PHP后端', '2026-03-11 15:31:14', NULL);
INSERT INTO `user_project` VALUES (18, '林泉', 'sas', '财务分账', 'PHP后端', '2026-03-11 15:31:14', NULL);
INSERT INTO `user_project` VALUES (21, '李骐宇', 'letter', '工具-函件', 'PHP后端', '2026-01-04 15:31:45', NULL);
INSERT INTO `user_project` VALUES (22, '李骐宇', 'sas', '财务分账', 'PHP后端', '2026-01-04 15:31:45', NULL);
INSERT INTO `user_project` VALUES (23, '李骐宇', 'work-task', '任务中心', 'PHP后端', '2026-01-04 15:31:45', NULL);
INSERT INTO `user_project` VALUES (31, '田超', 'approval', '审批', 'PHP后端', '2026-01-14 15:30:43', NULL);
INSERT INTO `user_project` VALUES (32, '田超', 'message', '消息中心', 'PHP后端', '2026-01-14 15:30:43', NULL);
INSERT INTO `user_project` VALUES (33, '田超', 'contract', '合同中心', 'PHP后端', '2026-01-14 15:30:43', NULL);
INSERT INTO `user_project` VALUES (50, '钟东杰', 'scm', '供应链', 'PHP后端', '2026-06-30 15:32:41', NULL);
INSERT INTO `user_project` VALUES (60, '刘广富', 'hr', 'hr', 'PHP后端', '2025-12-16 15:32:17', NULL);
INSERT INTO `user_project` VALUES (70, '', 'project', '项目中心', 'PHP后端', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
