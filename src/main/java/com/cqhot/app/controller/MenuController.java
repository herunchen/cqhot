package com.cqhot.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cqhot.app.entity.Menu;
import com.cqhot.app.service.MenuService;

@RestController
public class MenuController {
	
	@Autowired
	private MenuService menuservice;
	
	@RequestMapping("/getMenu")
	public List<Menu> getMenu(String parentId,String level) {
		return menuservice.getMenu(parentId,level);
	}
}
