package com.orion.demo.mapping.mapstruct.pojo.dto;

import lombok.Data;

import java.util.List;

/**
 * @author OrionLi
 * @date 2023/6/3 19:36
 * @description
 */
@Data
public class CarDto {
    private String manufacturer;
    private int seatCount;
    private List<String> features;
    private PersonDto driver;
    private String price;
    private String category;
    private EngineDto engine;
}
