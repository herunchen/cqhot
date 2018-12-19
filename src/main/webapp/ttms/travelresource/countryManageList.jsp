<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="page-header">
        <div class="page-title">
            <h3>国家地区</h3>
            <ol class="breadcrumb">
			  <li>资源管理</li>
			  <li>旅游资源</li>
			  <li class="active">国家地区</li>
			</ol>
        </div>	
    </div>
	<form method="post" name="countryListForm" id="countryListForm">
    <div class="row page-search">
        <div class="col-md-12">  
            <ul class="list-inline">
                <li>
                   <select name="continentId" id="continentId" class="form-control">
                        <option value="0">请选择大洲</option>
                        <option value="1">亚洲</option>
                        <option value="2">非洲</option>
                        <option value="3">北美洲</option>
                        <option value="4">南美洲</option>
                        <option value="5">南极洲</option>
                        <option value="6">欧洲</option>
                        <option value="7">大洋洲</option>
                        <option value="8">北极地区</option>
                    </select>
                </li>
                <li><input type="text" class="form-control" placeholder="国家编码" name="id" ></li>
                <li><input type="text" class="form-control" placeholder="国家名称" name="name" ></li>
                <li>
                    <button type="button" class="btn btn-primary O1"  id="btn_search">查询</button>
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
                    <th class="hide">国家编号</th>
                    <th>首字母</th>
                    <th>中文名称</th>
                    <th>英文名称</th>
                    <th>所属大洲</th>
                    <th>官方语言</th>
                    <th>货 币</th>
                    <th style="width:100px">时 区</th>
                    <th>国家代码</th>
                    <th>城市（个）</th>
                    <th>是否可用</th>
                    <th data-align="center" data-width="120">操作</th>
                </tr>
                </thead>
                <tbody>
					<tr>
				    	<td class="hide">CTRY001</td>
						<td align="center">A</td>
						<td align="center">阿尔巴尼亚</td>
						<td align="center">The Republic of Albania</td>
						<td align="center">非洲</td>
						<td align="center">阿尔巴尼亚语</td>
						<td align="center">印尼币</td>
						<td align="center">UTC+3</td>
						<td align="center">CTRY001</td>
						<td align="center">10</td>
						<td align="center">启用</td>
						<td align="center">
							<a class="updateCountry"> 修改</a> 
							<a class="changeState"> 禁用</a>    
						</td>
					</tr>
					<tr>
				    	<td class="hide">CTRY002</td>
						<td align="center">A</td>
						<td align="center">阿尔及利亚</td>
						<td align="center">Algeria</td>
						<td align="center">非洲</td>
						<td align="center">阿尔及利亚语</td>
						<td align="center">阿尔及利亚币</td>
						<td align="center">UTC+5</td>
						<td align="center">CTRY002</td>
						<td align="center">50</td>
						<td align="center">启用</td>
						<td align="center">
							<a class="updateCountry"> 修改</a> 
							<a class="changeState"> 禁用</a>    
						</td>
					</tr>
					<tr>
				    	<td class="hide">CTRY004</td>
						<td align="center">A</td>
						<td align="center">阿根廷</td>
						<td align="center">Argentina</td>
						<td align="center">非洲</td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center">CTRY004</td>
						<td align="center">10</td>
						<td align="center">启用</td>
						<td align="center">
							<a class="updateCountry"> 修改</a> 
							<a class="changeState"> 禁用</a>    
						</td>
					</tr>
					<tr>
				    	<td class="hide">CTRY005</td>
						<td align="center">A</td>
						<td align="center">阿联酋</td>
						<td align="center">The United Arab Emirates</td>
						<td align="center">非洲</td>
						<td align="center">阿拉伯语</td>
						<td align="center">阿联酋迪拉姆</td>
						<td align="center">UTC+4</td>
						<td align="center">CTRY005</td>
						<td align="center">10</td>
						<td align="center">启用</td>
						<td align="center">
							<a class="updateCountry"> 修改</a> 
							<a class="changeState"> 禁用</a>    
						</td>
					</tr>
					<tr>
				    	<td class="hide">CTRY006</td>
						<td align="center">A</td>
						<td align="center">阿塞拜疆</td>
						<td align="center">Azerbaijan</td>
						<td align="center">非洲</td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center">CTRY006</td>
						<td align="center">15</td>
						<td align="center">启用</td>
						<td align="center">
							<a class="updateCountry"> 修改</a> 
							<a class="changeState"> 禁用</a>    
						</td>
					</tr>
					<tr>
				    	<td class="hide">CTRY007</td>
						<td align="center">A</td>
						<td align="center">埃及</td>
						<td align="center">Egypt</td>
						<td align="center">非洲</td>
						<td align="center">阿拉伯语</td>
						<td align="center">埃及镑</td>
						<td align="center">UTC+2</td>
						<td align="center">CTRY007</td>
						<td align="center">15</td>
						<td align="center">启用</td>
						<td align="center">
							<a class="updateCountry"> 修改</a> 
							<a class="changeState"> 禁用</a>    
						</td>
					</tr>
					<tr>
				    	<td class="hide">CTRY008</td>
						<td align="center">A</td>
						<td align="center">埃塞俄比亚</td>
						<td align="center">Ethiopia</td>
						<td align="center">非洲</td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center">CTRY008</td>
						<td align="center">16</td>
						<td align="center">启用</td>
						<td align="center">
							<a class="updateCountry"> 修改</a> 
							<a class="changeState"> 禁用</a>    
						</td>
					</tr>
					<tr>
				    	<td class="hide">CTRY009</td>
						<td align="center">A</td>
						<td align="center">爱尔兰</td>
						<td align="center">Ireland</td>
						<td align="center">欧洲</td>
						<td align="center">爱尔兰语，英语</td>
						<td align="center">EUR</td>
						<td align="center">UTC+0(夏令时：UTC+1)</td>
						<td align="center">CTRY009</td>
						<td align="center">23</td>
						<td align="center">启用</td>
						<td align="center">
							<a class="updateCountry"> 修改</a> 
							<a class="changeState"> 禁用</a>    
						</td>
					</tr>
					<tr>
				    	<td class="hide">CTRY010</td>
						<td align="center">A</td>
						<td align="center">爱沙尼亚共和国</td>
						<td align="center">The Republic of Estonia</td>
						<td align="center">非洲</td>
						<td align="center">爱沙尼亚语</td>
						<td align="center"></td>
						<td align="center">UTC+2（夏时制UTC+3）</td>
						<td align="center">CTRY010</td>
						<td align="center">12</td>
						<td align="center">启用</td>
						<td align="center">
							<a class="updateCountry"> 修改</a> 
							<a class="changeState"> 禁用</a>    
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
<c:url var="url" value="/js/travelresource/countryManageList.js"></c:url>
<script type="text/javascript" src="${url}"></script>