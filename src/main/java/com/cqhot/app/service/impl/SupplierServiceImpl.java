package com.cqhot.app.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqhot.app.dao.SupplierMapper;
import com.cqhot.app.entity.Supplier;
import com.cqhot.app.service.SupplierService;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService{
	
	@Autowired
	private SupplierMapper supplierMapper;
	
	@Override
	public Map<String, Object> findSupByPage(Supplier s, PageUtil page) {
		int totPage = supplierMapper.getTotPage(s);
		List<Supplier> list = supplierMapper.findSupByPage(s, page);
		page.setRowCount(totPage);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pageObj", page);
		return map;
	}


	@Override
	public Result updateValid(String compId, String valid) {
		int row = supplierMapper.updateValid(compId, valid);
		Result res = new Result();
		if(row == 1) {
			res.setStatus(1);
			res.setMessage("修改成功");
		}else {
			res.setStatus(0);
			res.setMessage("系统异常");
		}
		return res;
	}

}
