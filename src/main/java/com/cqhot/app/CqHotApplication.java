package com.cqhot.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CqHotApplication {

	public static void main(String[] args) {
		SpringApplication.run(CqHotApplication.class, args);
	}
	
	public String login() {
		return "success:qaasdsaq";
	}

}

