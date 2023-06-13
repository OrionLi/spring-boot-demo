package com.orion.demo.mq.kafka.consumptionretry.consumer;

import com.orion.demo.mq.kafka.consumptionretry.message.Demo05Message;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

/**
 * @author OrionLi
 * @date 2023/6/13 14:12
 * @description
 */
@Slf4j
@Component
public class Demo05Consumer {

    @KafkaListener(topics = Demo05Message.TOPIC,
            groupId = "demo05-consumer-group-" + Demo05Message.TOPIC)
    public void onMessage(Demo05Message message) {
        log.info("[onMessage][线程编号:{} 消息内容：{}]", Thread.currentThread().getId(), message);
        // <X> 注意，此处抛出一个 RuntimeException 异常，模拟消费失败
        throw new RuntimeException("我就是故意抛出一个异常");
    }

}