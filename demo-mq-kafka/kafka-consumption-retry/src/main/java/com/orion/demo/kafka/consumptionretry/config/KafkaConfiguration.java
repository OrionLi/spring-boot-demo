package com.orion.demo.kafka.consumptionretry.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.listener.DeadLetterPublishingRecoverer;
import org.springframework.kafka.listener.DefaultErrorHandler;
import org.springframework.util.backoff.FixedBackOff;

/**
 * @author OrionLi
 * @date 2023/6/13 12:41
 * @description
 */
@Configuration
public class KafkaConfiguration {

    /**
     * 在Spring中，当有多个Bean满足相同类型的依赖时，会选择一个具有最高优先级的Bean来注入。可以使用`@Primary`注解将一个Bean标记为具有最高优先级，以确保它会被注入到相应的依赖中。
     * <p>
     * 例如，在下面提供的Kafka配置类中，我们使用了`@Primary`注解标记了`kafkaErrorHandler`方法。这意味着当其他组件需要一个`KafkaListenerErrorHandler`类型的Bean时，Spring会选择具有`@Primary`注解的方法返回的Bean，而不是任何其他可能存在的具有相同类型的Bean。
     */

    /**
     * 单条消费失败的消费重试
     */
    @Bean
    @Primary
    public DefaultErrorHandler kafkaErrorHandler(KafkaTemplate<?, ?> template) {
        return new DefaultErrorHandler(
                new DeadLetterPublishingRecoverer(template),
                new FixedBackOff(5L, 3L));// 失败后重新发送。间隔5秒，重复3次
    }

    ///**
    // * 批量消费失败的消费重试处理
    // */
    //@Bean
    //@Primary
    //public DefaultErrorHandler kafkaBatchErrorHandler() {
    //    return new DefaultErrorHandler(
    //            new FixedBackOff(5L, 3L));// 失败后重新发送。间隔5秒，重复3次
    //}
}