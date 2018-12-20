package com.cqhot.app.controller;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cqhot.app.entity.User;
import com.cqhot.app.service.UserService;
import com.cqhot.app.vo.Result;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(HttpSession session,User user,HttpServletRequest request) {
		Result res= userService.findUserByUsername(session,user);
		if(res.getStatus() == 1) {
			return "index.jsp";
		}else {
			request.setAttribute("errorMsg", "用户名或密码错误");
			return "login.jsp";
		}
	}
}
