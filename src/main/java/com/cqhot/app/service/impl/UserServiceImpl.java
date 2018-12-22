package com.cqhot.app.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqhot.app.dao.UserMapper;
import com.cqhot.app.entity.User;
import com.cqhot.app.service.UserService;
import com.cqhot.app.util.SendSMSUtil;
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
			String mess = "尊敬的用户:"+u.getName()+"登录成功,不是本人操作请联系管理员";
			SendSMSUtil.sendMessage("15178701739", mess);
		}
		return res;
	}

}
