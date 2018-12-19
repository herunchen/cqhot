var basePath = getRootPath();
//点击新增按钮
$(document).on('click','#btn_add',showAddChannelDialog)
//修改渠道信息
$(document).on('click','.updateChannel',showEditChannelDialog)
//更改渠道管理部门
$(document).on('click','#btn_channel_dept',showChannelDeptPage)
//更改渠道管理人
$(document).on('click','#btn_channel_manager',showChannelManagerPage)
//点击渠道名称查看详细
$(document).on('click','.viewChannelDetail',showChannelDetailPage)
//查看渠道账户
$(document).on('click','.channelAccount',showChannelAccounts);
//查看渠道商品
$(document).on('click','.channelGood',showChannelGoods)

//查看渠道商品
function showChannelGoods(){
	$('#content').load(basePath+'channel/showChannelGoods.do')
}

//查看渠道账户
function showChannelAccounts(){
	$('#content').load(basePath+'channel/showChannelAccounts.do')
}

//查看渠道商详细
function showChannelDetailPage(){
	$('#modifyDialog .modal-body').load(basePath+'channel/showChannelDetailPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('渠道信息浏览');
	})
}

//更改渠道商得管理人
function showChannelManagerPage(){
	$('#modifyDialog .modal-body').load(basePath+'channel/showChannelManagerPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('更改渠道管理人');
	})
}

//修改渠道商的的管理部门
function showChannelDeptPage(){
	$('#modifyDialog .modal-body').load(basePath+'channel/showChannelDeptPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('更改渠道管理部门');
	})
}

//显示修改渠道商信息模态框
function showEditChannelDialog(){
	$('#modifyDialog .modal-body').load(basePath+'channel/showEditChannelPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('修改渠道信息');
	})
}

//新增
function showAddChannelDialog(){
	$('#modifyDialog .modal-body').load(basePath+'channel/showEditChannelPage.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('添加渠道信息');
	})
}