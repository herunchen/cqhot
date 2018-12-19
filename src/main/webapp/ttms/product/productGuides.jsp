<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3>产品导游</h3>
			<ol class="breadcrumb">
				<li>产品管理</li>
				<li>产品</li>
				<li>产品列表</li>
				<li class="active">产品导游</li>
			</ol>
		</div>
	</div>
	<form method="post" class="form-horizontal" id="viewProductForm" >
    	<div class="row" >
			<div class="col-md-12">
				<div class="form-group">
					<label class="col-md-2 control-label">产品编号:</label>
					<div class="col-md-4">
						<p id="prodId" class="form-control-static"></p>
					</div>
					<label class="col-md-2 control-label">产品名称:</label>
					<div class="col-md-4">
						<p id="prodName" class="form-control-static"></p>
					</div>
				</div>
				<div class="form-group">
 					<label class="col-md-2 control-label">产品负责人:</label>
					<div class="col-md-4">
						<p id="director" class="form-control-static"></p>
					</div>
					<label class="col-md-2 control-label">服务日期:</label>
					<div class="col-md-4">
						<p id="serverDate" class="form-control-static"></p>
					</div>
				</div>
				<div class="form-group">
					
					<label class="col-md-2 control-label">价格信息:</label>
					<div class="col-md-4">
						<p id="price" class="form-control-static"></p>
					</div>
					<label class="col-md-2 control-label">状态:</label>
					<div class="col-md-4">
						<p id="state" class="form-control-static"></p>
					</div>
				</div>
			</div>
	    </div>
	   </form>
	    <div class="row">
	    	<div class="col-md-12">
	    		<ul class="list-inline" style="line-height: 40px">
	                <li>
                    	<button type="button" class="btn btn-success" id="btn_add">添加导游</button>
                	</li>
            	</ul>
            </div>
       </div>
	   <div class="row">
       	<div class="col-md-12">
            <table class="table table-bordered " id="productGuidesTable">
               <thead>
                <tr>
                    <th>导游编号</th>
                    <th>姓名</th>
                    <th>英文名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>语言</th>
                    <th>国籍</th>
                    <th>联系方式</th>
                    <th>备注</th>
                    <th>操作</th>
                </tr>
               </thead>
            </table>
        </div>
    </div>
</div>
<c:url var="url" value="/js/product/productGuides.js"></c:url>
<script type="text/javascript" src="${url}"></script>
