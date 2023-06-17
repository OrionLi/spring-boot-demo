package com.orion.demo.orm.beansearcher.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Size;
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
@Schema(description = "用户信息")
@Data
public class UserInfo implements Serializable {

    @Serial
    private static final long serialVersionUID = 4710917672747757144L;

    @Schema(description = "用户ID")
    private Long id;

    @Schema(description = "昵称", maxLength = 16)
    @Size(max = 16, message = "编码长度不能超过16")
    private String username;

    @Schema(description = "账号", maxLength = 32)
    @Size(max = 32, message = "编码长度不能超过32")
    private String userAccount;

    @Schema(description = "在平台的唯一编号", maxLength = 64)
    @Size(max = 64, message = "编码长度不能超过64")
    private String platformCode;

    @Schema(description = "头像地址", maxLength = 1024)
    @Size(max = 1024, message = "编码长度不能超过1,024")
    private String avatarUrl;

    @Schema(description = "性别")
    private Integer gender;

    @Schema(description = "密码", maxLength = 64)
    @Size(max = 64, message = "编码长度不能超过64")
    private String userPassword;

    @Schema(description = "电话", maxLength = 32)
    @Size(max = 32, message = "编码长度不能超过32")
    private String phone;

    @Schema(description = "邮箱", maxLength = 32)
    @Size(max = 32, message = "编码长度不能超过32")
    private String email;

    @Schema(description = "标签列表，JSON格式", maxLength = 256)
    @Size(max = 256, message = "编码长度不能超过256")
    private String tags;

    @Schema(description = "个人简介", maxLength = 512)
    @Size(max = 512, message = "编码长度不能超过512")
    private String profile;

    @Schema(description = "用户身份：0-默认用户，1-管理员", example = "0")
    private Integer identity;
    /**
     * 用户状态：0-正常
     */
    @Schema(description = "用户状态：0-正常")
    private Integer userStatus;
    /**
     * 创建时间
     */
    @Schema(description = "创建时间")
    private LocalDateTime createTime;
    /**
     * 更新时间
     */
    @Schema(description = "更新时间")
    private LocalDateTime updateTime;
    /**
     * 删除状态：0-未删除，1-已删除
     */
    @Schema(description = "删除状态：0-未删除，1-已删除")
    private Integer isDeleted;
}
