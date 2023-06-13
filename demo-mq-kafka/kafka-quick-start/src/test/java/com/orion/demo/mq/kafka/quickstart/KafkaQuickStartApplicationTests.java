package com.orion.demo.mq.kafka.quickstart;


import com.orion.demo.mq.kafka.quickstart.message.Demo01Message;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.kafka.core.KafkaProducerException;
import org.springframework.kafka.core.KafkaSendCallback;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.util.concurrent.ListenableFuture;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
@Slf4j
class KafkaQuickStartApplicationTests {

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    // 统计发送消息成功次数
    private static int count = 0;

    private final static String TOPIC = "my-topic";

    /**
     * 向Kafka发送消息
     *
     * @param record 消息体
     */
    public void sendMessageToKafka(ProducerRecord<String, String> record) {

        // 发送消息并添加回调函数
        ListenableFuture<SendResult<String, String>> future = this.kafkaTemplate.send(record);
        future.addCallback(new KafkaSendCallback<>() {

            @Override
            public void onSuccess(SendResult<String, String> result) {
                handleSuccess(record);
                KafkaQuickStartApplicationTests.count++;
            }

            @Override
            public void onFailure(KafkaProducerException ex) {
                handleFailure(record, ex);
            }
        });
    }

    /**
     * 消息发送成功后执行的逻辑
     *
     * @param record 发送成功的ProducerRecord对象
     */
    public void handleSuccess(ProducerRecord<String, String> record) {
        log.info("成功发送消息：{}", record.toString());
    }

    /**
     * 消息发送失败后执行的逻辑
     *
     * @param record 发送失败的ProducerRecord对象
     * @param ex     异常对象
     */
    public void handleFailure(ProducerRecord<String, String> record, KafkaProducerException ex) {
        log.error("发送消息失败，ProducerRecord为：{}", record.toString(), ex);
    }

    // 修改后的测试方法
    @Test
    void sendMessageToKafkaTest() {
        // 测试数据
        Demo01Message message = new Demo01Message();
        message.setId(1);
        message.setBody("Hello, Kafka");

        // 创建ProducerRecord对象进行消息发送
        final ProducerRecord<String, String> record = new ProducerRecord<>(TOPIC, message.getId().toString(), message.getBody());

        // 发送消息，应该成功
        sendMessageToKafka(record);

        // 等待一段时间等待发送完成
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // 判断是否成功发送消息
        // 这里可以针对具体业务逻辑进行断言判断
        // 此处仅以日志记录是否成功为例
        assertEquals(1, count);
    }

}
