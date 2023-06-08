package com.orion.demo.mq.kafka.quickstart.consumer;

import com.orion.demo.mq.kafka.quickstart.message.Demo01Message;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

/**
 * @author OrionLi
 * @date 2023/6/7 18:54
 * @description 测试 Kafka 集群消费
 */
@Slf4j
@Component
public class Demo01AConsumer {

    /**
     * 消费的 Topic 还是 "DEMO_01"
     * 消费者分组修改成了 "demo01-A-consumer-group-DEMO_01"
     *
     * @param record 消息类
     */
    @KafkaListener(topics = Demo01Message.TOPIC,
            groupId = "demo01-A-consumer-group-" + Demo01Message.TOPIC)
    public void onMessage(ConsumerRecord<Integer, String> record) {
        log.info("[onMessage][线程编号:{} 消息内容：{}]", Thread.currentThread().getId(), record);
    }

}