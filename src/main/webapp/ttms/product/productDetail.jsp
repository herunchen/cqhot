<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3>产品详情</h3>
			<ol class="breadcrumb">
				<li>产品管理</li>
				<li>产品</li>
				<li>产品列表</li>
				<li class="active">产品详情</li>
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
	  
	  <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom">
                <ul class="nav nav-tabs" id="productTabs">
                    <li class="active">
                        <a href="#tab_basicMessage" data-toggle="tab" class="productTab">基本信息</a>
                    </li>
                    <li>
                        <a href="#tab_detail" data-toggle="tab" class="productTab">旅游详细</a>
                    </li>
                    <li>
                        <a href="#tab_table" data-toggle="tab" class="productTab">库存分销</a>
                    </li>
                    <li>
                        <a href="#tab_table" data-toggle="tab" class="productTab">价格政策</a>
                    </li>
                    <li>
                        <a href="#tab_table" data-toggle="tab" class="productTab">附件</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_basicMessage">
                    	<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="col-md-2 control-label">服务开始时间:</label>
										<div class="col-md-4">
											 <p id="srvcBeginDate" class="form-control-static" > 
										</div>
										<label class="col-md-2 control-label">预售数量:</label>
										<div class="col-md-4">
											<p id="quantity" class="form-control-static" > 
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-md-2 control-label">服务结束时间:</label>
										<div class="col-md-4">
											<p id="srvcEndDate" class="form-control-static" >
										</div>
										<label class="col-md-2 control-label">最低数量:</label>
										<div class="col-md-4">
											<p id="minQty" class="form-control-static" >
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-md-2 control-label">上架时间:</label>
										<div class="col-md-4">
											<p id="onlineDate" class="form-control-static" >
										</div>
										<label class="col-md-2 control-label">商品价格:</label>
										<div class="col-md-4">
											<p id="prodPrice" class="form-control-static" >
										</div>
									</div>	
									<div class="form-group">
										<label class="col-md-2 control-label">下架时间:</label>
										<div class="col-md-4">
											<p id="offlineDate" class="form-control-static" >
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">特别提示:</label>
										<div class="col-md-6">
											<p id="exText" class="form-control-static" >
										</div>
									</div>									
									<div class="form-group">
										<label class="col-md-2 control-label">产品简介:</label>
										<div class="col-md-10">
											<p id="prodIntro" class="form-control-static"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
                    </div>
                    <div class="tab-pane" id="tab_detail">
                    	<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="col-md-2 control-label">出发地:</label>	
										<div class="col-md-4">
											<p id="startPlace" class="form-control-static"></p>
										</div>
										<label class="col-md-2 control-label">出发日期:</label>	
										<div class="col-md-4">
											<p id="startDate" class="form-control-static"></p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">返回地:</label>	
										<div class="col-md-4">
											<p id="returnPlace" class="form-control-static"></p>
										</div>
										<label class="col-md-2 control-label">返回日期:</label>	
										<div class="col-md-4">
											<p id="endDate" class="form-control-static"></p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">行程设置:</label>	
										<div class="col-md-10">
											<p id="nights" class="form-control-static"></p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">备注:</label>	
										<div class="col-md-10">
											<p id="note" class="form-control-static"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
                    </div>
                    <div class="tab-pane" id="tab_table">
                        <table class="table table-condensed table-bordered text-center">
                            <thead>
	                            <tr id="tableHead">
	                            </tr>
                            </thead>
                            <tbody id="tableBody">
                           </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</div>
<script type="text/javascript">
	initUiComponment();  //调用 /assets/js/demo/ui_general.js 提供的初始化界面组件方法
</script>
<c:url var="url" value="/js/product/productDetail.js"></c:url>
<script type="text/javascript" src="${url }"></script>