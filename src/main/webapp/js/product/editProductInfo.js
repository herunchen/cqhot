var basePath = getRootPath();
var SUCCESS = 0;

//初始化组件
initClass1Select();
initNumberSelect();
fillEditForm();

function fillEditForm(){
	var prodId = Window.prodId;
//	console.log(prodId);
	findProdInfoById(prodId);
}

function findProdInfoById(prodId){
	var url = basePath+'product/findProdInfoById.do';
	var param = {'prodId':prodId};
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			fillEditProdInfoFormHead(result.data);
			fillEditProdInfoFormBaseTab(result.data);
			fillEditProdInfoFormTourTab(result.data);
		}else{
			alert(result.message);
		}
	})
}

//填充头部信息
function fillEditProdInfoFormHead(prodInfo){
	debugger
	$('#productId').val(prodInfo.id);
	$('#prodId').text(prodInfo.prodId);
	$('#numId option').each(function(){
		if(prodInfo.numId==$(this).val()){
			$(this).attr('selected',true);
		}
		updateMgrName();
	});
	$('#c1Id option').each(function(){
		if(prodInfo.c1Id==$(this).val()){
			$(this).attr('selected',true);
		}
	});
	updateSelectedClass2List($('#c1Id').val(),prodInfo);
	
	$('#prodName').val(prodInfo.prodName);
}


//加载产品分类二级级联选中项
function updateSelectedClass2List(classId,prodInfo){
	var url = basePath + 'product/class2List.do';
	var data = {'c1Id':classId};
	$.post(url, data, function(result){
		if(result.state==SUCCESS){
			updateClass2List(result.data);
			$('#c2Id option').each(function(){
				if(prodInfo.c2Id==$(this).val()){
					$(this).attr('selected',true);
				}
			});
			updateSelectedClass3List($('#c2Id').val(),prodInfo);
		}else{
			alert(result.message);
		}
	});
}

//加载产品分类三级级联选中项
function updateSelectedClass3List(classId,prodInfo){
	var url = basePath + 'product/class3List.do';
	var data = {'c2Id':classId};
	$.post(url, data, function(result){
		if(result.state==SUCCESS){
			updateClass3List(result.data);
			$('#c3Id option').each(function(){
				if(prodInfo.c3Id==$(this).val()){
					$(this).attr('selected',true);
				}
			});
		}else{
			alert(result.message);
		}
	});
}


//填充基本信息tab
function fillEditProdInfoFormBaseTab(prodInfo){
	$('#srvcBeginDate').val(prodInfo.srvcBeginDate);
	$('#quantity').val(prodInfo.quantity);
	$('#srvcEndDate').val(prodInfo.srvcEndDate);
	$('#minQty').val(prodInfo.minQty);
	$('#onlineDate').val(prodInfo.onlineDate);
	$('#price').val(prodInfo.price);
	$('#offlineDate').val(prodInfo.offlineDate);
	$('#exText').val(prodInfo.exText);
	$('#prodIntro').val(prodInfo.prodIntro);
}

//填充旅游tab信息
function fillEditProdInfoFormTourTab(prodInfo){
	$('#contientId option').each(function(){
		if(prodInfo.contientId==$(this).val()){
			$(this).attr('selected',true);
		}
	});
	$('#startPlace').val(prodInfo.startPlace);
	$('#startDate').val(prodInfo.startDate);
	$('#returnPlace').val(prodInfo.returnPlace);
	$('#endDate').val(prodInfo.endDate);
	$('#nights option').each(function(){
		if(prodInfo.nights==$(this).val()){
			$(this).attr('selected',true);
		}
	});
	$('#note').val(prodInfo.note);
}



function initClass1Select(){
	var url = basePath + 'product/class1List.do';
	$.getJSON(url, function(result){
		if(result.state==SUCCESS){
			updateClass1List(result.data);
		}else{
			alert(result.message);
		}
	});
}


function updateClass1List(list){
	$('#c1Id').empty();
	$('#c1Id').append('<option value="" selected>一级分类</option>');
	for(var i=0; i<list.length; i++){
		var obj = list[i];
		var opt=$('<option value=""></option>').val(obj.id).html(obj.className);
		$('#c1Id').append(opt);
	}
}


function updateClass2List(list){
	$('#c2Id').empty();
	$('#c2Id').append('<option value="">二级分类</option>');
	for(var i=0; i<list.length; i++){
		var obj = list[i];
		var opt=$('<option value=""></option>').val(obj.id).html(obj.className);
		$('#c2Id').append(opt);
	}
}


function updateClass3List(list){
	$('#c3Id').empty();
	$('#c3Id').append('<option value="" selected>三级分类</option>');
	for(var i=0; i<list.length; i++){
		var obj = list[i];
		var opt=$('<option value=""></option>').val(obj.id).html(obj.className);
		$('#c3Id').append(opt);
	}
}
 
//  初始化团号
function initNumberSelect(){
	var url = basePath + 'product/numberList.do';
	$.getJSON(url, function(result){
		if(result.state==SUCCESS){
			updateNumberList(result.data);
		}else{
			alert(result.message);
		}
	});
}


function updateNumberList(list){
	$('#numId').empty();
	$('#numId').append('<option value="" selected>请选择产品团号</option>');
	for(var i=0; i<list.length; i++){
		var obj = list[i];
		var opt=$('<option value=""></option>').val(obj.id).html(obj.tName);
		$('#numId').append(opt);
		opt.data('mgrId',obj.mgrId);
		opt.data('mgrName',obj.mgrName);
	}
	updateMgrName();
}

$('#numId').change(function(){
	updateMgrName();
})

function updateMgrName(){
	$('#mgrId').val('');
	$('#prodMgrName').html('');
	$('#numId option').each(function(){
		if($(this).is(':selected')){
			$('#mgrId').val($(this).data('mgrId'));
			$('#prodMgrName').html($(this).data('mgrName'));
		}
	})
}


function selectGroups(){
	var groups = $('#groups_select option:selected');
    if(groups.length>1){
  		sweetAlert({
			title : "只能选择一个",
			type : "info",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确认!",
			closeOnConfirm : true
		},function() {});
    	return;
    }
    if(groups.length==1){
	    $('#usersgroupsText').val(groups[0].text);
	    $('#usersgroupsValue').val(groups[0].value);
    }
    $('#groupDialog').modal('hide');
}


//绑定事件
$('#c1Id').change(function(){
	var c1Id = $(this).val();
	if(! c1Id) {
		updateClass2List([]);
		updateClass3List([]);
		return;
	}
	var url = basePath + 'product/class2List.do';
	var data = {'c1Id':c1Id};
	$.getJSON(url, data, function(result){
		if(result.state==SUCCESS){
			updateClass2List(result.data);
		}else{
			alert(result.message);
		}
	});
});


$('#c2Id').change(function(){
	var c2Id = $(this).val();
	if(! c2Id) {
		updateClass3List([]);
		return;
	}
	var url = basePath + 'product/class3List.do';
	var data = {'c2Id':c2Id};
	$.getJSON(url, data, function(result){
		if(result.state==SUCCESS){
			updateClass3List(result.data);
		}else{
			alert(result.message);
		}
	});
});


function updateProdInfo(){
	var frm = $('#editProductForm');
	var params = frm.serialize();
	var url = basePath+'product/updateProdInfo.do';
	$.post(url,params,function(result){
		if(result.state == SUCCESS){
			alert(result.data);
			$('#content').load(basePath+'product/list.do');
		}else{
			alert(result.message);
		}
	});
}

function checkFormData(){
//	if($('#editProductForm').valid()){
		updateProdInfo();
//	}
}

$('#btn_save').click(checkFormData);
