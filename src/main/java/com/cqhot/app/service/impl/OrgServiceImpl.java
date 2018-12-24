package com.cqhot.app.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqhot.app.dao.OrgMapper;
import com.cqhot.app.entity.Organ;
import com.cqhot.app.service.OrgService;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

@Service("orgService")
public class OrgServiceImpl implements OrgService{
	
	@Autowired
	private OrgMapper orgMapper;

	@Override
	public Map<String,Object> findOrgByPage(Organ org, PageUtil page) {
		Map<String,Object> map = new HashMap<>();
		int tolPage = orgMapper.getTotPage(org);
		List<Organ> list = orgMapper.findProByPage(org, page);
		page.setRowCount(tolPage);
		map.put("list", list);
		map.put("pageObj", page);
		return map;
	}

	@Override
	public Result addOrgan(Organ org) {
		int row = orgMapper.addOrgan(org);
		Result res = new Result();
		if(row == 1) {
			res.setStatus(1);
			res.setMessage("OK");
		}else {
			res.setStatus(0);
		}
		return res;
	}

	@Override
	public Result editOrgan(Organ org) {
		Result res =new Result();
		int row = orgMapper.editOrgan(org);
		if(row == 1) {
			res.setStatus(1);
			res.setMessage("OK");
		}else {
			res.setStatus(0);
		}
		return res;
	}

	@Override
	public Result getOrgById(String id) {
		Organ org = orgMapper.getOrgById(id);
		Result res = new Result();
		if(org!=null) {
			res.setStatus(1);
			res.setData(org);
		}
		return res;
	}

}
