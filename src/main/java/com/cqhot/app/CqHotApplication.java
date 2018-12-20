package com.cqhot.app;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@MapperScan(basePackages= {"com.cqhot.app.dao"})
public class CqHotApplication {

	public static void main(String[] args) {
		SpringApplication.run(CqHotApplication.class, args);
	}
	
}

