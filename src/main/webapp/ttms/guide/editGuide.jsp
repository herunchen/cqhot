<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal row-border">
				<div class="form-group">
					<label class="col-md-2 control-label">编码:</label>
					<div class="col-md-10">
						<p class="form-control-static" id="guideCode">保存后自动生成</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 姓名: </label>
					<div class="col-md-10">
						<input type="text" class="form-control required maxlength:50" name="name" id="uname">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 英文名: </label>
					<div class="col-md-10">
						<input type="text" class="form-control required maxlength:50" id="engName" name="engName">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 性别: </label>

					<div class="col-md-10">
						<label class="radio-inline"> 
							<input type="radio" checked name="gender" value="M" id="male">男
						</label>
						<label class="radio-inline"> 
							<input type="radio" name="gender" value="F" id="female">女
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 语种: </label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="language" id="lang">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 服务国家: </label>
					<div class="col-md-10">
						<input type="text" class="form-control typeRequired" name="serveCountry" id="country">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 电子邮箱: </label>
					<div class="col-md-10">
						<input type="email" class="form-control email maxlength:50" name="email" id="email">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 联系方式: </label>
					<div class="col-md-10">
						<a class="btn btn-default btn-xs addTelPhone"> 增加 </a>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> </label>
					<div class="col-md-10">
						<table class="table table-bordered" id="tb_contract">
							<thead>
								<tr>
									<th>标题</th>
									<th>电话</th>
									<th>备注</th>
									<th style="width: 60px">操作</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 有效: </label>
					<div class="col-md-10">
						<label class="radio-inline"> 
							<input type="radio" checked name="inlineRadioOptions2" value="1" id="inlineRadio3">启用
						</label> 
						<label class="radio-inline"> 
							<input type="radio" name="inlineRadioOptions2" value="0" id="inlineRadio4">禁用
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> 备注 </label>
					<div class="col-md-10">
						<textarea name="note" id="note" rows="5" class="form-control"></textarea>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>