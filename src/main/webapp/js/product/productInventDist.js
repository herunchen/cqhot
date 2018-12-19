var basePath = getRootPath();
var SUCCESS =0;

initViewProductForm();

//点击确定按钮提交添加分销商
$('#btnConfirm').click(commitDistributionForm);
//删除产品和分销商的关系
$('#prodDistTable').on('click','.deleteProductDist',deleteProductDist);
//修改分销商
$('#prodDistTable').on('click','.updateProductDistByProdId',showEditDialog);


//查询分销商信息
function showEditDialog(){
	//清空表单内容
	initDialog();
	//加载模态框中分销商下拉列表
	initDistributionSelect();
	var distId = $(this).parent().parent().data('distId');
	var prodId = Window.distProdId;
	var url = basePath+'product/findProductDistribution.do';
	var param = {
			'prodId':prodId,
			'distId':distId
	}
	$.post(url,param,function(result){
		if(result.state==SUCCESS){
			$('#prodDistDialog').modal('show');
			$('#prodDistDialog .modal-title').html('编辑分销商');
			$('#prodDistDialog').data('distribution',result.data);
			fillProdDistForm();
		}else{
			alert(result.message);
		}
	})
}

//初始化模态框表单内容
function initDialog(){
	$('#distId').attr('disabled',false);
	$('.dynamicClear','#prodDistForm').val('');
	$('#message').html('');
}

//填充回显内容表单
function fillProdDistForm(){
	//debugger
	var distribution = $('#prodDistDialog').data('distribution');
	$('#distId option').each(function(){
		if(distribution.distId==$(this).val()){
			$(this).prop('selected',true);
		}
	})
	$('#distId').attr('disabled',true);
	$('#distQty').val(distribution.distQty);
	$('#beginDate').val(distribution.beginDate);
	$('#endDate').val(distribution.endDate);
	$('#prodDistDialog').data('distQty',distribution.distQty);
}

//删除产品的分销商  删除二者关系
function deleteProductDist(){
	//debugger
	var distId = $(this).parent().parent().data('distId');
	var prodId = Window.distProdId;
	var url = basePath+'product/deleteProductDist.do';
	
	var param = {
			'distId':distId,
			'prodId':prodId
	}
	$.post(url,param,function(result){
		if(result.state==SUCCESS){
			initDistList();
		}else{
			alert(result.message);
		}
	})
}

//初始化该产品的分销商列表
function initDistList(){
//	debugger
	var prodId = Window.distProdId;
	var url = basePath+'product/findDistListByProdId.do';
	var data = {'prodId':prodId};
	$.post(url,data,function(result){
		if(result.state==SUCCESS){
			if(result.data!=null){
				//填充分销商列表
				fillProdDistTable(result.data);
			}else{
				$('#distQtyTotal').text('0');
				$('#leftQty').text($('#quantity').text());
			}
		}else{
			alert(result.message);
		}
	})
}

//加载分销商列表
function fillProdDistTable(dist){
	//debugger
	var distQtyTotal = 0;
	var parentEle = $('#prodDistTable');
	$('#prodDistTable  tr:not(:first)').remove();
	for(var i in dist){
		//统计已分配数量
		distQtyTotal += dist[i].distQty;
		var tr = $('<tr></tr>');
		tr.data('distId',dist[i].distId);
		var template = '<td>[distId]</td>'+
						'<td>[distName]</td>'+
						'<td>[distQty]</td>'+
						'<td>[beginDate]</td>'+
						'<td>[endDate]</td>'+
						'<td><a class="btn btn-default btn-xs updateProductDistByProdId">修改</a>&nbsp;&nbsp;'+
						'<a class="btn btn-default btn-xs deleteProductDist">删除</a></td>';
		
		template = template.replace('[distId]',dist[i].distId)
							.replace('[distName]',dist[i].distName)
							.replace('[distQty]',dist[i].distQty)
							.replace('[beginDate]',dist[i].beginDate)
							.replace('[endDate]',dist[i].endDate);
		tr.append(template);
		parentEle.append(tr);
	}
	//填充已分配数量和剩余数量
	$('#distQtyTotal').text(distQtyTotal);
	$('#leftQty').text($('#quantity').text()-distQtyTotal);
}

//初始化头部产品表单
function initViewProductForm(){
	var prodId = Window.distProdId;
	var url = basePath+'product/viewProdInfoById.do';
	var data = {'prodId':prodId};
	$.post(url,data,function(result){
		if(result.state==SUCCESS){
			fillProductFormData(result.data);
		}else{
			alert(result.message);
		}
	});
}

//填充头部表单产品数据
function fillProductFormData(product){
	debugger
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
	$('#quantity').text(product.quantity);
	initDistList();
}


function initDistributionSelect(){
	//debugger
	var url = basePath+'product/findDistributionInfos.do';
	$.post(url,function(result){
		if(result.state==SUCCESS){
			var list = result.data;
			$('#distId').empty();
			$('#distId').append('<option value="">请选择分销商</option>');
			for(var i=0; i<list.length; i++){
				var opt=$('<option value=""></option>').val(list[i].id).html(list[i].name);
				$('#distId').append(opt);
			}
		}else{
			alert(result.message);
		}
	})
}


//提交添加分销商表单
function commitDistributionForm(){
	debugger
	if($('#prodDistForm').validate()){
		var params = getDistributionParams();
		var url;
		var title = $('#prodDistDialog .modal-title').html();
		if(title=='添加分销商'){
			url = basePath+'product/saveProductDistribution.do';
		}
		if(title == '编辑分销商'){
			url = basePath+'product/updateProductDistribution.do';
		}
		$.post(url,params,function(result){
			if(result.state==SUCCESS){
				$('#prodDistDialog').modal('hide');
				$('.dynamicClear','#prodDistForm').val('');
				initDistList();
			}
		})
	}
}

function getDistributionParams(){
	var prodId = Window.distProdId;
	var distId = $('#distId').val();
	var leftQty = $('#leftQty').text();
	
	if($('#prodDistDialog .modal-title').html()=='编辑分销商'){
		var distQtyAlready = $('#prodDistDialog').data('distQty'); 
		leftQty = +distQtyAlready + (+leftQty);
	}
	var distQty = $('#distQty').val();
	if(+distQty>+leftQty){
		$('#message').html('<font color=red>分配数量不能大于剩余数量！</font>');
		return false;
	}
	var beginDate = $('#beginDate').val();
	var endDate = $('#endDate').val();
	
	var params = {
			'prodId':prodId,
			'distId':distId,
			'distQty':distQty,
			'beginDate':beginDate,
			'endDate':endDate
	}
	return params;
}
$('#btn_add').click(function(){
	//清空表单内容
	initDialog();
	//加载模态框中分销商下拉列表
	initDistributionSelect();
	$('#prodDistDialog').modal('show');
	$('#prodDistDialog .modal-title').html('添加分销商');
})

