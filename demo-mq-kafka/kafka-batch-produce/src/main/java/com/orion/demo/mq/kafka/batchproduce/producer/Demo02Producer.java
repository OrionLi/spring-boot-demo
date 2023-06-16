package com.orion.demo.mq.kafka.batchproduce.producer;

import com.orion.demo.mq.kafka.batchproduce.message.Demo02Message;
import jakarta.annotation.Resource;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;

import java.util.concurrent.CompletableFuture;


/**
 * @author OrionLi
 * @date 2023/6/8 16:46
 * @description
 */
@Component
public class Demo02Producer {

    @Resource
    private KafkaTemplate<Object, Object> kafkaTemplate;

    public CompletableFuture<SendResult<Object, Object>> asyncSend(Integer id) {
        // 创建 Demo02Message 消息
        Demo02Message message = new Demo02Message();
        message.setId(id);
        // 异步发送消息
        return kafkaTemplate.send(Demo02Message.TOPIC, message);
    }
}
