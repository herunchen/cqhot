<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3 class="scheTitle">行程设置</h3>
			<ol class="breadcrumb">
				<li>产品管理</li>
				<li>产品</li>
				<li>产品列表</li>
				<li class="active scheTitle">行程设置</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tabbable tabbable-custom">
				<ul class="nav nav-tabs" id="dayTab">
					<li class="active"><a href="#schedualTab" data-toggle="tab" class="dayNo" id="1" > 第1天 </a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="schedualTab">
					<form id="schedualForm" method="post">
						<input type="hidden" name="prodId" id="prodId" />
						<input type="hidden" name="id" id="schedualId" />
						<input type="hidden" name="dayNumber" id="dayNumber" />
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<label class="col-md-2 control-label">日程名称:</label>
									<div class="col-md-10">
										<input type="text" class="form-control dynamicClear required" placeholder="日程名称..." name="scheName"  id="scheName" />
									</div>
								</div>
								<div class="col-md-12" style="margin-top:10px">
									<label class="col-md-2 control-label">日程内容:</label>
									<div class="col-md-10">
										<textarea class="form-control dynamicClear required" rows="5" placeholder="日程安排..." name="schedualContent" id="schedualContent"></textarea>
									</div>
								</div>	
								<div class="col-md-12" style="margin-top:10px">
									<label class="col-md-2 control-label">住宿信息:</label>
									<div class="col-md-10">
										<textarea class="form-control dynamicClear required" rows="5" placeholder="酒店信息..." name="lodgeMessage" id="lodgeMessage" ></textarea>
									</div>
								</div>
								<div class="col-md-12" style="margin-top:10px">	
									<label class="col-md-2 control-label">早餐:</label>
									<div class="col-md-10">
										<input type="text" class="form-control dynamicClear required" placeholder="早餐信息..." name="breakFastMessage" id="breakFastMessage" />
									</div>
								</div>
								<div class="col-md-12" style="margin-top:10px">
									<label class="col-md-2 control-label">午餐:</label>
									<div class="col-md-10">
										<input type="text" class="form-control dynamicClear required" placeholder="午餐信息..."  name="lunchMessage"  id="lunchMessage" />
									</div>	
								</div>
								<div class="col-md-12" style="margin-top:10px">
									<label class="col-md-2 control-label">晚餐:</label>
									<div class="col-md-10">
										<input type="text" class="form-control dynamicClear required" placeholder="晚餐信息..." name="dinnerMessage" id="dinnerMessage" />
									</div>
								</div>
								<div class="col-md-12" style="margin-top:10px">
					    		<div class="col-md-10">
					      			<button type="button" class="btn btn-primary" style="margin-left:300px" id="btn_save">保存</button>
					    		</div>
							</div>
						</div>
					</div>
				</form>
			</div><!-- end container -->
		</div>
	</div>
</div>
</div>
</div>
<c:url var="url" value="/js/product/productTourSchedual.js"></c:url>
<script type="text/javascript" src="${url }"></script>