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
import io.grpc.stub.AbstractBlockingStub;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.function.Function;

/**
 * @author OrionLi
 * @date 2023/6/17 20:40
 * @description GrpcConfig
 */
@Configuration
public class GrpcConfig {

    @Autowired
    private NacosDiscoveryProperties discoveryProperties;

    private ManagedChannel createManagedChannel(String serviceName) throws NacosException {
        // 获取指定服务的地址和端口
        NamingService namingService = NamingFactory.createNamingService(discoveryProperties.getServerAddr());
        Instance instance = namingService.selectOneHealthyInstance(serviceName);
        String address = instance.getIp();
        int port = getServiceGrpcPort(instance); // 获取 gRPC 端口号
        return ManagedChannelBuilder.forAddress(address, port).usePlaintext().build();
    }

    public <T extends AbstractBlockingStub<T>> T createBlockingStub(String serviceName,
                                                                    Function<ManagedChannel, T> stubFactory) throws NacosException {
        ManagedChannel managedChannel = createManagedChannel(serviceName);
        return stubFactory.apply(managedChannel);
    }

    @Bean
    public UserServiceGrpc.UserServiceBlockingStub userServiceGrpc() throws NacosException {
        return createBlockingStub("user-service", UserServiceGrpc::newBlockingStub);
    }

    // 获取 Service 的元数据中的 gRPC 端口号
    private int getServiceGrpcPort(Instance instance) {
        String grpcPort = instance.getMetadata().get("grpcPort");
        if (StringUtils.isEmpty(grpcPort)) {
            // 当元数据中不存在 grpcPort 时，抛出异常
            throw new RuntimeException("No grpcPort in service metadata.");
        }
        return Integer.parseInt(grpcPort);
    }

}
