/*加载项目列表*/
var basePath=getRootPath();
var SUCCESS = 0;
doGetGroups();
$('#modifyDialog').on('click','.ok',saveProject);
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
  $('#add_deptId').empty();
  $('#add_deptId').append('<option value="">选择归属部门</option>');
  for(var i=0; i<list.length; i++){
	var obj = list[i];
	var opt=$('<option value=""></option>').val(obj.id).html(obj.name);
	$('#add_deptId').append(opt);
  }
}
//保存
function saveProject(){
	debugger
	if($('#addProjectForm').validate()){
		console.log("validate");
		var data = getFormParameters();
		console.log("getFormParameters()");
		commitForm(data);
	}
}

//获取表单数据
function getFormParameters(){
	var prjId = $('#add_prjId').val();
	var prjName = $('#add_prjName').val();
	var beginDate=$('#add_beginDate').val();
	var endDate=$('#add_endDate').val();
	var deptId=$('#add_deptId').val();
	var note=$('#add_note').val();
	
	var data = {
			'prjId':prjId,
			'prjName':prjName,
			'beginDate':beginDate,
			'endDate':endDate,
			'deptId':deptId,
			'note':note
	};
	return data;
}
	
	
//提交表单数据
function commitForm(data){
	var url = basePath+'project/save.do';
	$.post(url,data,function(jsonResult){
		if(jsonResult.state==SUCCESS){
			$('#modifyDialog').modal('hide');
			doGetProjects();
		}else{
		   alert(jsonResult.message);
		}
	});
}
  
	  
    
