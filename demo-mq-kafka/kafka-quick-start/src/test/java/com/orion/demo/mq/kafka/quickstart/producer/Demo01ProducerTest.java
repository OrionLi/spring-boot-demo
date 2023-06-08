package com.orion.demo.mq.kafka.quickstart.producer;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.kafka.support.SendResult;
import org.springframework.util.concurrent.ListenableFutureCallback;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;

/**
 * @author OrionLi
 * @date 2023/6/7 18:55
 * @description
 */

@Slf4j
@SpringBootTest
public class Demo01ProducerTest {

    @Autowired
    private Demo01Producer producer;

    /**
     * 先执行这个
     */
    @Test
    public void testSyncSend() throws ExecutionException, InterruptedException {
        int id = (int) (System.currentTimeMillis() / 1000);
        SendResult result = this.producer.syncSend(id);
        log.info("[testSyncSend][发送编号：[{}] 发送结果：[{}]]", id, result);

        // 阻塞等待，保证消费
        new CountDownLatch(1).await();
    }

    /**
     * 再执行这个，不要关闭 #testSyncSend() 单元测试方法，
     * 因为我们要模拟每个消费者集群都有多个消费者节点。
     */
    @Test
    public void testASyncSend() throws InterruptedException {
        int id = (int) (System.currentTimeMillis() / 1000);
        this.producer.asyncSend(id).addCallback(new ListenableFutureCallback<>() {

            @Override
            public void onFailure(Throwable e) {
                Demo01ProducerTest.log.info("[testASyncSend][发送编号：[{}] 发送异常]]", id, e);
            }

            @Override
            public void onSuccess(SendResult<Object, Object> result) {
                Demo01ProducerTest.log.info("[testASyncSend][发送编号：[{}] 发送成功，结果为：[{}]]", id, result);
            }

        });

        // 阻塞等待，保证消费
        new CountDownLatch(1).await();
    }

}