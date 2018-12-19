<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" id="container_sub">
	<div class="page-header">
		<div class="page-title">
			<h3>价格政策</h3>
			<ol class="breadcrumb">
			  <li>产品管理</li>
			  <li>政策渠道</li>
			  <li class="active">价格政策</li>
			</ol>
		</div>
	</div>
	<form method="post"  name="policeListForm" id="policeForm">
		<div class="row page-search">
			<div class="col-md-12">
				<ul class="list-inline">
					<li><input type="text" class="form-control" placeholder="政策编号" name="plcyId" ></li>
					<li><input type="text" class="form-control" placeholder="政策名称" name="plcyName" ></li>
					<li>
						<select id="plcyType" name="plcyType" class="form-control">
							<option value="-1000">请选择政策类别</option>
							<option value="1">基础政策</option>
							<option value="2">限时优惠</option>
							<option value="3">人等优惠</option>
							<option value="4">在线立减</option>
							<option value="5">特别项目</option>
							
						</select> 
					</li> 
                	<li>
	                    <select id="valid" name="valid" class="form-control">
	                        <option value="-1000">状态</option>
	                        <option value="0">禁用</option>
	                        <option value="1">启用</option>
	                    </select>
                	</li>
					<li><button type="button" class="btn btn-primary O1" name="btn_search" id="btn_search">查询</button></li>
					<li><button type="button" id="btn_new" class="btn btn-success O2">新增 </button></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table data-toggle="table" class="table table-bordered" id="addPartList">
					<thead>
						<tr>
							<th>政策编号</th>
							<th>政策名称</th>
							<th>政策优惠</th>
							<th>最低数量</th>
							<th>最大数量</th>
							<th>起始日期</th>
							<th>终止日期</th>
							<th>状态</th>
							<th>备注</th>
							<th data-align="center" data-width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr data-plcyid="RCVB00000001">
							<td align="center"><a >RCVB00000001</a></td>
							<td align="center">限时优惠</td>
							<td align="center">9折</td>
							<td align="center">10</td>
							<td align="center">无上限</td>
							<td align="center">2017-03-14</td>
							<td align="center">2017-03-15</td>
							<td align="center"> 启用</td>
							<td align="center">限时优惠</td>	
							<td align="center"><a  class="O3">修改</a>&nbsp;&nbsp;
								<a  class="O3">禁用</a> </td>
						</tr>
						<tr data-plcyid="RCVB00000002">
							<td align="center"><a >RCVB00000002</a></td>
							<td align="center">团购优惠</td>
							<td align="center">-300.00</td>
							<td align="center">10</td>
							<td align="center">无上限</td>
							<td align="center">2017-03-16</td>
							<td align="center">2017-03-23</td>
							<td align="center"> 启用</td>
							<td align="center">10人以上优惠</td>	
							<td align="center"><a  class="O3">修改</a>&nbsp;&nbsp;
							<a  class="O3">禁用</a>
							</td>
						</tr>
                	</tbody>
            	</table> 
				<nav class="pull-right" id="pagination">
					<ul class="pagination">
						<!-- 当前页/共多少页 -->
						<li style="padding:6px 12px;border:1px solid transparent;float:left">
							<strong id="currentPage">1/3</strong>页
						</li>
						<!-- 总记录数 -->
						<li style="padding:6px 12px 6px 0px;border:1px solid transparent;float:left">
							<strong id="totalCount">28</strong>条记录
						</li>
						<!-- 生成首页，上一页，下一页，尾页 -->
						<li><a class="firstPage">首页</a></li>
						<li><a title="上一页" class="upperPage">&laquo;</a></li>
						<li><a title="下一页" class="nextPage">&raquo;</a></li>
						<li><a class="lastPage">尾页</a></li>
						<!-- 生成跳转页面文本框 -->
						<li><a style="padding:0px">
							<input type="number" id="pageSelect" name="pageSelect" class="form-control"  style='width:60px;margin:0px;border:none;height:30px' />
						</a></li>
						<li><a class="jump">跳转</a></li>
					</ul>
				</nav>
        	</div>
    	</div>
	</form>
</div>