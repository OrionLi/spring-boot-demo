package com.orion.demo.demoormmybatismapper.demain;

import io.mybatis.provider.Entity;
import lombok.Data;

/**
 * 用户
 *
 * @author OrionLi
 * @date 2024/01/28
 */
@Data
@Entity.Table("user")
public class User {
    /**
     * id
     */
    @Entity.Column(id = true)
    private Integer id;

    /**
     * 用户名
     */
    @Entity.Column("name")
    private String username;

    /**
     * 电子邮件
     */
    @Entity.Column
    private String email;

    /**
     * 年龄
     */
    @Entity.Column
    private Integer age;
}
