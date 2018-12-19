$(function() {
	//取得当前登录用户的权限菜单
	getAjax("../selectMenuByUser.do", null, function (data) {
		for(var key in data) {
			 if(null == data[key].parentMenu || "" == data[key].parentMenu) {
				 var li = $("<li></li>");
				 li.append("<a href='javascript:;'><i class='"+data[key].icon+"'></i>"+ data[key].menuName + "<span class='fa arrow'></span></a>");
				 li.append(buildTree(data[key].menuId, data));
				// $("#side-menu").append(li);
			 }
		}
    },"get");
	
  //  $('#side-menu').metisMenu();

});

//构建左侧菜单
function buildTree(parentId, data){
	var ul=$("<ul class='nav nav-second-level collapse'></ul>");
	var li=$("<li></li>");
	var a = "";
	for(var key in data) {
		if(data[key].parentMenu == parentId) {
			a+="<a href='"+data[key].linkUrl+"'>"+data[key].menuName+"</a>";
		}
	}
	li.append(a);
	ul.append(li);
	return ul;
}

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
    $(window).bind("load resize", function() {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    var url = window.location;
    var belongMenu = $("#belongMenu").val();
	belongMenu = belongMenu == undefined?belongMenu:belongMenu.toLowerCase();
    var element = $('ul.nav a').filter(function() {
    	var src = $(this).attr("href").toLowerCase();
        return this.href == url || url.href.indexOf(this.href) == 0 || src.indexOf(belongMenu) >= 0;
    }).addClass('active').parent().parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }
});
