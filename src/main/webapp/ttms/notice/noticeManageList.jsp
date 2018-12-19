<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="page-header">
		<div class="page-title" style="padding-bottom: 5px">
			<h3>通知管理</h3>
			<ol class="breadcrumb">
			  <li>消息中心</li>
			  <li>通知管理</li>
			  <li class="active">通知管理</li>
			</ol>
		</div>
	</div>
	<form method="post" id="messageList">
		<div class="row page-search">			
			<div class="col-md-12">
				<ul class="list-unstyled list-inline">
					<li>
					<select name="msgClassId" id="msgClassId" class="form-control">
						<option value="">选择分类</option>
						<option value="MST0001">系统消息</option>
						<option value="MST0002">公司通知</option>
						<option value="MST0003">分销通知</option>
						<option value="MST0004">业务通知</option>
					</select>
					</li>
					<li><input type="text" class="form-control" placeholder="标题" name="msgSubject" value=""></li>
					<li><input type="text" class="form-control datepicker dateISO compareDate required" placeholder="起始日期" name="beginDate" id="beginDate" value="">
					</li>
					<li>~</li>
					<li><input type="text" class="form-control datepicker dateISO compareDate required" placeholder="结束日期" name="endDate" id="endDate" value="">
					</li>
					<li><input type="text" class="form-control" placeholder="发布人" name="msgSenderName" value=""></li>
					<li>
						<button class="btn btn-primary" name="btn_search" type="button" id="btn_search">查询</button>
					</li>
				</ul>
			</div>			
		</div>
		<div class="row">			
			<div class="col-md-12">
				<table data-toggle="table" class="table table-bordered">
					<thead>
						<tr>
							<th>序号</th>
							<th>分类</th>
							<th>标题</th>
							<th>发送人</th>
							<th>发送部门</th>
							<th>发布时间</th>
							<th>发布</th>
							<th data-align="center" data-width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center">69</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">产品创建 :SYCJ0001-[三亚春季七天五夜游]</a></td>
							<td align="center">王毅</td>
							<td align="center"></td>
							<td align="center">2017-04-05</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
						<tr>
							<td>73</td>
							<td>系统消息</td>
							<td><a class="noticeDetail">三亚春季七天五夜游出团通知通知已审核 SYCJ0001-001[三亚春季七天五夜游]</a></td>
							<td>王毅</td>
							<td></td>
							<td>2017-06-30</td>
							<td>否</td>
							<td>
								<a class="updateNotice">修改</a> 
								<a class="publish"> 发布</a>
							</td>
						</tr>
						<tr>
							<td align="center">72</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">三亚春季七天五夜游出团通知通知已提交 SYCJ0001-001[三亚春季七天五夜游]</a></td>
							<td align="center">王毅</td>
							<td align="center"></td>
							<td align="center">2017-04-05</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
						<tr>
							<td align="center">73</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">三亚春季七天五夜游出团通知通知已审核 SYCJ0001-001[三亚春季七天五夜游]</a></td>
							<td align="center">王毅</td>
							<td align="center"></td>
							<td align="center">2017-04-05</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
						<tr>
							<td align="center">74</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">产品创建 :ZDFSJ0001-[澳洲五日四夜游]</a></td>
							<td align="center">王毅</td>
							<td align="center"></td>
							<td align="center">2017-04-17</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
						<tr>
							<td align="center">75</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">报名成功通知通知已审核 ZDFSJ0001-001[澳洲五日四夜游]</a></td>
							<td align="center">王毅</td>
							<td align="center"></td>
							<td align="center">2017-04-17</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
						<tr>
							<td align="center">76</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">澳洲五日四夜游出团通知通知已提交 ZDFSJ0001-001[澳洲五日四夜游]</a></td>
							<td align="center">王毅</td>
							<td align="center"></td>
							<td align="center">2017-04-17</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
						<tr>
							<td align="center">77</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">澳洲五日四夜游出团通知通知已审核 ZDFSJ0001-001[澳洲五日四夜游]</a></td>
							<td align="center">王毅</td>
							<td align="center"></td>
							<td align="center">2017-04-17</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
						<tr>
							<td align="center">78</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">产品创建 :ZDFSJ0001-[非洲五日游]</a></td>
							<td align="center">testuser</td>
							<td align="center"></td>
							<td align="center">2017-04-17</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
						<tr>
							<td align="center">79</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">产品 SYCJ0001-001[三亚春季七天五夜游]已分配分销商:山东国内旅行社</a></td>
							<td align="center">testuser</td>
							<td align="center"></td>
							<td align="center">2017-04-17</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
						<tr>
							<td align="center">80</td>
							<td align="center">系统消息</td>
							<td align="center"><a class="noticeDetail">产品 SYCJ0001-001[三亚春季七天五夜游]已分配分销商:北京国际旅行社分销商</a></td>
							<td align="center">testuser</td>
							<td align="center"></td>
							<td align="center">2017-04-17</td>
							<td align="center">是</td>
							<td align="center"><a class="revoke">撤回</a></td>
						</tr>
					</tbody>
				</table>
				<nav class="pull-right">
				<ul class="pagination">
				<li style="padding: 6px 12px;border: 1px solid transparent;float: left"><strong>1</strong>/<strong>4</strong>页</li>
				<li style="padding: 6px 12px 6px 0px;border: 1px solid transparent;float: left"><strong>34</strong> 条记录</li>
				<li><a href="JavaScript:void(0)">首页</a></li> <li><a href="JavaScript:void(0)" title="上一页">«</a></li>
				<li><a href="JavaScript:page_next()" title="下一页">»</a></li>
				<li><a href="JavaScript:page_end()">尾页</a></li>
				<li><a href="JavaScript:void(0)" style="padding: 0px"><input type="number" id="pageSelect" name="pageSelect" class="form-control" onkeydown="if(event.keyCode==13) page_jump_text();" style="width: 60px;margin: 0px;border: none;height: 30px"></a></li>
				<li><a href="JavaScript:page_jump_text()">跳转</a></li>
				</ul>
				</nav>
			</div>			
		</div>
	</form>
</div>
<script type="text/javascript">
	initUiComponment();  //调用 /assets/js/demo/ui_general.js 提供的初始化界面组件方法
</script>
<c:url var="url" value="/js/notice/noticeManageList.js"></c:url>
<script type="text/javascript" src="${url}"></script>