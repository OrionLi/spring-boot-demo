package com.orion.demo.mq.kafka.quickstart.producer;

import com.orion.demo.mq.kafka.quickstart.message.Demo01Message;
import jakarta.annotation.Resource;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * @author OrionLi
 * @date 2023/6/7 18:52
 * @description 一般都是异步发送
 */
@Component
public class Demo01Producer {

    @Resource
    private KafkaTemplate<Object, Object> kafkaTemplate;

    /**
     * 异步发送消息。在方法内部，会调用 KafkaTemplate#send(topic, data) 方法，异步发送消息
     *
     * @param id id
     * @return 发送结果
     */
    public CompletableFuture<SendResult<Object, Object>> asyncSend(Integer id) {
        // 创建 Demo01Message 消息
        Demo01Message message = new Demo01Message();
        message.setId(id);
        // 异步发送消息
        return kafkaTemplate.send(Demo01Message.TOPIC, message);
    }

    /**
     * 同步发送消息。在方法内部，也是调用 KafkaTemplate#send(topic, data) 方法，异步发送消息。
     * 不过，因为我们后面调用了 CompletableFuture 对象的 #get() 方法，阻塞等待发送结果，从而实现同步的效果。
     *
     * @param id id
     * @return 发送结果
     * @throws ExecutionException   发送异常
     * @throws InterruptedException 发送中断
     */
    public SendResult syncSend(Integer id) throws ExecutionException, InterruptedException {
        // 创建 Demo01Message 消息
        Demo01Message message = new Demo01Message();
        message.setId(id);
        // 同步发送消息
        return kafkaTemplate.send(Demo01Message.TOPIC, message).get();
    }

}