package com.orion.demo.demoormmybatismapper.dao;

import com.orion.demo.demoormmybatismapper.demain.User;
import io.mybatis.mapper.Mapper;

/**
 * @author OrionLi
 */
@org.apache.ibatis.annotations.Mapper
public interface UserDao extends Mapper<User, Integer> {
}
