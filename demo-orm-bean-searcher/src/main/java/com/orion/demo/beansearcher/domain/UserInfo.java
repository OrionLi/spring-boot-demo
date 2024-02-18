package com.orion.demo.beansearcher.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 用户表
 *
 * @author OrionLi
 * @TableName user
 */
@Data
public class UserInfo implements Serializable {

    @Serial
    private static final long serialVersionUID = 4710917672747757144L;

    private Long id;

    private String username;

    private String userAccount;

    private String platformCode;

    private String avatarUrl;

    private Integer gender;

    private String userPassword;

    private String phone;

    private String email;

    private String tags;

    private String profile;

    private Integer identity;
    /**
     * 用户状态：0-正常
     */
    private Integer userStatus;
    /**
     * 创建时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime;
    /**
     * 更新时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime updateTime;
    /**
     * 删除状态：0-未删除，1-已删除
     */
    private Integer isDeleted;
}
