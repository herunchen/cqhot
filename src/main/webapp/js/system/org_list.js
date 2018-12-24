/*加载项目列表*/
var basePath=getRootPath();
var SUCCESS = 0;

doGetObjects();
//条件查询
$('#queryFormId').on('click','.btn_search',doGetObjects);
$('#queryFormId').on('click','.btn_add',showAddDialog);
$('#queryFormId').data('parentId','');

$('#objectList').on('click','.doUpdateById',showEditDialog);
$('#objectList').on('click','.doValidById',doValidById);


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

$('#objectBody').on('click','.childOrgs',doGetChildObjects);

function doGetObjects(){
		var params = getQueryParamValues();
		var parentId=$('#queryFormId').data('parentId');
		console.log("queryFormId.parentId="+parentId);
		if(parentId){
			params.parentId=parentId;
		}
		var currentPage=$('#objectList').data('curPage');
		if(currentPage){
			params.pageCurrent = currentPage;
		}
		
         var url ='/org/findOrg';
		$.post(url,params,function(result){
			if(result.status==1){
				initPage();
				fillObjectList(result.data.list);
				showPagination(result.data.pageObj);
			}else{
				alert(result.message);
			}
		})
}
function doGetChildObjects(){
	var parentId = $(this).parent().parent().data('id');
	$('#queryFormId').data('parentId',parentId);
	$('#objectList').data('curPage',1);
	doGetObjects();
}
/*获取查询参数*/
function getQueryParamValues(){
	var name = $('#orgName').val();
	var valid=$('#valid').val();
	var params = {'name':name,'valid':valid};
	return params;
}
//初始化表格数据
 function initPage(){
	//清空表格数据
	$('#objectList  tr:not(:first)').empty();
	$('.firstPage').parent().show();
	$('.upperPage').parent().show();
	$('.nextPage').parent().show();
	$('.lastPage').parent().show();
  }

 /*动态替换项目列表内容*/
  function fillObjectList(list){
	  debugger
	var parentEle = $('#objectBody');
	for(var i in list){
		var tr = $('<tr></tr>');
		tr.data('id',list[i].id);
		var state,stateStr,colorVal;
		if(list[i].valid=='0'){
			stateStr = '禁用';
			colorVal = 'red';
			state = "启用";
		}
		if(list[i].valid=='1'){
			stateStr = '启用';
			colorVal = 'green';
			state = "禁用";
		}		
		var template =  '<td>[id]</td>'+
						'<td><a class="childOrgs">[name]</a></td>'+
						'<td>[code]</td>'+
						'<td><font color="[colorVal]">[stateStr]</font></td>'+
						'<td>[note]</td>'+
						'<td><a class="btn btn-default btn-xs doUpdateById">修改</a></td>'+
						'<td><a class="btn btn-default btn-xs doValidById">[state]</a></td>';
		 template = template.replace('[id]',list[i].id)
							.replace('[name]',list[i].name)
							.replace('[code]',list[i].code)
							.replace('[colorVal]',colorVal)
							.replace('[stateStr]',stateStr)
							.replace('[note]',list[i].note)
							.replace('[state]',state);
		tr.append(template);
		parentEle.append(tr);
	}
  }
	
    /*修改项目有效性信息*/
	function doValidById(){
		debugger
		var id = $(this).parent().parent().data('id');
		var content = $(this).text();
		var valid;
		if(content=='启用'){
			valid = 1;
		}
		if(content=='禁用'){
			valid = 0;
		}
		var params={"id":id,'valid':valid};
		var url=basePath+"org/validById.do";
		$.post(url,params,function(result){
				if(result.state==SUCCESS){
					doGetObjects();
				}else{
					alert(result.message);
				}
		});
	}
	/*添加项目信息*/
    function showAddDialog(){
    	var parentId=$('#queryFormId').data('parentId');
    	$('#modifyDialog').data('parentId',parentId);
    	$('#modifyDialog .modal-body').load('/ttms/system/organization_add.jsp',function(){
	        $('#modifyDialog').modal('show');
			$('#modifyDialog .modal-title').html('添加信息');
    	})
    }
   /*编辑项目信息*/
    function showEditDialog(){
    	var id = $(this).parent().parent().data('id');
    	$('#modifyDialog').data('checkedUpdateId',id);
    	$('#modifyDialog .modal-body').load('/ttms/system/organization_edit.jsp',function(){
	        $('#modifyDialog').modal('show');
			$('#modifyDialog .modal-title').html('编辑信息');
			
    	})
    }
   //分页显示
   function showPagination(pageObj){
	$('#currentPage').text(pageObj.pageCurrent+'/'+pageObj.pageCount);
	$('#totalCount').text(pageObj.rowCount);
	var tableElement = $("#objectList");
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
		currentPage = $('#objectList').data('curPage')+1;
	}
	if('upperPage' == classVal){
		currentPage = $('#objectList').data('curPage')-1;
	}
	if('lastPage' == classVal){
		currentPage = $('#objectList').data('lastPage');
	}
	if('jump' == classVal){
		var pageInput = $('#pageSelect').val();
		var lastPage = $('#objectList').data('lastPage');
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
	$('#objectList').data('curPage',currentPage);
    doGetObjects();
}
