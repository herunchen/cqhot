<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="page-header">
	  <div class="page-title" style="padding-bottom: 5px">
           <h3>产品分类</h3>
           <ol class="breadcrumb">
		  <li>产品管理</li>
		  <li>产品</li>
		  <li class="active">产品分类</li>
		</ol>
       </div>
	</div>
	<div class="row">
        <div class="col-md-4">
        	<form id="productCategoryOneForm">
	            <div class="panel panel-default">
	                <div class="panel-heading">主分类</div>
	                <div class="panel-body topClass">
	                    <button type="button" class="btn-link btn_add">新增</button>
	                    <button type="button" class="btn-link btn_update">修改</button>
	                    <button type="button" class="btn-link O4 btn_del">删除</button>
	                    <table class="table table-bordered" id="topCategoryTable">
	                        <thead>
	                        <tr>
	                            <th>名称</th>
	                        </tr>
	                        </thead>
	                    </table>
	                </div>
	            </div>
            </form>
        </div>
        <div class="col-md-4" style="display:none" id="secondCategoryDiv">
        	<form id="productCategoryTwoForm">
            	<div class="panel panel-default">
	                <div class="panel-heading">次分类</div>
	                <div class="panel-body secondClass">
	                    <button type="button" class="btn-link btn_add">新增</button>
	                    <button type="button" class="btn-link btn_update">修改</button>
	                   	<button type="button" class="btn-link O4 btn_del">删除</button>
	                    <table class="table table-bordered" id="secondCategoryTable">
	                        <thead>
	                        <tr>
	                            <th>名称</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        </tbody>
	                    </table>
	                </div>
            	</div>
            </form>
        </div>
        <div class="col-md-4" style="display:none" id="thirdCategoryDiv">
        	<form id="productCategoryThreeForm">
	            <div class="panel panel-default">
	                <div class="panel-heading">子分类</div>
	                <div class="panel-body thirdClass">
	                    <button type="button" class="btn-link btn_add">新增</button>
	                    <button type="button" class="btn-link btn_update">修改</button>
	                    <button type="button" class="btn-link O4 btn_del">删除</button>
	                    <table class="table table-bordered " id="thirdCategoryTable">
	                        <thead>
	                        <tr>
	                            <th>名称</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
			</form>
        </div>
    </div>
    <!-- 添加产品分类模态框 -->
     <div class="modal fade" id="addClassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="classForm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">分类名称：</label>
                            <div class="col-sm-10">
                                <input type="text" placeholder="分类名称" class="form-control" id="className">
                            </div>
                        </div>
                    </form>
                    <div class="row">
						<div class="col-md-12">
							<div class="form-group">
					    		<div class="col-md-offset-5 col-md-10">
					      			<button type="button" class="btn btn-primary" id="btn_save">保存</button>
					    		</div>
			  				</div>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:url var="url" value="/js/product/productCategory.js"></c:url>
<script type="text/javascript" src="${url }"></script>
