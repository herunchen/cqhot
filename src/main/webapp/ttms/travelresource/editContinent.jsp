<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form class="form-horizontal row-border" >
                <input type="hidden" id="valid" name="valid" value="1">
                <input type="hidden" id="hidId" name="hidId" value="">
                <div class="form-group">
                    <label class="col-md-2 control-label">大洲编码:</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" name="id" id="id" value="" maxlength="50">
                        
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">拼音首字母:</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" name="pyFstLetter" value="" maxlength="1">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">大洲名称:</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" name="name" id="name" value="" maxlength="50">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">英文名称:</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" name="engName" value="" maxlength="50">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">拼音名称:</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control" name="pyName" value="" maxlength="50">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">是否启用:</label>
                    <div class="col-md-10">
                        <label class="radio-inline">
                            <input type="radio" name="inlineRadioOptions2" value="1" id="inlineRadio3" checked>启用
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="inlineRadioOptions2" value="0" id="inlineRadio4">禁用
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">简介:</label>
                    <div class="col-md-10">
                        <textarea name="note" id="note" rows="5" class="form-control" maxlength="500"></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>