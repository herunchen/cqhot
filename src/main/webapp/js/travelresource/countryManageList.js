var basePath = getRootPath();

//新增
$(document).on('click','#btn_add',showAddCountryPage)
//修改
$(document).on('click','.updateCountry',showEditCountryPage)

//新增
function showAddCountryPage(){
	$('#modifyDialog .modal-body').load(basePath+'country/showEditCountryPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('添加国家地区');
	})
}
//修改
function showEditCountryPage(){
	$('#modifyDialog .modal-body').load(basePath+'country/showEditCountryPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('修改国家地区');
	})
}