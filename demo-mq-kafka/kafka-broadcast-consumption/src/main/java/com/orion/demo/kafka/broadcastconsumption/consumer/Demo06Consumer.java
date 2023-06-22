package com.orion.demo.kafka.broadcastconsumption.consumer;

import com.orion.demo.kafka.broadcastconsumption.message.Demo06Message;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

/**
 * @author OrionLi
 * @date 2023/6/13 17:00
 * @description
 */
@Slf4j
@Component
public class Demo06Consumer {
    @KafkaListener(topics = Demo06Message.TOPIC,
            groupId = "demo06-consumer-group-" + Demo06Message.TOPIC + "-" + "#{T(java.util.UUID).randomUUID()}") // <X>
    public void onMessage(Demo06Message message) {
        log.info("[onMessage][线程编号:{} 消息内容：{}]", Thread.currentThread().getId(), message);
    }
}
