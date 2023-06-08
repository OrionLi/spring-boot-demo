package com.orion.demo.mq.kafka.batchproduce.producer;

import com.orion.demo.mq.kafka.batchproduce.message.Demo02Message;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;
import org.springframework.util.concurrent.ListenableFuture;

import javax.annotation.Resource;

/**
 * @author OrionLi
 * @date 2023/6/8 16:46
 * @description
 */
@Component
public class Demo02Producer {

    @Resource
    private KafkaTemplate<Object, Object> kafkaTemplate;

    public ListenableFuture<SendResult<Object, Object>> asyncSend(Integer id) {
        // 创建 Demo02Message 消息
        Demo02Message message = new Demo02Message();
        message.setId(id);
        // 异步发送消息
        return this.kafkaTemplate.send(Demo02Message.TOPIC, message);
    }
}
