<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit" /> 
	<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/plugins/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
	
	<link href="/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="/assets/css/responsive.css" rel="stylesheet" type="text/css"/>
	<link href="/assets/css/plugins/bootstrap-clockpicker.min.css"  rel="stylesheet" type="text/css">
	<link href="/assets/css/icons.css" rel="stylesheet" type="text/css"/>
	<link href="/assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/bootstrap_table/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">
	<link href="/plugins/sweetalert/sweetalert.css" rel="stylesheet">
	<link href="/css/error.css" rel="stylesheet">
	<link href="/assets/css/main.css" rel="stylesheet" type="text/css"/>
	<link href="/tree-multiselect/jquery.tree-multiselect.css" rel="stylesheet" >
	<link href="/css/bg-main.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/TreeGrid.css">	
	
	<link href="/css/customer.css" rel="stylesheet" type="text/css"/>
	
	<script type="text/javascript" src="/assets/js/libs/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="/bootstrap_table/js/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="/bootstrap_table/js/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="/bootstrap_table/js/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript" src="/plugins/pickadate/picker.js"></script>
	<script type="text/javascript" src="/plugins/pickadate/picker.date.js"></script>
	<script type="text/javascript" src="/plugins/pickadate/picker.time.js"> </script>
	<script type="text/javascript" src="/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
	<script type="text/javascript" src="/js/validate.js"></script>
	<script type="text/javascript" src="/js/function.js"></script>
	<script type="text/javascript" src="/assets/js/libs/lodash.compat.min.js"></script>
	<script type="text/javascript" src="/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="/plugins/event.swipe/jquery.event.move.js"></script>
	<script type="text/javascript" src="/plugins/event.swipe/jquery.event.swipe.js"></script>
	<script type="text/javascript" src="/assets/js/libs/breakpoints.js"></script>
	<script type="text/javascript" src="/plugins/respond/respond.min.js"></script>
	<script type="text/javascript" src="/plugins/cookie/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="/plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
	 <!--[if lt IE 9]>
	 <script type="text/javascript" src="/plugins/flot/excanvas.min.js">
	 </script>
	 <![endif]-->
	<script type="text/javascript" src="/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="/plugins/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
	<script type="text/javascript" src="/plugins/daterangepicker/moment.js"></script>
	<script type="text/javascript" src="/plugins/typeahead/typeahead.min.js"></script>
	<script type="text/javascript" src="/plugins/autosize/jquery.autosize.min.js"></script>
	<script type="text/javascript" src="/plugins/inputlimiter/jquery.inputlimiter.min.js"></script>
	<script type="text/javascript" src="/plugins/tagsinput/jquery.tagsinput.min.js"></script>
	<script type="text/javascript" src="/plugins/fileinput/fileinput.js"></script>
	<script type="text/javascript" src="/plugins/duallistbox/jquery.duallistbox.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap-inputmask/jquery.inputmask.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap-wysihtml5/wysihtml5.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="/plugins/globalize/globalize.js"> </script>
	<script type="text/javascript" src="/plugins/globalize/cultures/globalize.culture.de-DE.js"> </script>
	<script type="text/javascript" src="/plugins/globalize/cultures/globalize.culture.ja-JP.js"></script>
	<script type="text/javascript" src="/plugins/bootbox/bootbox.min.js"></script>
	<script type="text/javascript" src="/plugins/daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="/plugins/blockui/jquery.blockUI.min.js"></script>
	<script type="text/javascript" src="/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script type="text/javascript" src="/plugins/noty/jquery.noty.js"></script>
	<script type="text/javascript" src="/plugins/noty/layouts/top.js"></script>
	<script type="text/javascript" src="/plugins/noty/themes/default.js"></script>
	<script type="text/javascript" src="/plugins/uniform/jquery.uniform.min.js"></script>
	<script type="text/javascript" src="/assets/js/app.js"></script>
	<script type="text/javascript" src="/assets/js/plugins.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap-multiselect/bootstrap-multiselect.min.js"></script>
	<script type="text/javascript" src="/assets/js/plugins.form-components.js"></script>
	<script type="text/javascript" src="/assets/js/custom.js"></script>
	<script type="text/javascript" src="/js/customer.js"></script>
	<script type="text/javascript" src="/js/TreeGrid.js"></script>
	<script type="text/javascript" src="/js/TreeInit.js"></script>
	<script type="text/javascript" src="/plugins/validation/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="/js/window-popup.js"></script>
	<script type="text/javascript" src="/plugins/jquery-form/jquery.form.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap-clockpicker/bootstrap-clockpicker.min.js"></script>
	<script type="text/javascript" src="/assets/js/demo/form_components.js"></script>
	<script type="text/javascript" src="/assets/js/demo/ui_general.js"></script>
	<script type="text/javascript" src="/tree-multiselect/jquery.tree-multiselect.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/bootstrap-wysiwyg/bootstrap-wysiwyg.js"></script>
	<script type="text/javascript" src="/bootstrap-wysiwyg/external/jquery.hotkeys.js"></script>
	
	<script>
		
	</script>
	<title>TPMS旅游管理系统</title>
	<!-- 导入当前页面的css样式 -->
	<link href="/css/dash-board.css" rel="stylesheet" type="text/css"/>
</head>
<body class="theme-dark ">
<%@ include file="include/menu.jsp"%>
<div id="container">
	<div id="sidebar" class="sidebar-fixed">
		<div id="sidebar-content"></div>
	</div>		
	<div id="content">

	</div>
</div>	

<!-- 公共编辑对话框 -->

<div class="modal fade" id="modifyDialog" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg"  role="document">
        <div class="modal-content">
            <div class="modal-header" >
                <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">窗口标题</h4>
            </div>
            <div class="modal-body" >
            </div>
	        <div class="modal-footer">
		       <button type="button" class="btn btn-default cancel" data-dismiss="modal">取消</button>
		       <button type="button" class="btn btn-primary ok">确定</button>
		    </div>
       </div>
    </div>
</div>

</body>
<script>
	
</script>
</html>