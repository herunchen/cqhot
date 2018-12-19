<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (request.getProtocol().compareTo("HTTP/1.0") == 0)
		response.setHeader("Pragma", "no-cache");
	else if (request.getProtocol().compareTo("HTTP/1.1") == 0)
		response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	//相对路径
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	if (basePath.endsWith("/")) {
		basePath = basePath.substring(0, basePath.length() - 1);
	}
%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<script type="text/javascript">
	var basePath = "<%=basePath%>/";
</script>
<link href="<%=basePath%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/plugins/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

<link href="<%=basePath%>/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/assets/css/responsive.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/assets/css/plugins/bootstrap-clockpicker.min.css"  rel="stylesheet" type="text/css">
<link href="<%=basePath%>/assets/css/icons.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/bootstrap_table/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<link href="<%=basePath%>/css/error.css" rel="stylesheet">
<link href="<%=basePath%>/assets/css/main.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>/tree-multiselect/jquery.tree-multiselect.css" rel="stylesheet" >
<link href="<%=basePath%>/css/bg-main.css" rel="stylesheet">

<link href="<%=basePath%>/css/customer.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="<%=basePath%>/assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap_table/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=basePath%>/bootstrap_table/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap_table/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/pickadate/picker.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/pickadate/picker.date.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/pickadate/picker.time.js"> </script>
<script type="text/javascript" src="<%=basePath%>/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/function.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/libs/lodash.compat.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/event.swipe/jquery.event.move.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/event.swipe/jquery.event.swipe.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/libs/breakpoints.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/respond/respond.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/cookie/jquery.cookie.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
 <!--[if lt IE 9]>
 <script type="text/javascript" src="<%=basePath%>/plugins/flot/excanvas.min.js">
 </script>
 <![endif]-->
<script type="text/javascript" src="<%=basePath%>/plugins/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/typeahead/typeahead.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/autosize/jquery.autosize.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/inputlimiter/jquery.inputlimiter.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/tagsinput/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/fileinput/fileinput.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/duallistbox/jquery.duallistbox.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/bootstrap-inputmask/jquery.inputmask.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/bootstrap-wysihtml5/wysihtml5.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/globalize/globalize.js"> </script>
<script type="text/javascript" src="<%=basePath%>/plugins/globalize/cultures/globalize.culture.de-DE.js"> </script>
<script type="text/javascript" src="<%=basePath%>/plugins/globalize/cultures/globalize.culture.ja-JP.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/blockui/jquery.blockUI.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/noty/jquery.noty.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/noty/layouts/top.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/noty/themes/default.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/bootstrap-multiselect/bootstrap-multiselect.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/custom.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/customer.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/window-popup.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/jquery-form/jquery.form.js"></script>
<script type="text/javascript" src="<%=basePath%>/plugins/bootstrap-clockpicker/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/demo/form_components.js"></script>
<script type="text/javascript" src="<%=basePath%>/assets/js/demo/ui_general.js"></script>
<script type="text/javascript" src="<%=basePath%>/tree-multiselect/jquery.tree-multiselect.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap-wysiwyg/bootstrap-wysiwyg.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap-wysiwyg/external/jquery.hotkeys.js"></script>

<script>
	
    $(document).ready(function () {
        App.init();
        Plugins.init();
        FormComponents.init();
    });
    

    //获取url中的参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]);
        return null; //返回参数值
    }
</script>

