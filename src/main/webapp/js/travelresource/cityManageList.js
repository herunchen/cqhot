var basePath = getRootPath()

//新增
$(document).on('click','#btn_add',showAddCityPage)
//修改
$(document).on('click','.updateCity',showEditCityPage)

//修改
function showEditCityPage(){
	$('#modifyDialog .modal-body').load(basePath+'city/showEditCityPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('修改城市信息');
	})
}

//新增
function showAddCityPage(){
	$('#modifyDialog .modal-body').load(basePath+'city/showEditCityPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('添加城市信息');
	})
}