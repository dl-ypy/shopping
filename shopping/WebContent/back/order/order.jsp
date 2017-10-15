<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<style type="text/css">
	table {
		text-align: center;
	}
	
	#Morder th {
		color: red;
		background-color: #E4F1FA;
	}
	
	th, td{
		border:1px solid #caf2ff;
		font-size: 15px;
		font-weight: bold;
		border-collapse: collapse;
	}
	
	input {
		color:blue;
		line-height: 20px !important;
		border: 1px solid !important;
	}
</style>
</head>
<body>

	<div id="Morder" style="width: 1000px; color: blue; margin: 0 auto;">
		<div style=" margin-left: 20px;">
			<form action="" method="post" style="margin-bottom: 20px;" onsubmit="return dateRule('start')&&dateRule('end')">
			<table style="width: 1000px;">
				<caption style="color:red; font-size: 20px; font-weight: bold;">订管理单</caption>
				<tr>
					<td>
					用户名：<input type="text" name="username" value="${username}"/>
					下单时间：<input id="start" type="text" name="startDate" value="${startDate}"/>至<input id="end" type="text" name="endDate" value="${endDate }" style="margin-right: 70px"/>
					审核状态：<select style="margin-right: 70px; height: 20px;border: 1px solid; color:blue;" name="status">
						<option value="">请选择</option>
						<option value="0" ${status eq 0?'selected':''}>未审核</option>
						<option value="1" ${status eq 1?'selected':''}>已通过</option>
						<option value="2" ${status eq 2?'selected':''}>未通过</option>
					</select>
					<input type="submit" value="查询"/>
					</td>
				</tr>
			</table>
			</form>
			
			<script type="text/javascript">
				function $(id) {
					return document.getElementById(id);
				}
			
				function dateRule(id) {
					var val = $(id).value;
					if (val.length == 0) {
						return true;
					} else {
						var year = val.substring(0,4);
						var month = val.substring(5,7);
						var day = val.substring(8,10);
						var reg = /^(([1][9][0-9]{2})|([2][0][0-9][0-9]))-(([0][1-9])|([1][0-2]))-(([0][1-9])|([1-2][0-9])|([3][0-1]))$/;
						if (reg.test(val)) {
							if (month == 02) {
								if ((year%4==0&&year%100!=0) || year%400==0) {
									if (day <= 29) {
										return true;
									} else {
										if (id == "start") {
											alert("开始日期错误！");
										} else {
											alert("结束日期错误！");
										}
										return false;
									}
								} else {
									if (day <= 28) {
										return true;
									} else {
										if (id == "start") {
											alert("开始日期错误！");
										} else {
											alert("结束日期错误！");
										}
										return false;
									}
								}
							} else if (month==01 || month==03 || month==05 || month==07 || month==08 || month==10 || month==12) {
								if (day <= 31) {
									return true;
								} else {
									if (id == "start") {
										alert("开始日期错误！");
									} else {
										alert("结束日期错误！");
									}
									return false;
								}
							} else {
								if (day <= 30) {
									return true;
								} else {
									if (id == "start") {
										alert("开始日期错误！");
									} else {
										alert("结束日期错误！");
									}
									return false;
								}
							}
						} else {
							if (id == "start") {
								alert("开始日期错误！");
							} else {
								alert("结束日期错误！");
							}
							return false;
						}
					}
				}
			</script>
			
			<table style="width: 1000px;">
				<tr>
					<th>订单编号</th>
					<th>订单用户</th>
					<th>订单金额</th>
					<th>下单时间</th>
					<th>审核人</th>
					<th>审核状态</th>
					<th>更多操作</th>
				</tr>
				
					<c:forEach var="order" items="${p.list}">
						<tr>
							<td>${order.orderid}</td>
							<c:forEach var="user" items="${user}">
								<c:if test="${user.userid eq order.userid }">
									<td>${user.username}</td>
								</c:if>
							</c:forEach>
							<td>￥${order.totalprice}</td>
							<td>${order.orderdate}</td>
							<td>${order.approveduser}</td>
							<c:if test="${order.status eq 0}">
								<td>未审核</td>
							</c:if>
							<c:if test="${order.status eq 1}">
								<td>通过</td>
							</c:if>
							<c:if test="${order.status eq 2}">
								<td>未通过</td>
							</c:if>
							<td><a href="back/BackOrderDetailServlet?task=query&orderid=${order.orderid}">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="back/BackOrderServlet?task=reviewquery&orderid=${order.orderid}">审核</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="back/BackOrderDetailServlet?task=query&flag=update&orderid=${order.orderid}">修改</a></td>
						</tr>
					</c:forEach>
			</table>
		</div>
		<form action="back/BackOrderServlet?task=query" method="post" id="changePage">
			<input id="currentPage" type="hidden" name="currentPage"/>
			<input id="pageSize" type="hidden" name="pageSize"/>
			<input type="hidden" name="username" value="${username}"/>
			<input type="hidden" name="startDate" value="${startDate}"/>
			<input type="hidden" name="endDate" value="${endDate}"/>
			<input type="hidden" name="status" value="${status}"/>
		</form>
		<jsp:include page="/back/pageBar.jsp"></jsp:include> 
	</div>
</body>
</html>