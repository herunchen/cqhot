<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
li{
	margin-top:5px;
}
</style>
<div class="container">
	<div class="page-header">
		<div class="page-title">
			<h3>导游信息管理</h3>
		<ol class="breadcrumb">
			  <li>资源管理</li>
			  <li>旅游资源</li>
			  <li class="active">导游信息管理</li>
			</ol>
		</div>
	</div>
	<form method="post" name="guideInfoListForm" id="guideInfoListForm">
		<div class="row page-search">
			<div class="col-md-12">
				<ul class="list-inline">
					<li><input type="text" class="form-control" placeholder="编号" name="guideId" id="guideId"></li>
					<li><input type="text" class="form-control" placeholder="姓名" name="name" id="name"></li>
					<li><select name="gender" id="gender" class="form-control">
						<option value="">性别</option>
						<option value="M">男</option>
						<option value="F">女</option>
					</select></li>
					<li><input type="text" class="form-control" placeholder="联系方式" name="contract" id="contract"></li>
					<li><input type="text" class="form-control" placeholder="语种" name="language" id="language"></li>
					<li><input type="text" class="form-control" placeholder="国家" name="serveCountry" id="serveCountry"></li>
					<li><select name="valid" id="valid" class="form-control">
							<option value="">请选择</option>
							<option value="1">有效</option>
							<option value="0">无效</option>
					</select></li>
					<li>
						<button class="btn btn-primary O1" type="button" name="btn_search" id="btn_search">查询</button>
					</li>
					<li>
						<button class="btn btn-success O2" type="button" id="btn_add">新增</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" id="listdiv">
				<table class="table table-bordered" style="width:100%;margin-top:5px;" id="guideTable">
					<thead>
						<tr>
							<th style="width: 10%;">编号</th>
							<th style="width: 8%;">姓名</th>
							<th style="width: 12%;">英文名</th>
							<th style="width: 5%;">性别</th>
							<th style="width: 31%">联系方式</th>
							<th style="width: 5%;">语种</th>
							<th style="width: 7%">服务国家</th>
							<th style="width: 5%">有效</th>
							<th style="width: 17%">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>TG20170125001</td>
							<td><a class="selectGuideInfoByName">王毅</a></td>
							<td>WANGYI</td>
							<td>男</td>
							<td>电话:18615588614</td>
							<td>中文</td>
							<td>中国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
						</tr>
						<tr>
							<td>TG20170208001</td>
							<td><a class="selectGuideInfoByName">刘小红</a></td>
							<td>LIU XIAOHONG</td>
							<td>女</td>
							<td>手机号:13242526362</td>
							<td>汉语</td>
							<td>中国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
						</tr>
						<tr>
							<td>TG20170317001</td>
							<td><a class="selectGuideInfoByName">张丽</a></td>
							<td>Lili</td>
							<td>女</td>
							<td>手机号:13242526362</td>
							<td>中文</td>
							<td>中国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
						</tr>
						<tr>
							<td>TG20170421001</td>
							<td><a class="selectGuideInfoByName">陈家乐</a></td>
							<td>Carler</td>
							<td>女</td>
							<td>联系方式1:18567890987,联系方式2:13242526362</td>
							<td>汉语</td>
							<td>中国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
						</tr>
						<tr>
							<td>TG20170515001</td>
							<td><a class="selectGuideInfoByName">王艳艳</a></td>
							<td>YAN WANG</td>
							<td>女</td>
							<td>手机号1:15637378907,手机号2:18617263678</td>
							<td>中文</td>
							<td>美国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
						</tr>
						<tr>
							<td>TG20170515002</td>
							<td><a class="selectGuideInfoByName">赵哲</a></td>
							<td>JACK</td>
							<td>男</td>
							<td>联系方式2:13978909876,联系方式1:18567890987</td>
							<td>中文</td>
							<td>中国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
						</tr>
						<tr>
							<td>TG20170515003</td>
							<td><a class="selectGuideInfoByName">张美丽</a></td>
							<td>GIGI</td>
							<td>女</td>
							<td>联系方式:13678909876</td>
							<td>汉语</td>
							<td>中国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
						</tr>
						<tr>
							<td>TG20170515004</td>
							<td><a class="selectGuideInfoByName">李青</a></td>
							<td>QING LI</td>
							<td>女</td>
							<td>联系方式:13898765456</td>
							<td>汉语</td>
							<td>中国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
						</tr>
						<tr>
							<td>TG20170515005</td>
							<td><a class="selectGuideInfoByName">孙飞</a></td>
							<td>SUN FEI</td>
							<td>男</td>
							<td>联系方式:13809876789</td>
							<td>汉语</td>
							<td>中国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
						</tr>
						<tr>
							<td>TG20170515006</td>
							<td><a class="selectGuideInfoByName">王凯</a></td>
							<td>King</td>
							<td>男</td>
							<td>联系方式:13890098767</td>
							<td>汉语</td>
							<td>中国</td>
							<td>启用</td>
							<td>
								<a class="btn btn-default btn-xs updateGuideById">修改&nbsp;&nbsp;</a>
								<a class="btn btn-default btn-xs changeState">禁用&nbsp;&nbsp;</a>
							</td>
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
	</form>
</div>
<c:url var="url" value="/js/guide/guideManageList.js"></c:url>
<script type="text/javascript" src="${url}"></script>