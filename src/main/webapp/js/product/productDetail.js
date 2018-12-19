var basePath = getRootPath();
var SUCCESS = 0;
var prodId = Window.prodDetailId;
var param = {'prodId':prodId};

//初始化页面头部产品信息
initPageHead();
//默认查询第一个tab栏的信息---查询产品基本信息
findProductBasicInfo();
//点击tab,查询相应的信息
$(document).on('click','.productTab',findProductInfos);
//点击文件名下载
$(document).on('click','.downLoadFileByFileId',downLoadFileByFileId);

//文件下载
function downLoadFileByFileId(){
	var attachmentId = $(this).parent().parent().data('attachmentId');
	var url = basePath + 'product/downLoadFileByFileId.do?attachmentId='+attachmentId;
	$(this).attr('href',url);
}

//查询产品相应的信息
function findProductInfos(){
	var info = $(this).text();
	if(info=='基本信息'){
		findProductBasicInfo();
	}
	if(info=='旅游详细'){
		findProductDetailInfo();
	}
	if(info=='库存分销'){
		findProductDistList();
	}
	if(info=='价格政策'){
		findProductPricePoliceList();
	}
	if(info=='附件'){
		findProductAttachmentList();
	}
}

//查看产品附件列表
function findProductAttachmentList(){
	debugger
	var url = basePath+'product/findAttachmentsListByProdId.do';
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			loadProductAttachmentsTable(result.data);
		}else{
			alert(result.message);
		}
	})
}

//加载附件列表
function loadProductAttachmentsTable(attachmentsList){
	debugger
	clearTable();
	var tableHead = $('#tableHead');
	var tableHeadTemplate = '<th>标题</th>'+
							'<th>文件名</th>'+
							'<th>上传时间</th>'+
							'<th>上传用户</th>';
	tableHead.append(tableHeadTemplate);
	var tableBody = $('#tableBody');
	for(var i in attachmentsList){
		var tr = $('<tr></tr>');
		tr.data('attachmentId',attachmentsList[i].id);
		
		var template = '<td>[title]</td>'+
						'<td><a class="downLoadFileByFileId">[fileName]</a></td>'+
						'<td>[uploadTime]</td>'+
						'<td>[uploadUser]</td>';
		template = template.replace('[title]',attachmentsList[i].title)
							.replace('[fileName]',attachmentsList[i].fileName)
							.replace('[uploadTime]',attachmentsList[i].createdTime)
							.replace('[uploadUser]',attachmentsList[i].createdUser);
		tr.append(template);
		tableBody.append(tr);
	}
}

//查看产品价格政策列表
function findProductPricePoliceList(){
	var url = basePath + 'product/findPricePoliciesByProdId.do';
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			loadProductPricePoliciesTable(result.data);
		}else{
			alert(result.message);
		}
	})
}

//加载产品价格政策列表
function loadProductPricePoliciesTable(list){
	clearTable();
	var tableHead = $('#tableHead');
	var tableHeadTemplate = '<th>政策名称</th>'+
							'<th>政策优惠</th>'+
							'<th>折后价格</th>'+
							'<th>最大数量</th>'+
							'<th>最低数量</th>'+
							'<th>开始日期</th>'+
							'<th>结束日期</th>'+
							'<th>政策说明</th>';
	tableHead.append(tableHeadTemplate);
	var tableBody = $('#tableBody');
	for(var i in list){
		var tr = $('<tr></tr>');
		var template = '<td>[policyName]</td>'+
						'<td>[reduce]</td>'+
						'<td>[disCountPrice]</td>'+
						'<td>[quantity]</td>'+
						'<td>[minQty]</td>'+
						'<td>[beginDate]</td>'+
						'<td>[endDate]</td>'+
						'<td>[note]</td>';
		var price = $('#price').text();
		var disCountPrice;
		var priceFloat = parseFloat(price);
		var reduceFloat = parseFloat(list[i].reduce);
		if(reduceFloat<0){
			disCountPrice = priceFloat + reduceFloat;
		}else{
			disCountPrice = priceFloat*reduceFloat;
		}
		var quantityStr;
		if(list[i].quantity=='-1'){
			quantityStr = '无上限';
		}else{
			quantityStr = list[i].quantity;
		}
		
		template = template.replace('[policyName]',list[i].policyName)
							.replace('[reduce]',list[i].reduce)
							.replace('[disCountPrice]',disCountPrice+'￥')
							.replace('[quantity]',quantityStr)
							.replace('[minQty]',list[i].minQty)
							.replace('[beginDate]',list[i].beginDate)
							.replace('[endDate]',list[i].endDate)
							.replace('[note]',list[i].note);
		tr.append(template);
		tableBody.append(tr);
	}
}

//查看产品库存分销列表
function findProductDistList(){
	var url = basePath+'product/findDistListByProdId.do';
	$.post(url,param,function(result){
		if(result.state==SUCCESS){
			loadProductDistTable(result.data);   //加载产品库存分销列表
		}else{
			alert(result.message);
		}
	})
}

//加载产品库存分销列表
function loadProductDistTable(distList){
	clearTable();
	var tableHead = $('#tableHead');
	var tableHeadTemplate = '<th>分销商编号</th>'+
							'<th>分销商名称</th>'+
							'<th>分配数量</th>'+
							'<th>销售开始日期</th>'+
							'<th>销售终止日期</th>';
	tableHead.append(tableHeadTemplate);
	var tableBody = $('#tableBody');
	for(var i in distList){
		var tr = $('<tr></tr>');
		var trTemplate = '<td>[distId]</td>'+
						'<td>[distName]</td>'+
						'<td>[distQty]</td>'+
						'<td>[beginDate]</td>'+
						'<td>[endDate]</td>';
		trTemplate = trTemplate.replace('[distId]',distList[i].distId)
							.replace('[distName]',distList[i].distName)
							.replace('[distQty]',distList[i].distQty)
							.replace('[beginDate]',distList[i].beginDate)
							.replace('[endDate]',distList[i].endDate);
		tr.append(trTemplate);
		tableBody.append(tr);
	}
}

//加载之前清除表格数据
function clearTable(){
	$('#tableHead th').remove();
	$('#tableBody tr').remove();
}

//查询旅游详细信息
function findProductDetailInfo(){
	var url = basePath + 'product/findProductDetailInfo.do';
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			fillProductDetailInfo(result.data);   //填充产品旅游详细信息tab栏
		}else{
			alert(result.message);
		}
	})
}

//填充产品旅游详细信息tab栏
function fillProductDetailInfo(prodInfo){
	$('#destName').text(prodInfo.destName);
	$('#startPlace').text(prodInfo.startPlace);
	$('#startDate').text(prodInfo.startDate);
	$('#returnPlace').text(prodInfo.returnPlace);
	$('#endDate').text(prodInfo.endDate);
	$('#nights').text(prodInfo.nights);
	$('#note').text(prodInfo.note);
}

//查询产品基本信息
function findProductBasicInfo(){
	var url = basePath +'product/findProductBasicInfo.do';
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			fillProductBasicInfo(result.data);   //填充产品基本信息tab栏
		}else{
			alert(result.message);
		}
	})
}

//填充产品基本信息tab栏
function fillProductBasicInfo(prodInfo){
	debugger
	$('#srvcBeginDate').text(prodInfo.srvcBeginDate);
	$('#quantity').text(prodInfo.quantity);
	$('#srvcEndDate').text(prodInfo.srvcEndDate);
	$('#minQty').text(prodInfo.minQty);
	$('#onlineDate').text(prodInfo.onlineDate);
	$('#prodPrice').text(prodInfo.price);
	$('#offlineDate').text(prodInfo.offlineDate);
	$('#exText').text(prodInfo.exText);
	$('#prodIntro').text(prodInfo.prodIntro);
}

//初始化页面头部产品信息
function initPageHead(){
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
}
