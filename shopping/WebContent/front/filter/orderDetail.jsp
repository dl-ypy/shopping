<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href=<%=basePath%>/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, tr{
		width: 800px;
		margin: 0 auto;
		color:blue;
		border-collapse: collapse;   /*取消间距*/
	}
	
	th,td {
		border: 1px solid gray;
		width: 50px;
		font-size: 15px;
		text-align: center;
	}
	
	tr {
		height: 40px;
	}
	
	th {
		background-color: orange;
	}
	
	td {
		background-color: #caf2ff;
	}
	
	caption {
		font-size: 20px;
		font-weight: bold;
		color:red;
	}
	.first {
		text-align: right;
		background-color: #E4F1FA;
		width: 150px;
	}	
}
</style>
</head>

<body>
<jsp:include page="/front/top.jsp">
<jsp:param value="4" name="flag"/>
</jsp:include>

	<table style="margin-bottom: 30px;">
		<caption>订单详细信息</caption>
		<tr>
			<td>订单编号：</td>
			<td>${order.orderid}</td>
			<td>下单时间：</td>
			<td>${order.orderdate}</td>
			<td>付款方式：</td>
			<td>${order.paytype}</td>
		</tr>
		<tr>
			<td>发货方式：</td>
			<td>${order.receivedtype}</td>
			<td>收货人：</td>
			<td>${order.username}</td>
			<td>收货人地址：</td>
			<td>${order.address}</td>
		</tr>
		<tr>
			<td>收货人邮编：</td>
			<td>${order.postcode}</td>
			<td>收货人联系电话：</td>
			<td>${order.phoneno}</td>
			<td>收货人email：</td>
			<td>${order.email}</td>
		</tr>
	</table>
	<table style="margin-bottom: 30px;">
		<tr>
			<th>明细编号</th>
			<th>商品图片</th>
			<th>商品名称</th>
			<th>商品数量</th>
			<th>商品单价</th>
			<th>小计</th>
		</tr>
		<c:forEach var="od" items="${p.list}">
			<tr>
				<td>${od.detailid}</td>
				<c:forEach var="mc" items="${mc}">
					<c:if test="${mc.mcid eq od.mcid}">
						<td><img alt="商品图片" src="/shopping/upload/${mc.pic}"/></td>
						<td>${mc.mcname}</td>
						<td>${od.buynum}</td>
						<td>${mc.price}</td>
						<td>￥${mc.price*od.buynum}</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
		<tr><td colspan="6" style="text-align: right;">商品种类数：${order.alltype}&nbsp;&nbsp;商品总件数：${order.quantity}&nbsp;&nbsp;订单金额：￥${order.totalprice}</td></tr>
	</table>
	<table>
		<tr>
			<td>审核状态：</td>
			<td>${order.status eq 0?'未审核':'审核通过'}</td>
			<td>审核人：</td>
			<td>${order.approveduser}</td>
			<td>审核时间：</td>
			<td>${order.approveddate}</td>
		</tr>
		<tr>
			<td>订单反馈</td>
			<td colspan="5">${order.msg}</td>
		</tr>
		<tr>
			<td colspan="6"><button style="width: 60px;height: 35px;font-size: 15px;color:red;font-weight: bold;" 
			onclick="javascript:location.href='filter/OrderServlet?task=query&userid=${USER.userid}'">返回</button></td>
		</tr>
	</table>
</body>
</html>