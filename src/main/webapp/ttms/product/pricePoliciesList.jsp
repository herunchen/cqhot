<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row page-search">
		<div class="col-md-12">
			<ul class="list-inline">
				<li style="margin-top:5px"><input type="text" class="form-control" placeholder="政策名称"  id="policyName" ></li>
				<li style="margin-top:5px"><input type="text" class="form-control datepicker dateISO compareDate"	placeholder="开始日期"  id="beginDate"></li>
				<li style="margin-top:5px"><input type="text" class="form-control datepicker dateISO compareDate" placeholder="结束日期"  id="endDate"></li>
				<li style="margin-top:5px">
					<button class="btn btn-primary O1" type= "button" name="btn_search" id="btn_search">查询</button>
				</li>
			</ul>
		</div>
		</div>
	<div class="row">
   	  <div class="col-md-12">
	   	  <table style="margin-top:5px" class="table table-bordered " id="pricePoliciesTable">
              <thead>
               <tr>
               	<th data-checkbox="true"></th>
                <th>政策名称</th>
                <th>政策优惠</th>
                <th>折后价格</th>
                <th>最大数量</th>
                <th>最低数量</th>
                <th>开始日期</th>
                <th>结束日期</th>
                <th>政策说明</th>
               </tr>
              </thead>
         </table>
         <nav class="pull-right" id="pagination">
			<ul class="pagination">
				<!-- 当前页/共多少页 -->
				<li style="padding:6px 12px;border:1px solid transparent;float:left">
					<strong id="currentPage"></strong>页
				</li>
				<!-- 总记录数 -->
				<li style="padding:6px 12px 6px 0px;border:1px solid transparent;float:left">
					<strong id="totalCount"></strong>条记录
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
</div>
<script type="text/javascript">
	initUiComponment();  //调用 /assets/js/demo/ui_general.js 提供的初始化界面组件方法
</script>
<c:url var="url" value="/js/product/pricePoliciesList.js"></c:url>
<script type="text/javascript" src="${url }"></script>
