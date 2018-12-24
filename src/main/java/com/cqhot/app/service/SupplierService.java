package com.cqhot.app.service;

import java.util.Map;

import com.cqhot.app.entity.Supplier;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

public interface SupplierService {
	
	public Map<String,Object> findSupByPage(Supplier s,PageUtil page);
	
	public Result updateValid(String compId,String valid);
	
}
