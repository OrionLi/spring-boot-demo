package com.orion.demo.grpc.application;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author OrionLi
 * @date 2023/6/22 23:05
 * @description
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface GrpcService {
    String serviceName();
}