package com.cqhot.app.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqhot.app.dao.TeamMapper;
import com.cqhot.app.entity.Team;
import com.cqhot.app.service.TeamService;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

@Service("teamService")
public class TeamServiceImpl implements TeamService{
	
	@Autowired
	private TeamMapper teamMapper;
	
	@Override
	public Result getTeam(Team team, PageUtil page) {
		int rowCount = teamMapper.getRowCounts(team);
		List<Team> list = teamMapper.getTeamByPage(team, page);
		page.setRowCount(rowCount);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pageObj", page);
		Result res = new Result();
		if(list != null) {
			res.setStatus(1);
			res.setData(map);
		}else {
			res.setStatus(0);
			res.setMessage("出错了");
		}
		return res;
	}

}
