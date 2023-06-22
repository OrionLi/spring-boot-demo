package com.orion.demo.kafka.batchproduce.consumer;

import com.orion.demo.kafka.batchproduce.message.Demo02Message;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

/**
 * @author OrionLi
 * @date 2023/6/8 16:47
 * @description
 */
@Slf4j
@Component
public class Demo02Consumer {

    @KafkaListener(topics = Demo02Message.TOPIC,
            groupId = "demo02-consumer-group-" + Demo02Message.TOPIC)
    public void onMessage(Demo02Message message) {
        log.info("[onMessage][线程编号:{} 消息内容：{}]", Thread.currentThread().getId(), message);
    }
}
