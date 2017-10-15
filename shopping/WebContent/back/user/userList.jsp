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
		<span>用户信息管理：</span>
	</div>

	<div class="rightinfo">

		<div class="tools">

			<ul class="toolbar">
				<form action="back/BackUserServlet?task=query" method="post" style="float:left;" >
					<li><label>用户名</label><input value="${username}" name="username" type="text"
						class="scinput" /></li>
					<li><label>性别</label> 
					<select class="select3" name="usersex" id="flag">
							<option value="" >未选择</option>
							<option value="1" ${usersex eq 1?'selected':''}>男</option>
							<option value="0" ${usersex eq 0?'selected':''}>女</option>
					</select></li>
					<li><label>状态</label> 
					<select class="select3" name="lockstate" id="price">
							<option value="-1">未选择</option>
							<option value="0" ${lockstate eq 0?'selected':'' }>正常</option>
							<option value="1" ${lockstate eq 1?'selected':'' }>冻结</option>
					</select></li> <label>&nbsp;</label>
					<input name="" type="submit" class="scbtn" value="查询" />
				</form>
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
				<th>注册时间</th>
				<th>是否冻结</th>
				<th>操作</th>
			</tr>
			<tbody>
				<c:forEach var="user" items="${p.list}">
					<tr>
						<td align="center"><input name="" type="checkbox" value="" /></td>
						<td>${user.username}</td>
						<td>${user.truename}</td>
						<td>${user.usersex eq 0?'女':'男'  }</td>
						<td>${user.regdate}</td>
						<td>${user.lockstate eq 0?'正常':'冻结'}</td>
						<td>
						<a href="back/BackUserServlet?task=state&userid=${user.userid}" class="tablelink">${user.lockstate eq 1?'解冻':'冻结'}</a>
						</td>
					</tr>

				</c:forEach>
		</table>
		
		<form id="changePage" action="back/BackUserServlet?task=query" method="post">
			<input id="currentPage" type="hidden" name="currentPage"
				value="${p.currentPage}" /> <input id="pageSize" type="hidden"
				name="pageSize" value="${p.pageSize}" />
				<input type="hidden" name="username" value="${username}"/>
				<input type="hidden" name="usersex" value="${usersex}"/>
				<input type="hidden" name="lockstate" value="${lockstate}"/>
		</form>
		<jsp:include page="/back/pageBar.jsp"></jsp:include>
	</div>

</body>
</html>
