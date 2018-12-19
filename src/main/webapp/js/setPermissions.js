	//参数设置
    var setting = {
    	check: {   
    		enable: true,  //是否启用 复选框   
    		chkStyle: "checkbox",
    		chkboxType: { "Y": "ps", "N": "ps" }
    	}, 
        /*view: { 
        	selectedMulti: false, //取消多节点选择
        	showIcon:false, //是否显示节点的图标
        	showTitle:false //是否显示节点的 title 提示信息
        },*/
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
        }
    };
    
$(function(){
	//构造树状菜单
    createTree();
    
    //保存权限设置
    $("#btnSave").click(function(){
    	var treeObj =  $.fn.zTree.getZTreeObj("treeMenu");
    	var nodes = treeObj.getCheckedNodes(true);
    	var menuIds = "";
    	for(var key in nodes){
    		/*if(nodes[key].isParent == false) {*/
    		menuIds+=nodes[key].menuId +",";
    		/*}*/
    	}
    	
    	/*if(menuIds != "") {*/
    	$("#txtMenuIds").val(menuIds)
        $("#savePermForm").submit();
    	/*} else {
    		alert("请先选择权限菜单！");
    	}*/
    })
})

//构建菜单树
function createTree() {
	var zNodes = getMenus();
	var menuRoles = getMenuRole();
	for (var key in zNodes) {
		if ("" == zNodes[key].menuId || zNodes[key].menuId==null) {
			zNodes[key].isParent = true;
		}
		for(var item in menuRoles) {
			if(zNodes[key].menuId==menuRoles[item].menuId && $("#txtRoleId").val() == menuRoles[item].roleId) {
				zNodes[key].checked = true;
				break;
			}
		}
	}
	var zTree = $.fn.zTree.init($("#treeMenu"), setting, zNodes);
	//默认展开所有节点
	zTree.expandAll(true);
}

//取得所有菜单
function getMenus() {
	var zNodes = "";
	getAjax("getMenus.do", null, function (data) {
		zNodes = data;
    },"get");
	
	return zNodes;
}

//取得角色对应的菜单
function getMenuRole(){
	var menuRoles = "";
	getAjax("getMenuRole.do", "roleId=" + $("#txtRoleId").val(), function (data) {
		menuRoles = data;
    },"get");
	
	return menuRoles;
}