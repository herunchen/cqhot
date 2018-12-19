//删除联系方式
function removeContact(obj) {
	$(obj).parent().remove();
}

//添加联系方式
function addContact(){
	var lastVal = $("#contact-body input[type=text]").last().val();
	if(lastVal==undefined || !isEmpty(lastVal)) {
		getAjax("getTypeList.do", null, function (data) {
			var random = generateMixed(4);
			var html = '<div class="control-group top">';
			for(var key in data) {
				html += '<input type="radio" name="contactType_'+random+'" value="'+data[key].dictValue+'" checked="checked">'+data[key].dictName;
			}
			html += '<input type="text" style="margin-left:18px;"  class="form-control" name="contactInfo" id="txtContactInfo">' +
			'<a class="btn btn-link" onclick="removeContact(this)">删除</a></div>';
			/*var html = '<div class="control-group top"><input type="radio" name="contactType_'+random+'" value="1" checked="checked">电话' +
			'<input type="radio" name="contactType_'+random+'" value="2">邮箱' +
			'<input type="text" style="margin-left:18px;"  class="form-control" name="contactInfo" id="txtContactInfo">' +
			'<a class="btn btn-link" onclick="removeContact(this)">删除</a></div>';*/
			$("#contact-body").append(html);
	    },"get");
	}
}

//取得随机数
function generateMixed(n) {
	var chars = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
	              'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
	              'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ];
	var res = "";
	for (var i = 0; i < n; i++) {
		var id = Math.ceil(Math.random() * 35);
		res += chars[id];
	}
	return res;
}

//保存用户信息
function save() {
	var contacts = "";
	$("input[name^='contactType_']").each(function() {
		if ($(this).is(':checked')) {
			contacts+=$(this).val() + ":" + $(this).nextAll("input[type=text]").val()+",";
		}
	});
	$("#txtContacts").val(contacts);
	$("#userForm").submit();
}