<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" id="container_sub">
    <div class="page-header">
        <div class="page-title" style="padding-bottom: 5px">
            <h3> 供应商管理</h3>
            <ol class="breadcrumb">
            	<li>资源管理</li>
				<li>供应商</li>
				<li class="active">供应商管理</li>
            </ol>
        </div>
    </div>
    <div class="row page-search">
            <div class="col-md-12">
                <ul class="list-inline">
                    <li>
                        <input type="text" class="form-control isNumber" placeholder="编号" name="supplierId" id="supplierId">
                    </li>
                    <li>
                        <select name="indCatg" class="form-control"
					id="indCatg">
						<option value="">请选择类别</option>
						<option value="A">农、林、牧、渔业</option>
						<option value="B">采矿业</option>
						<option value="C">制造业</option>
						<option value="D">电力、热力、燃气及水生产和供应业</option>
						<option value="E">建筑业</option>
						<option value="F">批发和零售业</option>
						<option value="G">交通运输、仓储和邮政业</option>
						<option value="H">住宿和餐饮业</option>
						<option value="I">信息传输、软件和信息技术服务业</option>
						<option value="J">金融业</option>
						<option value="K">房地产业</option>
						<option value="L">租赁和商务服务业</option>
						<option value="M">科学研究和技术服务业</option>
						<option value="N">水利、环境和公共设施管理业</option>
						<option value="O">居民服务、修理和其他服务业</option>
						<option value="P">教育</option>
						<option value="Q">卫生和社会工作</option>
						<option value="R">文化、体育和娱乐业</option>
						<option value="S">公共管理、社会保障和社会组织</option>
						<option value="T">国际组织</option>
				</select>
				</li>
                    <li>
                        <select name="acctPeriod" class="form-control" id="acctPeriod">
                            <option value="">请选择账期</option>
                            <option value="1">周结</option>
                            <option value="0">月结</option>
                        </select>
                    </li>
                    <li>
                        <input type="text" class="form-control" placeholder="名称" name="name" id="supplierName">
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
                        <button type="button" class="btn btn-primary O1" id="btn_search">查询</button>
                    </li>
                    <li>
                        <button type="button" class="btn btn-success O2">新增</button>
                    </li>
					
                </ul>
            </div>
    </div>
    <div class="row">
        <div class="col-md-12">
			<table class="table table-bordered" style="width:100%" id="distriTable">
				<thead>
					<tr>
						<th>编号</th>
						<th>类别</th>
						<th>名称</th>
						<th>账期</th>
						<th>国家地区</th>
						<th>省份</th>
						<th>城市</th>
						<th>有效</th>
						<th data-align="center" data-width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>4</td>
						<td>租赁和商务服务业</td>
						<td><a class="selectSupplierByName">海南国内旅行社</a></td>
						<td>月结</td>
						<td>中国</td>
						<td>海南</td>
						<td>三亚</td>
						<td>有效</td>
						<td>
							<a class="btn btn-default btn-xs updateSupplierById">修改</a>
							<a class="btn btn-default btn-xs changeState">禁用</a>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td>电力、热力、燃气及水生产和供应业</td>
						<td><a class="selectSupplierByName">北京能源有限公司</a></td>
						<td>月结</td>
						<td>中国</td>
						<td>北京</td>
						<td>西城区</td>
						<td>有效</td>
						<td>
							<a class="btn btn-default btn-xs updateSupplierById">修改</a>
							<a class="btn btn-default btn-xs changeState">禁用</a>
						</td>
					</tr>
					<tr>
						<td>10</td>
						<td>电力、热力、燃气及水生产和供应业</td>
						<td><a class="selectSupplierByName">康师傅有限公司</a></td>
						<td>周结</td>
						<td>中国</td>
						<td>北京</td>
						<td>东城区</td>
						<td>有效</td>
						<td>
							<a class="btn btn-default btn-xs updateSupplierById">修改</a>
							<a class="btn btn-default btn-xs changeState">禁用</a>
						</td>
					</tr>
					<tr>
						<td>11</td>
						<td>制造业</td>
						<td><a class="selectSupplierByName">北京神州帽业有限公司</a></td>
						<td>月结</td>
						<td>中国</td>
						<td>北京</td>
						<td>朝阳区</td>
						<td>有效</td>
						<td>
							<a class="btn btn-default btn-xs updateSupplierById">修改</a>
							<a class="btn btn-default btn-xs changeState">禁用</a>
						</td>
					</tr>
					<tr>
						<td>12</td>
						<td>交通运输、仓储和邮政业</td>
						<td><a class="selectSupplierByName">北京顺达客运有限公司</a></td>
						<td>月结</td>
						<td>中国</td>
						<td>北京</td>
						<td>丰台区</td>
						<td>有效</td>
						<td>
							<a class="btn btn-default btn-xs updateSupplierById">修改</a>
							<a class="btn btn-default btn-xs changeState">禁用</a>
						</td>
					</tr>
				</tbody>
			</table>
			<nav class="pull-right" id="pagination">
				<ul class="pagination">
					<!-- 当前页/共多少页 -->
					<li style="padding:6px 12px;border:1px solid transparent;float:left">
						<strong id="currentPage">1/1</strong>页
					</li>
					<!-- 总记录数 -->
					<li style="padding:6px 12px 6px 0px;border:1px solid transparent;float:left">
						<strong id="totalCount">5</strong>条记录
					</li>
					<!-- 生成首页，上一页，下一页，尾页 -->
					<li style="display: none;"><a class="firstPage">首页</a></li>
					<li style="display: none;"><a title="上一页" class="upperPage">«</a></li>
					<li style="display: none;"><a title="下一页" class="nextPage">»</a></li>
					<li style="display: none;"><a class="lastPage">尾页</a></li>
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