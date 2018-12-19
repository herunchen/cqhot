<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="page-header">
        <div class="page-title">
            <h3>城市</h3>
            <ol class="breadcrumb">
			  <li>资源管理</li>
			  <li>旅游资源</li>
			  <li class="active">城市</li>
			</ol>
        </div>
    </div>
    <form method="post"  id="cityListForm">
	<div class="row page-search">
		<div class="col-md-12">
			<ul class="list-inline">
				<li><input type="text" class="form-control" name="countryName" placeholder="国家名称" ></li>
				<li><input type="text" class="form-control" name="id" placeholder="城市编码" ></li>
				<li><input type="text" class="form-control" name="name" placeholder="城市名称" ></li>
				<li>
					<button type="button" class="btn btn-primary O1">查询</button>
				</li>
				<li>
					<button type="button" id="btn_add" class="btn btn-success O2">新增</button>
				</li>
			</ul>
		</div>		
	</div>
	<div class="row">
       <div class="col-md-12">         
           <table class="table table-bordered" style="margin-top:5px;">
               <thead>
               <tr>
                   <th data-align="center">城市编码</th>
                   <th data-align="center">国家名称</th>
                   <th data-align="center" data-width="150">中文名称</th>
                   <th data-align="center" data-width="150">英文名称</th>
                   <th data-align="center" data-width="150">拼    音</th>
                   <th data-align="center">是否首都</th>
                   <th data-align="center">是否可用</th>
                   <th data-align="center" data-width="120">操作</th>
               </tr>
               </thead>
               <tbody>
                  <tr>
                      <td>CITY000002</td>
                      <td>阿尔巴尼亚</td>
                      <td>地拉那 </td>
                      <td>Tirana</td>
                      <td>DI LA NA</td>
                  	  <td>否 </td>
                      <td>启用 </td>
                      <td>
                          <a class="updateCity">修改</a>&nbsp;
                          <a class="changeState">禁用</a>
                      </td>
                  </tr>
                  <tr>
                      <td>CITY000004</td>
                      <td>阿根廷</td>
                      <td>布宜诺斯艾利斯</td>
                      <td>Buenos Aires</td>
                      <td>BU YI NUO SI AI LI SI</td>
                  	   <td>是</td>
                      <td>禁用 </td>
                      <td>
                          <a class="updateCity">修改</a>&nbsp;
                          <a class="changeState">启用</a>
                      </td>
                  </tr>
                  <tr>
                      <td>CITY000005</td>
                      <td>阿联酋</td>
                      <td>阿布扎比</td>
                      <td>Abu Dhabi</td>
                      <td>A BU ZHA BI</td>
                  	   <td>是</td>
                      <td>	启用</td>
                      <td>
                          <a class="updateCity">修改</a>&nbsp;
                          <a class="changeState">禁用</a>
                      </td>
                  </tr>
                 <tr>
                     <td>CITY000007</td>
                     <td>阿塞拜疆</td>
                     <td>巴库 </td>
                     <td>Baku</td>
                     <td>BA KU</td>
                 	   <td>否 </td>
                     <td>启用</td>
                     <td>
                         <a class="updateCity">修改</a>&nbsp;
                         <a class="changeState">禁用</a>
                     </td>
                 </tr>
                 <tr>
                     <td>CITY000008</td>
                     <td>埃及</td>
                     <td>开罗</td>
                     <td>Cairo</td>
                     <td>KAI LUO</td>
                 	   <td>是</td>
                     <td>启用</td>
                     <td>
                         <a class="updateCity">修改</a>&nbsp;
                         <a class="changeState"> 禁用</a>
                     </td>
                 </tr>
                 <tr>
                     <td>CITY000009</td>
                     <td>埃塞俄比亚</td>
                     <td>亚的斯亚贝巴</td>
                     <td>Addis Ababa</td>
                     <td>YA DE SI YA BEI BA</td>
                 	   <td>	是</td>
                     <td>启用</td>
                     <td>
                         <a class="updateCity">修改</a>&nbsp;
                         <a class="changeState">禁用</a>
                     </td>
                 </tr>
                 <tr>
                     <td>CITY000010</td>
                     <td>爱尔兰</td>
                     <td>都柏林</td>
                     <td>Dublin</td>
                     <td>DOU BAI LIN</td>
                 	   <td>是</td>
                     <td>启用</td>
                     <td>
                         <a class="updateCity">修改</a>&nbsp;
                         <a class="changeState">  禁用</a>
                     </td>
                 </tr>
	              <tr>
	                  <td>CITY000011</td>
	                  <td>爱尔兰</td>
	                  <td>塔林</td>
	                  <td>Tallinn</td>
	                  <td>TA LIN</td>
	              	   <td>是</td>
	                  <td>启用</td>
	                  <td>
	                      <a class="updateCity">修改</a>&nbsp;
	                      <a class="changeState">禁用</a>
	                  </td>
	              </tr>
                  <tr>
                      <td>CITY000012</td>
                      <td>爱沙尼亚共和国</td>
                      <td>安道尔 </td>
                      <td>Andorra la Vella</td>
                      <td>AN DAO ER</td>
                  	   <td>	是</td>
                      <td>	启用</td>
                      <td>
                          <a class="updateCity">修改</a>&nbsp;
                          <a class="changeState">禁用</a>
                      </td>
                  </tr>
                  <tr>
                      <td>CITY000013</td>
                      <td>安哥拉</td>
                      <td>罗安达 </td>
                      <td>Luanda</td>
                      <td>LUO AN DA</td>
                  	   <td>是</td>
                      <td>启用</td>
                      <td>
                          <a class="updateCity">修改</a>&nbsp;
                          <a class="changeState">禁用 </a>
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
<c:url var="url" value="/js/travelresource/cityManageList.js"></c:url>
<script type="text/javascript" src="${url}"></script>