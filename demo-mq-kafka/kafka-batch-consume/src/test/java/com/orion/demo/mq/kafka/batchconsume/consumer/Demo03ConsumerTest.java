package com.orion.demo.mq.kafka.batchconsume.consumer;

import com.orion.demo.mq.kafka.batchconsume.producer.Demo03Producer;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.kafka.support.SendResult;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CountDownLatch;

/**
 * @author OrionLi
 * @date 2023/6/8 20:04
 * @description
 */
@Slf4j
@SpringBootTest
public class Demo03ConsumerTest {

    @Autowired
    private Demo03Producer producer;

    /**
     * 测试同步发送 普通消息
     *
     * @throws InterruptedException
     */
    @Test
    public void testASyncSend() throws InterruptedException {
        log.info("[testASyncSend][开始执行]");

        for (int i = 0; i < 3; i++) {
            int id = (int) (System.currentTimeMillis() / 1000);
            CompletableFuture<SendResult<Object, Object>> future = producer.asyncSend(id);
            future.whenComplete((result, ex) -> {
                if (ex == null) {
                    log.info("[testASyncSend][发送编号：[{}] 发送结果：[{}]]", id, result);
                } else {
                    log.error("[testASyncSend][发送编号：[{}] 发送异常]]", id, ex);
                }
            });

            // 故意每条消息之间，隔离 10 秒
            Thread.sleep(1000L);
        }

        // 阻塞等待，保证消费
        new CountDownLatch(1).await();
    }

}