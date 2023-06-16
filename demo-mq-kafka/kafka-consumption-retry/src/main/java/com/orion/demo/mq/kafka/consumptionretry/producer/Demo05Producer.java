package com.orion.demo.mq.kafka.consumptionretry.producer;

import com.orion.demo.mq.kafka.consumptionretry.message.Demo05Message;
import jakarta.annotation.Resource;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;

import java.util.concurrent.ExecutionException;

/**
 * @author OrionLi
 * @date 2023/6/13 14:11
 * @description
 */
@Component
public class Demo05Producer {

    @Resource
    private KafkaTemplate<Object, Object> kafkaTemplate;

    public SendResult syncSend(Integer id) throws ExecutionException, InterruptedException {
        // 创建 Demo05Message 消息
        Demo05Message message = new Demo05Message();
        message.setId(id);
        // 同步发送消息
        return kafkaTemplate.send(Demo05Message.TOPIC, message).get();
    }

}