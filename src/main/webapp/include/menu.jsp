<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	//获取一级菜单
	$(document).ready(
		function() {
			getAjax("/getMenu", "parentId=&level=1",
				function(data) {
					var fristTag = "false";
					for ( var key in data) {
						
						if (fristTag == "false") {
							fristTag = "true";
							getChild(data[key].id);
						}
						var li = $("<li></li>");
						li.value = data[key].id;
						li.name = data[key].id;
						var a = "";
						if(isEmpty(data[key].iconName))
						{
							a = "<a href='javascript:void(0);'";
							a = a + " onclick= getChild('" + data[key].id + "') >" + data[key].name + "</a>";
						}
						else
						{
							a = "<a href='javascript:void(0);'";
							a = a + " onclick= getChild('" + data[key].id + "') > <span class='" + data[key].iconName + "' style='font-size: 16px'></span></a>";
						}
						li.append(a);
						$(".navbar-left").append(li);
					}

				}, "get");
		});
	
	//获取子菜单
	function getChild(parentId) {
		$("#sidebar-content").html("");
		getAjax("/getMenu",
				"parentId="+parentId+"&level=2",
				function(data) {
					var temp = "false";
					for ( var key in data) {
						if (temp == "false") {
							var ulLevel1 = $("<ul id='nav' name='nav' class='dashboard'></ul>");
							temp = "true";
						}
						
						if (data[key].level == '2' && data[key].parentId == parentId) {
						    // 二级菜单
							var liLevel2 = $("<li></li>");
							var level2Id = data[key].id;
							var level2Name = data[key].name;
							var level2IconName = data[key].iconName;
							var level2Target = data[key].target;
							var level2Url = data[key].url;
							
							//定义三级菜单
							var ulLevel2 = $("<ul class='sub-menu'></ul>");
							var level3Exist = false;
							getAjax("/getMenu","parentId="+level2Id+"&level=3",function(data){
								for ( var key in data) {
									if (data[key].level == 3 && data[key].parentId == level2Id) {
										level3Exist = true;
										var liLevel3 = $("<li></li>");
										var menuName = data[key].name;
										var a = $("<a href='"+data[key].url + "' class=' nav-item ' ><i class ='" + data[key].iconName + "'></i></a>");
										a.append(menuName);
										liLevel3.append(a);
										ulLevel2.append(liLevel3);
									}
								}
							});

							if(level3Exist)
							{
								var a = $("<a href='javascript:void(0);'>"
										+ "<i class='" + level2IconName + "' ></i>"
										+ level2Name + "</a>");
								liLevel2.append(a);
								liLevel2.append(ulLevel2);
							}
							else
							{
								var a = $("<a href='" + level2Url + "' class='nav-item'>"
										+ "<i class='" + level2IconName + "' ></i>"
										+ level2Name + "</a>");
								liLevel2.append(a);
							}
						}
						ulLevel1.append(liLevel2);
						$("#sidebar-content").append(ulLevel1);

					}
					App.init();
					$('#nav').on('click', '.nav-item', function(){
						var a = $(this);
						$('#nav .nav-item').removeClass('active');
						a.addClass('active');
						var url = a.attr('href');
						$('#content').load(url, formSubmitAgent);
						return false;
					});
				}, "get");
	}
	/*
	* 代理用户表单请求，将表单请求转换为 Ajax 请求
	*/
	function formSubmitAgent(){
		var form=$('#content form');
		console.log(form);
		form.submit(function(){
			var frm = $(this);
			var data = frm.serialize();
			var url = frm.attr('action');
			console.log(data);
			console.log(url);
			//var method = frm.attr('method').toLowerCase();
			$.post(url, data, function(page){
				$('#content').html(page);
				formSubmitAgent();
			}, 'html');
			//$('#content').load(url, data, formSubmitAgent);
			return false;
		});
	}
	
</script>

<%-- class="theme-dark"--%>
<header class="header navbar navbar-fixed-top" role="banner">
	<div class="container">

		<a class="navbar-brand" href="../index.jsp"><strong><img src="/img/logo.png" alt="logo" /> 旅游管理系统 </strong> </a>

		<ul class="nav navbar-nav navbar-left hidden-xs hidden-sm" id="topMenu">
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown hidden-xs hidden-sm">
			    <a href="javascript:void(0);" onclick="getChild('0002')" class="dropdown-toggle"> <i class="icon-envelope"> </i> <span class="badge"> 1 </span></a>

			
			</li>
			<li class="dropdown user">
			    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
			        <i class="icon-male"> </i>
			            <span class="username"> ${sessionScope.user.name }</span>
			        <i class="icon-caret-down small"> </i>
			    </a>
				<ul class="dropdown-menu">
					<li><a href="#"> 修改密码 </a></li>
					<li class="divider"></li>
					<li><a href="../login.jsp"> <i class="icon-key"> </i> 退出 </a></li>
				</ul>
			</li>
		</ul>
	</div>
</header>
