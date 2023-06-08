package com.orion.demo.mq.kafka.batchproduce.producer;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.kafka.support.SendResult;
import org.springframework.util.concurrent.ListenableFutureCallback;

import java.util.concurrent.CountDownLatch;

/**
 * @author OrionLi
 * @date 2023/6/8 16:48
 * @description 测试 Producer 批量发送消息的效果
 */
@Slf4j
@SpringBootTest
public class Demo02ProducerTest {

    @Autowired
    private Demo02Producer producer;

    /**
     * 测试同步发送 普通消息
     * 异步发送三条消息，每次发送消息之间，都故意 sleep 10 秒。
     * 目的是恰好满足我们配置的 linger.ms 最大等待时长。
     *
     * @throws InterruptedException
     */
    @Test
    public void testASyncSend() throws InterruptedException {
        log.info("[testASyncSend][开始执行]");

        for (int i = 0; i < 3; i++) {
            int id = (int) (System.currentTimeMillis() / 1000);
            this.producer.asyncSend(id).addCallback(new ListenableFutureCallback<>() {

                @Override
                public void onFailure(Throwable e) {
                    Demo02ProducerTest.log.info("[testASyncSend][发送编号：[{}] 发送异常]]", id, e);
                }

                @Override
                public void onSuccess(SendResult<Object, Object> result) {
                    Demo02ProducerTest.log.info("[testASyncSend][发送编号：[{}] 发送成功，结果为：[{}]]", id, result);
                }

            });

            // 故意每条消息之间，隔离 10 秒
            Thread.sleep(1000L);
        }

        // 阻塞等待，保证消费
        new CountDownLatch(1).await();
    }

}