package com.cqhot.app.service;

import javax.servlet.http.HttpSession;

import com.cqhot.app.entity.User;
import com.cqhot.app.vo.Result;

public interface UserService {
	public Result findUserByUsername(HttpSession session ,User user);
}
