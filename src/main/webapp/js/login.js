﻿$(function(){
	/*登录*/
	$("#btnLogin").click(function(){
		var msg = "";
		var flg = false;
		if(isEmpty($("#username").val())){
			msg="用户名不能为空";
		} else if(isEmpty($("#password").val())){
			msg="密码不能为空";
		} else if(!isExistUser($("#username").val(),$("#password").val())){
			msg = "用户名或密码错误";
		} else {
			flg = true;
		}
		
		$("#errMsg").text(msg);
		if(flg==true){
			$("#loginForm").submit();
		}
	})
})