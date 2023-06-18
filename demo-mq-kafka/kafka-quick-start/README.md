# Demo01 快速入门

观看顺序：application.yml -> Message类 -> 提供者 -> 消费者`Demo01Consumer` -> 消费者`Demo01AConsumer`

如果复制了本项目的 yml 配置，记得把 `spring.kafka.consumer.properties.spring.json.trusted.packages` 配了
> 原因是前面配置的 `JsonDeserializer` 在反序列化消息时，考虑到安全性，只反序列化成信任的 Message 类，所以得配置一下

## Demo01Producer 类的两个方法最后都返回了什么

### 理解回调函数

回调函数的基本思想就是将一个方法（回调方法）作为参数传递给另一个方法，然后在特定的时刻调用它。在这个过程中，通常会有两个代码部分：请求方和响应方。请求方需要调用具有某种功能的响应方，并向该响应方注册一个回调函数。当响应方完成任务后，会调用已注册的回调函数，在此函数中执行请求方期望的操作。

举个例子，给一个方法B作为方法A参数，方法A会在某时候调用方法B。方法B可以视为作为参数传递给方法A的回调方法。而当方法A在特定的场合下被触发时，它将会自动调用已经注册好了的方法B。这样就实现了在方法A的执行过程中调用外部定义的方法B，以处理一些额外的操作或获得返回结果等目的。

下面是一个简单的 Java 回调函数示例：

```java
public class Worker {
    public void doWork(Callback callback) {
        // 模拟一些工作
        System.out.println("工作开始");

        for (int i = 1; i <= 10; i++) {
            System.out.println(i);
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        // 工作完成后，调用回调函数
        callback.onComplete();
    }
}

public interface Callback {
    void onComplete();
}
```

在上面的代码中，`Worker` 类会执行一些工作，然后在工作完成后调用一个回调函数。`doWork()` 方法接受 `Callback`
接口类型的参数，在工作完成时调用其中的 `onComplete()` 方法。

下面是使用这个回调函数的示例代码：

```java
public class Main {
    public static void main(String[] args) {
        Worker worker = new Worker();

        // 创建回调函数并传入
        worker.doWork(new Callback() {
            @Override
            public void onComplete() {
                System.out.println("工作结束");
            }
        });
    }
}
```

在上面的代码中，我们首先创建了一个 `Worker` 对象，然后创建了一个匿名类实现 `Callback` 接口，并将其传递给 `doWork()`
方法作为回调函数。

当 `worker.doWork()` 方法执行到最后，需要调用回调函数时，执行程序将打印出 "工作结束"。这就是回调的基本流程：工作执行完毕后，回调函数自动被调用。

### 理解异步操作

下面是一个简单的使用 Spring 的 CompletableFuture 进行异步操作和回调的示例代码：

```java
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.ListenableFutureCallback;
import org.springframework.util.concurrent.ListenableFutureTask;

import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Main {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(10);

        CompletableFuture<String> futureTask = new CompletableFuture<>(new Callable<String>() {
            @Override
            public String call() throws Exception {
                Thread.sleep(3000);  // 模拟耗时任务
                return "这是结果";
            }
        });

        futureTask.whenComplete((result, ex) -> {
            if (ex == null) {
                System.out.println("操作成功，结果为：" + result);
            } else {
                System.out.println("操作失败，原因为：" + throwable.getMessage());
            }
        });

        executor.submit(futureTask);

        System.out.println("正在等待结果...");
    }
}
```

在上面的代码中，我们首先创建了一个 `ExecutorService` 对象作为线程池。然后，创建了一个 `CompletableFuture`
对象

接下来，我们可以调用 `whenComplete()` 方法向这个任务注册一个回调函数，当任务执行成功或发生异常时回调该函数。`result`
携带处理任务成功时的结果，而 `ex` 携带任务执行失败时的异常信息。

最后，把`CompletableFuture`对象扔进线程池。主线程中会立即输出"正在等待结果..."，并不会有任何等待操作。当任务执行完成后回调函数将被自动调用，异步返回任务结果。

在上面的示例代码中，方法执行顺序如下：

1. 创建一个 `ExecutorService` 对象作为线程池，这个对象是同步创建的。
2. 创建一个 `CompletableFuture` 对象，并传入一个匿名内部类 `Callable` 对象作为任务执行体，还没有开始执行任务。
3. 给 `CompletableFuture` 对象注册回调方法，它是异步执行的，注册了回调函数后也不阻塞主线程。
4. 将 `CompletableFuture` 对象提交到线程池中，这里会调用 `ExecutorService` 的 `submit()`
   方法并将 `CompletableFuture` 作为参数，而`submit()` 方法会立即返回并继续执行下去，不阻塞主线程。任务在线程池中被开启，在后台新建线程中异步地执行
5. 输出"正在等待结果..."，这一行代码直接运行在主线程中，而不需要等待任务执行完才输出。
6. 当 `Callable` 对象的 `call()` 方法完成时，会将结果存储在 `CompletableFuture` 对象中，如果有回调函数，则它们会按照注册的顺序被自动调用。
7. 如果任务出现了异常，那么结果存放在 `ex`，否则存放在 `result` 。
8. 主线程和后台线程都已经执行完成。

总结起来，通过 CompletableFuture 对象使用 Spring
的异步操作机制，能够非常方便地实现后台异步执行任务，并且在任务完成时回调相应的方法，这样就避免了阻塞主线程。同时，在不需要使用到回调功能的情况下，我们也可以直接使用 `Future`
接口，并通过它来实现简单的异步操作。

### 更多 Kafka 异步调用示例

在 `com.orion.demo.mq.kafka.quickstart.KafkaQuickStartApplicationTests` 处，有一个稍显完整的 Kafka 异步调用示例

## 消息 Message 是怎么序列化的。

在序列化时，我们使用了 JsonSerializer 序列化 Message 消息对象，它会在 Kafka 消息 Headers 的 `__TypeId__` 上，值为 Message
消息对应的类全名。
在反序列化时，我们使用了 JsonDeserializer 序列化出 Message 消息对象，它会根据 Kafka 消息 Headers 的 `__TypeId__`
的值，反序列化消息内容成该 Message 对象。

## Kafka 集群消费

执行 `com.orion.demo.mq.kafka.producer.Demo01ProducerTest` 的 `#testSyncSend()` 方法再执行 `#testSyncSend()`
方法，我们打开 `#testSyncSend()` 方法所在的控制台，不会看到有消息消费的日志

### 怎么理解

我们把一群消费者划到一个组，每个到达这个消费者组的信息只会被这个消费者组的其中一个消费者消费，
也就是说，集群消费模式下，相同 消费者组 的每个 消费者
实例平均分摊消息。
> 就像一批书（对应你这个消费者组的Topic）到了你们班，你们自己班内分，一本书只能被一个人拥有。如果大家都有书了，那可能有几个人得多拿几本
> 但如果书不够分，那这些倒霉蛋就没书了（不能一起看）

消息发送时，要指定一个topic，topic内的消息会广播被所有订阅了这个topic的消费者组
> 每个消费者组都会消费一次它们订阅的消息

### 有什么用

1. 通过集群消费的机制，我们可以实现针对相同 Topic ，不同消费者分组实现各自的业务逻辑。例如说：用户注册成功时，发送一条 Topic
   为 `"USER_REGISTER"` 的消息。然后，不同模块使用不同的消费者分组，订阅该 Topic ，实现各自的拓展逻辑：
    - 积分模块：判断如果是手机注册，给用户增加 20 积分。
    - 优惠劵模块：因为是新用户，所以发放新用户专享优惠劵。
    - 站内信模块：因为是新用户，所以发送新用户的欢迎语的站内信。
    - ... 等等
      这样，我们就可以将注册成功后的业务拓展逻辑，实现业务上的解耦，未来也更加容易拓展。同时，也提高了注册接口的性能，避免用户需要等待业务拓展逻辑执行完成后，才响应注册成功。
2. 每个消费者组的方法参数可以不一样：在`Demo01AConsumer`中，设置消费的消息对应的类不是 `Demo01Message` 类，而是 Kafka
   内置的 `ConsumerRecord` 类。通过 `ConsumerRecord`
   类，我们可以获取到消费的消息的更多信息，例如说消息的所属队列、创建时间等等属性，不过消息的内容(`value`)
   就需要自己去反序列化。当然，一般情况下，我们不会使用 `ConsumerRecord` 类。

## `@KafkaListener` 注解的常用属性

| 属性              | 描述                                                                                                              | 示例                                                                                                                                                  |
|-----------------|-----------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| topics          | 监听的 Topic 数组。可以是 'topic name'、'property-placeholder keys' 或 'expressions'，必须与 topicPattern 和 topicPartitions 互斥 | `@KafkaListener(topics = {"myTopic"})`                                                                                                              |
| topicPattern    | 监听的 Topic 表达式。可以是 'topic pattern'、'property-placeholder key' 或 'expression'，必须与 topics 和 topicPartitions 互斥     | `@KafkaListener(topicPattern = "myTopic.*")`                                                                                                        |
| topicPartitions | @TopicPartition 注解的数组。每个 @TopicPartition 注解可配置监听的 Topic、队列、消费的开始位置，必须与 topics 和 topicPattern 互斥                 | `@KafkaListener(topicPartitions = {@TopicPartition(topic = "myTopic", partitionOffsets = @PartitionOffset(partition = "0", initialOffset = "0"))})` |
| groupId         | 消费者分组                                                                                                           | `@KafkaListener(groupId = "myGroupId")`                                                                                                             |
| errorHandler    | 使用消费异常处理器 KafkaListenerErrorHandler 的 Bean 名字                                                                   | `@KafkaListener(errorHandler = "myErrorHandler")`                                                                                                   |
| concurrency     | 自定义消费者监听器的并发数                                                                                                   | `@KafkaListener(concurrency = "3-6")`                                                                                                               |
| autoStartup     | 是否自动启动监听器                                                                                                       | `@KafkaListener(autoStartup = "false")`                                                                                                             |
| properties      | Kafka Consumer 拓展属性                                                                                             | `@KafkaListener(properties = {"max.poll.records=10", "enable.auto.commit=false"})`                                                                  |