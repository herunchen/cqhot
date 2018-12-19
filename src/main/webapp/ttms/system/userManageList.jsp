<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" id="container_sub">
		<div class="page-header">
			<div class="page-title">
				<h3>用户管理</h3>
				 <ol class="breadcrumb">
				  <li>系统管理</li>
				  <li>用户权限</li>
				  <li class="active">用户管理</li>
				</ol>
			</div>
		</div>
		<div class="row page-search">
			<form>
				<div class="col-md-12">
					<ul class="list-inline">
						<li><select id="userType" name="userType"  class="form-control">
								<option >请选择用户属性</option>
								<option value="0">内部用户</option>
								<option value="1">外部用户</option>
							</select>
						</li>
						<li><select id="userClass" name="userClass"  class="form-control">
								<option >请选择用户类别</option>
								<option value="1">员工</option>
								<option value="2">渠道商</option>
							</select>
						</li>
						<li><select id="gender" name="gender"  class="form-control">
								<option >请选择用户性别</option>
								<option value="M">男</option>
								<option value="F">女</option>
						</select></li>
						<li><input type="text" class="form-control" placeholder="请输入要搜索的文字" name="selectData" ></li>
						<li>
							<button type="button" class="btn btn-primary">查询</button>
						</li>
						<li>
							<button type="button" id="btn_new" class="btn btn-success">新增
							</button>
						</li>
					</ul>
				</div>
			</form>
		</div>
		<div class="row">
				<div class="col-md-12">
					<table data-toggle="table" class="table table-bordered" id="addPartList">
						<thead>
							<tr>
								<th data-checkbox="true"></th>
								<th style="text-align: center; width: 17%;">基本信息</th>
								<th style="text-align: center; width: 20%;">其他信息</th>
								<th style="text-align: center; width: 12%;">电子邮箱</th>
								<th style="text-align: center; width: 8%;">用户类别</th>
								<th style="text-align: center; width: 15%;">备注</th>
								<th style="text-align: center; width: 8%;">有效标识</th>
								<th style="text-align: center; width: 8%;">权限</th>
								<th style="text-align: center; width: 12%;">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr data-userid="U000000002">
								<td>
                       				<input name="btSelectItem" class="checkbox" type="checkbox">
                   				</td>
								<td align="left">
									<div>编号：U000000002</div>
									<div>名称：Admin</div>
									<div>姓名：<a >王毅</a></div>
									<div>性别：男</div>
									<div>电话：13872000534</div>
								</td>
								<td align="left">
									<div>所属机构：系统信息部</div>
									<div>所属组织：山东广顺国际旅行社</div>
									<div>用户属性：内部用户</div>
									<div>注册日期：2017-01-24</div>
								</td>
								<td align="center">wangyi@lvyou.cn</td>
								<td align="center">员工</td>
								<td align="center">系统信息管理专员</td>
								<td align="center">启用</td>
								<td align="center">管理员</td>
								<td align="center">
									<a > 修改</a> 
									<a >禁用 </a>
								</td>
							</tr>
							<tr data-userid="U000000003">
								<td>
                        			<input name="btSelectItem" class="checkbox" type="checkbox">
                    			</td>
								<td align="left">
									<div>编号：U000000003</div>
									<div>名称：Wangke</div>
									<div>姓名：<a >王珂</a></div>
									<div>性别：男</div>
									<div>电话：13623456789</div>
								</td>
								<td align="left">
									<div>所属机构：产品研发部</div>
									<div>所属组织：山东广顺国际旅行社</div>
									<div>用户属性：内部用户</div>
									<div>注册日期：2017-04-11</div>
								</td>
								<td align="center">wangke@lvyou.com</td>
								<td align="center">员工</td>
								<td align="center"></td>
								<td align="center">启用</td>
								<td align="center">项目经理</td>
								<td align="center">
									<a > 修改</a> 
									<a >禁用 </a>
								</td>
							</tr>
							<tr data-userid="U000000004">
								<td>
                        			<input name="btSelectItem" class="checkbox" type="checkbox">
                    			</td>
								<td align="left">
									<div>编号：U000000004</div>
									<div>名称：Linda</div>
									<div>姓名：<a >李琳</a></div>
									<div>性别：女</div>
									<div>电话：18612345678</div>
								</td>
								<td align="left">
									<div>所属机构：产品研发部</div>
									<div>所属组织：山东广顺国际旅行社</div>
									<div>用户属性：内部用户</div>
									<div>注册日期：2017-04-11</div>
								</td>
								<td align="center">lilin@lvyou.cn</td>
								<td align="center">员工</td>
								<td align="center"></td>
								<td align="center">启用</td>
								<td align="center">产品信息专员</td>
								<td align="center">
									<a > 修改</a> 
									<a >禁用 </a>
								</td>
							</tr>
							<tr data-userid="U000000005">
								<td>
                        			<input name="btSelectItem" class="checkbox" type="checkbox">
                    			</td>
								<td align="left">
									<div>编号：U000000005</div>
									<div>名称：Zhaoxin</div>
									<div>姓名：<a >赵鑫</a></div>
									<div>性别：男</div>
									<div>电话：18645678909</div>
								</td>
								<td align="left">
									<div>所属机构：产品研发部</div>
									<div>所属组织：山东广顺国际旅行社</div>
									<div>用户属性：内部用户</div>
									<div>注册日期：2017-04-11</div>
								</td>
								<td align="center">zhaoxin@lvyou.cn</td>
								<td align="center">员工</td>
								<td align="center"></td>
								<td align="center">启用</td>
								<td align="center">产品经理</td>
								<td align="center">
									 <a > 修改</a>
									 <a >禁用 </a>
								</td>
							</tr>
							<tr data-userid="U000000006">
								<td>
                        			<input name="btSelectItem" class="checkbox" type="checkbox">
                    			</td>
								<td align="left">
									<div>编号：U000000006</div>
									<div>名称：Zhangshuang</div>
									<div>姓名：<a >张爽</a></div>
									<div>性别：女</div>
									<div>电话：13654321234</div>
								</td>
								<td align="left">
									<div>所属机构：</div>
									<div>所属组织：携程旅游公司</div>
									<div>用户属性：外部用户</div>
									<div>注册日期：2017-04-18</div>
								</td>
								<td align="center">zhagnshaung@lvyou.cn</td>
								<td align="center">渠道商</td>
								<td align="center"></td>
								<td align="center">启用</td>
								<td align="center"></td>
								<td align="center"></td>
							</tr>
						</tbody>
					</table>
					 <%@include file="../common/page.jsp" %>
				</div>
		</div>
	</div>