<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="container_sub">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3>渠道商列表</h3>
		</div>
	</div>
		<div class="row page-search">
			<div class="col-md-12">
				<ul class="list-inline">
					<li><input type="text" class="form-control isNumber"
						placeholder="编号" name="id">
					<li><input type="text" class="form-control" placeholder="名称"
						name="name"></li>
					<li><select name="valid" class="form-control">
							<option value="1">有效</option>
							<option value="0">无效</option>
					</select></li>
					<li>
						<button class="btn btn-primary O1" data-func="searchSupplier">查询</button>
					</li>

					<li>
						<button class="btn btn-success O2 btn_add">新增</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered" style="width:100%;margin-top:5px;">
					<thead>
						<tr>
							<th data-field="0" tabindex="0">
								<div class="th-inner ">编号</div>
							</th>
							<th data-field="1" tabindex="0">
								<div class="th-inner ">类别</div>
							</th>
							<th data-field="2" tabindex="0">
								<div class="th-inner ">名称</div>
							</th>
							<th data-field="3" tabindex="0">
								<div class="th-inner ">账期</div>
							</th>
							<th data-field="4" tabindex="0">
								<div class="th-inner ">国家地区</div>
							</th>
							<th data-field="5" tabindex="0">
								<div class="th-inner ">省份</div>
							</th>
							<th data-field="6" tabindex="0">
								<div class="th-inner ">城市</div>
							</th>
							<th data-field="7" tabindex="0">
								<div class="th-inner ">有效</div>
							</th>
							<th style="text-align: center; width: 120px;" data-field="8"
								tabindex="0">
								<div class="th-inner ">操作</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr data-index="0">
							<td>13</td>
							<td>信息传输、软件和信息技术服务业</td>
							<td><a>携程旅游公司</a></td>
							<td>月结</td>
							<td>中国</td>
							<td>北京</td>
							<td>朝阳区</td>
							<td>有效</td>
							<td style="text-align: center; width: 120px;">
								<a>修改</a>&nbsp;&nbsp;
								<a>禁用 </a></td>
						</tr>
						<tr data-index="1">
							<td>14</td>
							<td>信息传输、软件和信息技术服务业</td>
							<td><a>去哪儿网有限公司</a></td>
							<td>月结</td>
							<td>中国</td>
							<td>北京</td>
							<td>朝阳区</td>
							<td>有效</td>
							<td style="text-align: center; width: 120px;">
								<a class="O3">修改</a>&nbsp;&nbsp; 
								<a class="O3"> 禁用 </a></td>
						</tr>
						<tr data-index="2">
							<td>15</td>
							<td>信息传输、软件和信息技术服务业</td>
							<td><a>驴妈妈网有限公司</a></td>
							<td>月结</td>
							<td>中国</td>
							<td>北京</td>
							<td>朝阳区</td>
							<td>有效</td>
							<td style="text-align: center; width: 120px;">
								<a  class="O3">修改</a>&nbsp;&nbsp;
								<a  class="O3"> 禁用 </a></td>
						</tr>
					</tbody>
				</table>
				<nav class="pull-right" id="pagination">
					<ul class="pagination">
						<!-- 当前页/共多少页 -->
						<li style="padding:6px 12px;border:1px solid transparent;float:left">
							<strong id="currentPage">1/2</strong>页
						</li>
						<!-- 总记录数 -->
						<li style="padding:6px 12px 6px 0px;border:1px solid transparent;float:left">
							<strong id="totalCount">11</strong>条记录
						</li>
						<!-- 生成首页，上一页，下一页，尾页 -->
						<li style="display: none;"><a class="firstPage">首页</a></li>
						<li style="display: none;"><a title="上一页" class="upperPage">«</a></li>
						<li><a title="下一页" class="nextPage">»</a></li>
						<li><a class="lastPage">尾页</a></li>
						<!-- 生成跳转页面文本框 -->
						<li><a style="padding:0px">
							<input type="number" id="pageSelect" name="pageSelect" class="form-control" style="width:60px;margin:0px;border:none;height:30px">
						</a></li>
						<li><a class="jump">跳转</a></li>
					</ul>
				</nav>
			</div>
		</div>
</div>
<c:url var="url" value="/js/channel/channelerManageList.js"></c:url>
<script type="text/javascript" src="${url }"></script>