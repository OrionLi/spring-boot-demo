package com.orion.demo.liteflow.cmp;

import com.yomahub.liteflow.annotation.LiteflowComponent;
import com.yomahub.liteflow.core.NodeComponent;

/**
 * @author OrionLi
 * <a href="https://liteflow.cc/pages/8486fb/">普通组件</a>
 */
@LiteflowComponent("b")
public class BCmp extends NodeComponent {

	@Override
	public void process() {
		System.out.println("B!");
	}
}
