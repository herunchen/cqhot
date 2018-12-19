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

function doGetProjects(){
		var params = getQueryParamValues();
		var currentPage=$('#projectList').data('curPage');
		if(currentPage){params.PageCurrent = currentPage;}
		var url =basePath+'project/findProjects.do';
		$.post(url,params,function(result){
			if(result.state==SUCCESS){
				initPage();
				fillProjectList(result.data.list);
				//分页
				showPagination(result.data.pageObj);
			}else{
				alert(result.message);
			}
		})
}
/*获取查询参数*/
function getQueryParamValues(){
	var prjId = $('#prjId').val();
	var prjName = $('#prjName').val();
	var deptId = $('#deptId').val();
	var valid = $('#valid').val();
	var srvcBeginDate = $('#beginDateId').val();
	var srvcEndDate = $('#endDateId').val();
	var params = {
			'prjId':prjId,
			'prjName':prjName,
			'deptId':deptId,
			'valid':valid,
			'beginDate':srvcBeginDate,
			'endDate':srvcEndDate
	}
	return params;
}

//初始化表格数据
 function initPage(){
	//清空表格数据
	$('#projectList  tr:not(:first)').empty();
	$('.firstPage').parent().show();
	$('.upperPage').parent().show();
	$('.nextPage').parent().show();
	$('.lastPage').parent().show();
  }

 /*动态替换项目列表内容*/
  function fillProjectList(list){
	debugger
	var parentEle = $('#projectBody');
	for(var i in list){
		var tr = $('<tr></tr>');
		tr.data('id',list[i].id);
		var state,stateStr,colorVal;
		if(list[i].valid == 0){
			stateStr = '禁用';
			state = "启用";
			colorVal = 'red';
		}
		if(list[i].valid == 1){
			stateStr = '启用';
			state = "禁用";
			colorVal = 'green';
		}
		var template = '<td>[prjId]</td>'+
						'<td>[prjName]</td>'+
						'<td>[grpName]</td>'+
						'<td>[beginDate]</td>'+
						'<td>[endDate]</td>'+
						'<td><font color="[colorVal]">[stateStr]</font></td>'+
						'<td>[note]</td>'+
						'<td><a class="btn btn-default btn-xs doUpdateProjectById">修改</a></td>'+
						'<td><a class="btn btn-default btn-xs doValidProjectById">[state]</a></td>';
		 template = template.replace('[id]',list[i].prjId)
		                    .replace('[prjId]',list[i].prjId)
							.replace('[prjName]',list[i].prjName)
							.replace('[grpName]',list[i].name)
							.replace('[beginDate]',list[i].beginDate)
							.replace('[endDate]',list[i].endDate)
							.replace('[stateStr]',stateStr)
							.replace('[note]',list[i].note)
							.replace('[colorVal]',colorVal)
							.replace('[state]',state);
		tr.append(template);
		parentEle.append(tr);
	}
}
	/*获得组织机构部门列表*/
	function doGetGroups(){
		var url = basePath + 'project/findGroups.do';	
		$.getJSON(url, function(result){
			if(result.state==SUCCESS){
				doUpdateGroupOptions(result.data);
			}else{
				alert(result.message);
			}
		});
	}
	/*修改组织机构下拉列表*/
	function doUpdateGroupOptions(list){
		$('#deptId').empty();
		$('#deptId').append('<option value="">选择归属部门</option>');
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
		var prjId = $(this).parent().parent().data('id');
		var content = $(this).text();
		var valid;
		if(content=='启用'){
			valid = 1;
		}
		if(content=='禁用'){
			valid = 0;
		}
		var url = basePath+"project/validById.do";
		var param = {'prjId':prjId,'valid':valid};
		
		$.post(url,param,function(result){
			if(result.state == SUCCESS){
				doGetProjects();
			}else{
				alert(result.message);
			}
		})
	}
	/*添加项目信息*/
    function showAddProjectDialog(){
    	$('#modifyDialog .modal-body').load(basePath+'project/addUI.do',function(){
	        $('#modifyDialog').modal('show');
			$('#modifyDialog .modal-title').html('添加项目信息');
			
    	})
    }
   /*编辑项目信息*/
    function showEditProjectDialog(){
    	var prjId = $(this).parent().parent().data('id');
    	$('#modifyDialog .modal-body').load(basePath+'project/editUI.do',function(){
	        $('#modifyDialog').modal('show');
			$('#modifyDialog .modal-title').html('编辑项目信息');
			$('#modifyDialog').data('checkedUpdateId',prjId);
    	})
    }
    
//分页显示
   function showPagination(pageObj){
	$('#currentPage').text(pageObj.pageCurrent+'/'+pageObj.pageCount);
	$('#totalCount').text(pageObj.rowCount);
	var tableElement = $("#projectList");
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
		currentPage = $('#projectList').data('curPage')+1;
	}
	if('upperPage' == classVal){
		currentPage = $('#projectList').data('curPage')-1;
	}
	if('lastPage' == classVal){
		currentPage = $('#projectList').data('lastPage');
	}
	if('jump' == classVal){
		var pageInput = $('#pageSelect').val();
		var lastPage = $('#projectList').data('lastPage');
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
	
	$('#projectList').data('curPage',currentPage);
	
	
	doGetProjects();
}
