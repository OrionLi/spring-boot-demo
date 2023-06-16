package com.orion.demo.mq.kafka.batchconsume.producer;


import com.orion.demo.mq.kafka.batchconsume.message.Demo03Message;
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
public class Demo03Producer {

    @Resource
    private KafkaTemplate<Object, Object> kafkaTemplate;

    public CompletableFuture<SendResult<Object, Object>> asyncSend(Integer id) {
        // 创建 Demo03Message 消息
        Demo03Message message = new Demo03Message();
        message.setId(id);
        // 异步发送消息
        return kafkaTemplate.send(Demo03Message.TOPIC, message);
    }
}
