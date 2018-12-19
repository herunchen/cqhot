var basePath = getRootPath();
var SUCCESS = 0;
//加载团列表
loadTeamList();
//初始化模态框项目下拉列表
initPrjIdOptions();
//点击查询，进行条件查询
$(document).on('click','#btn_search',loadTeamList);
//点击新增按钮
$(document).on('click','#btn_add',showAddTeamDialog);
//切换所属项目
$(document).on('change','#prjId',initMgrIdOptions);
//保存或修改团号
$(document).on('click','#btn_save',saveOrUpdateTeam);
//点击修改按钮
$(document).on('click','.updateTeamById',findTeamInfoById);
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
//启用禁用状态切换
$(document).on('click','.changeState',changeState);
//模态框隐藏时，将确定按钮绑定的事件移除
$('#addTeamModal').on('hide.bs.modal',dynamicClearData);

//清除模态框中的数据
function dynamicClearData(){
	$('.dynamicData').val('');
	$('#prjId option:first').prop('selected',true);
	$('#managerId option:not(:first)').remove();
	$('#addTeamModal').data('teamId','');
}

//点击修改按钮
function findTeamInfoById(){
	var teamId = $(this).parent().parent().data('teamId');
	var param = {'teamId':teamId};
	var url = basePath + 'team/findTeamInfoById.do';
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			$('#btn_save').text('修改');
			$('#addTeamModal').modal('show');
			fillTeamForm(result.data);
		}else{
			alert(result.message);
		}
	})
}

//回显编辑
function fillTeamForm(team){
	debugger
	$('#addTeamModal').data('teamId',team.id);
	$('#tName').val(team.tName);
	$('#note').val(team.note);
	$('#prjId option').each(function(){
		if(team.prjId==$(this).val()){
			$(this).prop('selected',true);
			initMgrIdOptions(team.managerId);
			return false;
		}
	})
}

//保存或修改团号
function saveOrUpdateTeam(){
	debugger
	if($('#teamForm').valid()){
		var operate = $(this).text();
		var url;
		var params = $('#teamForm').serialize();
		if(operate=='保存'){
			url = basePath + 'team/saveTeam.do';
		}
		if(operate=='修改'){
			var teamId = $('#addTeamModal').data('teamId');
			params = params+'&id='+teamId;
			url = basePath +'team/updateTeam.do';
		}
		$.post(url,params,function(result){
			if(result.state == SUCCESS){
				$('#addTeamModal').modal('hide');
				loadTeamList();
			}else{
				alert(result.message);
			}
		})
	}
}

//点击新增按钮，显示添加团号模态框
function showAddTeamDialog(){
	$('#btn_save').text('保存');
	$('#addTeamModal').modal('show');
}

//初始化所属项目下拉列表
function initPrjIdOptions(){
	var url = basePath + 'team/projectList.do';
	$.getJSON(url,function(result){
		if(result.state==SUCCESS){
			fillProjectOptions(result.data);
		}else{
			alert(result.message);
		}
	})
}

//填充项目下拉列表
function fillProjectOptions(list){
	$('#prjId').empty();
	$('#prjId').append('<option value="" selected>所属项目</option>');
	for(var i in list){
		var obj = list[i];
		var opt=$('<option value=""></option>').val(obj.id).html(obj.prjName);
		$('#prjId').append(opt);
	}
}

//初始化负责人下拉列表
function initMgrIdOptions(mgrId){
	var url = basePath + 'team/managerList.do';
	var param = {'prjId':$('#prjId').val()}
	$.post(url,param,function(result){
		if(result.state==SUCCESS){
			fillManagerOptions(result.data);
			if(mgrId){
				$('#managerId option').each(function(){
					if(mgrId==$(this).val()){
						$(this).prop('selected',true);
					}
				})
			}
		}else{
			alert(result.message);
		}
	})
}

//填充负责任下拉列表
function fillManagerOptions(list){
	$('#managerId').empty();
	$('#managerId').append('<option value="">负责人</option>');
	for(var i in list){
		var obj = list[i];
		var opt = $('<option value=""></option>').val(obj.id).html(obj.name);
		$('#managerId').append(opt);
	}
}

//切换启用禁用状态
function changeState(){
	var teamId = $(this).parent().parent().data('teamId');
	var content = $(this).text();
	var url = basePath +'team/changeState.do';
	var valid;
	if(content=='启用'){
		valid = 1;
	}
	if(content=='禁用'){
		valid = 0;
	}
	var params = {'id':teamId,'valid':valid};
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			loadTeamList();
		}else{
			alert(result.message);
		}
	})
}

//分页跳转
function jumpPage(){
	var classVal = $(this).attr('class');
	var currentPage;
	if('firstPage' == classVal){
		currentPage = 1;
	}
	if('nextPage' == classVal){
		currentPage = $('#teamListTable').data('curPage')+1;
	}
	if('upperPage' == classVal){
		currentPage = $('#teamListTable').data('curPage')-1;
	}
	if('lastPage' == classVal){
		currentPage = $('#teamListTable').data('lastPage');
	}
	if('jump' == classVal){
		var pageInput = $('#pageSelect').val();
		var lastPage = $('#teamListTable').data('lastPage');
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
	
	$('#teamListTable').data('curPage',currentPage);
	loadTeamList();
}

//加载团列表
function loadTeamList(){
	var params = getParams();
	var currentPage = $('#teamListTable').data('curPage');
	if(currentPage){
		params.PageCurrent = currentPage;
	}
	var url = basePath + 'team/teamList.do';
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			initPage();
			fillTeamListTable(result.data.teamList);
			showPagination(result.data.pageObj);
		}else{
			alert(result.message);
		}
	})
}

//分页显示
function showPagination(pageObj){
	$('#currentPage').text(pageObj.pageCurrent+'/'+pageObj.pageCount);
	$('#totalCount').text(pageObj.rowCount);
	var tableElement = $("#teamListTable");
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

//加载之前清除表格以前的数据
function initPage(){
	$('#teamListTable tr:not(:first)').remove();
	$('.firstPage').parent().show();
	$('.upperPage').parent().show();
	$('.nextPage').parent().show();
	$('.lastPage').parent().show();
}


//查询条件
function getParams(){
	debugger
	var tName = $('#teamName').val();
	var prjName = $('#prjName').val();
	var mgrName = $('#mgrName').val();
	var valid = $('#state').val();
	var params = {
			'tName':tName,
			'prjName':prjName,
			'valid':valid
	}
	return params;
}

//填充团号列表
function fillTeamListTable(list){
	debugger
	var parentEle = $('#teamListTable');
	for(var i in list){
		var tr = $('<tr></tr>');
		tr.data('teamId',list[i].id);
		var template = '<td>[tName]</td>'+
						'<td>[prjName]</td>'+
						'<td>[managerName]</td>'+
						'<td>[phone]</td>'+
						'<td>[note]</td>'+
						'<td><font color="[colorVal]">[state]</font></td>'+
						'<td><a class="btn btn-default btn-xs updateTeamById">修改</a>&nbsp;&nbsp;'+
						'<a class="btn btn-default btn-xs changeState">[stateStr]</a></td>';
		var state,stateStr,colorVal;
		if(list[i].valid==1){
			state = '启用';
			stateStr = '禁用';
			colorVal = 'green';
		}
		if(list[i].valid==0){
			state = '禁用';
			stateStr = '启用';
			colorVal = 'red';
		}
		template = template.replace('[tName]',list[i].tName)
							.replace('[prjName]',list[i].prjName)
							.replace('[managerName]',list[i].managerName)
							.replace('[phone]',list[i].phone)
							.replace('[note]',list[i].note)
							.replace('[colorVal]',colorVal)
							.replace('[state]',state)
							.replace('[stateStr]',stateStr);
		tr.append(template);
		parentEle.append(tr);
	}
}
