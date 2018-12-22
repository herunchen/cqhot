package com.cqhot.app.service;

import java.util.List;
import java.util.Map;

import com.cqhot.app.entity.Organ;
import com.cqhot.app.entity.Project;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

public interface ProjectService {
	
	public Map<String,Object> findProByPage(Project project,PageUtil page);
	
	public List<Organ> getAllGroup();
	
	public Result updateValid(String prjId,String valid);
	
	public Result addProject(Project project);
	
	public Result findProjectById(String id);
	
	public Result updateProject(Project project);
	
	public Result proImpot(List<Project> data);
}
