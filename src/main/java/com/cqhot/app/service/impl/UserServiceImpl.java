package com.cqhot.app.service.impl;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqhot.app.dao.UserMapper;
import com.cqhot.app.entity.User;
import com.cqhot.app.service.UserService;
import com.cqhot.app.vo.Result;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public Result findUserByUsername(HttpSession session ,User user) {
		User u = userMapper.selectUserByName(user);
		Result res = new Result();
		if(u != null) {
			res.setStatus(1);
			res.setMessage("登录成功!");
			session.setAttribute("user", u);
		}
		return res;
	}

	@Override
	public Result loginByShiro(HttpSession session, User user) {
		Result res = new Result();
		//Shiro的登陆操作   获取用户对象
		Subject subject = SecurityUtils.getSubject();
		//将用户的数据封装为令牌(票)
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
		try {
			//通过用户实现登陆 
			subject.login(token); 
			//获取真实的用户对象
			User u = (User) subject.getPrincipal();
			subject.getSession().setAttribute("user", u);
			//证明用户名和密码正确
			res.setStatus(1);
			res.setMessage("登录成功!");
			//发送短信
			String mess = "尊敬的用户:"+u.getName()+"登录成功,不是本人操作请联系管理员";
			//SendSMSUtil.sendMessage("15178701739", mess);
		} catch (Exception e) {
			//打印异常信息
			e.printStackTrace();  
			//证明用户名和密码错误
			res.setStatus(0);
			res.setMessage("登录失败!");
		}
		return res;
	}

}
