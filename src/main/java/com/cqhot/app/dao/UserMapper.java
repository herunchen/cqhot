package com.cqhot.app.dao;

import org.apache.ibatis.annotations.Param;

import com.cqhot.app.entity.User;

public interface UserMapper {
	public User selectUserByName(User user);
	
	public User shiroLogin(@Param("username") String username);
}
