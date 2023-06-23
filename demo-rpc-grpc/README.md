# gRPC

# 快速开始

启动nacos

先启动 [`GrpcUserserviceApplication`](grpc-userservice/src/main/java/com/orion/demo/grpc/userservice/GrpcUserserviceApplication.java)
，再启动 [`GrpcApplication`](grpc-application/src/main/java/com/orion/demo/grpc/application/GrpcApplication.java)

浏览器访问 [`http://127.0.0.1:8080/demo/get?id=1`](http://127.0.0.1:8080/demo/get?id=1)，如果能看到一个随机生成的名字证明运行成功

浏览器访问 [`http://127.0.0.1:8080/demo/create?name=yudaoyuanma&gender=1`](http://127.0.0.1:8080/demo/create?name=yudaoyuanma&gender=1)
，如果能看到一个随机生成的id证明运行成功

# 介绍

没有用很多教程中的 第三方 grpc-starter，而是手动配置 grpc 客户端和服务端，方便学习

gRPC 服务端启动完成后，会将自己的 gRPC 地址添加到元数据，服务注册到 Nacos 时会携带这些元数据

gRPC 客户端会通过服务端注册到 Nacos 的名字(`spring.application.name`的值)从 Nacos 拿到对应的 gRPC服务端 地址，实现远程调用

客户端那边的配置已经尽可能的封装了。添加一个新的服务端只需要按这个格式新增一个 Bean 就行了

```java
@Bean
public UserServiceGrpc.UserServiceBlockingStub userServiceGrpc()throws NacosException{
        return createBlockingStub("user-service",UserServiceGrpc::newBlockingStub);
        }
```

# 官方文档传送门

## 关于 `NacosDiscovery` 的

[官方快速开始](https://github.com/alibaba/spring-cloud-alibaba/wiki/Nacos-discovery)
[通过Java SDK配置](https://nacos.io/zh-cn/docs/v2/guide/user/sdk.html)