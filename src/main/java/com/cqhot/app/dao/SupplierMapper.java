package com.cqhot.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cqhot.app.entity.Supplier;
import com.cqhot.app.util.PageUtil;

public interface SupplierMapper {
	
	int getTotPage(@Param(value="supplier") Supplier supplier);
	
	List<Supplier> findSupByPage(@Param(value = "supplier") Supplier supplier,@Param(value = "page") PageUtil page);
		
	int updateValid(@Param("compId") String compId,@Param("valid") String valid);

}
