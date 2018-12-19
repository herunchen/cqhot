<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3>编辑产品信息</h3>
			<ol class="breadcrumb">
				<li>产品管理</li>
				<li>产品</li>
				<li>产品列表</li>
				<li class="active">编辑产品信息</li>
			</ol>
		</div>
	</div>
	<form method="post" class="form-horizontal" id="editProductForm" >
		<input type="hidden" name="id" id="productId" />
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="col-md-2 control-label">产品编号</label>
					<div class="col-md-4">
						<p id="prodId" class="form-control-static"></p>
					</div>
					<label class="col-md-2 control-label"> <i class="mandatory">*</i>团号 </label>
					<div class="col-md-4">
						<select name="numId" id="numId" class="form-control required" >
							<option value="">请选择团号</option>
							
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> <i class="mandatory">*</i>产品分类
					</label>
					<div class="col-md-4">
						<ul class="list-inline"  >
							<li><select id="c1Id" class="form-control required" >
									<option value="">一级分类</option>
									<option value="11">出境游</option>
									<option value="12">国内游</option>
									<option value="14">海岛游</option>
							</select></li>
							<li><select  id="c2Id" class="form-control required">
									<option value="">二级分类</option>
							</select></li>
							<li><select name="classId" id="c3Id" class="form-control required" >
									<option value="">三级分类</option>
							</select></li>
						</ul>
					</div>
					<label class="col-md-2 control-label">产品经理
					</label>
					<div class="col-md-4">
						<p class="form-control-static" id="prodMgrName"></p>
						<input type="hidden" name="mgrId" id="mgrId" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label"> <i class="mandatory">*</i>产品名称</label>
					<div class="col-md-10">
						<input type="text" name="prodName" id="prodName" class="form-control required"  >
					</div>
				</div>
			</div>
		</div>
			
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable tabbable-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab_1_1" data-toggle="tab" id="tab_1"> 基本信息 </a></li>
						
						<li><a href="#tab_1_3" data-toggle="tab" id="tab_3"> 旅游
						</a></li>
						
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_1_1">
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-md-2 control-label"> <i class="mandatory">*</i>服务开始时间</label>
											<div class="col-md-4">
												<input type="text" class="form-control datepicker dateISO compareDate required" name="srvcBeginDate" id="srvcBeginDate"  value="" size="10">
											</div>
											
											<label class="col-md-2 control-label"> <i class="mandatory">*</i>预售数量</label>
											<div class="col-md-4">
												<input type="number" name="quantity" id="quantity" class="form-control digits required">
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-md-2 control-label"> <i class="mandatory">*</i>服务结束时间</label>
											<div class="col-md-4">
												<input type="text" class="form-control datepicker dateISO compareDate required" name="srvcEndDate" id="srvcEndDate"  value="" size="10">
											</div>
											
											<label class="col-md-2 control-label"> <i class="mandatory">*</i>最低数量</label>
											<div class="col-md-4">
												<input type="number" class="form-control digits required" name="minQty" id="minQty">
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-md-2 control-label"> <i class="mandatory">*</i>上架时间</label>
											<div class="col-md-4">
												<input type="text" class="form-control datepicker dateISO compareDate2 required" id="onlineDate"  name="onlineDate" size="10">
											</div>
											
											<label class="col-md-2 control-label"> <i class="mandatory">*</i>商品价格</label>
											<div class="col-md-4">
												<div class="input-group">
													<span class="input-group-addon"><i class="icon-yen"></i></span>
													<input type="number" class="form-control isNoInteger required" name="price" id="price">
												</div>
											</div>
										</div>	
										
										<div class="form-group">
											<label class="col-md-2 control-label"> <i class="mandatory">*</i>下架时间</label>
											<div class="col-md-4">
												<input type="text" class="form-control datepicker required dateISO compareDate2 " id="offlineDate" name="offlineDate"  value="" size="10">
											</div>
										</div>
										
										<!-- <div class="form-group">
											<label class="col-md-2 control-label"><i class="mandatory">*</i>部门</label>
											<div class="col-md-10">
												<div class="input-group"> 
													<input type="text" class="form-control clear-input- required" id="usersgroupsText" placeholder="选择部门"  name="deptName" >
													<input type="hidden" class="form-control" id="usersgroupsValue" name="deptId">
													组织机构编号
													<span class="input-group-btn">
														<button class="btn btn-default btn-groups" type="button" id="btnUsersGroups" data-id="1"
														data-toggle="modal" data-target="#groupDialog">
															<i class="icon-ellipsis-horizontal"></i>
														</button>
													</span>
												</div>
											</div>
										</div> -->
											
										<div class="form-group">
											<label class="col-md-2 control-label">特别提示</label>
											<div class="col-md-6">
												<input type="text" class="form-control isChinese" name="exText" id="exText" maxlength="6" placeholder="限6个汉字">
											</div>
										</div>									
										<div class="form-group">
											<label class="col-md-2 control-label">产品简介</label>
											<div class="col-md-10">
												<textarea rows="5" name="prodIntro" id="prodIntro" class="form-control"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div><!-- end container -->
						</div>
						
						<div class="tab-pane" id="tab_1_3">
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-md-2 control-label"><i class="mandatory">*</i>出发地</label>	
											<div class="col-md-4">
												<input type="text" name="startPlace" id="startPlace" class="form-control required">
											</div>
											<label class="col-md-2 control-label"><i class="mandatory">*</i>出发日期</label>	
											<div class="col-md-4">
												<input type="text" name="startDate" id="startDate"  class="form-control datepicker   required dateISO compareDate3" size="10">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><i class="mandatory">*</i>返回地</label>	
											<div class="col-md-4">
												<input type="text" name="returnPlace" id="returnPlace" class="form-control required">
											</div>
											<label class="col-md-2 control-label"><i class="mandatory">*</i>返回日期</label>	
											<div class="col-md-4">
												<input type="text" name="endDate" id="endDate"  class="form-control datepicker required dateISO compareDate3" size="10">
											</div>
											
										</div>
										
										<div class="form-group">
											<label class="col-md-2 control-label"><i class="mandatory">*</i>行程设置</label>	
											<div class="col-md-10">
												<select name="nights" id="nights" class="form-control required"  style="width: 80px">
													<option value="1" selected="selected">1晚</option>
													<option value="2">2晚</option>
													<option value="3">3晚</option>
													<option value="4">4晚</option>
													<option value="5">5晚</option>
													<option value="6">6晚</option>
													<option value="7">7晚</option>
													<option value="8">8晚</option>
													<option value="9">9晚</option>
													<option value="10">10晚</option>
													<option value="11">11晚</option>
													<option value="12">12晚</option>
													<option value="13">13晚</option>
													<option value="14">14晚</option>
													<option value="15">15晚</option>
													<option value="16">16晚</option>
													<option value="17">17晚</option>
													<option value="18">18晚</option>
													<option value="19">19晚</option>
													<option value="20">20晚</option>
												</select>
											</div>
											
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">备注</label>	
											<div class="col-md-10">
												<textarea rows="5" name="note" id="note" class="form-control"></textarea>
											</div>
										</div>
									</div>
								</div>
								
							</div><!-- end container -->
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
		    		<div class="col-md-offset-5 col-md-10">
		      			<button type="button" class="btn btn-primary" id="btn_save">保存</button>
		    		</div>
  				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	initUiComponment();  //调用 /assets/js/demo/ui_general.js 提供的初始化界面组件方法
</script>
<c:url var="url" value="/js/product/editProductInfo.js"></c:url>
<script type="text/javascript" src="${url}"></script>
