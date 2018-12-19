<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-12">
			<form  class="form-horizontal row-border" >
				<div class="form-group">
					<label class="col-md-2 control-label"> 渠道代码: </label>
					<div class="col-md-10">
						<label class="control-label">CHN-携程-1</label>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label"> 渠道名称: </label>
					<div class="col-md-10">
						<label class="control-label">携程线上渠道</label>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label"> </label>
					<div class="col-md-10">
						<button type="button" class="btn btn-success"
							onclick="addNewRow();addIndex()">新增</button>
						<button type="button" class="btn btn-primary" id="btnSave">保存</button>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"> </label>
					<div class="col-md-10">
						<table class="table table-bordered" id="user_list">
							<thead>
								<tr>
									<th width="5%" style="text-align: center;">序号</th>
									<th style="text-align: center;"><span style="color: red">*</span>姓名</th>
									<th width="8%" style="text-align: center;">性别</th>
									<th style="text-align: center;"><span style="color: red">*</span>电话</th>
									<th width="15%" style="text-align: center;"><span
										style="color: red">*</span>电子邮箱</th>
									<th width="10%" style="text-align: center;"><span
										style="color: red">*</span>账户名</th>
									<th width="5%" style="text-align: center;">有效</th>
									<th width="13%" style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td style="text-align: center;">1</td>
									<td><input type="text" name="name" class="form-control required" value="张爽"> </td>
									<td><select name="gender" class="form-control">
											<option value="M">男</option>
											<option value="F" selected>女</option>
									</select></td>
									<td><input type="text" name="phone"
										class="form-control required mobile" value="13654321234"></td>
									<td><input type="text" name="eMail"
										class="form-control required email"
										value="zhagnshaung@lvyou.cn"></td>
									<td><input type="text" name="userName"
										class="form-control required" value="ZS"
										onblur="checkUserName(this)"></td>
									<td><input type="checkbox" value="1" name="valid1" checked>  </td>
									<td><a  onclick="delRow(this)">删除</a>&nbsp;&nbsp;
										<a
										href="http://localhost:8080/tpms_complete/channelData/updatePassWord.do?id=11&amp;userId=U000000006"
										onclick="javascript:return confirm('确定重置密码？')">重置密码</a></td>
								</tr>

								<tr>
									<td style="text-align: center;" >2</td>
									<td><input type="text" name="name" class="form-control required" value="王月"> </td>
									<td><select name="gender" class="form-control">
											<option value="M" selected>男</option>
											<option value="F">女</option>
									</select></td>
									<td><input type="text" name="phone"
										class="form-control required mobile" value="18765432334"></td>
									<td><input type="text" name="eMail"
										class="form-control required email" value="wangyue@lvyou.cn"></td>
									<td><input type="text" name="userName"
										class="form-control required" value="wangyue"
										onblur="checkUserName(this)"></td>
									<td><input type="checkbox" value="1" name="valid1"
										checked> </td>
									<td><a >删除</a>&nbsp;&nbsp;
										<a >重置密码</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>