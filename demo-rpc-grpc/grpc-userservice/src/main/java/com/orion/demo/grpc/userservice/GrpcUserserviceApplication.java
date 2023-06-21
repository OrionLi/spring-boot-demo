package com.orion.demo.grpc.userservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author OrionLi
 * @date 2023/6/17 20:42
 * @description
 */
@SpringBootApplication
public class GrpcUserserviceApplication {

    public static void main(String[] args) throws InterruptedException {
        // 启动 Spring Boot 应用
        SpringApplication.run(GrpcUserserviceApplication.class, args);
    }

}
