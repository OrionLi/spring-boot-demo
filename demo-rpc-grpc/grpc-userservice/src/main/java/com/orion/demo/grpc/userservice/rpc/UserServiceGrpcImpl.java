package com.orion.demo.grpc.userservice.rpc;

import com.github.javafaker.Faker;
import com.orion.demo.grpc.userservice.api.*;
import io.grpc.stub.StreamObserver;
import org.springframework.stereotype.Service;

/**
 * @author OrionLi
 * @date 2023/6/17 20:42
 * @description
 */
@Service
public class UserServiceGrpcImpl extends UserServiceGrpc.UserServiceImplBase {

    static final Faker FAKER = new Faker();

    @Override
    public void get(UserGetRequest request, StreamObserver<UserGetResponse> responseObserver) {
        // 创建响应对象
        UserGetResponse.Builder builder = UserGetResponse.newBuilder();
        builder.setId(request.getId())
                .setName("姓名：" + FAKER.name().name())
                .setGender(request.getId() % 2 + 1);
        // 返回响应
        responseObserver.onNext(builder.build());
        responseObserver.onCompleted();
    }

    @Override
    public void create(UserCreateRequest request, StreamObserver<UserCreateResponse> responseObserver) {
        // 创建响应对象
        UserCreateResponse.Builder builder = UserCreateResponse.newBuilder();
        builder.setId((int) (System.currentTimeMillis() / 1000));
        // 返回响应
        responseObserver.onNext(builder.build());
        responseObserver.onCompleted();
    }

}
