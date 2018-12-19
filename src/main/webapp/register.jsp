<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/front_inc.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=basePath%>/css/register.css" rel="stylesheet" type="text/css" />
<title>用户注册</title>
</head>
<body>
	<%@ include file="include/top.jsp"%>
	<div class="main-background">
		<div class="register-panel public-panel">
			<form method="post" action="saveRegister.do"  id="registerForm" name="registerForm" class="form-group form-horizontal">
				<div class="row">
					<div class="col-xs-12 col-md-8 form-panel">
						<div class="row input-block">
							<div class="col-xs-12 col-md-offset-6 col-md-6 has-feedback val-username"> <!-- has-success -->
              					<input type="text" name="userName" id="userName" class="form-control" placeholder="6~20位用户名"> 
              					<span class="glyphicon glyphicon-ok form-control-feedback hide"></span>
              					<span class="glyphicon glyphicon-remove form-control-feedback hide"></span>
              					<label class="control-label" for="userName"></label> 
              				</div>
						</div>
						<div class="row input-block">
							<div class="col-xs-12 col-md-offset-6 col-md-6 has-feedback val-pwd">
              					<input type="password" name="password" id="password" class="form-control" placeholder="6~20位密码"> 
              					<span class="glyphicon glyphicon-ok form-control-feedback hide"></span>
              					<span class="glyphicon glyphicon-remove form-control-feedback hide"></span>
              					<label class="control-label" for="password"></label> 
              				</div>
						</div>
						<div class="row input-block">
							<div class="col-xs-12 col-md-offset-6 col-md-6 has-feedback val-repwd">
              					<input type="password" id="repassword" class="form-control" placeholder="确认密码"> 
              					<span class="glyphicon glyphicon-ok form-control-feedback hide"></span>
              					<span class="glyphicon glyphicon-remove form-control-feedback hide" ></span>
              					<label class="control-label" for="repassword"></label> 
              				</div>
						</div>
						<div class="row input-block">
							<div class="col-xs-12 col-md-offset-6 col-md-6 has-feedback val-imgCode">
              					<input type="text" class="form-control" id="validycode" placeholder="图形验证码"> 
              					<span class="glyphicon glyphicon-ok form-control-feedback hide"></span>
              					<span class="glyphicon glyphicon-remove form-control-feedback hide"></span>
              					<label class="control-label" for="validycode"></label> 
              				</div>
						</div>
						<div class="row captcha-block">
							<div class="col-xs-6 col-sm-3 col-md-offset-6 col-md-4 captcha">
								<img id="captcha-image" class="captcha-image" src="generateVerifyCode.do" onclick="reloadImg()">
							</div>
							<div class="col-xs-3 col-md-2 captcha-btn">
								<a href="#" onClick="reloadImg()">换一个</a>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-offset-1 col-xs-10 col-md-offset-6 col-md-6">
								<button type="button" class="btn btn-lg btn-block btn-common" id="btnRegister">立即注册</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="js/register.js"></script>
</body>
</html>
