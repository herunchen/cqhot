var basePath = getRootPath();
var SUCCESS = 0;

//查询产品晚数，用于初始化行程页面
findProductNights();

//查询产品晚数，用于初始化行程页面
function findProductNights(){
	var prodId = Window.prodSchedualId;
	var param = {'prodId':prodId};
	var url = basePath+'product/findProductNights.do';
	$.post(url,param,function(result){
		if(result.state==SUCCESS){
			initSchedualPage(result.data);
		}else{
			alert(result.message);
		}
	})
}

//初始化页面信息
function initSchedualPage(nights){
	var parentEle = $('#dayTab');
	parentEle.empty();
	for(var i=1;i<=nights+1;i++){
		var li;
		if(i==1){
			li = $('<li class="active"><a data_toggle="tab" class="dayNo" id='+i+'>第'+i+'天</a></li>');
			var prodId = Window.prodSchedualId;
			$('#prodId').val(prodId);
			$('#dayNumber').val(i);
		}else{
			li = $('<li><a data_toggle="tab" class="dayNo" id='+i+'>第'+i+'天</a></li>');
		}
		parentEle.append(li);
	}
	findDayNumberSchedual(1);
}



$('#dayTab').on('click','.dayNo',changeTabActive);

function changeTabActive(){
	debugger
	$('#dayTab li').attr('class','');
	$(this).parent().attr('class','active');
	var dayNo = $(this).attr('id');
	$('#dayNumber').val(dayNo);
	//查询天数的日程内容
	findDayNumberSchedual(dayNo);
}

function findDayNumberSchedual(dayNo){
//	debugger
	var prodId = $('#prodId').val();
	var params = {
			'prodId':prodId,
			'dayNumber':dayNo
	};
	var url = basePath+'product/findDayNumberSchedual.do';
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			if(result.data!=null){
				loadSchedualForm(result.data);
			}else{
				$('#schedualId').val('');
				$('.dynamicClear','#schedualForm').val('');
			}
		}else{
			alert(result.message);
		}
	})
}

//加载特定日程表单
function loadSchedualForm(schedual){
//	debugger
	$('#schedualId').val(schedual.id);
	$('#scheName').val(schedual.scheName);
	$('#schedualContent').val(schedual.schedualContent);
	$('#lodgeMessage').val(schedual.lodgeMessage);
	$('#breakFastMessage').val(schedual.breakFastMessage);
	$('#lunchMessage').val(schedual.lunchMessage);
	$('#dinnerMessage').val(schedual.dinnerMessage);
}

//保存
$('#btn_save').click(chooseOperation);

//选择进行保存还是修改操作
function chooseOperation(){
	debugger
	var schedualId = $('#schedualId').val();
	if(schedualId){
		//修改操作
		updateSchedual();
	}else{
		//保存操作
		commitSchedual();
	}
}

//修改日程
function updateSchedual(){
	debugger
	var param = $('#schedualForm').serialize();
	var url = basePath+'product/updateSchedual.do';
	$.post(url,param,function(result){
		if(result.state==SUCCESS){
			alert('修改成功！');
			findDayNumberSchedual($('#dayNumber').val());
		}else{
			alert(result.message);
		}
	})
	
}

//提交表单
function commitSchedual(){
	debugger
	var params = $('#schedualForm').serialize();
	var url = basePath+'product/saveProductTourSchedual.do';
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			alert("保存成功！");
			findDayNumberSchedual($('#dayNumber').val());
		}else{
			alert(result.message);
		}
	})

}