package com.thsrc.myapp;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MyAppApplicationTests {

	@Autowired
	private HelloCtrl helloCtrl;

	@Test
	void contextLoads() {
		Assert.assertEquals("Hello Jenkins", helloCtrl.sayHello());
	}

}
