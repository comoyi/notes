# ActiveMQ

## 生产消息

```bash
activemq producer --brokerUrl tcp://127.0.0.1:61616 --messageCount 1 --destination queue://queue_name --message 'message'
```

## 消费消息

```bash
activemq consumer --brokerUrl tcp://127.0.0.1:61616 --messageCount 10 --destination queue://queue_name
```

## 查看队列消息

```bash
activemq browse --amqurl tcp://127.0.0.1:61616 queue_name
```
