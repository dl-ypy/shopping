<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<html>
<head>
<base href=<%=basePath%>/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
</head>
<body>
	<jsp:include page="top.jsp">
	<jsp:param value="5" name="flag"/>
	</jsp:include>
	
	<div class="mc_list_right">
		<p>${mcl.mcname }</p>
		<p>单价：￥${mcl.price }</p>
		<p>是否缺货：${mcl.flag eq 1?'是':'否' }</p>
		<p id="mc_message">详情：${mcl.mcdecx}</p>
		<p>
		<input type="image" src="img/pay.jpg" onclick="shopCar(${mcl.mcid})">
		</p>
	</div>
</body>
</html>