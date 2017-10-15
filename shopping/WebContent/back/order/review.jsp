<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<base href=<%=basePath%>/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		text-align: center;
	}
	
	td{
		border:1px solid #caf2ff;
		font-size: 15px;
		font-weight: bold;
		border-collapse: collapse;
	}
	
	input {
		color:blue;
		line-height: 20px;
		border: 1px solid;
	}
	
	#first {
		background-color: #E4F1FA;
	}
</style>
</head>
<body>
	<div id="review" style="width: 300px; margin: 0 auto;">
	<form action="back/BackOrderServlet?task=review" method="post">
		<input type="hidden" name="orderid" value="${order.orderid}"/>
		<table style="width: 300px;">
			<caption style="color:red; font-size: 20px; font-weight: bold;">审核订单</caption>
			<tr>
				<td id="first">订单编号</td>
				<td><input type="text" name="orderid" value="${order.orderid}" readonly="readonly"/></td>
			</tr>
			<tr>
			    <td id="first">审核状态</td>
				<td>
					<select style="margin-right: 70px; height: 20px;border: 1px solid; color:blue;" name="ostatus">
						<option value="0" ${order.status eq 0?'selected':''}>未审核</option>
						<option value="1" ${order.status eq 1?'selected':''}>已通过</option>
						<option value="2" ${order.status eq 2?'selected':''}>未通过</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="first">订单反馈</td>
				<td><textarea name="msg">${order.msg}</textarea></td>
			</tr>
			<tr>
				<td id="first">审核人</td>
				<td><input type="text" name="approveduser" value="${manager.musername}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="提交"/>
					<input type="reset" value="重置"/>				
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>