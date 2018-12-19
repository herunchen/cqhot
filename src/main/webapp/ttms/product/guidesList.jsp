<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row page-search">
		<div class="col-md-12">
			<ul class="list-inline">
				<li style="margin-top:5px"><input type="text" class="form-control" placeholder="导游姓名" name="name" id="name" ></li>
				<li style="margin-top:5px"><input type="text" class="form-control"	placeholder="联系方式" name="contact" id="contact"></li>
				<li style="margin-top:5px"><input type="text" class="form-control" placeholder="熟悉语言"	name="language"  id="language"></li>
				<li style="margin-top:5px"><input type="text" class="form-control" placeholder="国籍"	name="country" id="country" ></li>
				<li style="margin-top:5px">
					<button class="btn btn-primary O1" type= "button" name="btn_search" id="btn_search">查询</button>
				</li>
			</ul>
		</div>
		</div>
	<div class="row">
   	  <div class="col-md-12">
	   	  <table style="margin-top:5px" class="table table-bordered " id="guidesListTable">
              <thead>
               <tr>
               	<th data-checkbox="true"></th>
                   <th>导游编号</th>
                   <th>姓名</th>
                   <th>英文名</th>
                   <th>性别</th>
                   <th>邮箱</th>
                   <th>语言</th>
                   <th>国籍</th>
                   <th>联系方式</th>
                   <th>备注</th>
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
</div>
<c:url var="url" value="/js/product/guidesList.js"></c:url>
<script type="text/javascript" src="${url }"></script>