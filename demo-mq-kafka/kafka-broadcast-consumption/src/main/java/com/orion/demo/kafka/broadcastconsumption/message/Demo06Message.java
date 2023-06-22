package com.orion.demo.kafka.broadcastconsumption.message;

import lombok.Data;

/**
 * @author OrionLi
 * @date 2023/6/13 16:49
 * @description
 */
@Data
public class Demo06Message {
    public static final String TOPIC = "DEMO_06";

    /**
     * 编号
     */
    private Integer id;
}
