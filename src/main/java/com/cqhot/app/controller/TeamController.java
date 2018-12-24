package com.cqhot.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cqhot.app.entity.Team;
import com.cqhot.app.service.TeamService;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

@RestController
public class TeamController {
	
	@Autowired
	private TeamService teamSerivce;
	
	@RequestMapping("/team/getTeam")
	public Result getTeam(Team team,PageUtil page) {
		return teamSerivce.getTeam(team, page);
	}
}
