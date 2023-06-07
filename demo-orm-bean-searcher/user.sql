CREATE TABLE `user`
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
) ENGINE = InnoDB
  AUTO_INCREMENT = 105
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='用户表'

INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (1, 'orionli', '123456', '1', 'www.baidu.com', 0, 'ea5075bff5a411117b25e7efcb4e7da4', '123456', 'orionli@qq.com',
        '["Java","JavaScript","HTML","Redis","Spring Boot","MySQL"]', null, 1, 0, '2023-04-24 14:05:43',
        '2023-05-11 21:21:31', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (2, '小张', 'xiaozhang', null, 'www.baidu.com', 1, 'ea5075bff5a411117b25e7efcb4e7da4', '18888888888',
        'xiaozhang@qq.com', '["Java","Python","JavaScript"]', null, 0, 0, '2023-05-11 14:35:00', '2023-05-11 21:21:31',
        0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (3, '小李', 'xiaoli', null, 'www.baidu.com', 1, 'ea5075bff5a411117b25e7efcb4e7da4', '17777777777',
        'xiaoli@qq.com', '["Redis","Python","JavaScript"]', '我是一个程序员，对Java也有一定的了解。', 0, 0,
        '2023-05-11 14:40:00', '2023-05-11 21:21:31', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (4, '小刚', 'xiaogang', null, null, 1, 'ea5075bff5a411117b25e7efcb4e7da4', '16666666666', 'xiaogang@qq.com',
        '["Java","Python","Swift"]', null, 0, 0, '2023-05-11 15:00:00', '2023-05-11 21:21:31', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (5, '测试用户0', 'test_user0', 'platform_code_0',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test0@example.com', '["Python","Apache Kafka","Node.js"]',
        '这是测试用户0的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (6, '测试用户1', 'test_user1', 'platform_code_1',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test1@example.com', '["MySQL","Ansible","Redis"]',
        '这是测试用户1的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (7, '测试用户2', 'test_user2', 'platform_code_2',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test2@example.com', '["PostgreSQL","Vue.js","React"]',
        '这是测试用户2的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (8, '测试用户3', 'test_user3', 'platform_code_3',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test3@example.com', '["MySQL","MySQL","Kubernetes"]',
        '这是测试用户3的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (9, '测试用户4', 'test_user4', 'platform_code_4',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test4@example.com', '["Vue.js","JavaScript","Kubernetes"]',
        '这是测试用户4的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (10, '测试用户5', 'test_user5', 'platform_code_5',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test5@example.com', '["Jenkins","Docker","Ansible"]',
        '这是测试用户5的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (11, '测试用户6', 'test_user6', 'platform_code_6',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test6@example.com', '["Angular","MongoDB","PostgreSQL"]',
        '这是测试用户6的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (12, '测试用户7', 'test_user7', 'platform_code_7',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test7@example.com', '["Flutter","Vue.js","Python"]',
        '这是测试用户7的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (13, '测试用户8', 'test_user8', 'platform_code_8',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test8@example.com', '["Vue.js","Kubernetes","Java"]',
        '这是测试用户8的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (14, '测试用户9', 'test_user9', 'platform_code_9',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test9@example.com', '["Ansible","Apache Kafka","Python"]',
        '这是测试用户9的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (15, '测试用户10', 'test_user10', 'platform_code_10',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test10@example.com', '["JavaScript","Python","Redis"]',
        '这是测试用户10的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (16, '测试用户11', 'test_user11', 'platform_code_11',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test11@example.com', '["GraphQL","GraphQL","MySQL"]',
        '这是测试用户11的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (17, '测试用户12', 'test_user12', 'platform_code_12',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test12@example.com',
        '["Spring Boot","Apache Kafka","React"]', '这是测试用户12的个人简介', 1, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (18, '测试用户13', 'test_user13', 'platform_code_13',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test13@example.com', '["React","Spring Boot","Ansible"]',
        '这是测试用户13的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (19, '测试用户14', 'test_user14', 'platform_code_14',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test14@example.com',
        '["Spring Boot","TypeScript","Flutter"]', '这是测试用户14的个人简介', 1, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (20, '测试用户15', 'test_user15', 'platform_code_15',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test15@example.com', '["GraphQL","Docker","RabbitMQ"]',
        '这是测试用户15的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (21, '测试用户16', 'test_user16', 'platform_code_16',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test16@example.com',
        '["JavaScript","PostgreSQL","GraphQL"]', '这是测试用户16的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (22, '测试用户17', 'test_user17', 'platform_code_17',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test17@example.com', '["Redis","Kubernetes","RabbitMQ"]',
        '这是测试用户17的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (23, '测试用户18', 'test_user18', 'platform_code_18',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test18@example.com',
        '["Ansible","JavaScript","Spring Boot"]', '这是测试用户18的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (24, '测试用户19', 'test_user19', 'platform_code_19',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test19@example.com', '["React","Redis","MongoDB"]',
        '这是测试用户19的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (25, '测试用户20', 'test_user20', 'platform_code_20',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test20@example.com', '["Node.js","Python","RabbitMQ"]',
        '这是测试用户20的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (26, '测试用户21', 'test_user21', 'platform_code_21',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test21@example.com', '["MongoDB","Apache Kafka","Python"]',
        '这是测试用户21的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (27, '测试用户22', 'test_user22', 'platform_code_22',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test22@example.com', '["GraphQL","Java","Kubernetes"]',
        '这是测试用户22的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (28, '测试用户23', 'test_user23', 'platform_code_23',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test23@example.com', '["Redis","RabbitMQ","Kubernetes"]',
        '这是测试用户23的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (29, '测试用户24', 'test_user24', 'platform_code_24',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test24@example.com', '["Flutter","Angular","PostgreSQL"]',
        '这是测试用户24的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (30, '测试用户25', 'test_user25', 'platform_code_25',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test25@example.com', '["MongoDB","React","Docker"]',
        '这是测试用户25的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (31, '测试用户26', 'test_user26', 'platform_code_26',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test26@example.com', '["Node.js","GraphQL","Flutter"]',
        '这是测试用户26的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (32, '测试用户27', 'test_user27', 'platform_code_27',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test27@example.com', '["Vue.js","RabbitMQ","Docker"]',
        '这是测试用户27的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (33, '测试用户28', 'test_user28', 'platform_code_28',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test28@example.com', '["TypeScript","Angular","Flutter"]',
        '这是测试用户28的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (34, '测试用户29', 'test_user29', 'platform_code_29',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test29@example.com', '["JavaScript","RabbitMQ","Redis"]',
        '这是测试用户29的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (35, '测试用户30', 'test_user30', 'platform_code_30',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test30@example.com',
        '["Spring Boot","Kubernetes","Flutter"]', '这是测试用户30的个人简介', 1, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (36, '测试用户31', 'test_user31', 'platform_code_31',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test31@example.com', '["GraphQL","Python","React"]',
        '这是测试用户31的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (37, '测试用户32', 'test_user32', 'platform_code_32',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test32@example.com', '["MySQL","React","Ansible"]',
        '这是测试用户32的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (38, '测试用户33', 'test_user33', 'platform_code_33',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test33@example.com', '["Vue.js","Angular","Vue.js"]',
        '这是测试用户33的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (39, '测试用户34', 'test_user34', 'platform_code_34',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test34@example.com',
        '["Kubernetes","Jenkins","TypeScript"]', '这是测试用户34的个人简介', 1, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (40, '测试用户35', 'test_user35', 'platform_code_35',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test35@example.com', '["Angular","Kubernetes","Node.js"]',
        '这是测试用户35的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (41, '测试用户36', 'test_user36', 'platform_code_36',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test36@example.com', '["TypeScript","Angular","MongoDB"]',
        '这是测试用户36的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (42, '测试用户37', 'test_user37', 'platform_code_37',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test37@example.com',
        '["Node.js","Kubernetes","JavaScript"]', '这是测试用户37的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (43, '测试用户38', 'test_user38', 'platform_code_38',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test38@example.com', '["Java","Apache Kafka","JavaScript"]',
        '这是测试用户38的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (44, '测试用户39', 'test_user39', 'platform_code_39',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test39@example.com', '["MySQL","Jenkins","Jenkins"]',
        '这是测试用户39的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (45, '测试用户40', 'test_user40', 'platform_code_40',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test40@example.com', '["Ansible","Apache Kafka","Redis"]',
        '这是测试用户40的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (46, '测试用户41', 'test_user41', 'platform_code_41',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test41@example.com', '["Java","Angular","Docker"]',
        '这是测试用户41的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (47, '测试用户42', 'test_user42', 'platform_code_42',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test42@example.com', '["Docker","Java","Jenkins"]',
        '这是测试用户42的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (48, '测试用户43', 'test_user43', 'platform_code_43',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test43@example.com', '["Ansible","React","Redis"]',
        '这是测试用户43的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (49, '测试用户44', 'test_user44', 'platform_code_44',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test44@example.com',
        '["Apache Kafka","Spring Boot","Angular"]', '这是测试用户44的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (50, '测试用户45', 'test_user45', 'platform_code_45',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test45@example.com',
        '["Apache Kafka","Apache Kafka","Kubernetes"]', '这是测试用户45的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (51, '测试用户46', 'test_user46', 'platform_code_46',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test46@example.com', '["Flutter","JavaScript","MongoDB"]',
        '这是测试用户46的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (52, '测试用户47', 'test_user47', 'platform_code_47',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test47@example.com', '["Docker","RabbitMQ","Angular"]',
        '这是测试用户47的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (53, '测试用户48', 'test_user48', 'platform_code_48',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test48@example.com', '["Java","TypeScript","GraphQL"]',
        '这是测试用户48的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (54, '测试用户49', 'test_user49', 'platform_code_49',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test49@example.com', '["Java","Spring Boot","TypeScript"]',
        '这是测试用户49的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (55, '测试用户50', 'test_user50', 'platform_code_50',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test50@example.com', '["TypeScript","React","GraphQL"]',
        '这是测试用户50的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (56, '测试用户51', 'test_user51', 'platform_code_51',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test51@example.com',
        '["Spring Boot","Angular","JavaScript"]', '这是测试用户51的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (57, '测试用户52', 'test_user52', 'platform_code_52',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test52@example.com', '["Kubernetes","Ansible","Angular"]',
        '这是测试用户52的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (58, '测试用户53', 'test_user53', 'platform_code_53',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test53@example.com', '["Vue.js","JavaScript","Jenkins"]',
        '这是测试用户53的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (59, '测试用户54', 'test_user54', 'platform_code_54',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test54@example.com', '["MongoDB","Vue.js","Apache Kafka"]',
        '这是测试用户54的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (60, '测试用户55', 'test_user55', 'platform_code_55',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test55@example.com', '["Python","Redis","Apache Kafka"]',
        '这是测试用户55的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (61, '测试用户56', 'test_user56', 'platform_code_56',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test56@example.com', '["Kubernetes","RabbitMQ","React"]',
        '这是测试用户56的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (62, '测试用户57', 'test_user57', 'platform_code_57',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test57@example.com', '["TypeScript","Jenkins","Node.js"]',
        '这是测试用户57的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (63, '测试用户58', 'test_user58', 'platform_code_58',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test58@example.com', '["MongoDB","Flutter","RabbitMQ"]',
        '这是测试用户58的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (64, '测试用户59', 'test_user59', 'platform_code_59',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test59@example.com', '["MySQL","Python","Redis"]',
        '这是测试用户59的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (65, '测试用户60', 'test_user60', 'platform_code_60',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test60@example.com', '["RabbitMQ","Redis","MongoDB"]',
        '这是测试用户60的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (66, '测试用户61', 'test_user61', 'platform_code_61',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test61@example.com', '["Jenkins","Angular","Apache Kafka"]',
        '这是测试用户61的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (67, '测试用户62', 'test_user62', 'platform_code_62',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test62@example.com', '["Java","PostgreSQL","Jenkins"]',
        '这是测试用户62的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (68, '测试用户63', 'test_user63', 'platform_code_63',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test63@example.com', '["Ansible","MySQL","TypeScript"]',
        '这是测试用户63的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (69, '测试用户64', 'test_user64', 'platform_code_64',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test64@example.com', '["PostgreSQL","Redis","Kubernetes"]',
        '这是测试用户64的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (70, '测试用户65', 'test_user65', 'platform_code_65',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test65@example.com',
        '["PostgreSQL","Spring Boot","TypeScript"]', '这是测试用户65的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (71, '测试用户66', 'test_user66', 'platform_code_66',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test66@example.com',
        '["Flutter","TypeScript","Kubernetes"]', '这是测试用户66的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (72, '测试用户67', 'test_user67', 'platform_code_67',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test67@example.com',
        '["Angular","TypeScript","Apache Kafka"]', '这是测试用户67的个人简介', 1, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (73, '测试用户68', 'test_user68', 'platform_code_68',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test68@example.com', '["Python","MongoDB","Java"]',
        '这是测试用户68的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (74, '测试用户69', 'test_user69', 'platform_code_69',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test69@example.com', '["Java","React","Spring Boot"]',
        '这是测试用户69的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (75, '测试用户70', 'test_user70', 'platform_code_70',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test70@example.com', '["JavaScript","Vue.js","Node.js"]',
        '这是测试用户70的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (76, '测试用户71', 'test_user71', 'platform_code_71',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test71@example.com', '["Spring Boot","Java","TypeScript"]',
        '这是测试用户71的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (77, '测试用户72', 'test_user72', 'platform_code_72',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test72@example.com', '["Vue.js","Python","Kubernetes"]',
        '这是测试用户72的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (78, '测试用户73', 'test_user73', 'platform_code_73',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test73@example.com',
        '["GraphQL","Apache Kafka","PostgreSQL"]', '这是测试用户73的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (79, '测试用户74', 'test_user74', 'platform_code_74',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test74@example.com',
        '["Jenkins","JavaScript","Apache Kafka"]', '这是测试用户74的个人简介', 0, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (80, '测试用户75', 'test_user75', 'platform_code_75',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test75@example.com', '["React","Flutter","React"]',
        '这是测试用户75的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (81, '测试用户76', 'test_user76', 'platform_code_76',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test76@example.com', '["JavaScript","MySQL","PostgreSQL"]',
        '这是测试用户76的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (82, '测试用户77', 'test_user77', 'platform_code_77',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test77@example.com', '["RabbitMQ","Ansible","TypeScript"]',
        '这是测试用户77的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (83, '测试用户78', 'test_user78', 'platform_code_78',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test78@example.com',
        '["JavaScript","GraphQL","Apache Kafka"]', '这是测试用户78的个人简介', 1, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (84, '测试用户79', 'test_user79', 'platform_code_79',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test79@example.com', '["Redis","Spring Boot","JavaScript"]',
        '这是测试用户79的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (85, '测试用户80', 'test_user80', 'platform_code_80',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test80@example.com', '["Python","PostgreSQL","Python"]',
        '这是测试用户80的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (86, '测试用户81', 'test_user81', 'platform_code_81',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test81@example.com', '["RabbitMQ","Ansible","Jenkins"]',
        '这是测试用户81的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (87, '测试用户82', 'test_user82', 'platform_code_82',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test82@example.com', '["Jenkins","Kubernetes","GraphQL"]',
        '这是测试用户82的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (88, '测试用户83', 'test_user83', 'platform_code_83',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test83@example.com', '["Angular","Flutter","Spring Boot"]',
        '这是测试用户83的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (89, '测试用户84', 'test_user84', 'platform_code_84',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test84@example.com',
        '["TypeScript","GraphQL","Kubernetes"]', '这是测试用户84的个人简介', 1, 0, '2023-05-11 20:51:15',
        '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (90, '测试用户85', 'test_user85', 'platform_code_85',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test85@example.com', '["Ansible","MongoDB","TypeScript"]',
        '这是测试用户85的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (91, '测试用户86', 'test_user86', 'platform_code_86',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test86@example.com', '["MongoDB","TypeScript","MySQL"]',
        '这是测试用户86的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (92, '测试用户87', 'test_user87', 'platform_code_87',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test87@example.com', '["Jenkins","Jenkins","Kubernetes"]',
        '这是测试用户87的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (93, '测试用户88', 'test_user88', 'platform_code_88',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test88@example.com', '["Ansible","RabbitMQ","GraphQL"]',
        '这是测试用户88的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (94, '测试用户89', 'test_user89', 'platform_code_89',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test89@example.com', '["MySQL","Docker","MySQL"]',
        '这是测试用户89的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (95, '测试用户90', 'test_user90', 'platform_code_90',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test90@example.com', '["Node.js","Apache Kafka","MongoDB"]',
        '这是测试用户90的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (96, '测试用户91', 'test_user91', 'platform_code_91',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test91@example.com', '["PostgreSQL","Java","Angular"]',
        '这是测试用户91的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (97, '测试用户92', 'test_user92', 'platform_code_92',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test92@example.com', '["Kubernetes","Flutter","Jenkins"]',
        '这是测试用户92的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (98, '测试用户93', 'test_user93', 'platform_code_93',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test93@example.com', '["Python","MongoDB","RabbitMQ"]',
        '这是测试用户93的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (99, '测试用户94', 'test_user94', 'platform_code_94',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test94@example.com', '["Java","MongoDB","MongoDB"]',
        '这是测试用户94的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (100, '测试用户95', 'test_user95', 'platform_code_95',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test95@example.com', '["PostgreSQL","Kubernetes","React"]',
        '这是测试用户95的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (101, '测试用户96', 'test_user96', 'platform_code_96',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test96@example.com', '["MongoDB","Apache Kafka","Redis"]',
        '这是测试用户96的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (102, '测试用户97', 'test_user97', 'platform_code_97',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test97@example.com', '["Angular","MongoDB","React"]',
        '这是测试用户97的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (103, '测试用户98', 'test_user98', 'platform_code_98',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 1,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test98@example.com', '["Vue.js","PostgreSQL","Ansible"]',
        '这是测试用户98的个人简介', 0, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
INSERT INTO user_center.user (id, username, user_account, platform_code, avatar_url, gender, user_password, phone,
                              email, tags, profile, identity, user_status, create_time, update_time, is_deleted)
VALUES (104, '测试用户99', 'test_user99', 'platform_code_99',
        'https://gd-hbimg.huaban.com/d59206aa77a14757f674080ceb9fd4a1a266c39d3c0e-yLAKwW_fw1200webp', 0,
        'ea5075bff5a411117b25e7efcb4e7da4', '13300000000', 'test99@example.com', '["Angular","MySQL","Vue.js"]',
        '这是测试用户99的个人简介', 1, 0, '2023-05-11 20:51:15', '2023-05-11 21:11:47', 0);
