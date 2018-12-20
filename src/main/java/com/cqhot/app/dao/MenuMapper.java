package com.cqhot.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cqhot.app.entity.Menu;

public interface MenuMapper {
	
	public List<Menu> getMenu(@Param("parentId") String parentId,@Param("level") String level);
	
}
