var basePath = getRootPath();
var SUCCESS = 0;

//初始化组件
initClass1Select();
initNumberSelect();

function initClass1Select(){
	var url = basePath + 'product/class1List.do';
	$.getJSON(url, function(result){
		if(result.state==SUCCESS){
			//debuger;
			updateClass1List(result.data);
		}else{
			alert(result.message);
		}
	});
}

function updateClass1List(list){
	$('#c1Id').empty();
	$('#c1Id').append('<option value="">一级分类</option>');
	for(var i=0; i<list.length; i++){
		var obj = list[i];
		var opt=$('<option value=""></option>').val(obj.id).html(obj.className);
		$('#c1Id').append(opt);
	}
}


function updateClass2List(list){
	debugger
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
	$('#c3Id').append('<option value="">三级分类</option>');
	for(var i=0; i<list.length; i++){
		var obj = list[i];
		var opt=$('<option value=""></option>').val(obj.id).html(obj.className);
		$('#c3Id').append(opt);
	}
}

/**
 * 初始化团号
 * @returns
 */
function initNumberSelect(){
	var url = basePath + 'product/numberList.do';
	$.getJSON(url, function(result){
		if(result.state==SUCCESS){
			//debuger;
			updateNumberList(result.data);
		}else{
			alert(result.message);
		}
	});
}

function updateNumberList(list){
	$('#numId').empty();
	$('#numId').append('<option value="">请选择产品团号</option>');
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
});

//更新当前团号得产品经理
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



/*function initGroupDialog(){
	var url = basePath + 'product/groupList.do';
	$.getJSON(url, function(result){
		if(result.state==SUCCESS){
			//debuger;
			updateGroupDialog(result.data);
		}else{
			alert(result.message);
		}
	});
}*/

/*function updateGroupDialog(list){
	$('#groupDialog .modal-title').html('选择部门');
	var select = $('<select id="groups_select" multiple="multiple" ></select>');
	for(var i=0; i<list.length; i++){
		var obj = list[i];
		var opt = $('<option value="GRP0031" data-section="出境中心" data-key="17">邮轮部</option>')
			.val(obj.grpId).attr('data-section', obj.parentName).attr('data-key',i).html(obj.grpName);
		select.append(opt);
	}
	//$('#groupDialog .modal-dialog').removeClass('modal-lg');
	$('#groupDialog .modal-body').html($('<div></div>').css('height','380px').css('overflow','scroll').html(select));
	$("#groups_select").hide();
    $("#groups_select").treeMultiselect({
        enableSelectAll: false,//隐藏显示全选，取消全选按钮
        sortable: false,//启用禁用右侧panel显示结果排序
        hideSidePanel: true, //隐藏显示右侧选择结果panel
        freeze: false,//禁用所有checkbox
        collapsible: false,
        onlyBatchSelection: false,//如果为true，子节点的checkbox均无法选择
        allowBatchSelection: true,//显示、隐藏批量选择的节点
        sectionDelimiter: '/',//路径分隔符,与data-section中路径一致
        showSectionOnSelected: false,//隐藏显示右侧选择结果panel 中父节点名称
        startCollapsed: false,
        onChange: null
    });
}*/


/*function selectGroups(){
	debugger
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
}*/


//绑定事件

$('#c1Id').change(function(){
	var c1Id = $(this).val();
	//console.log(c1Id);
	if(! c1Id) {
		updateClass2List([]);
		updateClass3List([]);
		return;
	}
	var url = basePath + 'product/class2List.do';
	var data = {'c1Id':c1Id};
	$.getJSON(url, data, function(result){
		if(result.state==SUCCESS){
			//debuger;
			updateClass2List(result.data);
		}else{
			alert(result.message);
		}
	});
});

$('#c2Id').change(function(){
	var c2Id = $(this).val();
	//console.log(c2Id);
	if(! c2Id) {
		updateClass3List([]);
		return;
	}
	var url = basePath + 'product/class3List.do';
	var data = {'c2Id':c2Id};
	$.getJSON(url, data, function(result){
		if(result.state==SUCCESS){
			//debuger;
			updateClass3List(result.data);
		}else{
			alert(result.message);
		}
	});
});



function checkFormData(){
	var frm = $('#newProduct');
	if(frm.valid()){
		commitProdInfoForm();
	}
}

/*$('#groupDialog').on('click', '.ok', selectGroups);*/

$('#btn_save').click(checkFormData);


function commitProdInfoForm(){
	var frm = $('#newProduct');
	var data = frm.serialize();
	var url=basePath+"product/save.do";
	$.post(url, data, function(result){
		if(result.state == SUCCESS){
			alert(result.data);
			$('#newProduct')[0].reset();
			$('#prodMgrName').html('');
			$('#mgrId').val('');
		}else{
			alert(result.message);
		}
	});
	return false;
}


