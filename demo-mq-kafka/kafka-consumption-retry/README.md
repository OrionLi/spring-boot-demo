# Demo05 消费重试

# DefaultErrorHandler

这个新的错误处理程序取代了 `SeekToCurrentErrorHandlerand` 和
`RecoveringBatchErrorHandler`，后者现在已成为多个版本的默认错误处理程序。一个区别是批处理侦听器的回退行为（当抛出 a
以外的异常时 `BatchListenerFailedException`
）等同于重试完整批处理（[Retrying Complete Batches](https://docs.spring.io/spring-kafka/docs/2.8.11/reference/html/#retrying-batch-eh)）。

错误处理程序可以恢复（跳过）不断失败的记录。默认情况下，失败十次后，失败的记录被记录（在级别 `ERROR`
）。您可以使用自定义恢复器 (
`BiConsumer` )
和 `BackOff` 控制每个之间的传递尝试和延迟的处理程序来配置处理程序。将 `FixedBackOff` 与 `FixedBackOff.UNLIMITED_ATTEMPTS`
一起使用会
导致（有效地）无限重试。以下示例配置了三次尝试后的恢复：

```java
DefaultErrorHandler errorHandler=
        new DefaultErrorHandler((record,exception)->{
        // recover after 3 failures, with no back off - e.g. send to a dead-letter topic
        },new FixedBackOff(0L,2L));
```

要使用此处理程序的自定义实例配置侦听器容器，请将其添加到容器工厂。