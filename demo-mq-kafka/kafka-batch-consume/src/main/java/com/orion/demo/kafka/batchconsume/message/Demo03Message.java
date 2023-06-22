package com.orion.demo.kafka.batchconsume.message;

import lombok.Data;

/**
 * @author OrionLi
 * @date 2023/6/8 16:45
 * @description
 */
@Data
public class Demo03Message {

    public static final String TOPIC = "DEMO_03";

    /**
     * 编号
     */
    private Integer id;
}
