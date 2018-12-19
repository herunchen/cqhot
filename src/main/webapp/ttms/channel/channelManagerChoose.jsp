<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-12">
			<form  class="form-horizontal" >
				<div class="form-group">
					<label class="col-md-12 pull-left"> 
						<span style="color: red">*</span>更改下列渠道的管理人为：
					</label>
				</div>
				<div class="form-group">
					<div class="col-md-10">
						<select class="form-control required">
							<option value="U000000003">王珂</option>
							<option value="U000000004">李琳</option>
							<option value="U000000005">赵鑫</option>
							<option value="U000000002">王毅</option>
							<option value="U000000010">汤姆</option>
							<option value="U000000011">艾米</option>
						</select> 
					</div>
					<div class="col-md-2">
						<button class="btn btn-primary" id="btn_save">保存</button>
					</div>
				</div>
			</form>
			<div class="bootstrap-table">
				<div class="fixed-table-toolbar"></div>
				<div class="fixed-table-container" style="padding-bottom: 0px;">
					<div class="fixed-table-header" style="display: none;">
						<table></table>
					</div>
					<div class="fixed-table-body">
						<div class="fixed-table-loading" style="top: 42px;">正在努力地加载数据中，请稍候……</div>
						<table data-toggle="table"
							class="table table-bordered table_nowrap table-hover"
							id="channel_list">
							<thead>
								<tr>
									<th style="text-align: center;" data-field="0" tabindex="0"><div
											class="th-inner ">渠道代码</div>
										<div class="fht-cell"></div></th>
									<th style="text-align: center;" data-field="2" tabindex="0"><div
											class="th-inner ">渠道名称</div>
										<div class="fht-cell"></div></th>
									<th style="text-align: center;" data-field="2" tabindex="0"><div
											class="th-inner ">所属渠道商</div>
										<div class="fht-cell"></div></th>
									<th style="text-align: center;" data-field="3" tabindex="0"><div
											class="th-inner ">管理部门</div>
										<div class="fht-cell"></div></th>
									<th style="text-align: center;" data-field="4" tabindex="0"><div
											class="th-inner ">管理人</div>
										<div class="fht-cell"></div></th>
									<th style="text-align: center;" data-field="6" tabindex="0"><div
											class="th-inner ">有效</div>
										<div class="fht-cell"></div></th>
								</tr>
							</thead>
							<tbody>
								<tr data-index="0">
									<td style="text-align: center;">CHN-驴妈妈-12</td>
									<td style="text-align: center;">
										<a class="viewChannelDetail">驴妈妈线上渠道</a></td>
									<td style="text-align: center;">国内渠道商对接部</td>
									<td style="text-align: center;">赵鑫</td>
									<td style="text-align: center;">有效</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>