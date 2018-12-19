var basePath = getRootPath();
var SUCCESS = 0;

findGuides();
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
$('#btn_search').click(function(){
	findGuides();
})

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
			title : "请选择导游！",
			type : "info",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确认!",
			closeOnConfirm : true
		},function() {});
		return;
	}
	//选中项没有问题，保存
	saveProductGuides(selectedIds);
}

function saveProductGuides(options){
	debugger
	var url = basePath+'product/saveProductGuides.do'
	var prodId = Window.guidesProdId;
	var params = {
			'prodId':prodId,
			'guidesIds':options
	}
	$.post(url,params,function(result){
		if(result.state == SUCCESS){   //保存成功
			$('#modifyDialog').modal('hide');
			//重新加载产品的导游列表
			loadProductGuides();
		}else{
			alert(result.message);
		}
	})
}

function getSelections(){
	debugger
	var selectedIds ='';
	$('#guidesListTable input[name="btSelectItem"]').each(function(){
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

//分页跳转
function jumpPage(){
	var currentPage;
	var classVal = $(this).attr('class');
	if(classVal == 'firstPage'){
		currentPage = '1';
	}
	if(classVal == 'upperPage'){
		currentPage = $('#guidesListTable').data('curPage')-1;
	}
	if(classVal == 'nextPage'){
		currentPage = $('#guidesListTable').data('curPage')+1;
	}
	if(classVal == 'lastPage'){
		currentPage = $('#guidesListTable').data('lastPage');
	}
	if(classVal == 'jump'){
		var pageInput = $('#pageSelect').val();
		var lastPage = $('#guidesListTable').data('lastPage');
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
	$('#guidesListTable').data('curPage',currentPage);
	findGuides();
}

//查询所有可选导游列表
function findGuides(){
	debugger
	var params = getParams();
	var currentPage = $('#guidesListTable').data('curPage');
	if(currentPage){
		params.pageCurrent = currentPage;
	}
	var url = basePath+'product/findGuides.do';
	$.post(url,params,function(result){
		if(result.state == SUCCESS){
			clearTable();
			loadGuidesTable(result.data.guidesList);   //加载导游列表
			showPagination(result.data.pageObj);        //加载分页信息
		}else{
			alert(result.message);
		}
	})
}

//获取条件查询的条件
function getParams(){
	var name = $('#name').val();
	var contact = $('#contact').val();
	var language = $('#language').val();
	var country = $('#country').val();
	var params = {
			'name':name,
			'contact':contact,
			'language':language,
			'country':country
	}
	return params
}

//初始化表格数据
function clearTable(){
	//清空表格数据
	$('#guidesListTable  tr:not(:first)').remove();
	$('.firstPage').parent().show();
	$('.upperPage').parent().show();
	$('.nextPage').parent().show();
	$('.lastPage').parent().show();
}

//加载分页信息
function showPagination(pageObj){
	$('#currentPage').text(pageObj.pageCurrent+'/'+pageObj.pageCount);
	$('#totalCount').text(pageObj.rowCount);
	var tableElement = $("#guidesListTable");
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

//加载选择导游列表
function loadGuidesTable(guidesList){
	var parentEle = $('#guidesListTable');
	for(var i in guidesList){
		var tr = $('<tr></tr>');
		var template = '<td><input name="btSelectItem" value="[id]" class="checkbox" type="checkbox"></td>'+
						'<td>[certificateNo]</td>'+
						'<td>[name]</td>'+
						'<td>[engName]</td>'+
						'<td>[genderStr]</td>'+
						'<td>[email]</td>'+
						'<td>[language]</td>'+
						'<td>[country]</td>'+
						'<td>[contact]</td>'+
						'<td>[note]</td>';
		var genderStr;
		if(guidesList[i].gender=='male'){
			genderStr = '男';
		}
		if(guidesList[i].gender == 'female'){
			genderStr = '女';
		}
		
		template = template.replace('[id]',guidesList[i].id)
							.replace('[certificateNo]',guidesList[i].certificateNo)
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
