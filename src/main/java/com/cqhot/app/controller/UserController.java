package com.cqhot.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqhot.app.entity.User;

@Controller
public class UserController {
	
	@RequestMapping("/login")
	public String login(HttpSession session,User user) {
		return "index.jsp";
	}
}
