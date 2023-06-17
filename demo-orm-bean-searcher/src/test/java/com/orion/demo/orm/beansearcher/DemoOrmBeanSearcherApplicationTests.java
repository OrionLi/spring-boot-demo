package com.orion.demo.orm.beansearcher;

import cn.zhxu.bs.MapSearcher;
import com.orion.demo.orm.beansearcher.domain.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DemoOrmBeanSearcherApplicationTests {

    @Autowired
    private MapSearcher mapSearcher;

    @Test
    void contextLoads() {
        log.info("查询结果：{}", mapSearcher.searchAll(UserInfo.class));
    }

}
