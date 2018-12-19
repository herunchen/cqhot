var basePath = getRootPath();

//点击通知名称查看详细
$(document).on('click','.noticeDetail',showNoticeDetailPage)
//点击撤回
$(document).on('click','.revoke',revoke)
//点击发布
$(document).on('click','.publish',publish)
//点击修改
$(document).on('click','.updateNotice',updateNotice)

//点击修改
function updateNotice(){
	$('#modifyDialog .modal-body').load(basePath+'notice/showEditNoticePage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('修改通知');
	})
}

//点击发布
function publish(){
	$(this).parent().html('<a class="revoke">撤回</a>');
}

//点击撤回事件
function revoke(){
	$(this).parent().html('<a class="updateNotice">修改</a><a class="publish"> 发布</a>');
}

//点击通知名称查看详细
function showNoticeDetailPage(){
	$('#modifyDialog .modal-body').load(basePath+'notice/showNoticeDetailPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('查看通知详细信息');
	})
}