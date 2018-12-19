<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="page-header">
        <div class="page-title" style="padding-bottom: 5px">
            <h3>添加渠道商</h3>
            <ol class="breadcrumb">
            	<li>供销管理</li>
				<li>渠道管理</li>
				<li class="active">添加渠道商</li>
            </ol>
        </div>
    </div>
	<div class="row">
		<div class="col-md-12">
			<div class="tabbable tabbable-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_1_1" data-toggle="tab">


							渠道商基本信息 </a></li>
					<li><a href="#tab_1_2" data-toggle="tab"> 注册信息 </a></li>
					<li><a href="#tab_1_3" data-toggle="tab"> 财务信息 </a></li>
					<li><a href="#tab_1_4" data-toggle="tab"> 联系人 </a></li>
					<li><a href="#tab_1_5" data-toggle="tab"> 附件 </a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane active" id="tab_1_1">
						<form onsubmit="setRequest($(this),$('title').html())"
							id="form_1_1">
							<div class="form-horizontal row-border row-no-margin">
								<div class="form-group">
									<label class="col-md-2 control-label"> 编码: </label>
									<div class="col-md-10">
										<label class="col-md-2 control-label"> 保存后自动生成 </label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> <span
										style="color: red">*</span>类别:
									</label>
									<div class="col-md-10">
										<select name="deptId" id="deptId"
											class="form-control typeRequired" >

											<option data-code="A" value="A">农、林、牧、渔业</option>

											<option data-code="B" value="B">采矿业</option>

											<option data-code="C" value="C">制造业</option>

											<option data-code="D" value="D">电力、热力、燃气及水生产和供应业</option>

											<option data-code="E" value="E">建筑业</option>

											<option data-code="F" value="F">批发和零售业</option>

											<option data-code="G" value="G">交通运输、仓储和邮政业</option>

											<option data-code="H" value="H">住宿和餐饮业</option>

											<option data-code="I" value="I">信息传输、软件和信息技术服务业</option>

											<option data-code="J" value="J">金融业</option>

											<option data-code="K" value="K">房地产业</option>

											<option data-code="L" value="L">租赁和商务服务业</option>

											<option data-code="M" value="M">科学研究和技术服务业</option>

											<option data-code="N" value="N">水利、环境和公共设施管理业</option>

											<option data-code="O" value="O">居民服务、修理和其他服务业</option>

											<option data-code="P" value="P">教育</option>

											<option data-code="Q" value="Q">卫生和社会工作</option>

											<option data-code="R" value="R">文化、体育和娱乐业</option>

											<option data-code="S" value="S">公共管理、社会保障和社会组织</option>

											<option data-code="T" value="T">国际组织</option>

										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> <span
										style="color: red">*</span>名称:
									</label>
									<div class="col-md-10">
										<input type="text" name="name"
											class="form-control name required"> <label></label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 电话: </label>
									<div class="col-md-10">
										<input type="text" class="form-control name isPhone"
											style="width: 150px;" name="phone">
									</div>

								</div>

								<div class="form-group">
									<label class="col-md-2 control-label"> 传真: </label>
									<div class="col-md-10">
										<input type="text" class="form-control name isPhone"
											style="width: 150px" name="fax">
									</div>

								</div>


								<div class="form-group">
									<label class="col-md-2 control-label"> 地址: </label>
									<div class="col-md-10">
										<ul class="list-unstyled">
											<li><label class="col-md-1 control-label"> 国家 </label>
												<div class="col-md-11">
													<input type="text" name="country" class="form-control name">
												</div></li>
											<li><label class="col-md-1 control-label"> 省份 </label>
												<div class="col-md-11">
													<input type="text" name="province"
														class="form-control name">
												</div></li>
											<li><label class="col-md-1 control-label"> 城区 </label>
												<div class="col-md-11">
													<input type="text" name="city" class="form-control name">
												</div></li>
											<li><label class="col-md-1 control-label"> 街道 </label>
												<div class="col-md-11">
													<input type="text" name="address" class="form-control name">
												</div></li>
											<li><label class="col-md-1 control-label"> 邮编 </label>
												<div class="col-md-11">
													<input type="text" name="postNo" class="form-control name">
												</div></li>

										</ul>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 网站主页: </label>
									<div class="col-md-10">
										<input type="text" name="homePage"
											class="form-control name url">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 账期: </label>
									<div class="col-md-10">
										<select id="acctPeriod" class="form-control name">
											<option value="1">周结</option>
											<option value="0">月结</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2 control-label"> 有效: </label>
									<div class="col-md-10">
										<label class="radio-inline"> <input type="radio"
											value="1" name="valid" class="name" checked>有效
										</label> <label class="radio-inline"> <input type="radio"
											value="0" name="valid" class="name">无效
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 公司简介 </label>
									<div class="col-md-10">
										<textarea name="introduction" rows="5"
											class="form-control name"></textarea>
									</div>
								</div>
							</div>
						</form>
					</div>

					<div class="tab-pane" id="tab_1_2">
						<form onsubmit="setRequest($(this),$('title').html())"
							id="form_1_2">
							<div class="form-horizontal row-border">
								<div class="form-group">
									<label class="col-md-2 control-label"> 注册号: </label>
									<div class="col-md-10">
										<input type="text" name="regCode" class="form-control name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 法人代表: </label>
									<div class="col-md-10">
										<input type="text" name="regLegalRep"
											class="form-control name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 注册资金: </label>
									<div class="col-md-10">
										<input type="text" name="regCapital"
											class="form-control name money">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="tab_1_3">
						<form onsubmit="setRequest($(this),$('title').html())"
							id="form_1_3">
							<div class="form-horizontal row-border">
								<div class="form-group">
									<label class="col-md-2 control-label"> 单位名称: </label>
									<div class="col-md-10">
										<input type="text" name="bankCompName"
											class="form-control name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 开户银行: </label>
									<div class="col-md-10">
										<input type="text" name="bankName" class="form-control name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 账号: </label>
									<div class="col-md-10">
										<input type="text" name="bankAccount"
											class="form-control name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 统一信用代码: </label>
									<div class="col-md-10">
										<input type="text" name="taxCode" class="form-control name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 地址: </label>
									<div class="col-md-10">
										<input type="text" name="regAddress" class="form-control name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 电话: </label>
									<div class="col-md-10">
										<input type="text" name="regPhone"
											class="form-control name isPhone">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 备注: </label>
									<div class="col-md-10">
										<textarea name="note" id="" rows="5" class="form-control name"></textarea>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="tab-pane" id="tab_1_4">
						<form onsubmit="setRequest($(this),$('title').html())"
							id="form_1_4">
							<div class="form-horizontal row-border">
								<div class="form-group">
									<label class="col-md-2 control-label"> 联系方式: </label>
									<div class="col-md-10">
										<label class="control-label"> <a>新增</a>
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> </label>
									<div class="col-md-10">
										<table class="table table-bordered" id="tb_contract">
											<thead>
												<tr>
													<th><span style="color: red">*</span>姓名</th>
													<th>部门</th>
													<th>职位</th>
													<th><span style="color: red">*</span>电话</th>
													<th><span style="color: red">*</span>电子邮箱</th>
													<th>备注</th>
													<th style="width: 60px">操作</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</form>
					</div>

					<div class="tab-pane" id="tab_1_5">
						<form onsubmit="setRequest($(this),$('title').html())"
							method="post" id="index_form" name="file_form"
							class="form-horizontal" enctype="multipart/form-data">
							<div class="form-horizontal row-border">
								<div class="form-group">
									<label class="col-md-2 control-label"> 经营许可证: </label>
									<div class="col-md-10">
										<input type="file" class="form-control" name="attach_pto"
											accept="image/png,image/gif,image/jpg,image/jpeg,image/bmp"
											placeholder="选择文件">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 营业执照: </label>
									<div class="col-md-10">
										<input type="file" class="form-control" name="attach_licence"
											accept="image/png,image/gif,image/jpg,image/jpeg,image/bmp"
											placeholder="选择文件">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 税务登记证: </label>
									<div class="col-md-10">
										<input type="file" class="form-control" name="attach_tax_reg"
											accept="image/png,image/gif,image/jpg,image/jpeg,image/bmp"
											placeholder="选择文件">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label"> 法人身份证: </label>
									<div class="col-md-10">
										<ul class="list-unstyled">
											<li><label class="col-md-1 control-label"> 正面 </label>
												<div class="col-md-11">
													<input type="file" class="form-control"
														name="attach_repId_f"
														accept="image/png,image/gif,image/jpg,image/jpeg,image/bmp"
														placeholder="选择文件">
												</div></li>
											<li><label class="col-md-1 control-label"> 反面 </label>
												<div class="col-md-11">
													<input type="file" class="form-control"
														name="attach_repId_b"
														accept="image/png,image/gif,image/jpg,image/jpeg,image/bmp"
														placeholder="选择文件">
												</div></li>
										</ul>

									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-12 text-center">
				<button class="btn btn-primary" onclick="save()">保存</button>
			</div>
		</div>
	</div>
</div>