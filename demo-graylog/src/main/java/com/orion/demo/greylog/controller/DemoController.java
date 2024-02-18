package com.orion.demo.greylog.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author OrionLi
 */
@Slf4j
@RestController
public class DemoController {
    @GetMapping("/hello")
    public String hello() {
        // 每秒打印一次日志
        for (int i = 0; i < 10; i++) {
            log.error("Hello " + i);
        }
        return "over";
    }
}
