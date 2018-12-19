<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-12">
			<form  class="form-horizontal row-border" >
				<div class="form-group">
					<label class="col-md-2 control-label"><span
						style="color: red;">*</span> 渠道代码: </label>
					<div class="col-md-10">
						<input type="text" class="form-control required" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"><span
						style="color: red;">*</span> 渠道名称: </label>
					<div class="col-md-10">
						<input type="text" class="form-control required" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 简称: </label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="shortName" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 省市: </label>
					<div class="col-md-10">
						<input type="text" class="form-control pull-left" name="province" placeholder="省/自治区/直辖市" style="width: 150px"> 
						<input type="text" class="form-control pull-left" name="city"  placeholder="市/区/县/地区" style="width: 250px; margin-left: 10px">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 活动地区: </label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="district" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 主页: </label>
					<div class="col-md-10">
						<input type="text" class="form-control url" placeholder="URL地址"
							name="homePageUrl" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 所属渠道商: </label>
					<div class="col-md-10">
						<select name="chncId" class="form-control">
							<option value="">请选择渠道商</option>
							<option value="13">携程旅游公司</option>
							<option value="14">去哪儿网有限公司</option>
							<option value="15">驴妈妈网有限公司</option>

						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 管理部门: </label>
					<div class="col-md-10">
						<select name="deptId" class="form-control">
							<option>请选择管理部门</option>
							<option>国内渠道商对接部</option>
							<option>国外渠道商对接部</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 管理人: </label>
					<div class="col-md-10">
						<div class="select2-container select2-container-multi col-md-12 full-width-fix" id="s2id_autogen1">
							<ul class="select2-choices">
								<li class="select2-search-field">
									<input type="text" autocomplete="off" spellcheck="false" class="select2-input" id="s2id_autogen2" style="width: 22px;">
								</li>
							</ul>
							<div class="select2-drop select2-drop-multi select2-display-none">
								<ul class="select2-results">
									<li class="select2-no-results">No matches found</li>
								</ul>
							</div>
						</div>
						<select class="select2-select-00 col-md-12 full-width-fix select2-offscreen" multiple size="5" name="mgrId" tabindex="-1">
							<option value="U000000003">王珂</option>
							<option value="U000000004">李琳</option>
							<option value="U000000005">赵鑫</option>
							<option value="U000000002">王毅</option>
							<option value="U000000010">汤姆</option>
							<option value="U000000011">艾米</option>
						</select>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>