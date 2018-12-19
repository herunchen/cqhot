<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3>团号管理</h3>
			<ol class="breadcrumb">
				<li>产品管理</li>
				<li>团号</li>
				<li class="active">团号管理</li>
			</ol>
		</div>
	</div>
	<div class="row page-search">
		<div class="col-md-12">
			<ul class="list-inline">
				<li><input type="text" class="form-control" placeholder="团名称" id="teamName" ></li>
				<li><input type="text" class="form-control"	placeholder="项目名称"  id="prjName"></li>
				<li>
				   <select id="state" class="form-control">
						<option value="">状态</option>
						<option value="1">启用</option>
						<option value="0">禁用</option>
					</select>
				</li>
				<li>
					<button class="btn btn-success O1" type= "button" id="btn_search">查询</button>
				</li>
				<li>
					<button type="button" class="btn btn-success O3" id="btn_add">新增</button>
				</li>
			</ul>
		</div>
	</div>
	<div class="row">
   	  <div class="col-md-12">
	   	  <table style="margin-top:5px" class="table table-bordered " id="teamListTable">
              <thead>
               <tr>
                   <th>团名称</th>
                   <th>所属项目</th>
                   <th>负责人</th>
                   <th>负责人联系方式</th>
                   <th>团号说明</th>
                   <th>状态</th>
                   <th>操作</th>
               </tr>
              </thead>
         </table>
         <nav class="pull-right" id="pagination">
			<ul class="pagination">
				<!-- 当前页/共多少页 -->
				<li style="padding:6px 12px;border:1px solid transparent;float:left">
					<strong id="currentPage"></strong>页
				</li>
				<!-- 总记录数 -->
				<li style="padding:6px 12px 6px 0px;border:1px solid transparent;float:left">
					<strong id="totalCount"></strong>条记录
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
   	<!-- 添加团号模态框 -->
     <div class="modal fade" id="addTeamModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="teamForm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><i class="mandatory">*</i>团名称:</label>
                            <div class="col-sm-10">
                                <input type="text" placeholder="团名称" class="form-control required dynamicData" name="tName" id="tName">
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="col-sm-2 control-label"><i class="mandatory">*</i>所属项目:</label>
                            <div class="col-sm-10">
                                <select id="prjId" name="prjId" class="form-control required" >
                                	<option value="">所属项目</option>
                                </select>
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="col-sm-2 control-label"><i class="mandatory">*</i>负责人:</label>
                            <div class="col-sm-10">
                                <select name="managerId" id="managerId" class="form-control required">
                                	<option value="">负责人</option>
                                </select>
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="col-sm-2 control-label">团号说明:</label>
                            <div class="col-sm-10">
                                <textarea rows="5" name="note" id="note" class="form-control dynamicData"></textarea>
                            </div>
                        </div>
                    </form>
                    <div class="row">
						<div class="col-md-12">
							<div class="form-group">
					    		<div class="col-md-offset-5 col-md-10">
					      			<button type="button" class="btn btn-primary" id="btn_save"></button>
					    		</div>
			  				</div>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:url var="url" value="/js/team/teamManageList.js"></c:url>
<script type="text/javascript" src="${url }"></script>