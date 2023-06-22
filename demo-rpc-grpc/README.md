# gRPC

启动nacos

先启动 [`GrpcUserserviceApplication`](grpc-userservice/src/main/java/com/orion/demo/grpc/userservice/GrpcUserserviceApplication.java)
，再启动 [`GrpcApplication`](grpc-application/src/main/java/com/orion/demo/grpc/application/GrpcApplication.java)

浏览器访问 [`http://127.0.0.1:8080/demo/get?id=1`](http://127.0.0.1:8080/demo/get?id=1)，如果能看到一个随机生成的名字证明运行成功

浏览器访问 [`http://127.0.0.1:8080/demo/create?name=yudaoyuanma&gender=1`](http://127.0.0.1:8080/demo/create?name=yudaoyuanma&gender=1)
，如果能看到一个随机生成的id证明运行成功
