<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	.main {
		width:700px;
		text-align: center;
		margin: 0 auto;
	}
	
	table, th, td{
		width:700px;
		border:1px solid blue;
		font-size: 15px;
		font-weight: bold;
	}
	
	tr {
		height: 50px;
	}
	
	.button {
		width: 70px;
		color: red;
		font-weight: bold;
	}
	
	.footer {
		margin-top: 20px;
		border:2px solid blue;
		font-size: 15px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<jsp:include page="top.jsp">
	<jsp:param value="5" name="flag"/>	
	</jsp:include>
	
	<div class="main">
	<table cellspacing="0">
		<tr>
			<th>商品缩略图</th>
			<th>商品名称</th>
			<th>商品单价</th>
			<th>商品数量</th>
			<th>商品小计</th>
			<th>操作</th>
		</tr>
		<c:forEach var="mc" items="${SHOPCAR.mcList}">
			<tr>
			<td><img alt="缩略图" src="/shopping/upload/${mc.pic}"></td>
			<td>${mc.mcname}</td>
			<td>￥${mc.price}</td>
			<td><input id="count" style="width:40px" type="text" value="${mc.count}" onblur="changePrice(${mc.mcid},this.value)"/></td>
			<td>${mc.totalPrice}</td>
			<td><input type="button" class="button" value="删除" onclick="location.href='ShopCarServlet?task=delete&mcid=${mc.mcid}'"></td>
		</tr>
		</c:forEach>
	</table>
	<div class="footer">
		<span>商品总类数：${SHOPCAR.totalType}&nbsp;&nbsp;|&nbsp;&nbsp;</span>
		<span>商品总价格：￥${SHOPCAR.totalPrice}&nbsp;&nbsp;|&nbsp;&nbsp;</span>
		<span>商品总数量：${SHOPCAR.totalCount}&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="button" class="button" value="清空购物车" onclick="location.href='ShopCarServlet?task=clear'"/>
		<input type="button" class="button" value="继续购物" onclick="location.href='IndexServlet'"/>
		<input type="button" class="button" value="结算" onclick="pay(${SHOPCAR.totalCount})"/>
	</div>
	</div>
	
	<script type="text/javascript">
		//判断商品数量的格式
		function changePrice(id, num) {
			if (num>0 && num<=1000) {
				location.href="ShopCarServlet?task=update&mcid="+id+"&count="+num;
			} else {
				alert("商品数量不符合要求！必须大于0，小于等于1000");
				location.href="ShopCarServlet?task=update&mcid="+id+"&count=1";
			}
		}
	
		/* 判断用户是否已经购买商品 */
		function pay(val) {
			/* 什么都没买就为null，买了删除或清空了就为0 */
			if (val==null || val==0) {
				alert("您还未购买任何商品！");
			} else {
				location.href='front/filter/order.jsp';
			}
		}
	</script>
</body>
</html>