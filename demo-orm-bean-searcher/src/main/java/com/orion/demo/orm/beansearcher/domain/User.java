package com.orion.demo.orm.beansearcher.domain;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
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
public class User implements Serializable {

    @Serial
    private static final long serialVersionUID = 4710917672747757144L;
    /**
     *
     */
    @NotNull(message = "[]不能为空")
    @ApiModelProperty("id")
    private Long id;
    /**
     * 昵称
     */
    @Size(max = 16, message = "编码长度不能超过16")
    @ApiModelProperty("昵称")
    @Length(max = 16, message = "编码长度不能超过16")
    private String username;
    /**
     * 账号
     */
    @Size(max = 32, message = "编码长度不能超过32")
    @ApiModelProperty("账号")
    @Length(max = 32, message = "编码长度不能超过32")
    private String userAccount;
    /**
     * 在平台的唯一编号
     */
    @Size(max = 64, message = "编码长度不能超过64")
    @ApiModelProperty("在平台的唯一编号")
    @Length(max = 64, message = "编码长度不能超过64")
    private String platformCode;
    /**
     * 头像地址
     */
    @Size(max = 1024, message = "编码长度不能超过1024")
    @ApiModelProperty("头像地址")
    @Length(max = 1024, message = "编码长度不能超过1,024")
    private String avatarUrl;
    /**
     * 性别
     */
    @ApiModelProperty("性别")
    private Integer gender;
    /**
     * 密码
     */
    @NotBlank(message = "[密码]不能为空")
    @Size(max = 64, message = "编码长度不能超过64")
    @ApiModelProperty("密码")
    @Length(max = 64, message = "编码长度不能超过64")
    private String userPassword;
    /**
     * 电话
     */
    @Size(max = 32, message = "编码长度不能超过32")
    @ApiModelProperty("电话")
    @Length(max = 32, message = "编码长度不能超过32")
    private String phone;
    /**
     * 邮箱
     */
    @Size(max = 32, message = "编码长度不能超过32")
    @ApiModelProperty("邮箱")
    @Length(max = 32, message = "编码长度不能超过32")
    private String email;
    /**
     * 标签列表，JSON格式
     */
    @Size(max = 256, message = "编码长度不能超过256")
    @ApiModelProperty("标签列表，JSON格式")
    @Length(max = 256, message = "编码长度不能超过256")
    private String tags;
    /**
     * 个人简介
     */
    @Size(max = 512, message = "编码长度不能超过512")
    @ApiModelProperty("个人简介")
    @Length(max = 512, message = "编码长度不能超过512")
    private String profile;
    /**
     * 用户身份：0-默认用户，1-管理员
     */
    @NotNull(message = "[用户身份：0-默认用户，1-管理员]不能为空")
    @ApiModelProperty("用户身份：0-默认用户，1-管理员")
    private Integer identity;
    /**
     * 用户状态：0-正常
     */
    @NotNull(message = "[用户状态：0-正常]不能为空")
    @ApiModelProperty("用户状态：0-正常")
    private Integer userStatus;
    /**
     * 创建时间
     */
    @NotNull(message = "[创建时间]不能为空")
    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;
    /**
     * 更新时间
     */
    @NotNull(message = "[更新时间]不能为空")
    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;
    /**
     * 删除状态：0-未删除，1-已删除
     */
    @NotNull(message = "[删除状态：0-未删除，1-已删除]不能为空")
    @ApiModelProperty("删除状态：0-未删除，1-已删除")
    private Integer isDeleted;
}
