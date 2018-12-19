<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3>库存分销</h3>
			<ol class="breadcrumb">
				<li>产品管理</li>
				<li>产品</li>
				<li>产品列表</li>
				<li class="active">库存分销</li>
			</ol>
		</div>
	</div>
	<form method="post" class="form-horizontal" id="viewProductForm" >
		<div class="row" >
			<div class="col-md-12">
				<div class="form-group">
					<label class="col-md-2 control-label">产品编号:</label>
					<div class="col-md-4">
						<p id="prodId" class="form-control-static"></p>
					</div>
					<label class="col-md-2 control-label">产品名称:</label>
					<div class="col-md-4">
						<p id="prodName" class="form-control-static"></p>
					</div>
				</div>
				<div class="form-group">
 					<label class="col-md-2 control-label">产品负责人:</label>
					<div class="col-md-4">
						<p id="director" class="form-control-static"></p>
					</div>
					<label class="col-md-2 control-label">服务日期:</label>
					<div class="col-md-4">
						<p id="serverDate" class="form-control-static"></p>
					</div>
				</div>
				<div class="form-group">
					
					<label class="col-md-2 control-label">价格信息:</label>
					<div class="col-md-4">
						<p id="price" class="form-control-static"></p>
					</div>
					<label class="col-md-2 control-label">状态:</label>
					<div class="col-md-4">
						<p id="state" class="form-control-static"></p>
					</div>
				</div>
			</div>
	    </div>
	    <div class="row">
	    	<div class="col-md-12">
	    		<ul class="list-inline" style="line-height: 40px">
	                <li>
	                    <button type="button" class="btn btn-success" id="btn_add">添加分销商</button>
	                </li>
	                <li>库存数量: <label id="quantity"></label></li>
	                <li>已分配数量: <label id="distQtyTotal"></label></li> 
	                <li>剩余数量: <label id="leftQty"></label></li>
            	</ul>
            </div>
       </div>
    </form>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered" id="prodDistTable">
                <thead>
                <tr>
                    <th>分销商编号</th>
                    <th>分销商名称</th>
                    <th>分配数量</th>
                    <th>销售开始日期</th>
                    <th>销售终止日期</th>
                    <th>操作</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="prodDistDialog" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"  role="document">
        <div class="modal-content">
            <div class="modal-header" >
                <button type="button" class="close" data-dismiss="modal" id="closeDialog">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body" >
            	<div class="row">
			   	  <div class="col-md-12">
			   		<form  method="post"  class="form-horizontal" id="prodDistForm">
			       <div class="form-group">
			           <label class="col-md-2 control-label">分销商</label>
			           <div class="col-md-10">
			               <ul class="list-inline">
			                   <li>
			                       <select id="distId" class="form-control dynamicClear required" style="width: 300px">
			                           <option value="">选择分销商</option>
			                       </select>
			                   </li>
			               </ul>
			           </div>
			       </div>
			       <div class="form-group">
			           <label class="col-md-2 control-label"><span style="color:red">*</span>分配数量</label>
			           <div class="col-md-10">
			           		<ul class="list-inline">
			                   <li>
			                       <input type="number" class="form-control dynamicClear required" style="width: 100px" id="distQty" min="0">
			                   </li>
			                   <li>
			                       <span class="form-control-static" id="message"></span>
			                   </li>
			               </ul>
			           </div>
			       </div>
			       <div class="form-group">
			           <label class="col-md-2 control-label"><span style="color:red">*</span>销售日期</label>
			           <div class="col-md-10">
			               <ul class="list-inline">
			                   <li>
			                       <input type="text" class="form-control dynamicClear datepicker dateISO required " placeholder="开始日期" size="10" id="beginDate">
			                   </li>
			                   <li> ~ </li>
			                   <li>
			                       <input type="text" class="form-control dynamicClear datepicker dateISO required " placeholder="终止日期" size="10" id="endDate">
			                   </li>
			               </ul>
			           </div>
			       </div>
			       <div class="form-group">
			           <label class="col-md-2 control-label"></label>
			           <div class="col-md-10">
			               <button type="button" class="btn btn-primary" id="btnConfirm">确定</button>
			           </div>
			       </div>
			   	</form>
			   	</div>
   			</div>
           </div>
       </div>
    </div>
</div>
<script type="text/javascript">
	initUiComponment();
</script>
<c:url var="url" value="/js/product/productInventDist.js"></c:url>
<script type="text/javascript" src="${url }"></script>
