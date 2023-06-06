package com.orion.demo.orm.beansearcher.controller;

import cn.zhxu.bs.BeanSearcher;
import cn.zhxu.bs.MapSearcher;
import cn.zhxu.bs.operator.Contain;
import cn.zhxu.bs.operator.Equal;
import cn.zhxu.bs.util.MapUtils;
import com.orion.demo.orm.beansearcher.domain.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author OrionLi
 * @date 2023/6/6 14:25
 * @description <a href="https://bs.zhxu.cn/guide/latest/start.html#%E5%BC%80%E5%A7%8B%E6%A3%80%E7%B4%A2">字段检索关键字</a>
 */

@RestController
@RequestMapping("/user")
@Api(tags = "用户管理相关接口")
public class UserController {

    /**
     * 注入 Map 检索器，它检索出来的数据以 Map 对象呈现
     */
    @Autowired
    private MapSearcher mapSearcher;
    /**
     * 注入 Bean 检索器，它检索出来的数据以 泛型 对象呈现
     */
    @Autowired
    private BeanSearcher beanSearcher;

    @GetMapping("list")
    public Object testSelectList(User user, @ApiParam("要排序的字段名称") String sortField, @ApiParam("asc / desc") String order, Integer page, Integer size) {
        // 一行代码，实现一个用户检索接口（MapUtils.flat 只是收集前端的请求参数）
        return this.mapSearcher.search(User.class, MapUtils.builder()
                .onlySelect(User::getId, User::getUsername, User::getPhone, User::getTags, User::getProfile, User::getIdentity, User::getUserStatus, User::getCreateTime)
                .field(User::getId, user.getId()).op(Equal.class)
                .field(User::getUsername, user.getUsername()).op(Contain.class).ic(true)
                .field(User::getPhone, user.getPhone()).op(Contain.class)
                .field(User::getTags, user.getTags()).op(Contain.class).ic(true)
                // https://bs.zhxu.cn/guide/latest/params.html#%E5%AD%97%E6%AE%B5%E8%A1%8D%E7%94%9F%E8%A7%84%E5%88%99
                //.field(User::getCreateTime), entryDate_0, entryDate_1).op(规则)
                .orderBy(sortField, order)
                .page(page != null ? page : 0, size != null ? size : 15)
                .build()
        );
    }
}
