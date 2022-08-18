#
# Database "yygh_hosp"
#

CREATE
DATABASE IF NOT EXISTS `yygh_hosp` CHARACTER SET utf8mb4;
USE
`yygh_hosp`;

#
# Structure for table "hospital_set"
#

CREATE TABLE `hospital_set`
(
    `id`             bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `hosname`        varchar(100)       DEFAULT NULL COMMENT '医院名称',
    `hoscode`        varchar(30)        DEFAULT NULL COMMENT '医院编号',
    `api_url`        varchar(100)       DEFAULT NULL COMMENT 'api基础路径',
    `sign_key`       varchar(50)        DEFAULT NULL COMMENT '签名秘钥',
    `contacts_name`  varchar(20)        DEFAULT NULL COMMENT '联系人',
    `contacts_phone` varchar(11)        DEFAULT NULL COMMENT '联系人手机',
    `status`         tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
    `create_time`    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted`     tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_hoscode` (`hoscode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='医院设置表';

#
# Database "yygh_cmn"
#

CREATE DATABASE IF NOT EXISTS `yygh_cmn` CHARACTER SET utf8;
USE `yygh_cmn`;

#
# Structure for table "dict"
#

CREATE TABLE `dict` (
                        `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
                        `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级id',
                        `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
                        `value` bigint(20) DEFAULT NULL COMMENT '值',
                        `dict_code` varchar(20) DEFAULT NULL COMMENT '编码',
                        `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                        `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（1:不可用 0:可用）',
                        PRIMARY KEY (`id`),
                        KEY `idx_dict_code` (`dict_code`),
                        KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织架构表';

# Host: localhost  (Version 5.7.19-log)
# Date: 2020-07-31 14:28:31
# Generator: MySQL-Front 6.1  (Build 1.26)

CREATE DATABASE IF NOT EXISTS `yygh_manage` CHARACTER SET utf8mb4;
USE `yygh_manage`;

#
# Structure for table "hospital_set"
#

CREATE TABLE `hospital_set` (
                                `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                `hoscode` varchar(30) DEFAULT NULL COMMENT '医院编号',
                                `sign_key` varchar(50) DEFAULT NULL COMMENT '签名秘钥',
                                `api_url` varchar(100) DEFAULT NULL COMMENT '统一挂号平台api地址',
                                `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='医院设置表';

#
# Structure for table "order_info"
#

CREATE TABLE `order_info` (
                              `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                              `schedule_id` bigint(20) DEFAULT NULL COMMENT '排班id',
                              `patient_id` bigint(20) DEFAULT NULL COMMENT '就诊人id',
                              `number` int(11) DEFAULT NULL COMMENT '预约号序',
                              `fetch_time` varchar(50) DEFAULT NULL COMMENT '建议取号时间',
                              `fetch_address` varchar(255) DEFAULT NULL COMMENT '取号地点',
                              `amount` decimal(10,0) DEFAULT NULL COMMENT '医事服务费',
                              `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
                              `quit_time` datetime DEFAULT NULL COMMENT '退号时间',
                              `order_status` tinyint(3) DEFAULT NULL COMMENT '订单状态',
                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='订单表';

#
# Structure for table "schedule"
#

CREATE TABLE `schedule` (
                            `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '编号',
                            `hoscode` varchar(30) DEFAULT NULL COMMENT '医院编号',
                            `depcode` varchar(30) DEFAULT NULL COMMENT '科室编号',
                            `title` varchar(20) DEFAULT NULL COMMENT '职称',
                            `docname` varchar(20) DEFAULT NULL COMMENT '医生名称',
                            `skill` text COMMENT '擅长技能',
                            `work_date` date DEFAULT NULL COMMENT '安排日期',
                            `work_time` tinyint(3) DEFAULT '0' COMMENT '安排时间（0：上午 1：下午）',
                            `reserved_number` int(11) DEFAULT '0' COMMENT '可预约数',
                            `available_number` int(11) DEFAULT '0' COMMENT '剩余预约数',
                            `amount` decimal(10,0) DEFAULT NULL COMMENT '挂号费',
                            `status` tinyint(3) DEFAULT NULL COMMENT '排班状态（-1：停诊 0：停约 1：可约）',
                            `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                            `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生日程安排表';
