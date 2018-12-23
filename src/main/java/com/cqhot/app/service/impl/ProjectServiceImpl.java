package com.cqhot.app.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
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
	
	@Autowired
	private RedisTemplate<Object, Object> redisTemplate;
	
	@Override
	public Map<String, Object> findProByPage(Project project,PageUtil page) {
		//查询总数
		int rowCounts = projectMapper.getTotPage(project);
		
		List<Project> list = null;
		
		//设置key的序列化方式,采用字符串方式,可读性好
		this.redisTemplate.setKeySerializer(new StringRedisSerializer());
		//先从redis缓存中查询是否有指定key的缓存数据
		list=(List<Project>)redisTemplate.opsForValue().get("allPro");
		//双重检测,双重校验锁
		if(list == null || list.size() == 0) {
			synchronized (this) {
				//从redis获取数据
				list =  (List<Project>) redisTemplate.opsForValue().get("allPro");
				//说明redis指定key的缓存数据不存在
				if(list == null) {
					//去数据库查询
					list = projectMapper.findProByPage(project, page);
					//将数据库查询出的数据放入redis缓存中
					redisTemplate.opsForValue().set("allPro",list);
				}else {
					System.out.println("查询缓存");
				}
			}
		}else {
			System.out.println("查询缓存");
		}
		
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
