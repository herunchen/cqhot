<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <div class="page-header">
        <div class="page-title" style="padding-bottom: 5px">
            <h3> 操作日志</h3>
            <ol class="breadcrumb">
			  <li>系统管理</li>
			  <li>日志管理</li>
			  <li class="active">操作日志</li>
			</ol>
        </div>
    </div>
    <div class="row page-search">
        <div class="col-md-12">
            <ul class="list-inline">
                <li>
                    <input type="text" class="form-control" placeholder="姓名" name="userName" >
                </li>
                <li>
                    <select class="form-control" name="operType">
                        <option value="0">请选择操作类型</option>
                        <option value="删除信息">删除信息</option>
                   </select>
                </li>
                <li>
                    <select class="form-control" name="operObject">
                         <option value="0">请选择数据对象</option>
                    </select>
                </li>
                <li>
                    <select class="form-control" name="operState">
                        <option value="0">请选择操作状态</option>
                        <option value="成功">成功</option>
                        <option value="失败">失败</option>
                    </select>
                </li>
                <li>
                    <input type="text" class="form-control datepicker dateISO compareDate compareDate" placeholder="起始日期" name="beginDate" id="beginDate" >
                </li>
                <li> ~ </li>
                <li>
                    <input type="text" class="form-control datepicker dateISO compareDate compareDate" placeholder="结束日期" name="endDate" id="endDate" >
                </li>
                <li>
                    <input type="text" class="form-control" placeholder="请输入要搜索的文字" name="searchData" >
                </li>
                <li>
                    <button class="btn btn-primary" name="btn_search" type="button">查询</button>
                </li>
                <li>
                    <button class="btn btn-danger" name="btn_del" type="button">清除</button>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table data-toggle="table" class="table table-bordered">
                <thead>
                <tr>
                    <th data-align="center" data-width="50">日志编号</th>
                    <th data-align="center" data-width="150">日志时间</th>
                    <th data-align="center" data-width="100">用户姓名</th>
                    <th data-align="center" data-width="100">用户部门</th>
                    <th data-align="center" data-width="100">访问IP</th>
                    <th data-align="center" data-width="100">操作类型</th>
                    <th data-align="center" data-width="100">操作内容</th>
                    <th data-align="center" data-width="100">数据对象</th>
                    <th data-align="center" data-width="60">操作状态</th>
                </tr>
                </thead>
                <tbody>
                   <tr>
                       <td>1</td>
	                   <td>2017-03-04 12:34:34</td>
						<td>Admin</td>
						<td>产品部</td>
						<td>192.168.0.0.1</td>
						<td>编辑</td>
						<td>编辑项目</td>
						<td>项目模块</td>
						<td>成功</td>
                   </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>