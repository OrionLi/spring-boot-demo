package com.orion.demo.mq.kafka.consumptionretry.producer;

import com.orion.demo.mq.kafka.consumptionretry.message.Demo04Message;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.concurrent.ExecutionException;

/**
 * @author OrionLi
 * @date 2023/6/13 14:11
 * @description
 */
@Component
public class Demo04Producer {

    @Resource
    private KafkaTemplate<Object, Object> kafkaTemplate;

    public SendResult syncSend(Integer id) throws ExecutionException, InterruptedException {
        // 创建 Demo04Message 消息
        Demo04Message message = new Demo04Message();
        message.setId(id);
        // 同步发送消息
        return this.kafkaTemplate.send(Demo04Message.TOPIC, message).get();
    }

}