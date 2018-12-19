<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3>权限管理</h3>
			<ol class="breadcrumb">
			  <li>系统管理</li>
			  <li>用户权限</li>
			  <li class="active">权限管理</li>
			</ol>
		</div>
		<div class="page-stats"></div>
	</div>
		<div class="row page-search">
			<div class="col-md-12">
				<ul class="list-inline">
					<li>
						<button type="button" class="btn btn-success">新增权限组</button>
					</li>
					<li>
						<button type="button" class="btn btn-danger" name="btn_del" id="btn_del">删除</button>
					</li>
				</ul>
			</div>
		</div>
		<table data-toggle="table" style="margin-top:5px;" class="table table-bordered" id="roles_list">
			<thead>
				<tr>
					<th data-checkbox="true"></th>
					<th data-align="center" data-width="50">角色编号</th>
					<th data-align="center" >角色名称</th>
					<th data-align="center" >备注</th>
					<th data-align="center" >有效</th>
					<th data-align="center" >操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
					<td align="center"><a >1</a></td>
					<td align="center" >管理员</td>
					<td align="center" >管理员</td>
					<td align="center" >有效</td>
					<td align="center">
						<a >修改</a>
						<a >禁用 </a>
					</td>
				</tr>
				<tr>
					<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
					<td align="center"><a href="javascript:show_role_rights('2')">2</a></td>
					<td align="center" >项目经理</td>
					<td align="center" >负责启动项目</td>
					<td align="center" >有效</td>
					<td align="center">
						<a >修改</a>
						<a >禁用 </a>
					</td>
				</tr>
				<tr>
					<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
					<td align="center"><a href="javascript:show_role_rights('3')">3</a></td>
					<td align="center" >财务部</td>
					<td align="center" >财务审批</td>
					<td align="center" >有效</td>
					<td align="center">
						<a >修改</a>
						<a >禁用 </a>
					</td>
				</tr>
				<tr>
					<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
					<td align="center"><a href="javascript:show_role_rights('4')">4</a></td>
					<td align="center" >产品经理</td>
					<td align="center" >负责产品的的管理</td>
					<td align="center" >有效</td>
					<td align="center">
						<a >修改</a>
						<a >禁用 </a>
					</td>
				</tr>
				<tr>
					<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
					<td align="center"><a href="javascript:show_role_rights('6')">6</a></td>
					<td align="center" >产品信息专员</td>
					<td align="center" >负责产品信息整理以及上线</td>
					<td align="center" >有效</td>
					<td align="center">
						<a >修改</a>
						<a >禁用 </a>
					</td>
				</tr>
				<tr>
					<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
					<td align="center"><a href="javascript:show_role_rights('7')">7</a></td>
					<td align="center" >渠道运营经理</td>
					<td align="center" >渠道运营经理</td>
					<td align="center" >有效</td>
					<td align="center">
						<a >修改</a>
						<a >禁用 </a>
					</td>
				</tr>
				<tr>
					<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
					<td align="center"><a href="javascript:show_role_rights('8')">8</a></td>
					<td align="center" >渠道运营专员</td>
					<td align="center" >渠道运营专员</td>
					<td align="center" >有效</td>
					<td align="center">
						<a >修改</a>
						<a >禁用 </a>
					</td>
				</tr>
			</tbody>
		</table>
		<%@include file="../common/page.jsp" %>
	</div>