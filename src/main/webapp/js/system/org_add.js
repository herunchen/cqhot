/*加载项目列表*/
var basePath=getRootPath();
var SUCCESS = 0;
$('#modifyDialog').on('click','.ok',saveFormData);
$('#modifyDialog').on('hidden.bs.modal', function () {
	$('#modifyDialog').off('click','.ok');
})
//保存表单数据
function saveFormData(){
	if($('#addObjectForm').validate()){
		var data = getFormParameters();
		var url = '/org/save';
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
	var parentId=$('#modifyDialog').data('parentId');
	var orgName = $('#add_orgName').val();
	var orgCode = $('#add_orgCode').val();
	var valid = $('input[name="valid"]:checked').val();
	var note=$('#add_note').val();
	var data = {
			'parentId':parentId,
			'name':orgName,
			'code':orgCode,
			'valid':valid,
			'note':note
	};
	return data;
}