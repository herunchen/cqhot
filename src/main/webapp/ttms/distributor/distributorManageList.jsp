<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
li{
	margin-top:5px;
}
</style>
<div class="container" id="container_sub">
    <div class="page-header">
        <div class="page-title" style="padding-bottom: 5px">
            <h3> 分销商管理</h3>
            <ol class="breadcrumb">
            	<li>产品管理</li>
				<li>政策渠道</li>
				<li class="active">分销商管理</li>
           	</ol>
        </div>
    </div>
    <div class="row page-search">
            <div class="col-md-12">
                <ul class="list-inline">
                    <li>
                        <input type="text" class="form-control isNumber" placeholder="分销商编号" name="supplierId" id="supplierId">
                    </li>
                    <li>
                        <input type="text" class="form-control" placeholder="分销商名称" name="name" id="supplierName">
                    </li>
                    <li>
                        <input type="text" class="form-control" placeholder="国家" name="country" id="country">
                    </li>
                    <li>
                        <input type="text" class="form-control" placeholder="省份" name="province" id="province">
                    </li>
                    <li>
                        <input type="text" class="form-control" placeholder="城市" name="city" id="city">
                    </li>
                    <li><select name="valid" class="form-control" id="state">
                    	<option value="">请选择</option>
                        <option value="1">有效</option>
                        <option value="0">无效</option>
                    </select></li>

                    <li>
                        <button class="btn btn-primary O1" type="button" id="btn_search">查询</button>
                    </li>
					
                    <li>
                        <button class="btn btn-success O2" type="button">新增</button>
                    </li>
					
                </ul>
            </div>
    </div>
    
     <div class="row">
			<div class="col-md-12" id="listdiv">
				<table class="table table-bordered" style="width:100%;margin-top:5px;" id="guideTable">
					<thead>
					<tr>
						<th><input name="btSelectAll" type="checkbox"></th>
						<th>分销商编号</th>
						<th>简称</th>
						<th>分销商名称</th>
						<th>省市</th>
						<th>账户</th>
						<th>商品</th>
						<th>备忘录</th>
						<th>有效</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input data-index="0" name="btSelectItem" type="checkbox"></td>
						<td>11</td>
						<td>广顺国旅</td>
						<td>山东广顺国际旅行社</td>
						<td>山东</td>
						<td><a >2</a></td>
						<td><a >1</a></td>
						<td><a >备忘录</a></td>
						<td>启用</td>
						<td><a >禁用</a></td>
					</tr>
					<tr>
						<td><input data-index="1" name="btSelectItem" type="checkbox"></td>
						<td>12</td>
						<td>北京国旅</td>
						<td>北京国际旅行社</td>
						<td>北京</td>
						<td><a >1</a></td>
						<td><a >2</a></td>
						<td><a >备忘录</a></td>
						<td>启用</td>
						<td><a >禁用</a></td>
					</tr>
					<tr>
						<td><input data-index="2" name="btSelectItem" type="checkbox"></td>
						<td>13</td>
						<td>西安青旅</td>
						<td>西安青年旅行社</td>
						<td>西安</td>
						<td><a >1</a></td>
						<td><a >4</a></td>
						<td><a >备忘录</a></td>
						<td>启用</td>
						<td><a >禁用</a></td>
					</tr>
				</tbody>
			</table>
			<nav class="pull-right" id="pagination">
					<ul class="pagination">
						<!-- 当前页/共多少页 -->
						<li style="padding:6px 12px;border:1px solid transparent;float:left">
							<strong id="currentPage">1/2</strong>页
						</li>
						<!-- 总记录数 -->
						<li style="padding:6px 12px 6px 0px;border:1px solid transparent;float:left">
							<strong id="totalCount">11</strong>条记录
						</li>
						<!-- 生成首页，上一页，下一页，尾页 -->
						<li style="display: none;"><a class="firstPage">首页</a></li>
						<li style="display: none;"><a title="上一页" class="upperPage">«</a></li>
						<li><a title="下一页" class="nextPage">»</a></li>
						<li><a class="lastPage">尾页</a></li>
						<!-- 生成跳转页面文本框 -->
						<li><a style="padding:0px">
							<input type="number" id="pageSelect" name="pageSelect" class="form-control" style="width:60px;margin:0px;border:none;height:30px">
						</a></li>
						<li><a class="jump">跳转</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
