/* ******************************************
*	初始化SWFUpload上传控件
* ****************************************** */
function InitSWFUpload(upurl, uppath, upsize, flashurl, iswater, isthumbnail, uploadLimit) {
    var sendUrl = upurl + "?action=MultipleFile&UpFilePath=" + uppath;
    if (arguments.length == 5) {
        sendUrl = upurl + "?action=MultipleFile&UpFilePath=" + uppath + "&IsWater=" + iswater;
    }
    if (arguments.length == 6) {
        sendUrl = upurl;// + "?action=MultipleFile&UpFilePath=" + uppath + "&IsWater=" + iswater + "&IsThumbnail=" + isthumbnail;
    }
    var swfu = new SWFUpload({
        // Backend Settings
        upload_url: sendUrl,
        file_post_name: uppath,
        post_params: { "ASPSESSID": "NONE" },

        file_size_limit: upsize, // 2MB
        file_types: "*.jpg;*.jpge;*.png;*.gif",
        file_types_description: "JPG Images",
        file_upload_limit: uploadLimit,
        file_queue_error_handler: fileQueueError,
        file_dialog_complete_handler: fileDialogComplete,
        upload_progress_handler: uploadProgress,
        upload_error_handler: uploadError,
        upload_success_handler: uploadSuccess,
        upload_complete_handler: uploadComplete,

        // Button Settings
        button_placeholder_id: "upload",
        button_width: 90,
        button_height: 20,
        button_text: '<span class="redText">浏览...</span>',
        button_text_style: '.redText { font-size:12px;color:#fffff; text-align:center;width:90px;}',
        button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
        button_cursor: SWFUpload.CURSOR.HAND,

        // Flash Settings
        flash_url: flashurl,

        custom_settings: {
            upload_target: "show"
        },
        // Debug Settings
        debug: false
    });
}

/* ******************************************
*	返回上传的状态
* ****************************************** */
function uploadSuccess(file, serverData) {
    try {
    	if(file.name!=undefined && file.name!=null && file.name!=""){
        var progress = new FileProgress(file, this.customSettings.upload_target);
        	addImage(file.name, file.name);
        	progress.toggleCancel(false);
        }
    } catch (ex) {
        this.debug(ex);
    }
}

/* ******************************************
*	取得工程路径
* ****************************************** */
function getRootPath(){
    //获取当前网址，如： http://localhost:8088/test/test.jsp
    var curPath=window.document.location.href;
    //获取主机地址之后的目录，如： test/test.jsp
    var pathName=window.document.location.pathname;
    var pos=curPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8088
    var localhostPaht=curPath.substring(0,pos);
    //获取带"/"的项目名，如：/test
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}

/* ******************************************
*	添加图片列表
* ****************************************** */
function addImage(src) {
	var baseSrc = "\\upload\\tmp\\" + src
	src = getRootPath() + baseSrc;
    var newLi = $('<li></li>');
    var hidValue = $('<input type="hidden" name="hide_photo_name" value="' + baseSrc +'" />').appendTo(newLi);
    var newImg = $('<div onclick="focus_img(this);" class="img_box">' +
        '<img src="' + src + '"/></div>').appendTo(newLi);
    var downa = $('<a href="javascript:;" onclick="del_img(this);">删除</a>').appendTo(newLi);
    newLi.appendTo("#show_list ul");
}

/* ******************************************
*	删除LI元素
* ****************************************** */
function del_img(obj) {
//    var focusphoto = $("#focus_photo");
    var delSrc = $(obj).prevAll(".img_box").children("img").eq(0).attr("src");
    var strDel = $("#delScreenshot").val()==undefined?"":$("#delScreenshot").val();
    $("#delScreenshot").val(strDel + "," + delSrc.substring(delSrc.lastIndexOf('\\') + 1));
    var node = $(obj).parent(); //要删除的LI节点
    node.remove(); //删除DOM元素
//    //检查是否为封面
//    if (focusphoto.val() == smallimg) {
//        focusphoto.val("");
//        var firtimg = $("#show_list ul li .img_box img").eq(0);
//        firtimg.parent().addClass("current"); //取第一张做为封面
//        focusphoto.val(firtimg.attr("src")); //重新给封面的隐藏域赋值
//    }
}

/* ******************************************
*	设置相册封面
* ****************************************** */
function focus_img(obj) {
//    $("#focus_photo").val($(obj).children("img").eq(0).attr("src"));
    $("#show_list ul li .img_box").removeClass("current");
    $(obj).addClass("current");
}

/* ******************************************
*	显示图片链接
* ****************************************** */
function show_remark(obj) {
    //取得隐藏值
    var hidRemark = $(obj).prevAll("input[name='hide_photo_remark']").eq(0);
    $.XYTipsWindow({
        ___title: "图片描述",
        ___content: "id:pic_des",
        ___width: "300",
        ___height: "160",
        ___showbg: true,
        ___drag: "___boxTitle",
        ___fns: function () {
            $("#remark_txt").val(hidRemark.val());
            $("#btnSingle").click(function () { update_single(obj) })
        },
    });
    return false;
}

/* ******************************************
*	图片批量描述
* ****************************************** */
function update_batch()
{
    var remarks = $("#remark_txt").val();
    $("input[name='hide_photo_remark']").val(remarks);
    $(".img_box").find(".remark i").html(remarks);
    $.XYTipsWindow.removeBox();
}

/* ******************************************
*	图片单张描述
* ****************************************** */
function update_single(obj) {
    var remarks = $("#remark_txt").val();
    var hidRemark = $(obj).prevAll("input[name='hide_photo_remark']").eq(0);
    $(hidRemark).val(remarks);
    $(obj).prevAll(".img_box").find(".remark i").html(remarks);
    $.XYTipsWindow.removeBox();
}

function fileQueueError(file, errorCode, message) {
	try {
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setError();
		progress.toggleCancel(false);
		if (errorCode === SWFUpload.errorCode_QUEUE_LIMIT_EXCEEDED) {
			errorName = "您选择的文件太多.";
		}
		if (errorName !== "") {
			alert(errorName);
			return;
		}

		switch (errorCode) {
		case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
			progress.setStatus(file.name+"文件太小");
			progress.toggleCancel(false, this);
			break;
		case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
			progress.setStatus(file.name+"文件太大");
			progress.toggleCancel(false, this);
			break;
		case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
			progress.setStatus(file.name+"文件类型出错");
			progress.toggleCancel(false, this);
			break;
		default:
			if (file !== null) {
				progress.setStatus("未知错误");
				progress.toggleCancel(false, this);
			}
			break;
		}

	} catch (ex) {
		this.debug(ex);
	}

}

function fileDialogComplete(numFilesSelected, numFilesQueued) {
	try {
		if (numFilesQueued > 0) {
			this.startUpload();
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadProgress(file, bytesLoaded) {

	try {
		var percent = Math.ceil((bytesLoaded / file.size) * 100);

		var progress = new FileProgress(file,  this.customSettings.upload_target);
		progress.setProgress(percent);
		if (percent === 100) {
			progress.setStatus("创建缩略图...");
			progress.toggleCancel(false, this);
		} else {
			progress.setStatus("上传...");
			progress.toggleCancel(true, this);
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadComplete(file) {
	try {
		/*  I want the next upload to continue automatically so I'll call startUpload here */
		if (this.getStats().files_queued > 0) {
			this.startUpload();
		} else {
			var progress = new FileProgress(file,  this.customSettings.upload_target);
			progress.setComplete();
			progress.setStatus("上传完成.");
			setTimeout(function () { $("#show").text("") }, 3000);//在画面显示“上传完成”3秒后消失。
			progress.toggleCancel(false);
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadError(file, errorCode, message) {
	var imageName =  "error.gif";
	var progress;
	try {
		switch (errorCode) {
		case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
			try {
				progress = new FileProgress(file,  this.customSettings.upload_target);
				progress.setCancelled();
				progress.setStatus("Cancelled");
				progress.toggleCancel(false);
			}
			catch (ex1) {
				this.debug(ex1);
			}
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
			try {
				progress = new FileProgress(file,  this.customSettings.upload_target);
				progress.setCancelled();
				progress.setStatus("Stopped");
				progress.toggleCancel(true);
			}
			catch (ex2) {
				this.debug(ex2);
			}
		case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
			imageName = "uploadlimit.gif";
			break;
		default:
			alert(message);
			break;
		}
		addImage("images/" + imageName);
	} catch (ex3) {
		this.debug(ex3);
	}
}

function fadeIn(element, opacity) {
	var reduceOpacityBy = 5;
	var rate = 30;	// 15 fps
	if (opacity < 100) {
		opacity += reduceOpacityBy;
		if (opacity > 100) {
			opacity = 100;
		}

		if (element.filters) {
			try {
				element.filters.item("DXImageTransform.Microsoft.Alpha").opacity = opacity;
			} catch (e) {
				// If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
				element.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + opacity + ')';
			}
		} else {
			element.style.opacity = opacity / 100;
		}
	}

	if (opacity < 100) {
		setTimeout(function () {
			fadeIn(element, opacity);
		}, rate);
	}
}

/* ******************************************
 *	FileProgress Object
 *	Control object for displaying file info
 * ****************************************** */

function FileProgress(file, targetID) {
	this.fileProgressID = "divFileProgress";

	this.fileProgressWrapper = document.getElementById(this.fileProgressID);
	if (!this.fileProgressWrapper) {
		this.fileProgressWrapper = document.createElement("div");
		this.fileProgressWrapper.className = "progressWrapper";
		this.fileProgressWrapper.id = this.fileProgressID;

		this.fileProgressElement = document.createElement("div");
		this.fileProgressElement.className = "progressContainer";

		var progressCancel = document.createElement("a");
		progressCancel.className = "progressCancel";
		progressCancel.href = "#";
		progressCancel.style.visibility = "hidden";
		progressCancel.appendChild(document.createTextNode(" "));

		var progressText = document.createElement("div");
		progressText.className = "progressName";
		progressText.appendChild(document.createTextNode(file.name));

		var progressBar = document.createElement("div");
		progressBar.className = "progressBarInProgress";

		var progressStatus = document.createElement("div");
		progressStatus.className = "progressBarStatus";
		progressStatus.innerHTML = "&nbsp;";

		this.fileProgressElement.appendChild(progressCancel);
		this.fileProgressElement.appendChild(progressText);
		this.fileProgressElement.appendChild(progressStatus);
		this.fileProgressElement.appendChild(progressBar);

		this.fileProgressWrapper.appendChild(this.fileProgressElement);

		document.getElementById(targetID).appendChild(this.fileProgressWrapper);
		fadeIn(this.fileProgressWrapper, 0);

	} else {
		this.fileProgressElement = this.fileProgressWrapper.firstChild;
		this.fileProgressElement.childNodes[1].firstChild.nodeValue = file.name;
	}

	this.height = this.fileProgressWrapper.offsetHeight;

}
FileProgress.prototype.setProgress = function (percentage) {
	this.fileProgressElement.className = "progressContainer green";
	this.fileProgressElement.childNodes[3].className = "progressBarInProgress";
	this.fileProgressElement.childNodes[3].style.width = percentage + "%";
};
FileProgress.prototype.setComplete = function () {
	this.fileProgressElement.className = "progressContainer blue";
	this.fileProgressElement.childNodes[3].className = "progressBarComplete";
	this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setError = function () {
	this.fileProgressElement.className = "progressContainer red";
	this.fileProgressElement.childNodes[3].className = "progressBarError";
	this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setCancelled = function () {
	this.fileProgressElement.className = "progressContainer";
	this.fileProgressElement.childNodes[3].className = "progressBarError";
	this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setStatus = function (status) {
	this.fileProgressElement.childNodes[2].innerHTML = status;
};

FileProgress.prototype.toggleCancel = function (show, swfuploadInstance) {
	this.fileProgressElement.childNodes[0].style.visibility = show ? "visible" : "hidden";
	if (swfuploadInstance) {
		var fileID = this.fileProgressID;
		this.fileProgressElement.childNodes[0].onclick = function () {
			swfuploadInstance.cancelUpload(fileID);
			return false;
		};
	}
};
