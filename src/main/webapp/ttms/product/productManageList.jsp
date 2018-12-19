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
		<div class="page-title" style="padding-bottom: 5px">
			<h3>产品列表</h3>
			<ol class="breadcrumb">
				<li>产品管理</li>
				<li>产品</li>
				<li class="active">产品列表</li>
			</ol>
		</div>
	</div>
	<form method="post" id="productsList">
		<div class="row page-search">
			<div class="col-md-12">
				<ul class="list-inline" id="selectAccording">
					<li>
					   <select id="state" class="form-control">
							<option value="">状态</option>
							<option value="0">待售</option>
							<option value="1">上架</option>
							<option value="2">下架</option>
						</select>
					</li>
					<li>
						<select id="c1Id" class="form-control">
							<option value="">主分类</option>
							<option value="1">出境游</option>
							<option value="2">国内游</option>
							<option value="3">海岛游</option>
						</select>
					</li>
					<li>
						<select  id="c2Id" class="form-control" style="width: 160px">
							<option value="">二级分类</option>
						</select>
					</li>
					<li>
						<select id="c3Id" class="form-control" style="width: 160px">
							<option value="">三级分类</option>
						</select>
					</li>
					<li><input type="text" class="form-control" id="prjName" placeholder="项目名称"></li>
					<li><input type="text" class="form-control" id="prodId" placeholder="产品编号"></li>
					<li><input type="text" class="form-control" id="prodName" placeholder="产品名称"></li>
					<li><input id="srvcBeginDate" type="text" class="form-control datepicker dateISO required compareDate " placeholder="服务开始日期"></li>
					<li><input type="text" id="srvcEndDate" class="form-control datepicker dateISO required compareDate "  placeholder="服务结束日期"></li>
					<li>
						<button type="button" class="btn btn-primary O1 btn_search">查询</button>
					</li>
					<li>
						<button type="button" class="btn btn-success O3 btn_update">修改</button>
					</li>
					<li>
						<button type="button" class="btn btn-default O3 btn_onsales">待售</button>
					</li>
					<li>
						<button type="button" class="btn btn-default O3 btn_online">上架</button>
					</li>
					<li>
						<button type="button" class="btn btn-default O3 btn_offline">下架</button>
					</li>
					<li>
						<button type="button" class="btn btn-warning O3 btn_product_dist">库存分销</button>
					</li>

					<li>
						<button type="button" class="btn btn-info O3 btn_price_policy">价格政策</button>
					</li>

					<li>
						<button type="button" class="btn btn-primary O3 btn_attachments">附件</button>
					</li>


					<li>
						<button type="button" class="btn btn-info O3 btn_product_guide">导游信息</button>
					</li>
					<li>
						<button type="button" class="btn btn-info O3 btn_tour_schedual">行程设置</button>
					</li>
				</ul>
				<label id="errMsg" class="red">&nbsp;</label> <br />
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered" id="productList" style="margin-top:5px;">
					<thead>
						<tr>
							<th data-checkbox="true"></th>
							<th data-align="center">状态</th>
							<th data-align="center">类别</th>
							<th data-align="center">所属项目</th>
							<th data-align="center">团名称</th>
							<th data-align="center">产品编号</th>
							<th data-align="center">产品名称</th>
							<th data-align="center">服务开始时间</th>
							<th data-align="center">服务结束时间</th>
							<th data-align="center">预</th>
							<th data-align="center">已</th>
							<th data-align="center">余</th>
							<th data-align="center">产品价格</th>
						</tr>
					</thead>
					<tbody id="productBody">
					</tbody>
				</table>
				<nav class="pull-right" id="pagination">
						<ul class="pagination">
							<!-- 当前页/共多少页 -->
							<li style="padding:6px 12px;border:1px solid transparent;float:left">
								<strong id="currentPage">1/3</strong>页
							</li>
							<!-- 总记录数 -->
							<li style="padding:6px 12px 6px 0px;border:1px solid transparent;float:left">
								<strong id="totalCount">28</strong>条记录
							</li>
							<!-- 生成首页，上一页，下一页，尾页 -->
							<li><a class="firstPage">首页</a></li>
							<li><a title="上一页" class="upperPage">&laquo;</a></li>
							<li><a title="下一页" class="nextPage">&raquo;</a></li>
							<li><a class="lastPage">尾页</a></li>
							<!-- 生成跳转页面文本框 -->
							<li><a style="padding:0px">
								<input type="number" id="pageSelect" name="pageSelect" class="form-control"  style='width:60px;margin:0px;border:none;height:30px' />
							</a></li>
							<li><a class="jump">跳转</a></li>
						</ul>
					</nav>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
initUiComponment(); 
//调用 /assets/js/demo/ui_general.js 提供的初始化界面组件方法
</script> 

<c:url var="url" value="/js/product/productManageList.js"></c:url>
<script type="text/javascript" src="${url}"></script>