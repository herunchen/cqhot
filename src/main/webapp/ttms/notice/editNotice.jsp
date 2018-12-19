<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<form method="post" class="form-horizontal " id="messageForm" name="messageForm">
		<div class="row page-search">
			<div class="col-md-12">
				<ul class="list-unstyled list-inline">
					<li>
						<button id="submitBtn" name="submitBtn" type="button" class="btn btn-primary">发布</button>
					</li>
					<li>
						<button id="saveBtn" name="saveBtn" type="button" class="btn btn-success">保存</button>
					</li>
					<li>
						<button class="btn btn-default" id="btnReturn" name="btnReturn" type="button">舍弃</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">	
					<label class="col-md-1 control-label"><span style="color:red">*</span>分类</label>
					<div class="col-md-11">
						<select name="msgClassId" id="msgClassId" class="form-control typeRequired" style="width: 160px">
							<option value="">选择分类</option>
							<option value="MST0001">系统消息</option>
							<option value="MST0002">公司通知</option>
							<option value="MST0003">分销通知</option>
							<option value="MST0004">业务通知</option>
						</select>
					</div>	
				</div>
				<div>
					<input type="hidden" class="form-control" name="valid" id="valid" value=""> 
					<input type="hidden" class="form-control" name="optType" id="optType" value="0">
					<input type="hidden" class="form-control" name="msgId" id="msgId" value="">
				</div>
				<div class="form-group">
					<label class="col-md-1 control-label">发送人</label>
					<div class="col-md-11">
						<label class="control-label"> 王毅
						</label>
						<input type="hidden" name="msgSenderName" id="msgSenderName" value="王毅">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-1 control-label">接收人</label>
					<div class="col-md-11">
						<div class="input-group">
					 	<input type="text" class="form-control clear-input-readonly" id="msgReceiverName" name="msgReceiverName" placeholder="点击右侧按钮选择接收机构" readonly>
						<!-- 组织机构编号-->
						<input type="hidden" class="form-control" id="msgReceiverName">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" id="btnUsersGroups">
								<i class="icon-ellipsis-horizontal"></i>
							</button>
						</span> 
					</div> 
					<input type="hidden" class="form-control" name="msgReceiverID" id="msgReceiverID" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-1 control-label">标题</label>
				<div class="col-md-11">
					<input type="text" class="form-control name" name="msgSubject" id="msgSubject" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-1 control-label">内容</label>
				<div class="col-md-11">
					<div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Font"><i class="icon-font"></i><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a data-edit="fontName Serif" style="font-family: 'Serif'">Serif</a></li>
							<li><a data-edit="fontName Sans" style="font-family: 'Sans'">Sans</a></li>
							<li><a data-edit="fontName Arial" style="font-family: 'Arial'">Arial</a></li>
							<li><a data-edit="fontName Arial Black" style="font-family: 'Arial Black'">Arial Black</a></li>
							<li><a data-edit="fontName Courier" style="font-family: 'Courier'">Courier</a></li>
							<li><a data-edit="fontName Courier New" style="font-family: 'Courier New'">Courier New</a></li>
							<li><a data-edit="fontName Comic Sans MS" style="font-family: 'Comic Sans MS'">Comic Sans MS</a></li>
							<li><a data-edit="fontName Helvetica" style="font-family: 'Helvetica'">Helvetica</a></li>
							<li><a data-edit="fontName Impact" style="font-family: 'Impact'">Impact</a></li>
							<li><a data-edit="fontName Lucida Grande" style="font-family: 'Lucida Grande'">Lucida Grande</a></li>
							<li><a data-edit="fontName Lucida Sans" style="font-family: 'Lucida Sans'">Lucida Sans</a></li>
							<li><a data-edit="fontName Tahoma" style="font-family: 'Tahoma'">Tahoma</a></li>
							<li><a data-edit="fontName Times" style="font-family: 'Times'">Times</a></li>
							<li><a data-edit="fontName Times New Roman" style="font-family: 'Times New Roman'">Times New Roman</a></li>
							<li><a data-edit="fontName Verdana" style="font-family: 'Verdana'">Verdana</a></li>
						</ul>
					</div>
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
							<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
							<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
						</ul>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="bold" title="" data-original-title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
						<a class="btn" data-edit="italic" title="" data-original-title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a> <a class="btn" data-edit="strikethrough" title="" data-original-title="Strikethrough"><i class="icon-strikethrough"></i></a> <a class="btn" data-edit="underline" title="" data-original-title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="insertunorderedlist" title="" data-original-title="Bullet list"><i class="icon-list-ul"></i></a>
						<a class="btn" data-edit="insertorderedlist" title="" data-original-title="Number list"><i class="icon-list-ol"></i></a>
						<a class="btn" data-edit="outdent" title="" data-original-title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a> <a class="btn" data-edit="indent" title="" data-original-title="Indent (Tab)"><i class="icon-indent-right"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="justifyleft" title="" data-original-title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a> <a class="btn" data-edit="justifycenter" title="" data-original-title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a> <a class="btn" data-edit="justifyright" title="" data-original-title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a> <a class="btn" data-edit="justifyfull" title="" data-original-title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="undo" title="" data-original-title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
						<a class="btn" data-edit="redo" title="" data-original-title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
					</div>
					<input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="" style="display: none;">
				</div>
					<div id="editor" contenteditable="true">
						</div>
					<input class="name" type="hidden" name="msgContent">
				</div>
			</div>
			</div>
		</div>
	</form>
</div>