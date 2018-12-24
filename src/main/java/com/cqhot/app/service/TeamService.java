package com.cqhot.app.service;

import com.cqhot.app.entity.Team;
import com.cqhot.app.util.PageUtil;
import com.cqhot.app.vo.Result;

public interface TeamService {
	public Result getTeam(Team team,PageUtil page);
}
