	var basePath = getRootPath();
	var SUCCESS = 0;
	initClass1Select();
	loadProductListData();
	
	//条件查询
	$('#selectAccording').on('click','.btn_search',loadProductListData);
	//修改
	$('#selectAccording').on('click','.btn_update',showEditProductPage);
	//待售
	$('#selectAccording').on('click','.btn_onsales',changeState);
	//上架
	$('#selectAccording').on('click','.btn_online',changeState);
	//下架
	$('#selectAccording').on('click','.btn_offline',changeState);
	//点击产品名称查看产品详细
	$('#productBody').on('click','.viewProdInfoById',showViewProductInfoPage);
	//库存分销
	$('#selectAccording').on('click','.btn_product_dist',showProductDistPage);
	//价格政策
	$('#selectAccording').on('click','.btn_price_policy',showProductPricePoliciesPage);
	//附件
	$('#selectAccording').on('click','.btn_attachments',showProductAttachmentsPage);
	//导游信息
	$('#selectAccording').on('click','.btn_product_guide',showProductGuidesPage);
	//行程设置
	$('#selectAccording').on('click','.btn_tour_schedual',showProdTourSchedualPage);
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
	
	//初始化主分类
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
	//加载产品列表
	function loadProductListData(){
//		debugger
		var params = getSelectAccording();
		var currentPage = $('#productList').data('curPage');
		if(currentPage){
			params.PageCurrent = currentPage;
		}
		var url = basePath+'product/findProductInfos.do';
		$.post(url,params,function(result){
			if(result.state==SUCCESS){
				initPage();
				fillProductList(result.data.list);
				//分页
				showPagination(result.data.pageObj);
			}else{
				alert(result.message);
			}
		})
	}
	
	//点击产品名称查看产品详细信息
	function showViewProductInfoPage(){
		var prodId = $(this).parent().parent().data('prodId');
		Window.prodDetailId = prodId;
		$('#content').load(basePath+'product/showViewProductInfoPage.do');
	}
	
	//点击附件，跳转到产品附件页面
	function showProductAttachmentsPage(){
		var selectedIds = getSelections();
		if(selectedIds==''){
			sweetAlert({
				title : "请选择产品！",
				type : "info",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "确认!",
				closeOnConfirm : true
			},function() {});
			return;
		}else{
			var options = selectedIds.split(',');
			if(options.length>1){
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
		}
		Window.attachmentsProdId = selectedIds;
		$('#content').load(basePath+'product/showProductAttachmentsPage.do');
		
	}
	
	//查看产品导游信息
	function showProductGuidesPage(){
		var selectedIds = getSelections();
		if(selectedIds==''){
			sweetAlert({
				title : "请选择产品！",
				type : "info",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "确认!",
				closeOnConfirm : true
			},function() {});
			return;
		}else{
			var options = selectedIds.split(',');
			if(options.length>1){
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
		}
		Window.guidesProdId = selectedIds;
		$('#content').load(basePath+'product/showProductGuidesPage.do');
	}
	
	//库存分销
	function showProductDistPage(){
		var selectedIds = getSelections();
		if(selectedIds==''){
			sweetAlert({
				title : "请选择产品！",
				type : "info",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "确认!",
				closeOnConfirm : true
			},function() {});
			return;
		}else{
			var options = selectedIds.split(',');
			if(options.length>1){
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
		}
		Window.distProdId = selectedIds;
		$('#content').load(basePath+'product/showProductDistPage.do');
	}
	
	//产品价格政策
	function showProductPricePoliciesPage(){
		var selectedIds = getSelections();
		if(selectedIds==''){
			sweetAlert({
				title : "请选择产品！",
				type : "info",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "确认!",
				closeOnConfirm : true
			},function() {});
			return;
		}else{
			var options = selectedIds.split(',');
			if(options.length>1){
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
		}
		Window.pricePoliciesProdId = selectedIds;
		$('#content').load(basePath+'product/showProductPricePoliciesPage.do');
	}
	
	//修改产品信息操作
	function showEditProductPage(){
		//debugger
		//判断是否选中一项进行修改
		var selectedIds = getSelections();
		if(selectedIds==''){
			sweetAlert({
				title : "请选择要修改的项！",
				type : "info",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "确认!",
				closeOnConfirm : true
			},function() {});
			return;
		}else{
			var options = selectedIds.split(',');
			if(options.length>1){
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
		}
		Window.prodId = selectedIds;
		$('#content').load(basePath+'product/showEditPage.do');
	}
	
	//修改产品待售，上架，下架状态
	function changeState(){
		var state;
		if($(this).hasClass('btn_onsales')){
			state = 0;
		}
		if($(this).hasClass('btn_online')){
			state = 1;
		}
		if($(this).hasClass('btn_offline')){
			state = 2;
		}
		//获取选中的id值
		var selectedIds = getSelections();
		if(selectedIds==''){
			alert("必须选中至少一项进行操作！");
			return;
		}
		var url = basePath+'product/updateState.do';
		var param = {
				'state':state,
				'selectedIds':selectedIds
				};
		$.post(url,param,function(result){
			if(result.state == SUCCESS){
				loadProductListData();
			}else{
				alert(result.message);
			}
		})
	}
	
	function getSelections(){
		var selectedIds ='';
		$('#productBody input[name="btSelectItem"]').each(function(){
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
	
	//获取查询条件
	function getSelectAccording(){
		var state = $('#state').val();
		var c3Id = $('#c3Id').val();
		var prjName = $('#prjName').val();
		var tName = $('#tName').val();
		var prodId = $('#prodId').val();
		var prodName = $('#prodName').val();
		var srvcBeginDate = $('#srvcBeginDate').val();
		var srvcEndDate = $('#srvcEndDate').val();
		var classId ='';
		if(!c3Id){
			var c2Id = $('#c2Id').val();
			if(!c2Id){
				var c1Id = $('#c1Id').val();
				if(c1Id){
					classId = 'one-'+c1Id;
				}
			}else{
				classId = 'two-'+c2Id;
			}
		}else{
			classId = 'three-'+c3Id;
		}
		
		var params = {
				'state':state,
				'classIds':classId,
				'prjName':prjName,
				'prodId':prodId,
				'prodName':prodName,
				'srvcBeginDate':srvcBeginDate,
				'srvcEndDate':srvcEndDate
		}
		return params;
	}
	
	//分页跳转
	function jumpPage(){
		var classVal = $(this).attr('class');
		var currentPage;
		if('firstPage' == classVal){
			currentPage = 1;
		}
		if('nextPage' == classVal){
			currentPage = $('#productList').data('curPage')+1;
		}
		if('upperPage' == classVal){
			currentPage = $('#productList').data('curPage')-1;
		}
		if('lastPage' == classVal){
			currentPage = $('#productList').data('lastPage');
		}
		if('jump' == classVal){
			var pageInput = $('#pageSelect').val();
			var lastPage = $('#productList').data('lastPage');
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
		
		$('#productList').data('curPage',currentPage);
		loadProductListData();
	}
	
	
	function fillProductList(list){
		var parentEle = $('#productBody');
		for(var i in list){
			var state = '';
			if(list[i].state==0){
				state = '待售';
			}
			if(list[i].state==1){
				state = '上架';
			}
			if(list[i].state==2){
				state = '下架';
			}
			var remainQty = list[i].quantity-list[i].soldQty;
			var tr = $('<tr></tr>');
			tr.data('prodId',list[i].id);
			var template = '<td><input name="btSelectItem" value="[id]" class="checkbox" type="checkbox"></td>'+
							'<td>[state]</td>'+
							'<td>[category]</td>'+
							'<td>[prjName]</td>'+
							'<td>[tName]</td>'+
							'<td>[prodId]</td>'+
							'<td><a class="viewProdInfoById">[prodName]</a></td>'+
							'<td>[srvcBeginDate]</td>'+
							'<td>[srvcEndDate]</td>'+
							'<td>[quantity]</td>'+
							'<td>[soldQty]</td>'+
							'<td>[remainQty]</td>'+
							'<td>[price]</td>';
			template = template.replace('[id]',list[i].id)
								.replace('[state]',state)
								.replace('[category]',list[i].category)
								.replace('[prjName]',list[i].prjName)
								.replace('[tName]',list[i].tName)
								.replace('[prodId]',list[i].prodId)
								.replace('[prodName]',list[i].prodName)
								.replace('[srvcBeginDate]',list[i].srvcBeginDate)
								.replace('[srvcEndDate]',list[i].srvcEndDate)
								.replace('[quantity]',list[i].quantity)
								.replace('[soldQty]',list[i].soldQty)
								.replace('[remainQty]',remainQty)
								.replace('[price]',list[i].price);
			tr.append(template);
			parentEle.append(tr);
		}
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
	
	//分页显示
	function showPagination(pageObj){
		$('#currentPage').text(pageObj.pageCurrent+'/'+pageObj.pageCount);
		$('#totalCount').text(pageObj.rowCount);
		var tableElement = $("#productList");
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
	
	
	//初始化表格数据
	function initPage(){
		//清空表格数据
		$('#productList  tr:not(:first)').remove();
		$('.firstPage').parent().show();
		$('.upperPage').parent().show();
		$('.nextPage').parent().show();
		$('.lastPage').parent().show();
	}
	
	//绑定事件
	$('#c1Id').change(function(){
		debugger
		var c1Id = $(this).val();
		//console.log(c1Id);
		if(! c1Id) {
			updateClass2List([]);
			updateClass3List([]);
			return;
		}
		var url = basePath + 'product/class2List.do';
		var data = {c1Id:c1Id};
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
		var data = {c2Id:c2Id};
		$.getJSON(url, data, function(result){
			if(result.state==SUCCESS){
				//debuger;
				updateClass3List(result.data);
			}else{
				alert(result.message);
			}
		});
	});
	
	//行程设置
	function showProdTourSchedualPage(){
		var selectedIds = getSelections();
		if(selectedIds==''){
			sweetAlert({
				title : "至少选择一项！",
				type : "info",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "确认!",
				closeOnConfirm : true
			},function() {});
			return;
		}else{
			var options = selectedIds.split(',');
			if(options.length>1){
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
		}
		Window.prodSchedualId = selectedIds;
		$('#content').load(basePath+'product/showProductTourSchedualPage.do');
	}
