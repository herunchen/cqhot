//参数设置
	var zNodes = "";
    var setting = {
        view: { 
        	selectedMulti: false,
        	showIcon:false,
        	showTitle:false },	//取消节点多选
        data: {
            keep: {
                parent: true,
                leaf: true
            },
            key:{
            	name:"menuName"
            },
            simpleData: {
                enable: true,
                idKey: "menuId",
                pIdKey: "parentMenu",
                rootPId: null
            }
        },
        callback: {
            onClick: zTreeOnClick
        }
    };
    
    var par_setting = {
            view: { 
            	selectedMulti: false,
            	showIcon:false,
            	showTitle:false },	//取消节点多选
            data: {
                keep: {
                    parent: true,
                    leaf: true
                },
                key:{
                	name:"menuName"
                },
                simpleData: {
                    enable: true,
                    idKey: "menuId",
                    pIdKey: "parentMenu",
                    rootPId: null
                }
            },
            callback: {
                onClick: selectClick
            }
        };

$(function(){
	 //构造树状菜单
    createTree();
    
    //新增菜单
    $("#btnAddMenu").click(function(){
    	var treeObj = $.fn.zTree.getZTreeObj("treeMenu");
    	var nodes = treeObj.getSelectedNodes();
    	$("#txtMenuId").val("");
    	$("#txtMenuName").val("");
    	$("#txtLinkUrl").val("");
    	$("#txtSortLevel").val("0");
    	$("#txtMenuDesc").val("");
    	$("#txtIcon").val("");
    	clearParent();
    })
    
    //删除菜单
    $("#btnDelMenu").click(function(){
    	var treeObj = $.fn.zTree.getZTreeObj("treeMenu");
    	var nodes = treeObj.getSelectedNodes();
    	if(nodes.length<=0){
    		alert("请先选择菜单！");
    	} else if(confirm('是否确认删除？')) {
    		getAjax("delMenu.do", "menuId="+nodes[0].menuId, function (data) {
    			treeObj.removeNode(nodes[0]);
    	    },"get");
    	}
    })
    
    //保存
    $("#btnOk").click(function(){
    	if(isEmpty($("#txtMenuName").val())) {
			$("#chkMenuName").addClass("has-error");
			$("#lblMenuName").removeClass("hide");
			return false;
		}
    	$("#menuForm").submit();
    })
})

//构建菜单树
function createTree() {
	getMenus();
	for (var key in zNodes) {
		if ("" == zNodes[key].menuId || null==zNodes[key].menuId) {
			zNodes[key].isParent = true;
		}
	}
	var zTree = $.fn.zTree.init($("#treeMenu"), setting, zNodes);
	var parentTree = $.fn.zTree.init($("#parentTree"), par_setting, zNodes);
	//默认展开所有节点
	zTree.expandAll(true);
}

//取得所有菜单
function getMenus() {
	getAjax("getMenus.do", null, function (data) {
		zNodes = data;
    },"get");
}

//点击回调
function zTreeOnClick(event, treeId, treeNode) {
	$("#txtMenuId").val(treeNode.menuId);
	$("#txtMenuName").val(treeNode.menuName);
	$("#txtLinkUrl").val(treeNode.linkUrl);
	$("#txtSortLevel").val(treeNode.sortLevel);
	var node = treeNode.getParentNode();
	if(node==null) {
		clearParent();
	} else {
		$("#txtParentMenu").val(node.menuId);
		$("#txtParentName").val(node.menuName);
	}
	$("#txtMenuDesc").val(treeNode.menuDesc);
	$("#txtIcon").val(treeNode.icon);
}

//选择上级菜单
function showMenu(){
	var m = $("#menu").val();
    if (m == "0") {
        $("#menu").val("1");
        /*var objOffset = $("#txtParentName").offset();*/
        /*var objOffset = $("#txtParentMenu").offset();*/
        //定位zTree外围div容器位置
        $("#menuContent").slideDown("fast");
    }
    else {
        hideMenu();
    }
}

function clearParent() {
	$("#txtParentMenu").val("");
	$("#txtParentName").val("");
}

//隐藏zTree外围div容器
function hideMenu() {
    $("#menuContent").fadeOut("fast");
    $("#menu").val("0");
}

function selectClick(event, treeId, treeNode) {
	$("#txtParentMenu").val(treeNode.menuId);
	$("#txtParentName").val(treeNode.menuName);
	hideMenu();
	return false;
}