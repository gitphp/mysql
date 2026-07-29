
-- SELECT * FROM `account_calendar`

SELECT id, tenant_id, HEX(uid) AS uid_hex, account_id FROM account_calendar  WHERE `id` = '920620804457234432'

CREATE TABLE `account_balance_sheet_template` (
  `id` bigint unsigned NOT NULL COMMENT '主键(雪花ID)',
  `uid` binary(16) NOT NULL COMMENT '模板UID(UUIDv7)',
  `account_id` bigint unsigned NOT NULL COMMENT '账套id',
  `tenant_id` bigint unsigned NOT NULL COMMENT '租户id',
  `auto_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `source` tinyint unsigned NOT NULL COMMENT '来源：0=系统，1=自定义',
  `is_default` tinyint unsigned NOT NULL COMMENT '是否默认：0=否，1=是',
  `created_at` datetime(6) NOT NULL COMMENT '创建时间',
  `created_by` bigint unsigned NOT NULL COMMENT '创建人',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint unsigned DEFAULT NULL COMMENT '更新人',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '删除时间',
  `deleted_by` bigint unsigned DEFAULT NULL COMMENT '删除人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_balance_sheet_template_uid_unique` (`uid`),
  UNIQUE KEY `uk_abs_template_account_auto_code` (`account_id`,`auto_code`),
  KEY `account_balance_sheet_template_tenant_id_index` (`tenant_id`),
  KEY `account_balance_sheet_template_account_id_index` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资产负债模板表';


CREATE TABLE `settle_check_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_type` tinyint NOT NULL COMMENT '分组：1=必要基础核查 2=无产生资源',
  `rule_code` varchar(64) NOT NULL COMMENT '规则唯一编码（代码判断用，如no_loan、currency_profit等）',
  `rule_name` varchar(128) NOT NULL COMMENT '信贷项目/规则名称（页面展示）',
  `settle_target` varchar(255) DEFAULT '' COMMENT '结算对象（校验范围描述）',
  `check_condition_desc` text DEFAULT '' COMMENT '通过关键条件校验文案（前端展示）',
  `pass_action` text DEFAULT '' COMMENT '审核通过自动系统行为',
  `fail_guide` text DEFAULT '' COMMENT '未通过后续行动指引',
  `special_note` text DEFAULT '' COMMENT '特殊说明',
  `is_enable` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用 0关闭 1开启',
  `block_type` tinyint NOT NULL DEFAULT 1 COMMENT '阻断类型 0仅提醒可结账 1校验失败直接阻断结账',
  `sort` int NOT NULL DEFAULT 0 COMMENT '页面排序序号',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` bigint DEFAULT NULL COMMENT '操作人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_rule_code` (`rule_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账目结算校验规则配置';


CREATE TABLE `settle_check_warn_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rule_id` bigint NOT NULL COMMENT '关联settle_check_rule.id',
  `target_a_type` tinyint NOT NULL COMMENT '结算对象A类型：1总账 2明细账',
  `target_a_ids` text DEFAULT '' COMMENT '结算对象A选中ID，逗号分隔多值',
  `target_b_type` tinyint NOT NULL COMMENT '结算对象B类型：1利润表',
  `target_b_id` bigint DEFAULT NULL COMMENT '结算对象B单选ID',
  `compare_operator` varchar(10) NOT NULL DEFAULT '>=' COMMENT '运算符：>= > < <= =',
  `compare_value` decimal(10,4) NOT NULL DEFAULT 0 COMMENT '阈值百分比 30代表30%',
  `warn_msg` text DEFAULT '' COMMENT '自定义输出备注指示文案',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据比较预警校验扩展配置';


-- 利润表模板
CREATE TABLE profit_report_templates (
    `id` bigint unsigned NOT NULL COMMENT '主键(雪花ID)',
    `uid` binary(16) NOT NULL COMMENT '模板UID(UUIDv7)',
    `temp_name` VARCHAR(128) NOT NULL COMMENT '模板名称，如：利润表',
    `temp_code` VARCHAR(32) NOT NULL UNIQUE COMMENT '编码：LRB0001 , 自增+1',
    `temp_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '模版类型:1-利润表 2-资产负债表 3-现金流量表',
    `period_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '期间类型:1-月 2-季 3-年',
	`created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
);

CREATE TABLE account_income_statement (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    template_id BIGINT UNSIGNED NOT NULL COMMENT '关联报表ID',
    row_index INT NOT NULL COMMENT '行次序号，如 1, 2, 3...',
    item_name VARCHAR(100) NOT NULL COMMENT '项目名称，如：营业收入',
    row_type TINYINT NOT NULL COMMENT '行类型：1-标题, 2-直接取数, 3-公式计算, 4-空行',
    
    -- 针对“目取数行”的配置
    account_code VARCHAR(50) DEFAULT NULL COMMENT '会计科目代码，如 6001',
    data_source VARCHAR(20) DEFAULT NULL COMMENT '取数来源：期末余额/本期发生额/本年累计',
    
    -- 针对“行次侵犯行”的计算公式
    formula_current VARCHAR(255) DEFAULT NULL COMMENT '本期累计计算公式，如 {1}+{2}',
    formula_year_total VARCHAR(255) DEFAULT NULL COMMENT '本年累计计算公式',
    formula_last_year VARCHAR(255) DEFAULT NULL COMMENT '上年累计计算公式',
    
    sort_order INT DEFAULT 0 COMMENT '排序权重'
);


CREATE TABLE report_templates (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT '报表名称',
    code VARCHAR(50) NOT NULL UNIQUE COMMENT '编码：LRB0001 , 自增+1',
    structure_type ENUM('STANDARD', 'MULTI_DIM') DEFAULT 'STANDARD' COMMENT '结构类型',
    config JSON COMMENT '高级配置，如默认显示的维度列表'
);

CREATE TABLE report_rows (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    template_id BIGINT UNSIGNED NOT NULL,
    row_index INT NOT NULL COMMENT '行次',
    item_name VARCHAR(100) NOT NULL COMMENT '项目名称',
    formula TEXT COMMENT '取数公式或计算逻辑',
    is_header TINYINT(1) DEFAULT 0 COMMENT '是否为标题行（如：一、营业收入）'
);

CREATE TABLE auxiliary_dimensions (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE COMMENT '维度代码: CUSTOMER, SUPPLIER, DEPT...',
    name VARCHAR(100) NOT NULL COMMENT '显示名称: 客户, 供应商, 部门...',
    source_table VARCHAR(100) COMMENT '数据来源表名，用于关联具体名称',
    sort_order INT DEFAULT 0
);
-- 示例数据: ('CUST', '客户'), ('SUPP', '供应商'), ('EMP', '员工')






B64F1:eyMxMTMxI30=
{"type": "expression", "items": [{"type": "subject", "period": null, "data_type": null, "role_code": null, "entity_code": null, "subject_code": "1101"}]}



INSERT INTO `adc_finance`.`account_income_statement_column_header` (`id`, `template_id`, `header_name`, `display_order`, `created_at`, `created_by`, `updated_at`, `updated_by`) 
VALUES (927892488975171584, 927996903252209664,'项目', 1, '2026-06-23 11:53:28.000000', 0, '2026-06-23 11:53:28.000000', NULL);
INSERT INTO `adc_finance`.`account_income_statement_column_header` (`id`, `template_id`, `header_name`, `display_order`, `created_at`, `created_by`, `updated_at`, `updated_by`) 
VALUES (927892489000337408, 927996903252209664, '行次', 2, '2026-06-23 11:53:28.000000', 0, '2026-06-23 11:53:28.000000', NULL);
INSERT INTO `adc_finance`.`account_income_statement_column_header` (`id`, `template_id`, `header_name`, `display_order`, `created_at`, `created_by`, `updated_at`, `updated_by`) 
VALUES (927892489021308928, 927996903252209664, '本期累计', 3, '2026-06-23 11:53:28.000000', 0, '2026-06-23 11:53:28.000000', NULL);
INSERT INTO `adc_finance`.`account_income_statement_column_header` (`id`, `template_id`, `header_name`, `display_order`, `created_at`, `created_by`, `updated_at`, `updated_by`) 
VALUES (927892489042280448, 927996903252209664, '本年累计', 4, '2026-06-23 11:53:28.000000', 0, '2026-06-23 11:53:28.000000', NULL);
INSERT INTO `adc_finance`.`account_income_statement_column_header` (`id`, `template_id`, `header_name`, `display_order`, `created_at`, `created_by`, `updated_at`, `updated_by`) 
VALUES (927892489042280449, 927996903252209664, '上年累计', 5, '2026-06-23 11:53:28.000000', 0, '2026-06-23 11:53:28.000000', NULL);



CREATE TABLE `account_income_statement_column_header` (
  `id` bigint unsigned NOT NULL COMMENT '主键(雪花ID)',
  `template_id` bigint unsigned NOT NULL COMMENT '所属模板ID(account_report_template.id)',
  `header_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '列头名称',
  `display_order` int unsigned NOT NULL DEFAULT '1' COMMENT '列顺序（从1开始）',
  `created_at` datetime(6) NOT NULL COMMENT '创建时间',
  `created_by` bigint unsigned NOT NULL COMMENT '创建人',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint unsigned DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_income_statement_template_order` (`template_id`,`display_order`),
  KEY `idx_income_statement_template_id` (`template_id`),
  CONSTRAINT `fk_income_statement_header_template` FOREIGN KEY (`template_id`) REFERENCES `account_report_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='利润表列头配置';


019EF418-712E-7166-8AF2-4220DBA68085

019EF8E9-C4AC-734F-B11E-E63B3D944956

CREATE TABLE `account_multi_dimension_fact` (
  `id` bigint unsigned NOT NULL COMMENT '主键(雪花ID)',
  `account_id` bigint unsigned NOT NULL COMMENT '账套id',
  `tenant_id` bigint unsigned NOT NULL COMMENT '租户id',
  `entity_id` bigint unsigned NOT NULL COMMENT '结算主体id（关联公司/部门）',
  `period_type` tinyint unsigned NOT NULL COMMENT '期间类型：1=年 2=季 3=月',
  `year` smallint unsigned NOT NULL COMMENT '年份',
  `quarter` tinyint unsigned DEFAULT NULL COMMENT '季度（1-4）',
  `month` tinyint unsigned DEFAULT NULL COMMENT '月份（1-12）',
  `period_code` varchar(16) NOT NULL COMMENT '期间编码（如 2026-08）',
  `row_index` int unsigned NOT NULL COMMENT '行次（关联利润表行次）',
  `current_period_value` decimal(20,4) DEFAULT 0.0000 COMMENT '本期累计值',
  `current_year_value` decimal(20,4) DEFAULT 0.0000 COMMENT '本年累计值（基准标准口径）',
  `previous_year_value` decimal(20,4) DEFAULT 0.0000 COMMENT '上年累计值',
  `same_period_last_year` decimal(20,4) DEFAULT 0.0000 COMMENT '上年同期值',
  `created_at` datetime(6) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_fact` (`account_id`, `entity_id`, `period_type`, `year`, `quarter`, `month`, `row_index`),
  KEY `idx_entity_period` (`entity_id`, `period_type`, `year`, `quarter`, `month`),
  KEY `idx_account_row` (`account_id`, `row_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='多维利润表数据事实表';







