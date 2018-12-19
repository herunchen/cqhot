var basePath = getRootPath();
//新增导游资料
$(document).on('click','#btn_add',showAddGuidePage)
//添加导游联系方式
$(document).on('click','.addTelPhone',addNewRow)
//移除导游联系方式
$(document).on('click','.deleteContact',delRow);
//点击修改
$(document).on('click','.updateGuideById',showEditGuidePage)
//点击导游名称查看导游详细资料
$(document).on('click','.selectGuideInfoByName',showGuideDetail)

//显示导游详细模态框
function showGuideDetail(){
	$('#modifyDialog .modal-body').load(basePath+'guide/showGuideDetail.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('显示导游资料');
	})
}

//添加导游联系方式
function addNewRow() {
    var htm =
            '<tr>'+
            '<td><input type="text" class="form-control required" name="title"></td>' +
            '<td><input type="text" class="form-control" name="phone"></td>' +
            '<td><input type="text" class="form-control" name="note"></td>' +
            '<td><a class="btn btn-default btn-xs deleteContact">删除</a></td>' +
            '</tr>';
    $("#tb_contract").append(htm);
}

function delRow() {
	$(this).parent().parent().remove();
}

//新增
function showAddGuidePage(){
	$('#modifyDialog .modal-body').load(basePath+'guide/showEditGuidePage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('添加导游资料');
	})
}

//显示修改模态框
function showEditGuidePage(){
	$('#modifyDialog .modal-body').load(basePath+'guide/showEditGuidePage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('修改导游资料');
	})
}