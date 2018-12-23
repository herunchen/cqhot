package com.cqhot.app.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cqhot.app.entity.Organ;
import com.cqhot.app.entity.Project;
import com.cqhot.app.util.PageUtil;

public interface ProjectMapper {
	
	int getTotPage(@Param(value="project") Project project);
	
	List<Project> findProByPage(@Param(value = "project") Project project,@Param(value = "page") PageUtil page);
	
	List<Organ> getAllGroup();
	
	int updateValid(@Param("prjId") String prjId,@Param("valid") String valid);
	
	int addProject(@Param("project") Project project);
	
	Project findProjectById(@Param("id") String id);
	
	int updateProject(@Param("p") Project project);
	
	int proImport(@Param("data") List<Project> data);
}
