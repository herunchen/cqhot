var basePath = getRootPath();
var SUCCESS = 0;

//初始化一级分类表格
loadTopCategoryTable();
//点击一级分类列表行事件
$(document).on('click','#topCategoryTable tr:not(:first)',changeTopCategorySeletedOption);
//点击二级分类列表行事件
$(document).on('click','#secondCategoryTable tr:not(:first)',changeSecondCategorySelectedOption);
//点击三级分类列表行事件
$(document).on('click','#thirdCategoryTable tr:not(:first)',changeThirdCategorySelectedOption);
//新增
$(document).on('click','.btn_add',showAddClassDialog);
//修改
$(document).on('click','.btn_update',findClassInfoById);
//保存或修改分类
$(document).on('click','#btn_save',saveOrUpdateClass);
//删除
$(document).on('click','.btn_del',checkProductClassDeletable);
//模态框隐藏时，将确定按钮绑定的事件移除
$('#addClassModal').on('hide.bs.modal',dynamicClearData);


//检查选中项是否可删除
function checkProductClassDeletable(){
	var panelBody = $(this).parent();
	var selectedId = getSelectedOption(panelBody);
	if(!selectedId){
		sweetAlert({
			title : "请选择删除项！",
			type : "info",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确认!",
			closeOnConfirm : true
		},function() {});
		return;
	}
	hasProduct(selectedId);    //判断分类下是否有产品
}

//判断分类下是否有产品
function hasProduct(classId){
	var classLevel = $('#addClassModal').data('classLevel');
	var params = {'classLevel':classLevel,'classId':classId};
	var url = basePath + 'product/hasProduct.do';
	$.post(url,params,function(result){
		if(result.state == SUCCESS){
			if(result.data==''){   //分类下没有产品，可以删除
				if(classLevel!='three'){
					sweetAlert({
						title : "此操作会将该分类下的所有子分类删除，确定删除？",
						type : "info",
						showCancelButton : true,
						confirmButtonColor : "#DD6B55",
						confirmButtonText : "确认!",
						closeOnConfirm : true
					},function() {
						deleteClasses(params);
					});
				}else{
					deleteClasses(params);
				}
			}else{
				alert(result.data);
			}
		}else{
			alert(result.message);
		}
	})
}

//删除分类
function deleteClasses(params){
	var url = basePath+'product/deleteClasses.do';
	$.post(url,params,function(result){
		if(result.state==SUCCESS){
			alert('删除成功！');
			loadCategoryTable(params.classLevel);
			dynamicClearData();
		}else{
			alert(result.message);
		}
	})
}
 
//获取要修改的项的id
function findClassInfoById(){
	//debugger
	var panelBody = $(this).parent();
	//判断点击的修改按钮所在的表格是否有选中项
	var selectedId = getSelectedOption(panelBody);
	if(!selectedId){
		sweetAlert({
			title : "请选择修改项！",
			type : "info",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确认!",
			closeOnConfirm : true
		},function() {});
		return;
	}
	showEditClassDialog(selectedId);
}

//显示分类修改编辑框
function showEditClassDialog(selectedId){
	$('#addClassModal').data('classId',selectedId);
	var url = basePath+'product/findClassInfoById.do';
	var param = {'classId':selectedId};
	$.post(url,param,function(result){
		if(result.state==SUCCESS){
			$('#btn_save').text('修改');
			$('#addClassModal').modal('show');
			fillClassForm(result.data);
		}else{
			alert(result.message);
		}
	})
}

//在模态框回显数据
function fillClassForm(classInfo){
	debugger
	$('#className').val(classInfo.className);
}

//获取选中项
function getSelectedOption(panelBody){
	var selectedId;
	if(panelBody.hasClass('topClass')){
		selectedId = getData('one');
	}
	if(panelBody.hasClass('secondClass')){
		selectedId = getData('two');
	}
	if(panelBody.hasClass('thirdClass')){
		selectedId = getData('three');
	}
	return selectedId;
}

//获取选中id以及绑定数据
function getData(classLevel){
	var selectedId,trs,parentId;
	var dialog = $('#addClassModal');
	if(classLevel=='one'){
		//获取出表头外的所有行
		trs = $('#topCategoryTable tr:not(:first)');
		dialog.data('classLevel','one');
		dialog.data('parentId',null);
	}
	if(classLevel=='two'){
		trs = $('#secondCategoryTable tr:not(:first)');
		$('#topCategoryTable tr:not(:first)').each(function(){
			if($(this).attr('class')=='active'){
				parentId = $(this).data('classId');
			}
		})
		dialog.data('classLevel','two');
		dialog.data('parentId',parentId);
	}
	if(classLevel=='three'){
		trs = $('#thirdCategoryTable tr:not(:first)');
		$('#secondCategoryTable tr:not(:first)').each(function(){
			if($(this).attr('class')=='active'){
				parentId = $(this).data('classId');
			}
		})
		dialog.data('classLevel','three');
		dialog.data('parentId',parentId);
	}
	trs.each(function(){
		if($(this).attr('class')=='active'){
			selectedId = $(this).data('classId');
		}
	})
	return selectedId;
}

//保存或修改分类
function saveOrUpdateClass(){
	//debugger
	if($('#classForm').valid()){
		var className = $('#className').val();
		var params,url;
		var textVal = $(this).text();
		if(textVal=='保存'){
			var parentId = $('#addClassModal').data('parentId');
			params = {'parentId':parentId,'className':className}
			url = basePath+'product/saveProductClass.do';
		}
		if(textVal=='修改'){
			var classId = $('#addClassModal').data('classId');
			params = {'id':classId,'className':className}
			url = basePath +'product/updateProductClass.do';
		}
		$.post(url,params,function(result){
			if(result.state == SUCCESS){
				loadCategoryTable(); //加载相应级别分类列表
				$('#addClassModal').modal('hide');
			}else{
				alert(result.message);
			}
		})
	}
}

//添加完成后加载列表
function loadCategoryTable(level){
	debugger
	var classLevel;
	if(level){
		classLevel = level;
	}else{
		classLevel = $('#addClassModal').data('classLevel');
	}
	if(classLevel == 'one'){
		$('#secondCategoryDiv').css('display','none');
		$('#thirdCategoryDiv').css('display','none');
		loadTopCategoryTable();
	}
	if(classLevel=='two'){
		$('#thirdCategoryDiv').css('display','none');
		loadSecondCategoryTable();
	}
	if(classLevel=='three'){
		loadThirdCategoryTable();
	}
} 

//新增
function showAddClassDialog(){
	var panelBody = $(this).parent();
	var dialog = $('#addClassModal');
	var modalTitle = $('#addClassModal .modal-title');
	var title;
	if(panelBody.hasClass('topClass')){
		title = initDialogTitle('one');
	}
	if(panelBody.hasClass('secondClass')){
		title = initDialogTitle('two');
	}
	if(panelBody.hasClass('thirdClass')){
		title = initDialogTitle('three');
	}
	modalTitle.html(title);
	$('#btn_save').text('保存');
	dialog.modal('show');
}

//新增分类时设置模态框title
function initDialogTitle(classLevel){
	var topClassName,secondClassName;
	var dialog = $('#addClassModal');
	var title;
	if(classLevel == 'one'){
		dialog.data('parentId',null);
		dialog.data('classLevel','one');
		title = '主分类';
	}
	if(classLevel == 'two'){
		$('#topCategoryTable tr').each(function(){
			if($(this).attr('class') == 'active'){
				topClassName = $(this).find('td:first').text();
				dialog.data('parentId',$(this).data('classId'));
				dialog.data('classLevel','two');
				title =topClassName;
			}
		})
	}
	if(classLevel=='three'){
		//获取一级分类名称
		$('#topCategoryTable tr').each(function(){
			if($(this).attr('class') == 'active'){
				topClassName = $(this).find('td:first').text();
			}
		})
		//获取二级分类名称
		$('#secondCategoryTable tr').each(function(){
			if($(this).attr('class') == 'active'){
				secondClassName = $(this).find('td:first').text();
				dialog.data('parentId',$(this).data('classId'));
				dialog.data('classLevel','three');
				title = topClassName+' - '+secondClassName;
			}
		})
	}
	return title;
}

//选择三级列表中的选中项
function changeThirdCategorySelectedOption(){
	//debugger
	$('#thirdCategoryTable tr').removeClass('active');
	$(this).attr('class','active');
}

//设置二级分类的选中项
function changeSecondCategorySelectedOption(){
	//debugger
	//将所有行的active属性移除
	$('#secondCategoryTable tr').removeClass('active');
	//给选定的行添加active属性
	$(this).attr('class','active');
	$('#thirdCategoryDiv').css('display','block');
	var secondClassId = $(this).data('classId');
	loadThirdCategoryTable(secondClassId);
}

//加载三级分类列表
function loadThirdCategoryTable(secondClassId){
	debugger
	var parentId = $('#addClassModal').data('parentId');
	if(parentId!=null){
		secondClassId = parentId;
	}
	var param = {'c2Id':secondClassId};
	var url = basePath + 'product/class3List.do';
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			clearThirdCategoryTable();
			fillThirdCategoryTable(result.data);
		}else{
			alert(result.message);
		}
	})
}

//清空三级列表表中数据
function clearThirdCategoryTable(){
	$('#thirdCategoryTable tr').removeClass('active');
	$('#thirdCategoryTable tr:not(:first)').remove();
}

//填充三级分类表格
function fillThirdCategoryTable(list){
	var parentEle = $('#thirdCategoryTable');
	for(var i in list){
		var tr = $('<tr></tr>');
		tr.data('classId',list[i].id);
		var changeState;
		var state;
		var template = '<td>[className]</td>';
		template = template.replace('[className]',list[i].className);
		tr.append(template);
		parentEle.append(tr);
	}
}

//设置一级分类中的选中项
function changeTopCategorySeletedOption(){
	//debugger
	//将所有行的active属性移除
	$('#topCategoryTable tr').removeClass('active');
	//给选定的行添加active属性
	$(this).attr('class','active');
	$('#secondCategoryDiv').css('display','block');
	$('#thirdCategoryDiv').css('display','none');
	var topClassId = $(this).data('classId');
	loadSecondCategoryTable(topClassId);
}

//加载二级分类列表
function loadSecondCategoryTable(topClassId){
	debugger
	var parentId = $('#addClassModal').data('parentId');
	if(parentId!=null){
		topClassId = parentId;    //添加完成后自动加载二级分类，获取模态框绑定的一级分类id
	}
	var url = basePath + 'product/class2List.do';
	var param = {'c1Id':topClassId};
	$.post(url,param,function(result){
		if(result.state == SUCCESS){
			clearSecondCategoryTable();
			fillSecondCategoryTable(result.data);
		}else{
			alert(result.message);
		}
	})
}

//将模态框的所有数据移除
function dynamicClearData(){
	//debugger
	$('#className').val('');
	$('#addClassModal').data('parentId',null);
	$('#addClassModal').data('classLevel',null);
	$('#addClassModal').data('classId',null);
}

//清空二级分类表格的数据
function clearSecondCategoryTable(){
	$('#secondCategoryTable tr').removeClass('active');
	$('#secondCategoryTable tr:not(:first)').remove();
}

//填充二级分类列表
function fillSecondCategoryTable(list){
	var parentEle = $('#secondCategoryTable');
	for(var i in list){
		var tr = $('<tr></tr>');
		tr.data('classId',list[i].id);
		var state,changeState;
		var template = '<td>[className]</td>';
		template = template.replace('[className]',list[i].className);
		tr.append(template);
		parentEle.append(tr);
	}
}

//加载一级分类列表
function loadTopCategoryTable(){
	var url = basePath + 'product/class1List.do';
	$.getJSON(url,function(result){
		if(result.state == SUCCESS){
			clearTopCategoryTable();
			fillTopCategoryTable(result.data);
		}else{
			alert(result.message);
		}
	})
}

//清空一级分类表格
function clearTopCategoryTable(){
	$('#topCategoryTable tr:not(:first)').remove();
}

//填充一级分类表格
function fillTopCategoryTable(list){
	var parentEle = $('#topCategoryTable');
	for(var i in list){
		var tr = $('<tr></tr>');
		tr.data('classId',list[i].id);
		var state,changeState;
		var template  = '<td>[className]</td>';
		template = template.replace('[className]',list[i].className);
		tr.append(template);
		parentEle.append(tr);
	}
}