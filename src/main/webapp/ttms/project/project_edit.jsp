<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="container">
            <div class="row" style="margin-top: 10px;">
                <div class="col-md-12">
                    <form  method="post" class="form-horizontal row-border"  id="editProjectForm" accept-charset="UTF-8">
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                <span style="color:red">*</span>项目编号:
                            </label>
                            <div class="col-md-10">
                                <input type="text" placeholder="TP性质-日期-国家地区-城市-序号" class="form-control required" id="edit_prjId">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                <span style="color:red">*</span>项目名称:
                            </label>
                            <div class="col-md-10">
                                <input type="text" class="form-control required" maxlength="50" id="edit_prjName" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                日期:
                            </label>
                            <div class="col-md-10">
                                <ul class="list-inline">
                                    <li>
                                        <input type="text" class="form-control datepicker dateISO compareDate" placeholder="起始日期" name="beginDate" id="edit_beginDate" />
                                    </li>
                                    <li> ~ </li>
                                    <li>
                                        <input type="text" class="form-control datepicker dateISO compareDate" placeholder="结束日期" name="endDate" id="edit_endDate" />
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                归属部门:
                            </label>
                            <div class="col-md-10">
                                <select id="edit_deptId" class="form-control" >
                                    <option value="">选择归属部门</option>
                                </select>
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
<script type="text/javascript">
    initUiComponment(); //调用 /assets/js/demo/ui_general.js 提供的初始化界面组件方法
</script> 
<c:url var="url" value="/js/project/project_edit.js"></c:url>
<script type="text/javascript" src="${url}"></script>
