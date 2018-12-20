package com.cqhot.app.dao;

import com.cqhot.app.entity.User;

public interface UserMapper {
	public User selectUserByName(User user);
}
