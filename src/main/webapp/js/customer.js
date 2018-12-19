/**
 * Created by XXXIANG on 2016/11/27.
 * 引入jquery之后
 */

$(window).on('resize', function () {
    setListHeight();


    try {
        changeFrameHeight();
    } catch (e) {

    }
    try {
        // setTreelistHeader();
    } catch (e) {

    }
});

var oldattr = new Array();
var oldval = new Array();
var newattr = new Array();
var saveflg = 0;
$(document).ready(function () {
	setListHeight();
    try {
        changeFrameHeight();
    } catch (e) {

    }
    try {
        setTreelistHeader();
    } catch (e) {

    }
	$("button").click(function(){
		saveflg = 0;
	  if($(this).html() == "保存"){
		setNewAttr();	
		saveflg = 1;
		}
	});

});
//调整ready顺序
$(window).load(function(){
 	setOldAttr();
	//checkFunctionRights();
 });


function setRequest(forminfo,formtitle) {

	if (typeof(formtitle) =="undefined"){
		formtitle = (parent).$(".modal-title").html();
	}
	
	if (oldattr.length == newattr.length && saveflg == 1){
		var difattr = new Array();
		for(var i=0;i<oldattr.length;i++){
			 if (oldval[i] != newattr[i]){
				 difattr.push(oldattr[i] + "->" + newattr[i]) 
			 }
		}
		
		//$.ajax({
		//  type: 'POST',
		//  url: "insertSysUserLog.do",
		//  data: data,
		//  success: success,
		//  dataType: dataType
		//});
	}
	forminfo.append("<input type=\"hidden\" name=\"formtitle\" value=\""+ formtitle +"\">");
	forminfo.append("<input type=\"hidden\" name=\"formdifattr\" value=\""+ difattr +"\">");

}


//取得更新前数据
function setOldAttr() {
	$("select,input,textarea").each(function(){
		var title = "";
		var obj = $(this);
		var i = 0;
		while (title == "" && i<5)
		  {
			i++;
		    obj = obj.parent();
			if (obj.attr("class") == "form-group"){
				title = obj.find("label").html();
			}
			
		  }
		  
		if($(this).attr('type') == "checkbox"){
			title = $(this).parent().html();
		}  
		  
		title = title.replace(/<.*>/g,"");  
		title = title.replace("<span style=\"color:red\">*</span>","");
		title = title.replace(/[\r\n]/g,"");
		title = title.replace(/[ ]/g,"");
		

		
		
		if ($(this).get(0).tagName == "SELECT") {
			oldattr.push(title+"["+$(this).find("option:selected").text()+"]");
			oldval.push("["+$(this).find("option:selected").text()+"]");
		} else {
			oldattr.push(title+"["+$(this).val()+"]");
			oldval.push("["+$(this).val()+"]");
		}

	});
	
}



function setNewAttr() {
	

 $("select,input,textarea").each(function(){

		var obj = $(this);
		var i = 0;

		
		if ($(this).get(0).tagName == "SELECT") {
			newattr.push("["+$(this).find("option:selected").text()+"]");
		} else {
			newattr.push("["+$(this).val()+"]");
		}
	});

}


//只有列表页才能生效
function setListHeight() {
    var container = $(".container").height();
    //console.log(container);
    var header = 0;
    try {
        header = $(".page-header").height();
        //console.log("header:"+header);
    } catch (e) {
        header = 0;
    }
    var search = 0
    try {
        search = $(".page-search").height();
        //console.log("header:"+header);
    } catch (e) {
        search = 0
    }
    var pagination = 0;
    try {
        pagination = $(".pagination").height();
        //console.log("pagination:"+pagination);
    } catch (e) {
        pagination = 0;
    }
    var h = container - header - search - pagination - 10;
    if (pagination != null) {
        h = h - 25;
    }

    try {
        //只要页面没有分页，就不计算table的高度
    	//debugger;
        if (pagination == null) {
           // $("[data-toggle='table']").bootstrapTable('resetView', {height: 50});
        } else {
            $("[data-toggle='table']").bootstrapTable('resetView', {height: h});
        }
    } catch (e) {
    }
    try {
        // var ifm = document.getElementById("role_rights");
        // ifm.height = container - header - search - 10;
        $("#role_rights").height(container - header - search - 10);
    } catch (e) {

    }
    try {
        $("#groups_content").height(h);
    }
    catch (e) {
    }

}
//设置全屏的弹出窗口
function changeFrameHeight() {
    try {
        var ifm = document.getElementById("iframepage");
        ifm.height = document.getElementById("container_sub").offsetHeight - 40;
        //console.log( "container_sub:" + document.getElementById("container_sub").offsetHeight );
        $("#modal-dialog").attr("style", "width:" + parseFloat(document.getElementById("container_sub").offsetWidth) + "px;padding:0px 0px 0px 0px;margin-right:0px;");
    } catch (e) {

    }
    try {
        var ifm2 = document.getElementById("iframepage2");
        ifm2.height = document.getElementById("container_sub").offsetHeight - 40;
        //console.log( "container_sub:" + document.getElementById("container_sub").offsetHeight );
        $("#modal-dialog2").attr("style", "width:" + parseFloat(document.getElementById("container_sub").offsetWidth) + "px;padding:0px 0px 0px 0px;margin-right:0px;");
    } catch (e) {

    }
}
//设置TreelistHeader高度
function setTreelistHeader() {

    var cells = document.getElementById("tv_groups").rows[0].cells.length;
    var html = [];
    html.push(" <table class=\"table table-hover table-bordered TreeGrid\">");
    html.push("<thead>");
    html.push("<tr class=\"header\" style=\"height:" + $(".TreeGrid thead tr").height() + "px;\">")

    for (var i = 0; i < cells; i++) {
        html.push(" <th class=\"text-center\" style=\"width:" + document.getElementById("tv_groups").rows[0].cells[i].offsetWidth + "px; \">" + document.getElementById("tv_groups").rows[0].cells[i].innerText + "</th>");
        //console.log(i+":"+ document.getElementById("tv_groups").rows[0].cells[i].offsetWidth);
    }
    html.push("</tr>")
    html.push("</thead>");

    html.push("</table>");


    $("#groups_header").width(document.getElementById("tv_groups").offsetWidth);
    $("#groups_header").height(document.getElementById("tv_groups").rows[0].offsetHeight);
    $("#groups_header").html(html.join(''));


}


$('#myModal button').click(function () {
    $('#myModal iframe').removeAttr('src');
});


// *** Bootstrap Table Start 自定义事件，配合Bootstrap Table 使用，且只对引入了Bootstrap.min.js的页面生效 ****

//初始化事件复选框事件，多个事件空格分隔，此方法请在引入customer.js下方初始化一下
function initBootstrapEvents(_tableid, _events, btns) {
    //绑定row check、check-all、uncheck、uncheck-all 事件
    $(document).on(_events, '#' + _tableid, function (row) {
        resetBtn(_tableid, btns);
    })
}
//初始化事件行点击选择事件，此方法请在引入customer.js下方初始化一下
function initBootstrapRowClick(_tableid) {
    $(document).on('click-row.bs.table', "#" + _tableid, function (row, $element, field) {
        $('#' + _tableid).bootstrapTable('uncheckAll');
        $('#' + _tableid).bootstrapTable('check', parseInt(field[0].rowIndex) - 1);
    })
}

//获取列值（只有 bootstrap table 有效）
//_tableid 为bootstrap table id;
//_index 为 td下标数组，td下标从0开始
function getColumnsValue(_tableid, _index) {
    //创建一个数组
    var arrayObj = new Array();
    //var seltion =   $('#visa_list').bootstrapTable('getSelections');
    //getSelections 返回所选的行，当没有选择任何行的时候返回一个空数组
    //getAllSelections 返回所有选择的行，包括搜索过滤前的，当没有选择任何行的时候返回一个空数组
    var seltion = $('#' + _tableid).bootstrapTable('getSelections');

    if (seltion != null && seltion.length > 0) {
        for (var i = 0; i < seltion.length; i++) {
            var arr = {};//json对象
            for (var j = 0; j < _index.length; j++) {
                arr[_index[j]] = delHtmlTag(seltion[i][_index[j]]);
            }
            //将json对象push到数组中
            arrayObj.push(arr);
        }
    }
    //json 数组转换为普通数组
    var arr = [];
    var jsonarray = arrayObj;
    for(var i =0;i<jsonarray.length;i++){
    var jsonobj = jsonarray[i];
    for(var x in jsonobj){
    	arr.push(jsonobj[x]);
    }
    }
    return arr;
}

//设置按钮禁用状态（有些按钮不支持批量操作，如果用户多选中，应该将按钮设为禁用）
function resetBtn(_tableid, _btns) {
    var s = $('#' + _tableid).bootstrapTable('getSelections');
    if (s.length > 1) {
        //禁用不支持批量操作的按钮
        for (var i = 0; i < _btns.length; i++) {
            $("#" + _btns[i]).attr("disabled", "disabled");
        }
    }
    else {
        for (var i = 0; i < _btns.length; i++) {
            $("#" + _btns[i]).removeAttr("disabled");
        }
    }
}


//************************** Bootstrap Table End *********************************
//删除html标签
function delHtmlTag(description) {
    if (description == null || description == undefined) {
        description = "";
    } else {
        description = description.replace(/(\n)/g, "");
        description = description.replace(/(\t)/g, "");
        description = description.replace(/(\r)/g, "");
        description = description.replace(/<\/?[^>]*>/g, "");
        description = description.replace(/\s*/g, "");
    }
    return description;
}


//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return decodeURIComponent(r[2]);
    return null; //返回参数值
}


/**  
 * 将数值四舍五入(保留2位小数)后格式化成金额形式  
 *  
 * @param num 数值(Number或者String)  
 * @return 金额格式的字符串,如'1,234,567.45'  
 * @type String  
 */    
function formatCurrency(num) {    
    num = num.toString().replace(/\$|\,/g,'');    
    if(isNaN(num))    
    num = "0";    
    sign = (num == (num = Math.abs(num)));    
    num = Math.floor(num*100+0.50000000001);    
    cents = num%100;    
    num = Math.floor(num/100).toString();    
    if(cents<10)    
    cents = "0" + cents;    
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)    
    num = num.substring(0,num.length-(4*i+3))+','+    
    num.substring(num.length-(4*i+3));    
    return (((sign)?'':'-') + num + '.' + cents);    
}   
function checkFunctionRights() {
	var id = $('title').attr('class');
	if(typeof(id)!="undefined"){
	getAjax(
				"selectFunctionRights.do",
				"functionId=" + id,
				function(data) {
					if (data != ''){
					strList = data.split(",");
						for(var i=0;i<strList.length;i++){
							$('.'+strList[i]).remove();
						}
					}
				}, "post");
	}
	
}
//获取项目根路径
function getRootPath() {
	    //获取当前网址，如： http://localhost:8080/tpms_complete_ajax/guideInfo/list.do
	    var curWwwPath = window.document.location.href;
	    //获取主机地址之后的目录，如： /tpms_complete_ajax/guideInfo/list.do
	    var pathName = window.document.location.pathname;
	    var pos = curWwwPath.indexOf(pathName);
	    //获取主机地址，如： http://localhost:8080
	    var localhostPath = curWwwPath.substring(0, pos);
	    //获取带"/"的项目名，如：/tpms_complete_ajax
	    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/')+2);
	    return (localhostPath + projectName);
	}



