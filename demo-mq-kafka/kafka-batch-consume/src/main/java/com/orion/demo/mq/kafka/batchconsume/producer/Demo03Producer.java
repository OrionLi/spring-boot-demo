package com.orion.demo.mq.kafka.batchconsume.producer;


import com.orion.demo.mq.kafka.batchconsume.message.Demo03Message;
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
public class Demo03Producer {

    @Resource
    private KafkaTemplate<Object, Object> kafkaTemplate;

    public ListenableFuture<SendResult<Object, Object>> asyncSend(Integer id) {
        // 创建 Demo03Message 消息
        Demo03Message message = new Demo03Message();
        message.setId(id);
        // 异步发送消息
        return this.kafkaTemplate.send(Demo03Message.TOPIC, message);
    }
}
