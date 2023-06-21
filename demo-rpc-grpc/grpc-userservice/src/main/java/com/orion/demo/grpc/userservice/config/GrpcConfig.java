package com.orion.demo.grpc.userservice.config;

import com.alibaba.cloud.nacos.NacosDiscoveryProperties;
import com.orion.demo.grpc.userservice.rpc.UserServiceGrpcImpl;
import io.grpc.Server;
import io.grpc.ServerBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author OrionLi
 * @date 2023/6/17 20:42
 * @description
 */
@Configuration
public class GrpcConfig {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private NacosDiscoveryProperties discoveryProperties;

    @Bean
    public Server grpcServer(final UserServiceGrpcImpl userServiceGrpc) throws IOException {
        // 创建 gRPC Server 对象
        Server server = ServerBuilder
                // gRPC Server 随机端口
                .forPort(0)
                .addService(userServiceGrpc)
                .build();
        // 启动 gRPC Server
        server.start();
        logger.info("[grpcServer][启动完成，端口为({})]", server.getPort());
        Map<String, String> metadata = new HashMap<>();
        metadata.put("grpcPort", String.valueOf(server.getPort()));
        discoveryProperties.setMetadata(metadata);
        return server;
    }

}
