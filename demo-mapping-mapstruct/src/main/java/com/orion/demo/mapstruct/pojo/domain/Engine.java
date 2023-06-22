package com.orion.demo.mapstruct.pojo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author OrionLi
 * @date 2023/6/3 19:39
 * @description
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Engine {
    private int horsePower;
    private String fuel;
}
