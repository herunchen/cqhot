package com.cqhot.app.controller;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cqhot.app.entity.User;
import com.cqhot.app.service.UserService;
import com.cqhot.app.util.Md5Util;
import com.cqhot.app.vo.Result;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user/login")
	public String login(HttpSession session,User user,HttpServletRequest request) {
		//普通登录
		//Result res= userService.findUserByUsername(session,user);
		try {
			user.setPassword(Md5Util.getMd5(user.getPassword(),"user"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//shiro登录
		Result res = userService.loginByShiro(session,user);
		if(res.getStatus() == 1) {
			return "index";
		}else {
			request.setAttribute("errorMsg", "用户名或密码错误");
			return "login";
		}
	}
}
