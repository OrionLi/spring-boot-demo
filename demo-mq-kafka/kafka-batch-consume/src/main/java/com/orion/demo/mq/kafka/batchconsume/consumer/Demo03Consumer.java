package com.orion.demo.mq.kafka.batchconsume.consumer;


import com.orion.demo.mq.kafka.batchconsume.message.Demo03Message;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author OrionLi
 * @date 2023/6/8 16:47
 * @description 和 Demo 02 的消费者相比，方法上的参数变成了 List 数组
 */
@Slf4j
@Component
public class Demo03Consumer {

    @KafkaListener(topics = Demo03Message.TOPIC,
            groupId = "demo03-consumer-group-" + Demo03Message.TOPIC)
    public void onMessage(List<Demo03Message> messages) {
        log.info("[onMessage][线程编号:{} 消息数量：{}]", Thread.currentThread().getId(), messages.size());
    }
}
