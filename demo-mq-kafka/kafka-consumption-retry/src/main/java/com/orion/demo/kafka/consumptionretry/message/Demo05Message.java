package com.orion.demo.kafka.consumptionretry.message;

import lombok.Data;

/**
 * @author OrionLi
 * @date 2023/6/13 14:08
 * @description
 */
@Data
public class Demo05Message {

    public static final String TOPIC = "DEMO_05";

    /**
     * 编号
     */
    private Integer id;
}
