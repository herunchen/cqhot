<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="container" id="container_sub">
	    <div class="page-header">
	        <div class="page-title" style="padding-bottom: 5px">
	            <h3> 供应商管理</h3>
	            <ol class="breadcrumb">
	            	<li>资源管理</li>
					<li>供应商</li>
					<li class="active">供应商管理</li>
	            </ol>
	        </div>
	    </div>
	    <div class="row page-search">
	            <div class="col-md-12">
	                <ul class="list-inline">
	                    <li>
	                        <input type="text" class="form-control isNumber" placeholder="编号" name="supplierId" id="supplierId">
	                    </li>
	                    <li>
	                        <select name="indCatg" class="form-control"
						id="indCatg">
							<option value="">请选择类别</option>
					</select>
					</li>
	                    <li>
	                        <select name="acctPeriod" class="form-control" id="acctPeriod">
	                            <option value="">请选择账期</option>
	                            <option value="1">周结</option>
	                            <option value="0">月结</option>
	                        </select>
	                    </li>
	                    <li>
	                        <input type="text" class="form-control" placeholder="名称" name="name" id="supplierName">
	                    </li>
	                    <li>
	                        <input type="text" class="form-control" placeholder="国家" name="country" id="country">
	                    </li>
	                    <li>
	                        <input type="text" class="form-control" placeholder="省份" name="province" id="province">
	                    </li>
	                    <li>
	                        <input type="text" class="form-control" placeholder="城市" name="city" id="city">
	                    </li>
	                    <li><select name="valid" class="form-control" id="state">
	                    	<option value="">请选择</option>
	                        <option value="1">有效</option>
	                        <option value="0">无效</option>
	                    </select></li>
	                    <li>
	                        <button type="button" class="btn btn-primary O1" id="btn_search">查询</button>
	                    </li>
	                    <li>
	                        <button type="button" class="btn btn-success O2">新增</button>
	                    </li>
						
	                </ul>
	            </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12">
				<table class="table table-bordered" style="width:100%" id="supplierList">
					<thead>
						<tr>
							<th>编号</th>
							<th>类别</th>
							<th>名称</th>
							<th>账期</th>
							<th>国家地区</th>
							<th>省份</th>
							<th>城市</th>
							<th>有效</th>
							<th data-align="center" data-width="120">操作</th>
						</tr>
					</thead>
					<tbody id="supplierBody">
						  <!-- 这的内容需要动态获取 -->
					</tbody>
				</table>
				<nav class="pull-right" id="pagination">
					<ul class="pagination">
						<!-- 当前页/共多少页 -->
						<li style="padding:6px 12px;border:1px solid transparent;float:left">
							<strong id="currentPage">1/1</strong>页
						</li>
						<!-- 总记录数 -->
						<li style="padding:6px 12px 6px 0px;border:1px solid transparent;float:left">
							<strong id="totalCount">5</strong>条记录
						</li>
						<!-- 生成首页，上一页，下一页，尾页 -->
						<li style="display: none;"><a class="firstPage">首页</a></li>
						<li style="display: none;"><a title="上一页" class="upperPage">«</a></li>
						<li style="display: none;"><a title="下一页" class="nextPage">»</a></li>
						<li style="display: none;"><a class="lastPage">尾页</a></li>
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

<script type="text/javascript">
    initUiComponment(); //调用 /assets/js/demo/ui_general.js 提供的初始化界面组件方法
</script> 
<c:url var="url" value="/js/supplier/supplierManageList.js"></c:url>
<script type="text/javascript" src="${url}"></script>