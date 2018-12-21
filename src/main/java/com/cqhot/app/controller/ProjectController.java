package com.cqhot.app.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cqhot.app.entity.Organ;
import com.cqhot.app.entity.Project;
import com.cqhot.app.service.ProjectService;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

@RestController
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/project/findProByPage")
	public Result findProByPage(Model model,Project project,PageUtil page) {
		Map<String,Object> proMap = projectService.findProByPage(project,page);
		Result res = new Result();
		if(proMap!=null) {
			res.setData(proMap);
			res.setMessage("OK");
			res.setStatus(1);
		}
		return res;
	}
	
	@RequestMapping("/project/getAllGroup")
	public Result getAllGroup() {
		List<Organ> list = projectService.getAllGroup();
		Result res = new Result();
		if(list != null && list.size() >0) {
			res.setStatus(1);
			res.setMessage("OK");
			res.setData(list);
		}
		return res;
	}
	
	@RequestMapping("/project/updateValid")
	public Result updateValid(String prjId,String valid) {
		return projectService.updateValid(prjId, valid);
	}
	
	@RequestMapping("/project/addProject")
	public Result addProject(Project project) {
		return projectService.addProject(project);
	}
	
	@RequestMapping("/project/findProjectById")
	public Result findProjectById(String prjId) {
		return projectService.findProjectById(prjId);
	}
	
	@RequestMapping("/project/updateProject")
	public Result updateProject(Project project) {
		return projectService.updateProject(project);
	}
}
