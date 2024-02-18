package com.orion.demo.beansearcher.controller;

import cn.zhxu.bs.BeanSearcher;
import cn.zhxu.bs.MapSearcher;
import cn.zhxu.bs.operator.Contain;
import cn.zhxu.bs.operator.Equal;
import cn.zhxu.bs.param.OrderBy;
import cn.zhxu.bs.util.MapUtils;
import com.orion.demo.beansearcher.domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author OrionLi
 * @date 2023/6/6 14:25
 * @description <a href="https://bs.zhxu.cn/guide/latest/start.html#%E5%BC%80%E5%A7%8B%E6%A3%80%E7%B4%A2">字段检索关键字</a>
 */

@RestController
@RequestMapping("/user")
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

    @PostMapping("list")
    public Object testSelectList(@RequestBody UserInfo userInfo, Integer page, Integer size) {
        // 一行代码，实现一个用户检索接口（MapUtils.flat 只是收集前端的请求参数）
        return beanSearcher.search(UserInfo.class, MapUtils.builder()
                .onlySelect(UserInfo::getId, UserInfo::getUsername, UserInfo::getPhone, UserInfo::getTags, UserInfo::getProfile, UserInfo::getIdentity, UserInfo::getUserStatus, UserInfo::getCreateTime)
                .field(UserInfo::getId, userInfo.getId()).op(Equal.class)
                .field(UserInfo::getUsername, userInfo.getUsername()).op(Contain.class).ic(true)
                .field(UserInfo::getPhone, userInfo.getPhone()).op(Contain.class)
                .field(UserInfo::getTags, userInfo.getTags()).op(Contain.class).ic(true)
                // https://bs.zhxu.cn/guide/latest/params.html#%E5%AD%97%E6%AE%B5%E8%A1%8D%E7%94%9F%E8%A7%84%E5%88%99
                //.field(UserInfo::getCreateTime), entryDate_0, entryDate_1).op(规则)
                .orderBy(UserInfo::getId, OrderBy.ORDER_ASC)
                .page(page != null ? page : 0, size != null ? size : 15)
                .build()
        );
    }

    @GetMapping
    public Object testGetAll() {
        return beanSearcher.searchAll(UserInfo.class);
    }
}
