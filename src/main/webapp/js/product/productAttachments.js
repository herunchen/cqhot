var basePath = getRootPath();
var SUCCESS = 0;

//初始化页面头部产品信息
initPageHead();
//点击添加附件
$('#attachmentContainer').on('click','.btn_add',showAddAttachmentDialog);
//上传事件
$('#prodAttachmentForm').on('click','.btn_upload',uploadFile);
//切换附件禁用启用状态
$('#productAttachmentsTable').on('click','.changeState',changeState);
//点击文件名下载
$('#productAttachmentsTable').on('click','.downLoadFileByFileId',downLoadFileByFileId);


//文件下载
function downLoadFileByFileId(){
	var attachmentId = $(this).parent().parent().data('attachmentId');
	var url = basePath + 'product/downLoadFileByFileId.do?attachmentId='+attachmentId;
	$(this).attr('href',url);
}

//显示添加附件对话框
function showAddAttachmentDialog(){
	$('#addAttachmentDialog').modal('show');
	$('#addAttachmentDialog .modal-title').html('添加附件');
}

//切换附件禁用启用状态
function changeState(){
	var attachmentId = $(this).parent().parent().data('attachmentId');
	var state = $(this).parent().parent().data('state');
	var url = basePath + 'product/changeAttachmentState.do';
	var params = {
			'attachmentId':attachmentId,
			'state':state
	}
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			//重新加载附件列表
			loadProductAttachmentsTable();
		}else{
			alert(result.message);
		}
	})
}

//上传
function uploadFile(){
	var prodId = Window.attachmentsProdId;
	var frm = $('#prodAttachmentForm');
	var data = new FormData();
	if(frm.valid()){
		var title = $('#title').val();
		var prodFile = $('#prodFile')[0].files[0];
		//验证文件大小
		if(prodFile.size>1000000){
			alert("文件太大！");
			return;
		}
		//将上传的内容保存到formData中
		data.append('title',title);
		data.append('prodFile',prodFile);
		data.append('belongId',prodId);
	
		//ajax上传到服务器
		var url = basePath+'product/upload.do';
		$.ajax({
			url:url,
			data:data,
			type:'post',
			cache:false,
			processData:false,   //JQuery不处理发送数据
			contentType:false    //JQuery不处理ContenType
		})
		.done(function(result){
			if(result.state == SUCCESS){
				alert('上传成功！');
				//隐藏并清空模态框
				clearDialog();
				//加载产品的附件列表
				loadProductAttachmentsTable();
			}else{
				alert(result.message);
			}
		})
		.fail(function(result){
			alert('上传失败！');
		})
	}
}

//隐藏并清空模态框
function clearDialog(){
	$('.dynamicClear','#prodAttachmentForm').val('');
	$('#addAttachmentDialog').modal('hide');
}


//初始化页面头部产品信息
function initPageHead(){
	debugger
	var prodId = Window.attachmentsProdId;
	var url = basePath+'product/viewProdInfoById.do';
	var data = {'prodId':prodId};
	$.post(url,data,function(result){
		if(result.state==SUCCESS){
			fillPageHeadData(result.data);
		}else{
			alert(result.message);
		}
	});
}

//填充页面头部产品信息
function fillPageHeadData(product){
	$('#prodId').text(product.prodId);
	$('#prodName').text(product.prodName);
	$('#director').text(product.director);
	$('#serverDate').text(product.srvcBeginDate+'~~'+product.srvcEndDate);
	$('#price').text(product.price+'￥');
	var stateStr;
	if(product.state==0){
		stateStr = '待售';
	}
	if(product.state==1){
		stateStr = '上架';
	}
	if(product.state==2){
		stateStr = '下架';
	}
	$('#state').text(stateStr);
	
	//加载该产品的附件列表
	loadProductAttachmentsTable();
}

//加载产品的附件列表
function loadProductAttachmentsTable(){
	var prodId = Window.attachmentsProdId;
	var url = basePath+'product/findAttachmentsListByProdId.do';
	var params = {
			'prodId':prodId
	}
	$.post(url,params,function(result){
		if(result.state == SUCCESS){
			fillAttachmentsList(result.data);
		}else{
			alert(result.message);
		}
	})
}

//填充附件列表
function fillAttachmentsList(attachmentsList){
//	debugger
	clearProductAttachmentsTable();
	var parentEle = $('#productAttachmentsTable');
	for(var i in attachmentsList){
		var tr = $('<tr></tr>');
		tr.data('attachmentId',attachmentsList[i].id);
		tr.data('state',attachmentsList[i].valid);
		
		var template = '<td>[title]</td>'+
						'<td><a class="downLoadFileByFileId">[fileName]</a></td>'+
						'<td>[uploadTime]</td>'+
						'<td>[uploadUser]</td>'+
						'<td><a class="btn btn-default btn-xs changeState">[state]</a></td>';
		var stateStr;
		if(attachmentsList[i].valid==1){
			stateStr = '禁用';
		}
		if(attachmentsList[i].valid==0){
			stateStr = '启用';
		}
		
		template = template.replace('[title]',attachmentsList[i].title)
							.replace('[fileName]',attachmentsList[i].fileName)
							.replace('[uploadTime]',attachmentsList[i].createdTime)
							.replace('[uploadUser]',attachmentsList[i].createdUser)
							.replace('[state]',stateStr);
		tr.append(template);
		parentEle.append(tr);
	}
}

//清空表格数据
function clearProductAttachmentsTable(){
	$('#productAttachmentsTable tr:not(:first)').remove();
}
