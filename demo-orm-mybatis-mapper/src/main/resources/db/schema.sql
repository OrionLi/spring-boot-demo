drop table if exists user;
CREATE TABLE user
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL COMMENT '用户名',
    email    VARCHAR(255) NOT NULL COMMENT '电子邮件地址',
    age      INT          NOT NULL COMMENT '用户年龄'
);
