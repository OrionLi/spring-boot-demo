package com.orion.demo.kafka.batchproduce.message;

import lombok.Data;

/**
 * @author OrionLi
 * @date 2023/6/8 16:45
 * @description
 */
@Data
public class Demo02Message {

    public static final String TOPIC = "DEMO_02";

    /**
     * 编号
     */
    private Integer id;
}
