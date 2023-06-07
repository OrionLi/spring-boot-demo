package com.orion.demo.mq.kafka.consumer;

import com.orion.demo.mq.kafka.message.Demo01Message;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

/**
 * @author OrionLi
 * @date 2023/6/7 18:53
 * @description 虽然说，@KafkaListener 注解是方法级别的，但是还是建议一个类对应一个方法消费消息，简单清晰
 */
@Slf4j
@Component
public class Demo01Consumer {

    /**
     * 声明消费的 Topic 是 "DEMO_01" ，消费者分组是 "demo01-consumer-group-DEMO_01"
     * 一般情况下，我们建议一个消费者分组，仅消费一个 Topic 。这样做会有个好处：每个消费者分组职责单一，只消费一个 Topic 。
     *
     * @param message 消息内容，使用消费 Topic 对应的消息类即可
     */
    @KafkaListener(topics = Demo01Message.TOPIC,
            groupId = "demo01-consumer-group-" + Demo01Message.TOPIC)
    public void onMessage(Demo01Message message) {
        log.info("[onMessage][线程编号:{} 消息内容：{}]", Thread.currentThread().getId(), message);
    }

}