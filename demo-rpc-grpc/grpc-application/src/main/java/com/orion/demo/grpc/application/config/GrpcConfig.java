package com.orion.demo.grpc.application.config;

import com.alibaba.cloud.commons.lang.StringUtils;
import com.alibaba.cloud.nacos.NacosDiscoveryProperties;
import com.alibaba.nacos.api.exception.NacosException;
import com.alibaba.nacos.api.naming.NamingFactory;
import com.alibaba.nacos.api.naming.NamingService;
import com.alibaba.nacos.api.naming.pojo.Instance;
import com.orion.demo.grpc.userservice.api.UserServiceGrpc;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class GrpcConfig {

    @Autowired
    private NacosDiscoveryProperties discoveryProperties;

    @Bean
    public ManagedChannel userGrpcManagedChannel() throws NacosException {
        // 获取 user-service 服务的地址和端口
        NamingService namingService = NamingFactory.createNamingService(discoveryProperties.getServerAddr());
        Instance instance = namingService.selectOneHealthyInstance("user-service");
        String address = instance.getIp();
        int port = this.getUserServiceGrpcPort(instance); // 获取 gRPC 端口号
        return ManagedChannelBuilder.forAddress(address, port).usePlaintext().build();
    }

    @Bean
    public UserServiceGrpc.UserServiceBlockingStub userServiceGrpc() throws NacosException {
        // 创建 ManagedChannel 对象
        ManagedChannel userGrpcManagedChannel = this.userGrpcManagedChannel();
        // 创建 UserServiceGrpc 对象
        return UserServiceGrpc.newBlockingStub(userGrpcManagedChannel);
    }

    // 获取 UserService 的元数据中的 gRPC 端口号
    private int getUserServiceGrpcPort(Instance instance) {
        String grpcPort = instance.getMetadata().get("grpcPort");
        if (StringUtils.isEmpty(grpcPort)) {
            // 当元数据中不存在 grpcPort 时，抛出异常
            throw new RuntimeException("No grpcPort in user-service metadata.");
        }
        return Integer.parseInt(grpcPort);
    }

}
