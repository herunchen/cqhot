<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="page-header">
        <div class="page-title">
            <h3> 世界大洲</h3>
            <ol class="breadcrumb">
			  <li>资源管理</li>
			  <li>旅游资源</li>
			  <li class="active">世界大洲</li>
			</ol>
        </div>
    </div>
	<form method="post" id="worldListForm">
	<div class="row page-search">
		<div class="col-md-12">
			<ul class="list-inline">
				<li><input type="text" class="form-control" name="id" placeholder="大洲编码" ></li>
				<li><input type="text" class="form-control" name="name" placeholder="大洲名称" ></li>
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
               <tr align="center">
                   <th>大洲编码</th>
                   <th>拼音首字母</th>
                   <th>大洲名称</th>
                   <th>英文名称</th>
                   <th>拼音名称</th>
                   <th>国家（个）</th>
                   <th style="width:150px;height:38px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">大洲简介</th>
                   <th>是否可用</th>
                   <th>操作</th>
               </tr>
             </thead>
             <tbody>
              	<tr align="center">
                   <td>1</td>
                   <td>Y</td>
                   <td>亚洲</td>
                   <td>Asia</td>
                   <td>YA ZHOU</td>
                   <td>10</td>
                   <td>面积4400万平方千米，约占世界陆地总面积的29.4%，是世界第一大洲。共有48个国家和地区。人口32.29亿，约占世界总人口的60%，居世界第一位。</td>
                   <td>	启用</td>
                   <td>
                       <a class="updateContinent">修改</a>&nbsp;
                       <a class="changeState"> 禁用</a>
                   </td>
               </tr>
               <tr align="center">
                   <td>2</td>
                   <td>F</td>
                   <td>非洲</td>
                   <td>Afrika</td>
                   <td>FEI ZHOU </td>
                   <td>20</td>
                   <td>面积约3000万平方千米，约占世界陆地总面积的20.2%，是世界第二大洲。共有56个国家和地区。人口6.62亿，占世界总人口的12.3%，居世界第三位。</td>
                   <td>启用</td>
                   <td>
                       <a class="updateContinent">修改</a>&nbsp;
                       <a class="changeState">  禁用</a>
                   </td>
               </tr>
               <tr align="center">
                   <td>3</td>
                   <td>B</td>
                   <td>北美洲</td>
                   <td>North America</td>
                   <td>BEI MEI ZHOU</td>
                   <td>30</td>
                   <td>面积约2400万平方千米，约占世界陆地总面积的16.2%，是世界第三大洲。共有37个国家和地区。人口4.32亿，约占世界总人口的8.1%，居世界第四位。</td>
                   <td>启用</td>
                   <td>
                       <a class="updateContinent">修改</a>&nbsp;
                       <a class="changeState">  禁用</a>
                   </td>
               </tr>
               <tr align="center">
                   <td>4</td>
                   <td>N</td>
                   <td>南美洲</td>
                   <td>South America</td>
                   <td>NAN MEI ZHOU</td>
                   <td>50</td>
                   <td>面积约1800万平方千米，约占世界陆地总面积的12%，是世界第四大洲。共有13个国家和地区。人口3.02亿，约占世界总人口的5.6%，居世界第五位。</td>
                   <td>	启用</td>
                   <td>
                       <a class="updateContinent">修改</a>&nbsp;
                       <a class="changeState">禁用</a>
                   </td>
               </tr>
               <tr align="center">
                   <td>5</td>
                   <td>N</td>
                   <td>南极洲</td>
                   <td>Antarctica</td>
                   <td>NAN JI ZHOU</td>
                   <td>10</td>
                   <td>面积1400万平方千米，约占世界陆总面积的9.4%，是世界第五大洲。南极洲仅有一些来自其它大陆的科学考察人员和捕鲸队，无定居居民。</td>
                   <td>禁用 </td>
                   <td>
                       <a class="updateContinent">修改</a>&nbsp;
                       <a class="changeState">启用</a>
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
<c:url var="url" value="/js/travelresource/continentManageList.js"></c:url>
<script type="text/javascript" src="${url}"></script>