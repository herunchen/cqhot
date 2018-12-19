var basePath = getRootPath();
var SUCCESS = 0;

//初始化页面头部产品信息
initPageHead();
//点击添加价格政策
$('#btnRow').on('click','.btn_add',showAddPricePoliceDialog);

//显示添加产品价格政策模态框
function showAddPricePoliceDialog(){
	$('#modifyDialog .modal-body').load(basePath+'product/showAddPricePoliceDialog.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('添加价格政策');
	})
}
//删除产品价格政策
$('#productPricePoliciesTable').on('click','.deleteProductPricePolicy',deleteProductPricePolicy);


//删除产品价格政策
function deleteProductPricePolicy(){
	var pricePolicyId = $(this).parent().parent().data('pricePolicyId');
	var prodId = Window.pricePoliciesProdId;
	var params = {
			'prodId':prodId,
			'pricePolicyId':pricePolicyId
	}
	var url = basePath + 'product/deleteProductPricPolicy.do';
	$.post(url,params,function(result){
		if(result.state == SUCCESS){
			loadProductPricePolicies();
		}else{
			alert(result.message);
		}
	})
}

//初始化页面头部产品信息
function initPageHead(){
	var prodId = Window.pricePoliciesProdId;
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
	
	$('#viewProductForm').data('price',product.price);
	
	//加载该产品的价格政策列表
	loadProductPricePolicies();
}

//获取产品的价格政策列表
function loadProductPricePolicies(){
	clearTable();
	var prodId = Window.pricePoliciesProdId;
	var url = basePath + 'product/findPricePoliciesByProdId.do';
	var param = {'prodId':prodId};
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			fillProductPricePoliciesTable(result.data);
		}else{
			alert(result.message);
		}
	})
}

//清除表中已有数据
function clearTable(){
	$('#productPricePoliciesTable tr:not(:first)').remove();
}

//填充产品价格政策列表
function fillProductPricePoliciesTable(list){
	var parentEle = $('#productPricePoliciesTable');
	for(var i in list){
		var tr = $('<tr></tr>');
		tr.data('pricePolicyId',list[i].id);
		var template = '<td>[policyName]</td>'+
						'<td>[reduce]</td>'+
						'<td>[disCountPrice]</td>'+
						'<td>[quantity]</td>'+
						'<td>[minQty]</td>'+
						'<td>[beginDate]</td>'+
						'<td>[endDate]</td>'+
						'<td>[note]</td>'+
						'<td><a class="btn btn-default btn-xs deleteProductPricePolicy">删除</a></td>';
		var price = $('#viewProductForm').data('price');
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
		parentEle.append(tr);
	}
}