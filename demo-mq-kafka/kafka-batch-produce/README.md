# Demo02 批量发送

Kafka 提供的批量发送消息，它提供了一个 RecordAccumulator 消息收集器，将发送给相同 Topic 的相同 Partition
分区的消息们，“偷偷”收集在一起，当满足条件时候，一次性批量发送提交给 Kafka Broker 。如下是三个条件，满足任一即会批量发送：

- 【数量】`batch-size` ：单个批次中可以包含的最大消息数量，默认值为 16384。
- 【空间】`buffer-memory` ：生产者可用于缓存尚未发送到服务器的消息的总内存大小，默认值为 33554432 字节。
- 【时间】`linger.ms` ：生产者将要等待多少毫秒后再将消息发送出去，默认值为 0，即不进行等待。

因为我们发送的消息 Topic 是自动创建的，所以其 Partition 分区大小是 1 。这样，就能保证我每次调用这个方法，满足批量发送消息的一个前提，相同
Topic 的相同 Partition 分区的消息们。
> Spring Boot 自动创建的 Kafka Topic 在没有指定分区数的情况下，默认会使用 1
> 个分区。这一默认设置通常适用于简单的应用场景或者示例代码的开发。但在实际生产环境中，我们需要根据具体业务需求来合理地调整分区数量，待会我们会提到。

# 配置

## 实现批量发送

相比 Demo1 `kafka-quick-start`，本模块配置项多了三个（当然，默认也挺好）

- `spring.kafka.producer.batch-size`
- `spring.kafka.producer.buffer-memory`
- `spring.kafka.producer.properties.linger.ms`

具体的数值配置多少，根据自己的应用来。
> 这里，我们故意将 `linger.ms` 配置成了 3 秒，主要为了演示之用。实际场景下，我们不会把 `linger.ms` 配置的这么长时间

## 刚你说到是自动创建的 Topic 分区为 1，我可以自己配置吗

是的，Spring 中可以通过在 YAML 配置文件中配置 Kafka 的 Producer 或 Consumer 属性来指定分区数和副本数量。

对于 Producer，可以使用 `spring.kafka.producer.properties` 属性来配置 Kafka Producer 的属性，其中 `partitioner.class`
属性可以用来自定义消息的分配策略。如果需要指定分区数和副本数量，则可以在 `producer.properties` 中添加以下属性：

```properties
# 设置 topic 的分区数为 10
topic.partition.count=10
# 设置 replicas 副本集大小为 3
replication.factor=3
```

对于 Consumer，可以使用 `spring.kafka.consumer.properties` 属性来配置 Kafka Consumer
的属性。如果需要指定分区数和副本数量，则可以在 `consumer.properties` 中添加以下属性：

```properties
# 设置分区数为 5
partition.assignment.strategy=com.example.MyPartitionAssignmentStrategy
partition.count=5
# 设置每个分区的副本数量为 2
replica.fetch.max.bytes=10485760
min.insync.replicas=2
default.replication.factor=2
```

需要注意的是，在设置分区和副本数量时，应该遵循 Kafka 的分区数量和副本数量的限制规则，并考虑到集群的实际负载情况和容错需求。

> **Kafka 的分区数量一旦创建完成后就无法更改，因此在创建 Topic 时需要考虑到未来数据增长的情况，避免出现分区过少导致吞吐量不足的问题。
**

## 啥？消费者还有副本和分区？

在 Kafka 中，消费者组通过订阅指定 Topic
来消费其中的消息。当消费者启动时，会加入指定的消费者组并进行协调，每个消费者会被分配到一个或多个分区进行消息消费。在一个消费者组内，每个消费者只会消费不同的分区，同一个分区只会被其中的一个消费者消费，这样可以保证同一个分区中的消息只会被消费一次。

根据消费者组的数目和主题的分区数、副本数，以及消费者组内每个消费者的处理能力等因素，Kafka
在启动消费者时会自动进行分区重新分配（即 `Rebalance`）操作，在已启动的消费者之间重新平衡消费者与分区之间的关系，保证消费者之间负载均衡和容错性。

在 `Rebalance`
过程中，某个消费者可能会被重新分配新的分区，也有可能会释放掉已经分配的分区，这取决于当前消费者组内所有消费者的相对权重和分区的数量，以及消费者组内的 `partition.assignment.strategy`
配置等因素。

## 就是说消费者组内的消费者会在相同组内再分配？

是的，消费者组内的消费者会在重新分配分区的过程中再次进行分配。在 Kafka 中，每个消费者可以同时消费一个或多个分区的数据。当消费者启动时，它会与
Kafka 中的协调器（`Coordinator`）进行交互，以获取当前可消费的 Partition 信息，并分配给自己一定数量的 Partition 进行消费。

在消费者组中，每个消费者通过协调器获得了一部分 Partition
后就会开始进行消费。当新的消费者加入到消费者组中，或者已有的消费者退出消费组时，消费者组将发生分区再均衡的动作，即消费者组内的所有消费者将重新分配要消费的分区。

在分区再均衡的过程中，消费者组内的每个消费者和 Kafka 中的 `Coordinator` 协同工作，生成 `Rebalance` 方案，并根据该方案重新分配要消费的
Partition。最后，每个消费者都会被分配到一些新的 Partition 来消费。这样可以保证整个消费者组内的消费者和 Partition
之间始终保持着负载均衡的状态。

## 消费者的副本和生产者的副本是隔离的吗

是的，消费者的副本和生产者的副本是互相独立的。

在 Kafka 集群中，每个 Partition 都有一组副本。这些副本分散在不同的 Broker 上，用于保证数据的高可用性和可靠性。同时，Kafka
的副本机制也确保了数据的一致性，即所有的副本都具有相同的消息顺序和内容。

当一个消费者加入到消费者组中时，它会找到要消费的 Topic 的 Partitions，并从对应的 Leader Replica 中读取消息。这里的 Leader
Replica 是指某个 Partition 中负责将数据写入和读出的主副本。消费者只能从 Leader Replica 中读取消息，而不能从其他 Replica
中读取消息，因为其他 Replica 中的数据可能还未被同步到 Leader Replica 上，或者与 Leader Replica 的数据存在差异。

由于消费者和生产者之间没有共享的副本，所以在消费者消费消息的过程中，对已经被消费的消息进行修改或删除操作并不会影响到生产端，反之亦然。