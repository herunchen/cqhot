var basePath = getRootPath();
//新增
$(document).on('click','.btn_add',showAddChannelerPage)

//新增
function showAddChannelerPage(){
	$('#content').load(basePath+'channel/showAddChannelerPage.do');
}
