<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
	<div class="container" id="container_sub">
		<div class="page-header">
			<div class="page-title" style="padding-bottom: 5px">
				<h3>组织结构管理</h3>
				<ol class="breadcrumb">
				  <li>机构管理</li>
				  <li class="active">组织机构信息管理</li>
				</ol>
			</div>
			<div class="page-stats"></div>
		</div>
		<form method="post"  id="orgQueryForm">
			<div class="row page-search">
				<div class="col-md-12" >
					<ul class="list-unstyled list-inline"  id="queryFormId">
						<li><input type="text" id="orgName" class="form-control" placeholder="机构名称"></li>
						<li>
						<select id="valid" class="form-control">
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
						class="table table-bordered" id="objectList">
						<thead>
							<tr>
								<th data-align="center" data-width="150px">机构ID</th>
								<th data-align="center" data-width="150px">机构名称</th>
								<th data-align="center" data-width="150px">机构编码</th>
								<th data-align="center">状态</th>
								<th data-align="center">备注</th>
								<th data-align="center" data-width="120px" colspan="2">操作</th>
							</tr>
						</thead>
						<tbody id="objectBody">
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
//调用 /assets/js/demo/ui_general.js 提供的初始化界面组件方法
</script> 
<c:url var="url" value="/js/system/org_list.js"></c:url>
<script type="text/javascript" src="${url}"></script>
