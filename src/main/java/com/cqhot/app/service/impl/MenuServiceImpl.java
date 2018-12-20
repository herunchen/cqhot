package com.cqhot.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqhot.app.dao.MenuMapper;
import com.cqhot.app.entity.Menu;
import com.cqhot.app.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public List<Menu> getMenu(String parentId,String level) {
		List<Menu> menuList = null;
		menuList = menuMapper.getMenu(parentId, level);
		return menuList;
	}
	
}
