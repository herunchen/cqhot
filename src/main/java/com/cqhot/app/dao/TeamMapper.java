package com.cqhot.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cqhot.app.entity.Team;
import com.cqhot.app.util.PageUtil;

public interface TeamMapper {
	List<Team> getTeamByPage(@Param("team") Team team,@Param("pageObj") PageUtil page);
	int getRowCounts(@Param("team") Team team);
}
