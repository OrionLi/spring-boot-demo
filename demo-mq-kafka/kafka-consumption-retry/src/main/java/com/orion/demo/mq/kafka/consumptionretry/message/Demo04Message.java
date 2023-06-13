package com.orion.demo.mq.kafka.consumptionretry.message;

import lombok.Data;

/**
 * @author OrionLi
 * @date 2023/6/13 14:08
 * @description
 */
@Data
public class Demo04Message {

    public static final String TOPIC = "DEMO_04";

    /**
     * 编号
     */
    private Integer id;
}
