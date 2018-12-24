package com.cqhot.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cqhot.app.entity.Supplier;
import com.cqhot.app.service.SupplierService;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

@RestController
public class SupplierController {
	
	@Autowired
	private SupplierService supplierService;
	
	@RequestMapping("/supplier/findSupByPage")
	public Result findsupByPage(Model model,Supplier s,PageUtil page) {
		Map<String,Object> supMap = supplierService.findSupByPage(s,page);
		Result res = new Result();
		if(supMap!=null) {
			res.setData(supMap);
			res.setMessage("OK");
			res.setStatus(1);
		}
		return res;
	}
	
	
	@RequestMapping("/supplier/updateValid")
	public Result updateValid(String prjId,String valid) {
		return supplierService.updateValid(prjId, valid);
	}
	
}
