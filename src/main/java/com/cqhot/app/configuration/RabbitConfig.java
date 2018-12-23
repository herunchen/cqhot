package com.cqhot.app.configuration;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class RabbitConfig {
	
	
	//声明队列queue
	@Bean(name="qu01")
	public Queue queue01() {
		Queue queue = new Queue("qu01",false);
		return queue;
	}
	
	//声明交换机(直接型交换机)
	@Bean
	public DirectExchange ex() {
		DirectExchange directExchange = new DirectExchange("directExchange");
		return directExchange;
	}
	
	//声明绑定关系
	@Bean
	public Binding bind(@Qualifier("qu01") Queue queue01,
						@Qualifier("ex") DirectExchange de) {
		
		return BindingBuilder.bind(queue01).to(de).with("qu01");
	}
}
