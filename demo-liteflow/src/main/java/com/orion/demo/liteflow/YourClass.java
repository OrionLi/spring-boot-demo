package com.orion.demo.liteflow;

import com.yomahub.liteflow.core.FlowExecutor;
import com.yomahub.liteflow.flow.LiteflowResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * @author OrionLi
 * <a href="https://liteflow.cc/pages/501abf/">数据上下文的定义和使用</a>
 */
@Component
public class YourClass {

    @Resource
    private FlowExecutor flowExecutor;

    public void testConfig() {
        LiteflowResponse response = flowExecutor.execute2Resp("chain1");
    }
}
