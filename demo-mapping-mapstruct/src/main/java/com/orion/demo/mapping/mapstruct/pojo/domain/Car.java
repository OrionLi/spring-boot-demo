package com.orion.demo.mapping.mapstruct.pojo.domain;

import com.orion.demo.mapping.mapstruct.pojo.emum.Category;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author OrionLi
 * @date 2023/6/3 19:35
 * @description
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Car {
    private String make;
    private int numberOfSeats;
    private List<String> features;
    private Person driver;
    private double price;
    private Category category;
    private Engine engine;
}