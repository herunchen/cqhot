/*加载项目列表*/
var basePath=getRootPath();
var SUCCESS = 0;
/*初始化数据*/
doInitPageData();
$('#modifyDialog').on('click','.ok',updateProject);
/*获得组织机构部门列表*/
function doInitPageData(){
 var url = basePath + 'project/findGroups.do';
	$.getJSON(url, function(result) {
		if (result.state == SUCCESS) {
			doInitGroupOptions(result.data);
			doInitProjectById();
		} else {
			alert(result.message);
		}
	});
}
/*修改组织机构下拉列表*/
function doInitGroupOptions(list){
  $('#edit_deptId').empty();
  $('#edit_deptId').append('<option value="">选择归属部门</option>');
  for(var i=0; i<list.length; i++){
	var obj = list[i];
	var opt=$('<option value=""></option>').val(obj.id).html(obj.name);
	$('#edit_deptId').append(opt);
  }
 
 }
/*修改项目信息*/
function doInitProjectById(){
   var prjId=$('#modifyDialog').data("checkedUpdateId");
	var params={'prjId':prjId};
	var url = basePath+'project/findById.do';
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			fillUpdateByIdForm(result.data)
		}else{
			alert(result.message);
		}
	})
}
//填充编辑页面表单
function fillUpdateByIdForm(project){		
	$('#edit_prjId').val(project.prjId);
	$('#edit_prjName').val(project.prjName);
	$('#edit_beginDate').val(project.beginDate);
	$('#edit_endDate').val(project.endDate);
	$('#edit_deptId option').each(function(){
		if(project.deptId==$(this).val()){
			$(this).attr('selected',true);
		}
	});
	console.log("project.valid="+project.valid)
 	//有效选中项
 	if(project.valid){
 		$('#edit_valid_0').attr('checked',true);
 	}else {
 		$('#edit_valid_1').attr('checked',true);
 	}
	
	console.log("project.note="+project.note);
 	//备注
 	$('#edit_note').html(project.note);
}
//修改項目信息
function updateProject(){
	if($('#editProjectForm').validate()){
		var data = getFormParameters();
		var url = basePath+'project/updateById.do';
		$.post(url,data,function(jsonResult){
			if(jsonResult.state==SUCCESS){
				$('#modifyDialog').modal('hide');
				doGetProjects();
			}else{
			    alert(jsonResult.message);
			}
		});
	}
}

//获取表单数据
function getFormParameters(){
	var id = $('#modifyDialog').data('checkedUpdateId');
	var prjId = $('#edit_prjId').val();
	var prjName = $('#edit_prjName').val();
	var beginDate=$('#edit_beginDate').val();
	var endDate=$('#edit_endDate').val();
	var deptId=$('#edit_deptId').val();
	var note=$('#edit_note').val();
	
	var data = {
			'id':id,
			'prjId':prjId,
			'prjName':prjName,
			'beginDate':beginDate,
			'endDate':endDate,
			'deptId':deptId,
			'note':note
	};
	return data;
}

  
	  
    
