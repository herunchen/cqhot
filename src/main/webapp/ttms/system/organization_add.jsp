<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
        <div class="container">
            <div class="row" style="margin-top: 10px;">
                <div class="col-md-12">
                    <form  class="form-horizontal row-border"  id="addObjectForm" accept-charset="UTF-8">
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                <span style="color:red">*</span>机构名称:
                            </label>
                            <div class="col-md-10">
                                <input type="text" class="form-control required" maxlength="50" id="add_orgName" >
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="col-md-2 control-label">
                                <span style="color:red">*</span>机构编码:
                            </label>
                            <div class="col-md-10">
                                <input type="text" class="form-control required" maxlength="50" id="add_orgCode" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                有效:
                            </label>
                            <div class="col-md-10">
                                <label class="radio-inline">
                                    <input  type="radio" name="valid" id="add_valid_0" checked value="1" > 启用
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="valid" id="add_valid_1" value="0"> 禁用
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                备注:
                            </label>
                            <div class="col-md-10">
                                <textarea name="note" id="add_note" rows="5" class="form-control"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
<c:url var="url" value="/js/system/org_add.js"></c:url>
<script type="text/javascript" src="${url}"></script>
