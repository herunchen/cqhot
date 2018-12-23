<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<%@ include file="include/front_inc.jsp"%>

<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/main.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/responsive.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/icons.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/login.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/assets/css/fontawesome/font-awesome.min.css">
<!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
<![endif]-->
<!--[if IE 8]>
    <link href="assets/css/ie8.css" rel="stylesheet" type="text/css"/>
<![endif]-->

<script type="/text/javascript" src="assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="/text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="/text/javascript" src="assets/js/libs/lodash.compat.min.js"></script>
<!--[if lt IE 9]>
    <script src="assets/js/libs/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript" src="/plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript" src="/plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="plugins/nprogress/nprogress.js"></script>
<script type="text/javascript" src="/js/cookie_util.js"></script>

<style type="text/css">
body {
	background-image: url("../img/login-bg.jpg");
	background-position: center;
	background-repeat: no-repeat;
	-moz-background-size: cover;
	-o-background-size: cover;
	-webkit-background-size: cover;
	background-size: cover;
	padding-top: 130px !important;
}

.box {
	background-color: transparent !important;
	background-image: url(../img/lgbx-bg-b27.png);
}

.form-actions {
	background-color: transparent !important;
	color: white;
}

.checkbox {
	cursor: pointer;
}
</style>


</head>

<body class="login">
	<div class="logo">
		<small style="color: white; font-size: 24px;">重庆热旅游产品管理系统</small>
	</div>
	<div class="box">
		<div class="content">
			<form method="post" action="/user/login"
				class="form-vertical login-form" name="loginForm" id="loginForm">
				<h3 class="form-title" style="color: white;">登 录</h3>

				<div class="form-group">
					<div class="input-icon">
						<i class="icon-user"> </i> <input type="text" id="username"
							name="username" class="form-control" placeholder="用户名"
							autofocus="autofocus" maxlength="20" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="input-icon">
						<i class="icon-lock"> </i> <input type="password" id="password"
							name="password" class="form-control" placeholder="密码" />
					</div>
				</div>
				<span id="login_msg" style="color: red">${errorMsg}</span>



				<div class="form-actions">
					<label class="checkbox pull-left">
						<div class="checker">
							<div class="checker">
								<span><input type="checkbox" class="uniform"
									id="ck_rmbUser"></span>
							</div>
						</div><span style="vertical-align: bottom;">记住密码</span>
					</label>
					<button type="button" class="submit btn btn-primary pull-right"
						id="btnLogin">
						登录 <i class="icon-angle-right"> </i>
					</button>
				</div>
			</form>
		</div>

	</div>
</body>
<script type="text/javascript">
	$(":radio.uniform, :checkbox.uniform").uniform();
</script>
<script type="text/javascript">
	document.getElementById("btnLogin").enable = "false";
	$(function() {
		$("#btnLogin").click(function() {
			$('#login_msg').empty();
			//点击登录时 ，将输入的用户名和密码保存到Cookie中
			var inUser = document.getElementById("username").value;
			var inPass = document.getElementById("password").value;
			if (inUser == '' || inPass == '') {
				$('#login_msg').empty().append("请输入用户名密码");
				return;
			}

			//不能将明文密码保存在cookie中，不安全
			//setCookie('cookUser', inUser, time, '/');//set 获取用户名和密码 传给cookie
			//setCookie('cookPass', inPass, time, '/');
			alert(inUser);
			alert(inPass);
			$("#loginForm").submit();
		})
		//回车按钮
		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#btnLogin").trigger("click");
			}
		});
	});

	function getCookieValue(name) {
		var name = escape(name);
		//读cookie属性，这将返回文档的所有cookie   
		var allcookies = document.cookie;
		//查找名为name的cookie的开始位置   
		name += "=";
		var pos = allcookies.indexOf(name);
		//如果找到了具有该名字的cookie，那么提取并使用它的值   
		if (pos != -1) { //如果pos值为-1则说明搜索"version="失败   
			var start = pos + name.length; //cookie值开始的位置   
			var end = allcookies.indexOf(";", start); //从cookie值开始的位置起搜索第一个";"的位置,即cookie值结尾的位置   
			if (end == -1)
				end = allcookies.length; //如果end值为-1说明cookie列表里只有一个cookie   
			var value = allcookies.substring(start, end); //提取cookie的值   
			return unescape(value); //对它解码         
		} else
			return ""; //搜索失败，返回空字符串   
	}

	//设置Cookie保存时间
	var time = 0;
	$(document).ready(function() {
		//获取Cookie保存的用户名和密码
		var username = getCookieValue("cookUser");
		var password = getCookieValue("cookPass");
		//输入用户名 促发一个事件
		$("#username").keyup(function() {
			var userNow = $(this).val();
			if (userNow == username) { //判断现在输入的用户名  和 当时保存在cookie的用户名是否一致
				$("#password").val(password);//一致 则把 第一次 保存在cookie的密码 自动填入
			}
		});

		$("#ck_rmbUser").click(function() {//记住密码
			if ($(this).attr("checked") == 'checked') {
				time = 60 * 60 * 60;
			}
		});
	});
</script>
</html>