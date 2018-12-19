<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
        <div class="container">
            <div class="row" style="margin-top: 10px;">
                <div class="col-md-12">
                    <form  method="post" class="form-horizontal row-border"  id="editObjectForm" accept-charset="UTF-8">
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                <span style="color:red">*</span>机构名称:
                            </label>
                            <div class="col-md-10">
                                <input type="text" class="form-control required" maxlength="50" id="edit_orgName" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                <span style="color:red">*</span>机构编码:
                            </label>
                            <div class="col-md-10">
                                <input type="text" class="form-control required" maxlength="50" id="edit_orgCode" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                                                         备注:
                            </label>
                            <div class="col-md-10">
                                <textarea name="note" id="edit_note" rows="5" class="form-control"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
<c:url var="url" value="/js/system/org_edit.js"></c:url>
<script type="text/javascript" src="${url}"></script>
