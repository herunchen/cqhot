<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <div class="page-header">
        <div class="page-title" style="padding-bottom: 5px">
            <h3>系统参数 </h3>
            <ol class="breadcrumb">
			  <li>系统管理</li>
			  <li>系统配置</li>
			  <li class="active">系统参数</li>
			</ol>
        </div>
    </div>
    <div class="row page-search">
        <div class="col-md-12">
            <ul class="list-inline">
                <li>
                    <select name="category" id="category"
					class="form-control">
						<option value="">选择类别</option>
						<option value="gender">gender</option>
						<option value="valid">valid</option>
						<option value="userType">userType</option>
						<option value="userClass">userClass</option>
						<option value="visaAppType">visaAppType</option>
						<option value="attachment">attachment</option>
						<option value="prodState">prodState</option>
						<option value="defualt">defualt</option>
						<option value="singleProdType">singleProdType</option>
						<option value="distContType">distContType</option>
						<option value="groupType">groupType</option>
						<option value="policyType">policyType</option>
						<option value="aprvState">aprvState</option>
						<option value="expenseType">expenseType</option>
						<option value="objType">objType</option>
						<option value="finalAccounts">finalAccounts</option>
						<option value="orderState">orderState</option>
						<option value="orderPayState">orderPayState</option>
						<option value="ordCusState">ordCusState</option>
						<option value="passType">passType</option>
						<option value="prodNumber">prodNumber</option>
						<option value="prodNoticeType">prodNoticeType</option>
						<option value="attachementBelonger">attachementBelonger</option>
				</select>
				</li>
                <li>
                    <button class="btn btn-primary" type="button">查询</button>
                </li>
                <li>
                    <button class="btn btn-success" type="button">新增</button>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
         <table class="table table-bordered">
               <thead>
	               <tr>
	                   <th data-align="center">参数编码</th>
	                   <th data-align="center">参数类别</th>
	                   <th data-align="center">参数名称</th>
	                   <th data-align="center" data-width="150">参数值</th>
	                   <th data-align="center" data-width="150">参数文本</th>
	                   <th data-align="center">参数说明</th>
	                   <th data-align="center" data-width="120">操作</th>
	               </tr>
               </thead>
               <tbody>
                 	<tr>
                     <td>35</td>
                     <td>aprvState</td>
                     <td>未提交</td>
                     <td>0</td>
                     <td>unsubmit</td>
                     <td>审批状态</td>
                     <td>
                         <a >禁用</a>&nbsp;
                         <a >修改</a>&nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>36</td>
                     <td>aprvState</td>
                     <td>已提交</td>
                     <td>1</td>
                     <td>submitted</td>
                     <td>审批状态</td>
                     <td>
                         <a >禁用</a>&nbsp;
                         <a >修改</a>&nbsp;
                     </td>
                 </tr>
               	<tr>
                   <td>37</td>
                   <td>aprvState</td>
                   <td>审批通过</td>
                   <td>2</td>
                   <td>approved</td>
                   <td>审批状态</td>
                   <td>
                       <a >禁用</a>&nbsp;
                       <a >修改</a>&nbsp;
                   </td>
               </tr>
                <tr>
                    <td>38</td>
                    <td>aprvState</td>
                    <td>未通过</td>
                    <td>-2</td>
                    <td>refused</td>
                    <td>审批状态</td>
                    <td>
                        <a >禁用</a>&nbsp;
                        <a >修改</a>&nbsp;
                    </td>
                </tr>
                 <tr>
                     <td>108</td>
                     <td>attachementBelonger</td>
                     <td>产品</td>
                     <td>product</td>
                     <td>product</td>
                     <td>附件归属于产品</td>
                     <td>
                         <a >禁用</a>&nbsp;
                         <a >修改</a>&nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>109</td>
                     <td>attachementBelonger</td>
                     <td>供应商</td>
                     <td>supplier</td>
                     <td>supplier</td>
                     <td>附件归属于供应商</td>
                     <td>
                         <a >禁用</a>&nbsp;
                         <a >修改</a>&nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>110</td>
                     <td>attachementBelonger</td>
                     <td>分销商</td>
                     <td>distribution</td>
                     <td>distribution</td>
                     <td>附件归属于分销商</td>
                     <td>
                         <a >禁用</a>&nbsp;
                         <a >修改</a>&nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>111</td>
                     <td>attachementBelonger</td>
                     <td>渠道商</td>
                     <td>channel</td>
                     <td>channel</td>
                     <td>附件归属于渠道商</td>
                     <td>
                         <a >禁用</a>&nbsp;
                         <a >修改</a>&nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>13</td>
                     <td>attachment</td>
                     <td>附件根路径</td>
                     <td>/path</td>
                     <td>rootPath</td>
                     <td>附件文件存放的根文件夹</td>
                     <td>
                         <a >禁用</a>&nbsp;
                         <a >修改</a>&nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>17</td>
                     <td>defualt</td>
                     <td>清位时间</td>
                     <td>48</td>
                     <td>ordExpTime</td>
                     <td>默认订单清位时间，单位：小时</td>
                     <td>
                         <a >禁用</a>&nbsp;
                         <a >修改</a>&nbsp;
                     </td>
                 </tr>
               </tbody>
           </table>
        </div>
    </div>
</div>