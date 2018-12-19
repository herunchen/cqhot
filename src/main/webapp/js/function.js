/* 请求Ajax 带返回值，并弹出提示框提醒
--------------------------------------------------*/
function getAjax(url,parm,callBack,method) {
    method = method == null ? "post" : method;
    $.ajax({
        type: method,
        url: url,
        data: parm,
        cache: false,
        async: false,
        success: function (msg) {
            callBack(msg);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) { 
        	alert(XMLHttpRequest.status+"：系统异常！")
        }
    });
}


/*更换验证码*/
function reloadImg(){  
    $("#captcha-image").attr("src",$("#captcha-image").attr("src") + "?nocache="+new Date().getTime());  
}

/*验证图形验证码*/
function verificationCode(verifyCode){
	var flg = false;
	var imgCode = "";
	getAjax("getVerifyCode.do", null, function (msg) {
		imgCode=msg;
    },"get");
	if(isSame(verifyCode.toLowerCase(), imgCode)){
		flg = true;
	}
	
	return flg;
}

/*判断用户是否存在*/
function isExistUser(userName, password, url){
	if(isEmpty(url)){
		url="isExistUser.do";
	}
	var flg = false
	getAjax(url, "userName=" +userName+"&password="+password, function (data) {
		if (data == "0"){ //存在
			flg = true;
		}
    },"get");
	
	return flg;
}

function confirmAlert(url, s) {
	sweetAlert({
		title : "确认删除吗?",
		type : "info",
		showCancelButton : true,
		confirmButtonColor : "#DD6B55",
		confirmButtonText : "确认!",
		closeOnConfirm : true
	}, function() {
		if(!(s == '' || s == undefined || s == null)){
			$(s.parentNode.parentNode).remove();
		}
		if (!(url == '' || url == undefined || url == null)) {
			window.location.href = url;
		}

	});
}