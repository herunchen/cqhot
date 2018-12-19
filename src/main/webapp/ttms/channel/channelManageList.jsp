<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
li{
	margin-top:5px;
}
</style>
<div class="container" >
    <div class="page-header">
        <div class="page-title" style="padding-bottom: 5px">
            <h3>  渠道商资料管理</h3>
            <ol class="breadcrumb">
            	<li>分销管理</li>
				<li>渠道管理</li>
				<li class="active">渠道商资料管理</li>
            </ol>
        </div>
    </div>
    <div class="row page-search">
	        <div class="col-md-12">
	            <ul class="list-inline">
	                <li>
	                    <input type="text" class="form-control" name="id"  placeholder="渠道编号">
	                </li>
	                <li>
	                    <input type="text" class="form-control" name="name"  placeholder="渠道名称/简称">
	                </li>
	                <li>
	                    <select name="valid" class="form-control">
	                        <option >状态</option>
	                        <option value="1">启用</option>
	                        <option value="0">禁用</option>
	                    </select>
	                </li>
	                <li>
	                    <input type="text" class="form-control" name="mgrName"  placeholder="管理人">
	                </li>
	                <li>
	                    <button class="btn btn-primary" type="button">查询</button>
	                </li>
	                <li>
	                    <button type="button" class="btn btn-success" id="btn_add">新增</button>
	                </li>
	                <li>
	                    <button type="button" class="btn btn-primary" id="btn_channel_dept">渠道管理部门</button>
	                </li>
	                <li>
	                    <button type="button" class="btn btn-primary" id="btn_channel_manager">渠道管理人</button>
	                </li>
	            </ul>
	        </div>
    	</div>
    <div class="row">
			<div class="col-md-12" id="listdiv">
				<table class="table table-bordered" style="width:100%;margin-top:5px;" id="guideTable">
					<thead>
					<tr>
						<th data-checkbox="true"></th>
						<th>渠道代码</th>
						<th>渠道名称</th>
						<th>简称</th>
						<th>所属渠道商</th>
						<th>管理部门</th>
						<th>管理人</th>
						<th>省市</th>
						<th>账户</th>
						<th>商品</th>
						<th>有效</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
						<td>CHN-携程-1</td>
						<td><a class="viewChannelDetail">携程线上渠道</a></td>
						<td>携程</td>
						<td>携程旅游公司</td>
						<td>国内渠道商对接部</td>
						<td>赵鑫</td>
						<td>北京</td>
						<td><a class="channelAccount">2</a></td>
						<td><a class="channelGood">1</a></td>
						<td>启用</td>
						<td>
							<a class="updateChannel">修改</a>
							<a href="#">禁用</a>
						</td>
					</tr>
					<tr>
						<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
						<td>CHN-驴妈妈-12</td>
						<td><a class="viewChannelDetail">驴妈妈线上渠道</a></td>
						<td>驴妈妈</td>
						<td>驴妈妈网有限公司</td>
						<td>国内渠道商对接部</td>
						<td>赵鑫</td>
						<td>上海</td>
						<td><a class="channelAccount">1</a></td>
						<td><a class="channelGood">2</a></td>
						<td>启用</td>
						<td>
							<a class="updateChannel">修改</a>
							<a href="#">禁用</a>
						</td>
					</tr>
					<tr>
						<td><input name="btSelectItem" class="checkbox" type="checkbox"></td>
						<td>CHN-去哪儿-13</td>
						<td><a class="viewChannelDetail">去哪儿网线上渠道</a></td>
						<td>去哪儿</td>
						<td class="viewChannelDetail">去哪儿网有限公司</td>
						<td>国内渠道商对接部</td>
						<td>赵鑫</td>
						<td>西安</td>
						<td><a class="channelAccount">1</a></td>
						<td><a class="channelGood">4</a></td>
						<td>启用</td>
						<td>
							<a class="updateChannel">修改</a>
							<a href="#">禁用</a>
						</td>
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
<c:url var="url" value="/js/channel/channelManageList.js"></c:url>
<script type="text/javascript" src="${url }"></script>
