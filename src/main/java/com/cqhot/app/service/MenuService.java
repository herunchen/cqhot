package com.cqhot.app.service;

import java.util.List;

import com.cqhot.app.entity.Menu;

public interface MenuService {
	public List<Menu> getMenu(String parentId,String level);
}
