/*
Navicat MySQL Data Transfer 流程模块数据表设计

Source Server         : local
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : process

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2021-04-09 16:22:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for process_account
-- ----------------------------
DROP TABLE IF EXISTS `process_account`;
CREATE TABLE `process_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '银行卡户名',
  `account_num` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '银行卡卡号',
  `account_bank` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '开户行名称',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '余额额',
  `remark` varchar(1024) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人：用户id',
  `editer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编辑人：用户id',
  `company_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '细胞id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1=删除禁用,0=正常',
  `is_platform` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=个人银行卡,1=平台银行卡',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='流程管理：银行卡账号管理表';

-- ----------------------------
-- Table structure for process_account_log
-- ----------------------------
DROP TABLE IF EXISTS `process_account_log`;
CREATE TABLE `process_account_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_sn` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '交易流水',
  `operation_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '操作类型：1=收入,0=支出',
  `transaction_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '交易类型：1=付款,0=购买,2=充值,3=出售 等',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '收支变动的金额',
  `balance` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '变动后的余额',
  `remark` varchar(1024) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `payer_account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付款银行卡id',
  `payee_account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '对方银行卡id',
  `files_url` varchar(2048) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '付款收款-截图URL',
  `program_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '流程id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1=删除禁用,0=正常',
  `pay_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '付款时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `payer_account_id` (`payer_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='流程管理：收款账号收入支出流水表';

-- ----------------------------
-- Table structure for process_contract
-- ----------------------------
DROP TABLE IF EXISTS `process_contract`;
CREATE TABLE `process_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_no` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '合同编号',
  `contract_name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '合同名称',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '合同总金额',
  `payment` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '合同已支付金额',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请用户id',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '合同内容',
  `files_url` text COLLATE utf8mb4_unicode_ci COMMENT '合同附件URL',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=有效,1=无效,2=可撤销,3=待定',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_no` (`contract_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='流程管理：合同信息表';

-- ----------------------------
-- Table structure for process_flow
-- ----------------------------
DROP TABLE IF EXISTS `process_flow`;
CREATE TABLE `process_flow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flow_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '流程名称',
  `flow_code` varchar(16) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '标签:财务(CW),人事(RS)',
  `flow_desc` varchar(512) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '流程简介说明',
  `flow_node` varchar(4096) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '平台自定义的流程节点json格式',
  `copy_user_id` varchar(512) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '抄送用户id：逗号分隔',
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '流程类型id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人：用户id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1=删除禁用,0=正常',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程管理：流程表';

-- ----------------------------
-- Table structure for process_form
-- ----------------------------
DROP TABLE IF EXISTS `process_form`;
CREATE TABLE `process_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flow_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '流程id',
  `type` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '字段类型',
  `field_length` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '字段长度',
  `field_desc` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '字段注释',
  `input_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '表单类型id',
  `field_name` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '字段名',
  `must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1=必填,0=正常',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1=删除,0=正常',
  `input_title` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '表单标题',
  `placeholder` varchar(128) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '表单提示',
  `key_value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单选多选下拉框：字段可选值：json',
  `time_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=年月日时分,1=年月日时,2=年月日,3=年月',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `flow_id` (`flow_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程管理：流程表单字段表';

-- ----------------------------
-- Table structure for process_log
-- ----------------------------
DROP TABLE IF EXISTS `process_log`;
CREATE TABLE `process_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flow_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '流程id',
  `program_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '待审批项目id',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审批角色id',
  `role_has_user_ids` varchar(1024) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '该角色下的所有用户ids',
  `node_name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '(角色/用户)名字',
  `approval_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审批人用户id',
  `node_id` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '节点id',
  `op_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '操作状态：0=申请，1=已审批',
  `content` varchar(1024) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '审批备注意见',
  `files_url` varchar(1024) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '附件URL',
  `result` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=待审核,1通过,2=驳回,3=撤回,4=通过后撤回',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `flow_id` (`flow_id`) USING BTREE,
  KEY `program_id` (`program_id`) USING BTREE,
  KEY `approval_user_id` (`approval_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程管理：审批记录表';

-- ----------------------------
-- Table structure for process_node
-- ----------------------------
DROP TABLE IF EXISTS `process_node`;
CREATE TABLE `process_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '所属系统：0=订单系统,1平台,2=其他...',
  `company_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '细胞/事业部ids，逗号分割（平台默认=0）',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '细胞/事业部自定义审批节点json',
  `flow_ids` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '配置的流程ids',
  `create_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人id',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=正常，1=删除',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序权重-越大越高',
  `desc` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注说明',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='流程管理：审批节点配置表';

-- ----------------------------
-- Table structure for process_payment
-- ----------------------------
DROP TABLE IF EXISTS `process_payment`;
CREATE TABLE `process_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `program_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审批流程id',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '待付款银行卡id',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '待付款金额',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请用户id',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '付款备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=初始化,1=待付款,2=已付款,3=撤销',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='流程管理：财务待付款数据表';

-- ----------------------------
-- Table structure for process_program
-- ----------------------------
DROP TABLE IF EXISTS `process_program`;
CREATE TABLE `process_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flow_code` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '流程项目编号',
  `flow_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '流程id',
  `program_name` varchar(512) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '流程标题',
  `finance_name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '流程名称',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '申请金额',
  `payment` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '本次需付款/应退余款',
  `loan_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '原借款金额',
  `repair_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '财务：应补余款/待付款',
  `finance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的签呈id',
  `loan_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的借款编号id',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的银行卡账号id',
  `contract_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联合同的id',
  `finance_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=其他申请,1=签呈申请,2=借款申请,3=付款申请,4=费用报销',
  `invoice_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发票类型：',
  `cost_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '费用科目：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请人用户id',
  `user_name` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '申请人',
  `company_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '细胞id',
  `department_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行部门id',
  `node_now` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '当前流程节点',
  `node_total` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '节点总个数',
  `flow_node` varchar(4096) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户自定义的审批流程节点：json',
  `is_fast` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否催办0否,1是',
  `has_receipt` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '有无收据',
  `has_contract` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '有无合同',
  `has_invoice` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '有无发票',
  `has_quotation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '有无报价单',
  `has_pic` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '有无截图详情',
  `files_url` text COLLATE utf8mb4_unicode_ci COMMENT '附件URL',
  `files_num` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件张数',
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '流程说明，报销说明',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '填写表单的内容',
  `check_user_id` varchar(512) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '当前审批人id',
  `check_role_id` varchar(512) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '审批角色id',
  `copy_user_id` varchar(512) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '抄送用户id：逗号分隔',
  `check_department_id` varchar(512) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '审批部门id',
  `result` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0审核中,1=通过,2=驳回,3=撤回,4=通过后撤回',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=正常,1=删除,2=草稿',
  `is_client` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0=正常,1=已委托/移交',
  `node_tag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '自定义节点类型:0=平台定义,1=用户自定义',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '流程等级：0正常,1一般,2紧急',
  `use_condition` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：0=细胞内使用，1=平台内使用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_id` (`finance_id`),
  KEY `loan_id` (`loan_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='流程管理：财务审批表(new)';

-- ----------------------------
-- Table structure for process_relation
-- ----------------------------
DROP TABLE IF EXISTS `process_relation`;
CREATE TABLE `process_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `program_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '流程项目id',
  `program_petition_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的流程签呈项目id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1=审批通过,0=审批中,2=作废',
  `is_pay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'type=借款时：0=待还款,2=已还款,1=部分还款',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '财务类型：1=费用报销,2=付款申请,3=借款申请,4=签呈申请,0=其他申请',
  `total_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '签呈总金额、借款金额',
  `balance_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '已核销的剩余金额',
  `remark` varchar(512) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '简单描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='流程管理：流程签呈-财务核销-关联表';

-- ----------------------------
-- Table structure for process_type
-- ----------------------------
DROP TABLE IF EXISTS `process_type`;
CREATE TABLE `process_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flow_name` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '流程类型名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注说明',
  `system` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '归属系统',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1=关闭,0=启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程管理：流程类型表';

-- ----------------------------
-- Table structure for process_user_account
-- ----------------------------
DROP TABLE IF EXISTS `process_user_account`;
CREATE TABLE `process_user_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '银行卡id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程管理：用户关联银行卡表';
