package com.cqhot.app.service;

import java.util.Map;

import com.cqhot.app.entity.Organ;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

public interface OrgService {
	public Map<String,Object> findOrgByPage(Organ org,PageUtil page);
	
	public Result addOrgan(Organ org);
	
	public Result editOrgan(Organ org);
	
	public Result getOrgById(String id);
}
