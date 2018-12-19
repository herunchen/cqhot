/**
 * 需要引入 :
 *     jquery
 *     sweetalert.js
 *     sweetalert.css
 */
//弹窗
window.successAlert = function (fun){//成功
    swal({
        title: "成功!",
        text: "保存成功!",
        type: "success",
        confirmButtonText: "ok"
    }, fun);
};
window.bugAlert = function(message){//异常
    message=(message!=null)?message:'无法连接到服务器';
    swal({
        title: "异常",
        text: message,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        closeOnConfirm: true
    });
}
window.warnAlert =function(message){//注意警告
    message=message||"请选择一条记录操作！";
    swal({
        title: "注意",
        text: message,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        closeOnConfirm: true
    });
}
window.iseffectiveAlert = function(fun){//是否有效弹窗
    swal({
        title: "请确认",
        text: "是否将状态设为有效？",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确认",
        cancelButtonText: "取消",
        closeOnConfirm: true
    },fun);
}
window.isdelAlert = function(fun){
    swal({
        title: "请确认",
        text: "确定要删除吗？",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "删除",
        cancelButtonText: "取消",
        closeOnConfirm: true,
        animation: "slide-from-top"
    },fun);
}
window.closePage = function(){//关闭页面
    swal({
        title: "请确认",
        text: "是否离开此页面？",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确认",
        cancelButtonText: "取消",
        closeOnConfirm: true,
        animation: "slide-from-top"
    }, function () {
        window.close();
    });
}
/**
 * 判断父窗口和本窗口
 */
window.getWindow=function(){
    return (parent)?parent:window;
}