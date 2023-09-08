package com.orion.demo.liteflow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class DemoLiteflowApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(DemoLiteflowApplication.class, args);

        // 获取 YourClass 的 Bean
        YourClass yourClass = context.getBean(YourClass.class);

        // 调用 testConfig 方法
        yourClass.testConfig();
    }

}
