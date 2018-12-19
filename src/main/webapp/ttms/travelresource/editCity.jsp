<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<form  class="form-horizontal row-border" >
				<div class="form-group">
					<label class="col-md-2 control-label">城市编码:</label>
					<div class="col-md-10">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 所属大洲/国家: </label>
					<div class="col-md-10">
						<select name="continentId" id="continentId" class="form-control" style="width: 150px; float: left">
							<option value="0">请选择大洲</option>
							<option value="CONT01">亚洲</option>
							<option value="CONT02">非洲</option>
							<option value="CONT03">北美洲</option>
							<option value="CONT04">南美洲</option>
							<option value="CONT05">南极洲</option>
							<option value="CONT06">欧洲</option>
							<option value="CONT07">大洋洲</option>
							<option value="CONT08">北极地区</option>
						</select> 
						<select name="countryId" id="countryId" class="form-control" style="width: 150px; float: left">
							<option value="0">请选择国家</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">中文名称:</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="name" id="name"  maxlength="50">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">英文名称:</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="engName" id="engName"  maxlength="50">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">拼音:</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="pyName" id="pyName"  maxlength="50">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">是否首都:</label>
					<div class="col-md-10">
						<label class="radio-inline"> 
							<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1" checked>是
						</label> 
						<label class="radio-inline"> 
							<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="0">否
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">是否启用:</label>
					<div class="col-md-10">
						<label class="radio-inline"> 
							<input type="radio" name="inlineRadioOptions2" value="1" id="inlineRadio3" checked>启用
						</label> 
						<label class="radio-inline"> 
							<input type="radio" name="inlineRadioOptions2" value="0" id="inlineRadio4">禁用
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">简介:</label>
					<div class="col-md-10">
						<textarea name="note" id="note" rows="5" class="form-control"></textarea>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>