var basePath = getRootPath();

//新增
$(document).on('click','#btn_add',showAddContinentPage);
//修改
$(document).on('click','.updateContinent',showEditContinentPage);

//显示添加大洲页面
function showAddContinentPage(){
	$('#modifyDialog .modal-body').load(basePath+'continent/showEditContinentPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('添加世界大洲');
	})
}

//修改
function showEditContinentPage(){
	$('#modifyDialog .modal-body').load(basePath+'continent/showEditContinentPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('编辑修改世界大洲');
	})
}