-- ============================================
-- 1. 部门表（组织架构）
-- ============================================
CREATE TABLE `sys_dept` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门ID',
    `parent_id` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '父部门ID，0为顶级',
    `dept_name` VARCHAR(64) NOT NULL COMMENT '部门名称',
    `dept_code` VARCHAR(64) DEFAULT NULL COMMENT '部门编码',
    `leader` VARCHAR(32) DEFAULT NULL COMMENT '负责人',
    `phone` VARCHAR(15) DEFAULT NULL COMMENT '联系电话',
    `email` VARCHAR(64) DEFAULT NULL COMMENT '邮箱',
    `sort_order` INT DEFAULT 0 COMMENT '显示排序',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态：0-停用，1-正常',
    `create_by` VARCHAR(64) DEFAULT NULL COMMENT '创建者',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` VARCHAR(64) DEFAULT NULL COMMENT '更新者',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
    `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
    PRIMARY KEY (`id`),
    KEY `idx_parent_id` (`parent_id`),
    KEY `idx_status` (`status`),
    KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';

-- ============================================
-- 2. 用户表
-- ============================================
CREATE TABLE `sys_user` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id` BIGINT UNSIGNED DEFAULT NULL COMMENT '部门ID',
    `username` VARCHAR(64) NOT NULL COMMENT '用户名（登录账号）',
    `password` VARCHAR(128) NOT NULL COMMENT '密码（加密存储）',
    `nickname` VARCHAR(64) DEFAULT NULL COMMENT '用户昵称',
    `real_name` VARCHAR(64) DEFAULT NULL COMMENT '真实姓名',
    `avatar` VARCHAR(255) DEFAULT NULL COMMENT '头像URL',
    `email` VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
    `phone` VARCHAR(15) DEFAULT NULL COMMENT '手机号',
    `gender` TINYINT DEFAULT 0 COMMENT '性别：0-未知，1-男，2-女',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态：0-停用，1-正常',
    `user_type` TINYINT DEFAULT 1 COMMENT '用户类型：1-系统用户，2-外部用户',
    `login_ip` VARCHAR(128) DEFAULT NULL COMMENT '最后登录IP',
    `login_time` DATETIME DEFAULT NULL COMMENT '最后登录时间',
    `create_by` VARCHAR(64) DEFAULT NULL COMMENT '创建者',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` VARCHAR(64) DEFAULT NULL COMMENT '更新者',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
    `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_username` (`username`),
    UNIQUE KEY `uk_email` (`email`),
    UNIQUE KEY `uk_phone` (`phone`),
    KEY `idx_dept_id` (`dept_id`),
    KEY `idx_status` (`status`),
    KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ============================================
-- 3. 角色表
-- ============================================
CREATE TABLE `sys_role` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name` VARCHAR(64) NOT NULL COMMENT '角色名称',
    `role_code` VARCHAR(64) NOT NULL COMMENT '角色编码（唯一标识）',
    `role_sort` INT DEFAULT 0 COMMENT '显示排序',
    `data_scope` TINYINT DEFAULT 1 COMMENT '数据范围：1-全部，2-本部门，3-本部门及以下，4-仅本人，5-自定义',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态：0-停用，1-正常',
    `create_by` VARCHAR(64) DEFAULT NULL COMMENT '创建者',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` VARCHAR(64) DEFAULT NULL COMMENT '更新者',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
    `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role_code` (`role_code`),
    KEY `idx_status` (`status`),
    KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';

-- ============================================
-- 4. 菜单/功能表（前端路由 + 后端接口）
-- ============================================
CREATE TABLE `sys_menu` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `parent_id` BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '父菜单ID，0为顶级',
    `menu_name` VARCHAR(64) NOT NULL COMMENT '菜单名称',
    `menu_type` TINYINT NOT NULL DEFAULT 1 COMMENT '菜单类型：1-目录，2-菜单，3-按钮/操作',
    `icon` VARCHAR(128) DEFAULT NULL COMMENT '菜单图标',
    `path` VARCHAR(128) DEFAULT NULL COMMENT '路由路径（前端）',
    `component` VARCHAR(255) DEFAULT NULL COMMENT '组件路径（前端）',
    `perms` VARCHAR(128) DEFAULT NULL COMMENT '权限标识（后端），如：system:user:list',
    `sort_order` INT DEFAULT 0 COMMENT '显示排序',
    `is_frame` TINYINT DEFAULT 0 COMMENT '是否外链：0-否，1-是',
    `is_cache` TINYINT DEFAULT 0 COMMENT '是否缓存：0-否，1-是',
    `is_visible` TINYINT DEFAULT 1 COMMENT '是否显示：0-隐藏，1-显示',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态：0-停用，1-正常',
    `create_by` VARCHAR(64) DEFAULT NULL COMMENT '创建者',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by` VARCHAR(64) DEFAULT NULL COMMENT '更新者',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
    `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
    PRIMARY KEY (`id`),
    KEY `idx_parent_id` (`parent_id`),
    KEY `idx_menu_type` (`menu_type`),
    KEY `idx_status` (`status`),
    KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';

-- ============================================
-- 5. 权限表（API 级别的细粒度权限）
-- ============================================
CREATE TABLE `sys_permission` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限ID',
    `permission_name` VARCHAR(64) NOT NULL COMMENT '权限名称',
    `permission_code` VARCHAR(128) NOT NULL COMMENT '权限编码，如：user:create',
    `resource_type` VARCHAR(32) DEFAULT NULL COMMENT '资源类型：MENU、API、DATA、FILE等',
    `http_method` VARCHAR(10) DEFAULT NULL COMMENT 'HTTP方法：GET、POST、PUT、DELETE',
    `api_path` VARCHAR(255) DEFAULT NULL COMMENT 'API路径，支持Ant风格，如：/api/users/**',
    `description` VARCHAR(255) DEFAULT NULL COMMENT '权限描述',
    `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态：0-停用，1-正常',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT '逻辑删除：0-未删除，1-已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_permission_code` (`permission_code`),
    KEY `idx_resource_type` (`resource_type`),
    KEY `idx_status` (`status`),
    KEY `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限表';

-- ============================================
-- 6. 用户-角色关联表
-- ============================================
CREATE TABLE `sys_user_role` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `user_id` BIGINT UNSIGNED NOT NULL COMMENT '用户ID',
    `role_id` BIGINT UNSIGNED NOT NULL COMMENT '角色ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_role` (`user_id`, `role_id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户角色关联表';

-- ============================================
-- 7. 角色-菜单关联表
-- ============================================
CREATE TABLE `sys_role_menu` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `role_id` BIGINT UNSIGNED NOT NULL COMMENT '角色ID',
    `menu_id` BIGINT UNSIGNED NOT NULL COMMENT '菜单ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role_menu` (`role_id`, `menu_id`),
    KEY `idx_role_id` (`role_id`),
    KEY `idx_menu_id` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色菜单关联表';

-- ============================================
-- 8. 角色-权限关联表
-- ============================================
CREATE TABLE `sys_role_permission` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `role_id` BIGINT UNSIGNED NOT NULL COMMENT '角色ID',
    `permission_id` BIGINT UNSIGNED NOT NULL COMMENT '权限ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role_permission` (`role_id`, `permission_id`),
    KEY `idx_role_id` (`role_id`),
    KEY `idx_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色权限关联表';

-- ============================================
-- 9. 角色-数据权限关联表（自定义数据范围）
-- ============================================
CREATE TABLE `sys_role_dept` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `role_id` BIGINT UNSIGNED NOT NULL COMMENT '角色ID',
    `dept_id` BIGINT UNSIGNED NOT NULL COMMENT '部门ID',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role_dept` (`role_id`, `dept_id`),
    KEY `idx_role_id` (`role_id`),
    KEY `idx_dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色部门关联表（数据权限）';

-- ============================================
-- 10. 操作日志表
-- ============================================
CREATE TABLE `sys_operation_log` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志ID',
    `title` VARCHAR(64) DEFAULT NULL COMMENT '操作模块',
    `business_type` TINYINT DEFAULT 0 COMMENT '业务类型：0-其它，1-新增，2-修改，3-删除，4-授权，5-导出，6-导入，7-强退，8-生成代码，9-清空数据',
    `method` VARCHAR(255) DEFAULT NULL COMMENT '请求方法',
    `request_method` VARCHAR(10) DEFAULT NULL COMMENT '请求方式',
    `operator_type` TINYINT DEFAULT 0 COMMENT '操作类别：0-其它，1-后台用户，2-手机端用户',
    `oper_name` VARCHAR(64) DEFAULT NULL COMMENT '操作人员',
    `dept_name` VARCHAR(64) DEFAULT NULL COMMENT '部门名称',
    `oper_url` VARCHAR(500) DEFAULT NULL COMMENT '请求URL',
    `oper_ip` VARCHAR(128) DEFAULT NULL COMMENT '操作IP',
    `oper_location` VARCHAR(255) DEFAULT NULL COMMENT '操作地点',
    `oper_param` TEXT COMMENT '请求参数',
    `json_result` TEXT COMMENT '返回结果',
    `status` TINYINT DEFAULT 0 COMMENT '操作状态：0-正常，1-异常',
    `error_msg` VARCHAR(2000) DEFAULT NULL COMMENT '错误消息',
    `oper_time` DATETIME DEFAULT NULL COMMENT '操作时间',
    `cost_time` BIGINT DEFAULT 0 COMMENT '消耗时间（毫秒）',
    PRIMARY KEY (`id`),
    KEY `idx_oper_name` (`oper_name`),
    KEY `idx_business_type` (`business_type`),
    KEY `idx_status` (`status`),
    KEY `idx_oper_time` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志表';

-- ============================================
-- 11. 登录日志表
-- ============================================
CREATE TABLE `sys_login_log` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `username` VARCHAR(64) DEFAULT NULL COMMENT '用户账号',
    `ipaddr` VARCHAR(128) DEFAULT NULL COMMENT '登录IP',
    `login_location` VARCHAR(255) DEFAULT NULL COMMENT '登录地点',
    `browser` VARCHAR(64) DEFAULT NULL COMMENT '浏览器类型',
    `os` VARCHAR(64) DEFAULT NULL COMMENT '操作系统',
    `status` TINYINT DEFAULT 0 COMMENT '登录状态：0-成功，1-失败',
    `msg` VARCHAR(255) DEFAULT NULL COMMENT '提示消息',
    `login_time` DATETIME DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`id`),
    KEY `idx_username` (`username`),
    KEY `idx_ipaddr` (`ipaddr`),
    KEY `idx_login_time` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录日志表';


-- 查询某用户的所有权限标识
SELECT DISTINCT m.perms 
FROM sys_user_role ur
JOIN sys_role_menu rm ON ur.role_id = rm.role_id
JOIN sys_menu m ON rm.menu_id = m.id
WHERE ur.user_id = 1 AND m.perms IS NOT NULL AND m.status = 1;

-- 查询某用户的所有角色
SELECT r.* FROM sys_role r
JOIN sys_user_role ur ON r.id = ur.role_id
WHERE ur.user_id = 1 AND r.status = 1 AND r.deleted = 0;

-- 查询某角色的完整菜单树
SELECT m.* FROM sys_menu m
JOIN sys_role_menu rm ON m.id = rm.menu_id
WHERE rm.role_id = 1 AND m.status = 1 AND m.deleted = 0
ORDER BY m.parent_id, m.sort_order;

-- 数据权限：查询某用户能查看的部门ID列表（自定义范围）
SELECT dept_id FROM sys_role_dept
WHERE role_id IN (SELECT role_id FROM sys_user_role WHERE user_id = 1);