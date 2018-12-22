﻿//设置错误信息
function setError(parDiv,errMsg){
	$(parDiv).removeClass("has-success");
	$(parDiv).addClass("has-error");
	$(parDiv+" .glyphicon-remove").removeClass("hide");
	$(parDiv+" .glyphicon-ok").addClass("hide");
	$(parDiv+" label").text(errMsg);
}

/*设置成功信息*/
function setSuccess(parDiv){
	$(parDiv).removeClass("has-error");
	$(parDiv).addClass("has-success");
	$(parDiv+" .glyphicon-remove").addClass("hide");
	$(parDiv+" .glyphicon-ok").removeClass("hide");
	$(parDiv+" label").text("");
}

/*验证用户名*/
function chkUserName(){
	var userName = $("#userName").val();
	var flg = false;
	if(isEmpty(userName)) {
		setError(".val-username", "用户名不能为空");
	} else if(!isLenBetween(userName,6,20)){
		setError(".val-username", "用户名为6~20个字符");
	} else {
		flg = isExistUser(userName,"");
		if(flg){
			setError(".val-username", "用户名已存在");
		} else{
			setSuccess(".val-username");
			flg=true;
		}
		/*getAjax("isExistUser.do", "userName=" +userName, function (msg) {
			if(msg == "1"){
				setSuccess(".val-username");
				flg = true;
			} else if (msg == "0"){
				setError(".val-username", "用户名已存在");
			}
	    },"get");*/
	}
	
	return flg;
}

/*验证密码*/
function chkPwd(){
	var password = $("#password").val();
	var flg = false;
	if(isEmpty(password)) {
		setError(".val-pwd", "密码不能为空");
	} else if(!isLenBetween(password,6,20)){
		setError(".val-pwd", "密码为6~20个字符");
	} else {
		setSuccess(".val-pwd");
		flg = true;
	}
	
	return flg;
}

/*验证确认密码*/
function chkRepwd(){
	var repwd = $("#repassword").val();
	var flg = false;
	if(isEmpty(repwd)) {
		setError(".val-repwd", "确认密码不能为空");
	} else if(isSame($("#password").val(), repwd)) {
		setSuccess(".val-repwd");
		flg = true;
	} else {
		setError(".val-repwd", "两次密码不一致");
	}
	
	return flg;
}

/*验证图形验证码*/
function chkValidyCode(){
	var flg = verificationCode($("#validycode").val());
	if(flg){
		setSuccess(".val-imgCode");
	} else {
		setError(".val-imgCode", "图形验证码错误");
	}
	
	return flg;
}

$(function(){
	/*用户名*/
	$("#userName").blur(function(){
		chkUserName();
	})
	
	/*密码*/
	$("#password").blur(function(){
		chkPwd();
	})
	
	/*确认密码*/
	$("#repassword").blur(function(){
		chkRepwd();
	})
	
	/*图形验证码*/
	$("#validycode").blur(function(){
		chkValidyCode();
	})
	
	/*注册*/
	$("#btnRegister").click(function(){
		var userFlg =  chkUserName();
		var pwdFlg = chkPwd();
		var repwdFlg = chkRepwd();
		var codeFlg = chkValidyCode();
		if(userFlg && pwdFlg && repwdFlg && codeFlg){
			$("#registerForm").submit();
		}
	})
})