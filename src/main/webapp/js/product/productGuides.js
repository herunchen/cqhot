var basePath = getRootPath();
var SUCCESS = 0;

//初始化页面头部产品信息
initPageHead();
//删除产品的导游信息
$('#productGuidesTable').on('click','.deleteProductGuide',deleteProductGuide);


//删除产品的导游信息
function deleteProductGuide(){
	var prodId = Window.guidesProdId;
	var guideId = $(this).parent().parent().data('guideId');
	var url = basePath+'product/deleteProductGuide.do';
	var params = {
			'prodId':prodId,
			'guideId':guideId
	}
	$.post(url,params,function(result){
		if(result.state == SUCCESS){   //删除成功
			loadProductGuides();
		}else{
			alert(result.message);
		}
	})
}

//初始化页面头部产品信息
function initPageHead(){
	var prodId = Window.guidesProdId;
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
	
	//加载该产品的导游列表
	loadProductGuides();
}


//加载产品导游列表
function loadProductGuides(){
	var prodId = Window.guidesProdId;
	var url = basePath + 'product/findGuidesListByProdId.do';
	var data = {'prodId':prodId};
	$.post(url,data,function(result){
		if(result.state == SUCCESS){
			//填充表格数据
			fillGuidesList(result.data);
		}else{
			alert(result.message);
		}
	})
}

function fillGuidesList(guidesList){
	clearGuidesTable();
	var parentEle = $('#productGuidesTable');
	for(var i in guidesList){
		var tr = $('<tr></tr>');
		tr.data('guideId',guidesList[i].id);
		
		var template = '<td>[certificateNo]</td>'+
						'<td>[name]</td>'+
						'<td>[engName]</td>'+
						'<td>[genderStr]</td>'+
						'<td>[email]</td>'+
						'<td>[language]</td>'+
						'<td>[country]</td>'+
						'<td>[contact]</td>'+
						'<td>[note]</td>'+
						'<td><a class="btn btn-default btn-xs deleteProductGuide">删除</a></td>';
		
		var genderStr;
		if(guidesList[i].gender=='male'){
			genderStr = '男';
		}
		if(guidesList[i].gender == 'female'){
			genderStr = '女';
		}
		
		template = template.replace('[certificateNo]',guidesList[i].certificateNo)
							.replace('[name]',guidesList[i].name)
							.replace('[engName]',guidesList[i].engName)
							.replace('[genderStr]',genderStr)
							.replace('[email]',guidesList[i].email)
							.replace('[language]',guidesList[i].language)
							.replace('[country]',guidesList[i].country)
							.replace('[contact]',guidesList[i].contact)
							.replace('[note]',guidesList[i].note);
		tr.append(template);
		parentEle.append(tr);
	}
}

function clearGuidesTable(){
	$('#productGuidesTable tr:not(:first)').remove();
}

$('#btn_add').click(function(){
	$('#modifyDialog .modal-body').load(basePath+'product/showProductGuidesDialog.do',function(){
	    $('#modifyDialog').modal('show');
		$('#modifyDialog .modal-title').html('添加导游');
	})
})

