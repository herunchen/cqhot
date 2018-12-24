/*加载项目列表*/
var basePath=getRootPath();
var SUCCESS = 0;

doGetProjects();
doGetGroups();


//条件查询
$('#queryFormId').on('click','.btn_search',doGetProjects);
$('#queryFormId').on('click','.btn_add',showAddProjectDialog);

$('#projectList').on('click','.doUpdateProjectById',showEditProjectDialog);
$('#projectList').on('click','.doValidProjectById',doValidProjectById);

$('#form1').on('click','.btn_import',excelImport);

/*点击部门选择框，显示列表*/
//$('#orgSelectId').click(doGetGroups);

//首页跳转
$('#pagination').on('click','.firstPage',jumpPage);
//上一页跳转
$('#pagination').on('click','.upperPage',jumpPage);
//下一页跳转
$('#pagination').on('click','.nextPage',jumpPage);
//尾页跳转
$('#pagination').on('click','.lastPage',jumpPage);
//输入页码跳转
$('#pagination').on('click','.jump',jumpPage);

function excelImport(){
	$('#form1').ajaxSubmit({
		type:'post',
		url:'/supplier/excelImport',
		data:{},
		beforeSend:function(){
			$("#firstDiv").text("");
		},
		success:function(result){
			if(result.status == 1){
				$("#firstDiv").text("导入成功");
				doGetProjects();
			}else{
				$("#firstDiv").text("导入失败");
			}
		},
		error : function(){
			$("#firstDiv").text("连接异常");
		}
	});
}

function doGetProjects(){
		var params = getQueryParamValues();
		var currentPage=$('#supplierList').data('curPage');
		if(currentPage){params.PageCurrent = currentPage;}
		var url ='/supplier/findSupByPage';
		$.post(url,params,function(result){
			initPage();
			fillSupplierList(result.data.list);
			//分页
			showPagination(result.data.pageObj);
		});
}
/*获取查询参数*/
function getQueryParamValues(){
	var compId = $('#compId').val();
	var indCatg = $('#indCatg').val();
	var acctPeriod = $('#acctPeriod').val();
	var supplierName = $('#supplierName').val();
	var country = $('#country').val();
	var province = $('#province').val();
	var city = $('#city').val();
	var params = {
			'compId':compId,
			'indCatg':indCatg,
			'acctPeriod':acctPeriod,
			'supplierName':supplierName,
			'country':country,
			'province':province,
			'city':city
	}
	return params;
}

//初始化表格数据
 function initPage(){
	//清空表格数据
	$('#supplierList  tr:not(:first)').empty();
	$('.firstPage').parent().show();
	$('.upperPage').parent().show();
	$('.nextPage').parent().show();
	$('.lastPage').parent().show();
  }

 /*动态替换项目列表内容*/
  function fillSupplierList(list){
	debugger
	var parentEle = $('#supplierBody');
	for(var i in list){
		var tr = $('<tr></tr>');
		tr.data('id',list[i].id);
		var state,stateStr,colorVal;
		if(list[i].type == 1){
			type = '未知';
		}
		if(list[i].type == 2){
			type = '月结';
		}
		if(list[i].type == 3){
			type = '周结';
		}
		var template = '<td>[compId]</td>'+
						'<td>[indCatg]</td>'+
						'<td>[supplierName]</td>'+
						'<td>[acctPeriod]</td>'+
						'<td>[country]</td>'+
						'<td>[province]</td>'+
						'<td>[city]</td>'+
						'<td>有效</td>'+
						'<td><a class="btn btn-default btn-xs doValidProjectById">修改</a></td>';
		 template = template.replace('[id]',list[i].compId)
		                    .replace('[compId]',list[i].compId)
							.replace('[indCatg]',list[i].indCatg)
							.replace('[supplierName]',list[i].name)
							.replace('[acctPeriod]',type)
							.replace('[country]',list[i].country)
							.replace('[province]',list[i].province)
							.replace('[city]',list[i].city);
		tr.append(template);
		parentEle.append(tr);
	}
}
	/*获得组织机构部门列表*/
	function doGetGroups(){
		var url = '/supplier/getAllGroup';	
		$.getJSON(url, function(result){
			if(result.status==1){
				doUpdateGroupOptions(result.data);
			}else{
				alert(result.message);
			}
		});
	}
	/*修改组织机构下拉列表*/
	function doUpdateGroupOptions(list){
		$('#deptId').empty();
		$('#deptId').append('<option value="">请选择类别</option>');
		for(var i=0; i<list.length; i++){
			var obj = list[i];
			var opt=$('<option value=""></option>').val(obj.id).html(obj.name);
			$('#deptId').append(opt);
		}
	}
	
	
	/*获得选中的id*/
	function getCheckedIds(){
		var checkedIds ='';
		$('#projectBody input[name="btSelectItem"]').each(function(){
			if($(this).is(':checked')){
				if(checkedIds==''){
					checkedIds += $(this).val();
				}else{
					checkedIds += ','+$(this).val();
				}
			}
		})
		return checkedIds;
	}
  
    /*修改项目有效性信息*/
	function doValidProjectById(){
		debugger
		var compId = $(this).parent().parent().data('id');
		var url ="/supplier/updateValid";
		var param = {'compId':compId};
		
		$.post(url,param,function(result){
			if(result.status == 1){
				doGetProjects();
			}else{
				alert(result.message);
			}
		});
	}
	/*添加项目信息*/
    function showAddProjectDialog(){
    	$('#modifyDialog .modal-body').load('ttms/supplier/supplier_add.jsp',function(){
	        $('#modifyDialog').modal('show');
			$('#modifyDialog .modal-title').html('添加项目信息');
			
    	})
    }
   /*编辑项目信息*/
    function showEditProjectDialog(){
    	var supplierId = $(this).parent().parent().data('id');
    	$('#modifyDialog .modal-body').load('ttms/supplier/supplier_edit.jsp',function(){
	        $('#modifyDialog').modal('show');
			$('#modifyDialog .modal-title').html('编辑项目信息');
			$('#modifyDialog').data('checkedUpdateId',prjId);
    	});
    }
    
//分页显示
   function showPagination(pageObj){
	$('#currentPage').text(pageObj.pageCurrent+'/'+pageObj.pageCount);
	$('#totalCount').text(pageObj.rowCount);
	var tableElement = $("#supplierList");
	tableElement.data('curPage',pageObj.pageCurrent);
	tableElement.data('lastPage',pageObj.pageCount);
	if(pageObj.pageCurrent=='1'){
		$('.firstPage').parent().hide();
		$('.upperPage').parent().hide();
	}
	if(pageObj.pageCurrent==pageObj.pageCount){
		$('.nextPage').parent().hide();
		$('.lastPage').parent().hide();
	}
}
//分页跳转
function jumpPage(){
	var classVal = $(this).attr('class');
	var currentPage;
	if('firstPage' == classVal){
		currentPage = 1;
	}
	if('nextPage' == classVal){
		currentPage = $('#supplierList').data('curPage')+1;
	}
	if('upperPage' == classVal){
		currentPage = $('#supplierList').data('curPage')-1;
	}
	if('lastPage' == classVal){
		currentPage = $('#supplierList').data('lastPage');
	}
	if('jump' == classVal){
		var pageInput = $('#pageSelect').val();
		var lastPage = $('#supplierList').data('lastPage');
		if(pageInput>lastPage){
			$('#pageSelect').val(lastPage);
			currentPage = lastPage;
		}else if(pageInput<1){
			$('#pageSelect').val(1);
			currentPage = 1;
		}else{
			currentPage = pageInput;
		}
	}
	
	$('#supplierList').data('curPage',currentPage);
	
	
	doGetProjects();
}
