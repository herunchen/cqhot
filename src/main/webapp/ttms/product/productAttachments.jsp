<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="attachmentContainer">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3>产品附件</h3>
			<ol class="breadcrumb">
				<li>产品管理</li>
				<li>产品</li>
				<li>产品列表</li>
				<li class="active">产品附件</li>
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
	   </form>
	   <div class="row">
	    	<div class="col-md-12">
	    		<ul class="list-inline" style="line-height: 40px">
	                <li>
                    	 <button type="button" class="btn btn-primary btn_add">添加附件</button>
                	</li>
            	</ul>
            </div>
       </div>
       <div class="row">
       	<div class="col-md-12">
            <table class="table table-bordered " id="productAttachmentsTable">
               <thead>
                <tr>
                    <th>标题</th>
                    <th>文件名</th>
                    <th>上传时间</th>
                    <th>上传用户</th>
                    <th>操作</th>
                </tr>
               </thead>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="addAttachmentDialog" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
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
			   		<form  method="post"  class="form-horizontal" id="prodAttachmentForm">
			       	  <div class="form-group">
			           <label class="col-md-2 control-label">标题：</label>
			           <div class="col-md-10">
			               <input type="text" class="form-control dynamicClear required " placeholder="文件标题" size="10" id="title">
			           </div>
			       </div>
			       <div class="form-group">
			           <label class="col-md-2 control-label">文件：</label>
			           <div class="col-md-10">
			           		<input type="file" class="dynamicClear required" id="prodFile" name="prodFile" />
			           </div>
			       </div>
			       <div class="form-group">
			           <label class="col-md-2 control-label"></label>
			           <div class="col-md-offset-2 col-md-10">
			               <button type="button" class="btn btn-primary btn_upload" id="btn_upload">上传</button>
			           </div>
			       </div>
			   	</form>
			   	</div>
   			</div>
           </div>
       </div>
    </div>
</div>
<c:url var="url" value="/js/product/productAttachments.js"></c:url>
<script type="text/javascript" src="${url }"></script>