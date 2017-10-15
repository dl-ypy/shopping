<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<head>
<base href=<%=basePath%>/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.msg th, td{
		border:1px solid #caf2ff;
		font-size: 15px;
		font-weight: bold;
		border-collapse: collapse;
	}
	
	.msg {
		width: 400px;
		color:blue;
	}
	
	.left {
		background-color: #E4F1FA;
	}
</style>
</head>
<body>
	<div id="msg" style="width: 400px; margin: 0 auto">
		<table class="msg">
			<caption style="font-size: 20px; color:red; font-weight:bold">显示个人资料</caption>
			<tr>
				<td class="left">用户名：</td>
				<td><input type="text" name="username" value="${m.musername}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="left">性别：</td>
				<td><input type="text" name="usersex" value="${m.msex}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="left">真实姓名：</td>
				<td><input type="text" name="truename" value="${m.mtruename}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="left">管理权限：</td>
				<td><input type="text" name="level" value="${m.mlevel eq 2?'超级管理员':'普通管理员'}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="left">注册时间：</td>
				<td><input type="text" name="regdate" value="${m.mdate}" readonly="readonly"/></td>
			</tr>
		</table>
	</div>
</body>
</html>