package com.orion.demo.mq.kafka.broadcastconsumption.producer;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.kafka.support.SendResult;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;

/**
 * @author OrionLi
 * @date 2023/6/13 17:02
 * @description
 */
@Slf4j
@SpringBootTest
class Demo06ProducerTest {

    @Autowired
    private Demo06Producer producer;

    @Test
    public void test() throws InterruptedException {
        // 阻塞等待，保证消费
        new CountDownLatch(1).await();
    }

    @Test
    public void testSyncSend() throws InterruptedException {
        int id = (int) (System.currentTimeMillis() / 1000);
        try {
            SendResult result = producer.syncSend(id);
            log.info("[testSyncSend][发送编号：[{}] 发送结果：[{}]]", id, result);
        } catch (ExecutionException | InterruptedException e) {
            log.error("[testASyncSend][发送编号：[{}] 发送异常]]", id, e);
        }

        // 阻塞等待，保证消费
        new CountDownLatch(1).await();
    }
}