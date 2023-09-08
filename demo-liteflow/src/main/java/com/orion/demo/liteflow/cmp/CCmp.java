package com.orion.demo.liteflow.cmp;

import com.yomahub.liteflow.annotation.LiteflowComponent;
import com.yomahub.liteflow.core.NodeComponent;

/**
 * @author OrionLi
 * <a href="https://liteflow.cc/pages/8486fb/">普通组件</a>
 */
@LiteflowComponent("c")
public class CCmp extends NodeComponent {

	@Override
	public void process() throws InterruptedException {
		Thread.sleep(1000);
		System.out.println("C!");
	}
}
