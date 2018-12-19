var basePath = getRootPath();
var SUCCESS = 0;

loadPricePoliciesTable();
//首页跳转
$('#pagination').on('click','.firstPage',jumpPage);
//上一页跳转
$('#pagination').on('click','.upperPage',jumpPage);
//下一页跳转
$('#pagination').on('click','.nextPage',jumpPage);
//尾页跳转
$('#pagination').on('click','.lastPage',jumpPage);
//输入页码跳转
$('#pagination').on('click','.jump',jumpPage);
//条件查询
$('#btn_search').click(loadPricePoliciesTable);
//点击确定按钮
$('#modifyDialog').on('click','.ok',checkSelectedItems);
//模态框隐藏时，将确定按钮绑定的事件移除
$('#modifyDialog').on('hidden.bs.modal', function () {
	$('#modifyDialog').off('click','.ok');
})

//检查是否选中项
function checkSelectedItems(){
	debugger
	var selectedIds = getSelections();
	if(selectedIds==''){
		sweetAlert({
			title : "请选择政策！",
			type : "info",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确认!",
			closeOnConfirm : true
		},function() {});
		return;
	}
	//选中项没有问题，保存
	saveProductPricePolicies(selectedIds);
}

//获取选中项
function getSelections(){
	var selectedIds ='';
	$('#pricePoliciesTable input[name="btSelectItem"]').each(function(){
		if($(this).is(':checked')){  //或者用prop('checked')
			if(selectedIds==''){
				selectedIds += $(this).val();
			}else{
				selectedIds += ','+$(this).val();
			}
		}
	})
	return selectedIds;
}

//保存产品选中的政策
function saveProductPricePolicies(pricePolicyIds){
	var prodId = Window.pricePoliciesProdId;
	var url = basePath + 'product/saveProductPricePolicies.do';
	var params = {
			'prodId':prodId,
			'pricePolicyIds':pricePolicyIds
	}
	$.post(url,params,function(result){
		if(result.state == SUCCESS){   //保存成功
			$('#modifyDialog').modal('hide');
			//重新加载列表
			loadProductPricePolicies();
		}else{
			alert(result.message);
		}
	})
}

//分页跳转
function jumpPage(){
	debugger
	var currentPage;
	var classVal = $(this).attr('class');
	if(classVal == 'firstPage'){
		currentPage = '1';
	}
	if(classVal == 'upperPage'){
		currentPage = $('#pricePoliciesTable').data('curPage')-1;
	}
	if(classVal == 'nextPage'){
		currentPage = $('#pricePoliciesTable').data('curPage')+1;
	}
	if(classVal == 'lastPage'){
		currentPage = $('#pricePoliciesTable').data('lastPage');
	}
	if(classVal == 'jump'){
		var pageInput = $('#pageSelect').val();
		var lastPage = $('#pricePoliciesTable').data('lastPage');
		if(pageInput>lastPage){
			$('#pageSelect').val(lastPage);
			currentPage = lastPage;
		}else if(pageInput<1){
			$('#pageSelect').val(1);
			currentPage = 1;
		}else{
			currentPage = pageInput;
		}
	}
	$('#pricePoliciesTable').data('curPage',currentPage);
	loadPricePoliciesTable();
}

//加载政策列表
function loadPricePoliciesTable(){
	debugger
	var params = getParams();
	var currentPage = $('#pricePoliciesTable').data('curPage');
	if(currentPage){
		params.pageCurrent = currentPage;
	}
	var url = basePath +'product/findProductPricePoliciesList.do';
	$.post(url,params,function(result){
		if(result.state == SUCCESS){
			clearPricePoliciesTable();
			fillPricePoliciesTable(result.data.pricePoliciesList);
			showPagination(result.data.pageObj);        //加载分页信息
		}else{
			alert(result.message);
		}
	})
}

function getParams(){
	var prodId = Window.pricePoliciesProdId;
	var policyName = $('#policyName').val();
	var beginDate = $('#beginDate').val();
	var endDate = $('#endDate').val();
	var params = {
			'prodId':prodId,
			'policyName':policyName,
			'beginDate':beginDate,
			'endDate':endDate
	}
	return params;
}

//加载分页信息
function showPagination(pageObj){
	$('#currentPage').text(pageObj.pageCurrent+'/'+pageObj.pageCount);
	$('#totalCount').text(pageObj.rowCount);
	var tableElement = $("#pricePoliciesTable");
	tableElement.data('curPage',pageObj.pageCurrent);
	tableElement.data('lastPage',pageObj.pageCount);
	if(pageObj.pageCurrent=='1'){
		$('.firstPage').parent().hide();
		$('.upperPage').parent().hide();
	}
	if(pageObj.pageCurrent==pageObj.pageCount){
		$('.nextPage').parent().hide();
		$('.lastPage').parent().hide();
	}
}

//填充政策列表
function fillPricePoliciesTable(list){
	var parentEle = $('#pricePoliciesTable');
	for(var i in list){
		var tr = $('<tr></tr>');
		var template = '<td><input name="btSelectItem" value="[id]" class="checkbox" type="checkbox"></td>'+
						'<td>[policyName]</td>'+
						'<td>[reduce]</td>'+
						'<td>[discountPrice]</td>'+
						'<td>[quantity]</td>'+
						'<td>[minQty]</td>'+
						'<td>[beginDate]</td>'+
						'<td>[endDate]</td>'+
						'<td>[note]</td>';
		var discountPrice;
		var priceFloat = parseFloat(list[i].price);
		var reduceFloat = parseFloat(list[i].reduce)
		if(reduceFloat<0){
			discountPrice = priceFloat+reduceFloat;
		}else{
			discountPrice = priceFloat*reduceFloat;
		}
		var quantityStr;
		if(list[i].quantity=='-1'){
			quantityStr = '无上限';
		}else{
			quantityStr = list[i].quantity;
		}
		
		template = template.replace('[id]',list[i].id)
							.replace('[policyName]',list[i].policyName)
							.replace('[reduce]',list[i].reduce)
							.replace('[discountPrice]',discountPrice+'￥')
							.replace('[quantity]',quantityStr)
							.replace('[minQty]',list[i].minQty)
							.replace('[beginDate]',list[i].beginDate)
							.replace('[endDate]',list[i].endDate)
							.replace('[note]',list[i].note);
		tr.append(template);
		parentEle.append(tr);
	}
}

//清空表格数据
function clearPricePoliciesTable(){
	$('#pricePoliciesTable tr:not(:first)').remove();
	$('.firstPage').parent().show();
	$('.upperPage').parent().show();
	$('.nextPage').parent().show();
	$('.lastPage').parent().show();
}

