/*加载项目列表*/
var basePath=getRootPath();
var SUCCESS = 0;
/**初始化对象信息*/
doInitObjectById();
$('#modifyDialog').on('click','.ok',updateFormData);
/*修改项目信息*/
function doInitObjectById(){
    var id=$('#modifyDialog').data("checkedUpdateId");
	var params={'id':id};
	var url = '/org/getOrgById';
	$.post(url,params,function(result){
		if(result.status==1){
			fillUpdateByIdForm(result.data)
		}else{
			alert(result.message);
		}
	})
}
//填充编辑页面表单
function fillUpdateByIdForm(obj){	
	$('#edit_orgName').val(obj.name);
	$('#edit_orgCode').val(obj.code);
 	$('#edit_note').html(obj.note);
}

//保存表单数据
function updateFormData(){
	if($('#editObjectForm').validate()){
		var data = getFormParameters();
		var url ='/org/edit';
		$.post(url,data,function(jsonResult){
			if(jsonResult.status==1){
			$('#modifyDialog').modal('hide');
			doGetObjects();
			}else{
			alert(jsonResult.message);
			}
		});
	}
}
//获取表单数据
function getFormParameters(){
	var id = $('#modifyDialog').data('checkedUpdateId');
	var orgName = $('#edit_orgName').val();
	var orgCode = $('#edit_orgCode').val();
	var note=$('#edit_note').val();
	var data = {
			'id':id,
			'name':orgName,
			'code':orgCode,
			'note':note
	};
	return data;
}