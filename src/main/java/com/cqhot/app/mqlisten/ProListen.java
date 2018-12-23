package com.cqhot.app.mqlisten;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
public class ProListen {
	
	@RabbitListener(queues="qu01")
	public void process(Message msg) {
		System.out.println("进入mq消费方法");
		
	}
}
