package com.orion.demo.kafka.quickstart.message;

import lombok.Data;

/**
 * @author OrionLi
 * @date 2023/6/7 18:51
 * @description
 */
@Data
public class Demo01Message {

    public static final String TOPIC = "DEMO_01";

    /**
     * 编号
     */
    private Integer id;

    /**
     * 正文
     */
    private String body;
}