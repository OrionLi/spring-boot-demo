package com.orion.demo.mapstruct.pojo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author OrionLi
 * @date 2023/6/3 19:38
 * @description
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Person {
    private String firstName;
    private String lastName;
    private int age;
}
