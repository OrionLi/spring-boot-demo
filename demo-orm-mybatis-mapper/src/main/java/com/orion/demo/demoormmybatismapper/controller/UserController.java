package com.orion.demo.demoormmybatismapper.controller;

import com.orion.demo.demoormmybatismapper.dao.UserDao;
import com.orion.demo.demoormmybatismapper.demain.User;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author OrionLi
 */
@RestController
public class UserController {
    @Resource
    private UserDao userDao;

    @GetMapping("/user/list")
    public Object testSelectList(User user) {
        return userDao.selectList(user);
    }
}
