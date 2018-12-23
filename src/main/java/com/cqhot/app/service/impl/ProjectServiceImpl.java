package com.cqhot.app.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.amqp.core.AmqpTemplate;
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
	
	@Autowired
	private AmqpTemplate amqpTemplate;
	
	@Override
	public Map<String, Object> findProByPage(Project project,PageUtil page) {
		//查询总数
		int rowCounts = projectMapper.getTotPage(project);
		//分页查询project对象 返回list
		List<Map<String,Object>> list = projectMapper.findProByPage(project, page);
		//将list对象放入mq队列
		amqpTemplate.convertAndSend("directExchange","qu01",list);
		//给page对象设值
		page.setRowCount(rowCounts);
		//设置返回结果集
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

	@Override
	public Result proImpot(List<Project> data) {
		int row = projectMapper.proImport(data);
		Result res = new Result();
		if(row>0) {
			res.setStatus(1);
			res.setMessage("导入成功");
		}
		return res;
	}

}
