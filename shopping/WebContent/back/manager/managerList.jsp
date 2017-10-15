<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<!-- <script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
</script> -->


</head>


<body>

	<div class="place">
		<span>管理员信息管理：</span>
	</div>

	<div class="rightinfo">

		<div class="tools">

			<ul class="toolbar">
				<form action="back/BackManagerServlet?task=query&mid=${manager.mid}" method="post" style="float:left;" >
					<li><label>用户名</label><input value="${musername}" name="musername" type="text"
						class="scinput" /></li>
					<li><label>性别</label> 
					<select class="select3" name="msex">
							<option value="" >未选择</option>
							<option value="男" ${msex eq '男'?'selected':''}>男</option>
							<option value="女" ${msex eq '女'?'selected':''}>女</option>
					</select></li>
					<input name="" type="submit" class="scbtn" value="查询" />
					<input name="" type="reset" class="scbtn" value="重置" />
				</form>
				<li><button style="margin-left: 300px;" class="scbtn" onclick="javascript:location.href='back/manager/manageradd.jsp'">添加管理员</button></li>
			</ul>

			<ul class="toolbar1">
				<li><span><img src="images/t05.png" /></span>设置</li>
			</ul>

		</div>


		<table class="tablelist">
			<tr>
				<th><input name="" type="checkbox" value="" checked="checked" /></th>
				<th>用户名<i class="sort"><img src="images/px.gif" /></i></th>
				<th>真实姓名</th>
				<th>性别</th>
				<th>权限级别</th>
				<th>注册时间</th>
				<th>操作</th>
			</tr>
			<tbody>
				<c:forEach var="manager" items="${p.list}">
					<tr>
						<td align="center"><input name="" type="checkbox" value="" /></td>
						<td>${manager.musername}</td>
						<td>${manager.mtruename}</td>
						<td>${manager.msex}</td>
						<td>${manager.mlevel eq 1?'普通管理员':'超级管理员'}</td>
						<td>${manager.mdate}</td>
						<td>
						<a href="back/BackManagerServlet?task=updatequery&mid=${manager.mid}" class="tablelink">修改</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:del(${manager.mid})" class="tablelink">删除</a>
						</td>
					</tr>

				</c:forEach>
		</table>
		
		<script type="text/javascript">
			function del(val) {
				if (confirm("确定要删除此条记录？")) {
					location.href="back/BackManagerServlet?task=delete&mid="+val;
				}
			}
		</script>
		
		<form id="changePage" action="back/BackManagerServlet?task=query&mid=${manager.mid}" method="post">
			<input id="currentPage" type="hidden" name="currentPage"
				value="${p.currentPage}" /> <input id="pageSize" type="hidden"
				name="pageSize" value="${p.pageSize}" />
				<input type="hidden" name="musername" value="${musername}"/>
				<input type="hidden" name="msex" value="${msex}"/>
		</form>
		<jsp:include page="/back/pageBar.jsp"></jsp:include>
	</div>

</body>
</html>
