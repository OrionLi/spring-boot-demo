DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info`
(
    `id`            bigint      NOT NULL AUTO_INCREMENT,
    `username`      varchar(16)          DEFAULT NULL COMMENT '昵称',
    `user_account`  varchar(32)          DEFAULT NULL COMMENT '账号',
    `platform_code` varchar(64)          DEFAULT NULL COMMENT '在平台的唯一编号',
    `avatar_url`    varchar(1024)        DEFAULT NULL COMMENT '头像地址',
    `gender`        tinyint              DEFAULT NULL COMMENT '性别',
    `user_password` varchar(64) NOT NULL COMMENT '密码',
    `phone`         varchar(32)          DEFAULT NULL COMMENT '电话',
    `email`         varchar(32)          DEFAULT NULL COMMENT '邮箱',
    `tags`          varchar(256)         DEFAULT NULL COMMENT '标签列表，JSON格式',
    `profile`       varchar(512)         DEFAULT NULL COMMENT '个人简介',
    `identity`      tinyint     NOT NULL DEFAULT '0' COMMENT '用户身份：0-默认用户，1-管理员',
    `user_status`   tinyint     NOT NULL DEFAULT '0' COMMENT '用户状态：0-正常',
    `create_time`   datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted`    tinyint     NOT NULL DEFAULT '0' COMMENT '删除状态：0-未删除，1-已删除',
    PRIMARY KEY (`id`)
);