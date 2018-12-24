package com.cqhot.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cqhot.app.entity.Organ;
import com.cqhot.app.service.OrgService;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

@RestController
public class OrgController {
	
	@Autowired
	private OrgService orgService;
	
	@RequestMapping("/org/findOrg")
	public Result findOrg(Organ org,PageUtil page) {
		Map<String,Object> list =  orgService.findOrgByPage(org, page);
		Result res = new Result();
		if(list !=null ) {
			res.setStatus(1);
			res.setData(list);
		}
		return res;
	}
	
	@RequestMapping("/org/save")
	public Result addOrgan(Organ org) {
		return orgService.addOrgan(org);
	}
	
	@RequestMapping("/org/edit")
	public Result editOrgan(Organ org) {
		return orgService.editOrgan(org);
	}
	
	@RequestMapping("/org/getOrgById")
	public Result getOrganById(String id) {
		return orgService.getOrgById(id);
	}
}
