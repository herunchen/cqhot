package com.cqhot.app.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqhot.app.dao.ProjectMapper;
import com.cqhot.app.entity.Organ;
import com.cqhot.app.entity.Project;
import com.cqhot.app.service.ProjectService;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectMapper projectMapper;
	
	@Override
	public Map<String, Object> findProByPage(Project project,PageUtil page) {
		int rowCounts = projectMapper.getTotPage(project);
		List<Map<String,Object>> list = projectMapper.findProByPage(project, page);
		page.setRowCount(rowCounts);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageObj", page);
		return map;
	}

	@Override
	public List<Organ> getAllGroup() {
		return projectMapper.getAllGroup();
	}

	@Override
	public Result updateValid(String prjId, String valid) {
		int row = projectMapper.updateValid(prjId, valid);
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

	@Override
	public Result addProject(Project project) {
		int row = projectMapper.addProject(project);
		Result res = new Result();
		if(row == 1) {
			res.setStatus(1);
			res.setMessage("添加成功");
		}else {
			res.setStatus(0);
			res.setMessage("系统异常");
		}
		return res;
	}

	@Override
	public Result findProjectById(String id) {
		Project project = projectMapper.findProjectById(id);
		Result res = new Result();
		if(project!=null) {
			res.setStatus(1);
			res.setMessage("OK");
			res.setData(project);
		}else {
			res.setStatus(0);
			res.setMessage("服务器异常");
		}
		return res;
	}

	@Override
	public Result updateProject(Project project) {
		int row = projectMapper.updateProject(project);
		Result res = new Result();
		if(row == 1) {
			res.setStatus(1);
			res.setMessage("修改成功");
		}else {
			res.setStatus(0);
			res.setMessage("服务器异常");
		}
		return res;
	}

}
