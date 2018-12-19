<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="container" id="container_sub">
		<div class="page-header">
			<div class="page-title" style="padding-bottom: 5px">
				<h3>项目信息管理</h3>
				<ol class="breadcrumb">
				  <li>产品管理</li>
				  <li>项目</li>
				  <li class="active">项目信息管理</li>
				</ol>
			</div>
			<div class="page-stats"></div>
		</div>
		<form method="post"  id="projectQueryForm">
			<div class="row page-search">
				<div class="col-md-12" >
					<ul class="list-unstyled list-inline"  id="queryFormId">
						<li><input type="text" id="prjId" class="form-control"   placeholder="项目编号" ></li>
						<li><input type="text" id="prjName" class="form-control" placeholder="项目名称"></li>
						<li><select id="deptId" class="form-control name">
								<option value="">选择归属部门</option>
						</select></li>
                    <li><input id="beginDateId" type="text"  class="form-control datepicker dateISO required compareDate " placeholder="起始日期"></li>
					<li>~</li>
					<li><input type="text" id="endDateId"  class="form-control datepicker dateISO required compareDate "  placeholder="截止日期"></li>
						<li><select name="valid" id="valid" class="form-control">
								<option value="">选择状态</option>
								<option value="1" >启用</option>
								<option value="0" >禁用</option>
						</select></li>
						<li class='O1'><button type="button" class="btn btn-primary btn_search" >查询</button></li>
						<li class='O2'><button type="button" class="btn btn-primary btn_add">新增</button></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table data-toggle="table"
						class="table table-bordered" id="projectList">
						<thead>
							<tr>
								<th data-align="center" data-width="100px">项目编号</th>
								<th data-align="center" data-width="150px">项目名称</th>
								<th data-align="center">归属部门</th>
								<th data-align="center">开始日期</th>
								<th data-align="center">结束日期</th>
								<th data-align="center">状态</th>
								<th data-align="center">备注</th>
								<th data-align="center" data-width="120" colspan="3">操作</th>
							</tr>
						</thead>
						<tbody id="projectBody">
						  <!-- 这的内容需要动态获取 -->
						</tbody>
					</table>
                    <%@include file="../common/page.jsp" %>
				</div>
			</div>
		</form>
	</div>
	
	
<script type="text/javascript">
initUiComponment(); 
</script> 
<c:url var="url" value="/js/project/project_list.js"></c:url>
<script type="text/javascript" src="${url}"></script>
