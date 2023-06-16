package com.orion.demo.mq.kafka.broadcastconsumption.producer;

import com.orion.demo.mq.kafka.broadcastconsumption.message.Demo06Message;
import jakarta.annotation.Resource;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;

import java.util.concurrent.ExecutionException;

/**
 * @author OrionLi
 * @date 2023/6/13 16:59
 * @description
 */
@Component
public class Demo06Producer {

    @Resource
    private KafkaTemplate<Object, Object> kafkaTemplate;

    public SendResult syncSend(Integer id) throws ExecutionException, InterruptedException {
        // 创建 Demo05Message 消息
        Demo06Message message = new Demo06Message();
        message.setId(id);
        // 同步发送消息
        return kafkaTemplate.send(Demo06Message.TOPIC, message).get();
    }
}
