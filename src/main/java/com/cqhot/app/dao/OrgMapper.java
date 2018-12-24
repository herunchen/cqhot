package com.cqhot.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cqhot.app.entity.Organ;
import com.cqhot.app.util.PageUtil;

public interface OrgMapper {
	
	int getTotPage(@Param(value="org") Organ org);
	
	List<Organ> findProByPage(@Param(value = "org") Organ org,@Param(value = "page") PageUtil page);
	
	int addOrgan(@Param("org") Organ org);
	
	int editOrgan(@Param("org") Organ org);
	
	Organ getOrgById(@Param("id") String id);
}
