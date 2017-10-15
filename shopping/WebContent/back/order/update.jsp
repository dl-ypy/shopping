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
	span {
		font-size: 10px;
		line-height: 10px;
		color: #CCCCCB;
		font-weight: bold;
		margin-left: 20px;
	}
}
</style>
</head>
<body>
	<form action="back/BackOrderServlet?task=update" method="post" onsubmit="return ruleUpOdSubmit()">
		<input type="hidden" name="orderid" value="${order.orderid}"/>
	<table style="margin-bottom: 30px;">
		<caption>订单详细信息</caption>
		<tr>
			<td>订单编号：</td>
			<td>${order.orderid}</td>
			<td>下单时间：</td>
			<td>${order.orderdate}</td>
			<td>付款方式：</td>
			<td>
				<select name="paytype">
					<option value="货到付款" ${order.paytype eq '货到付款'?'selected':''}>货到付款</option>
					<option value="在线支付" ${order.paytype eq '在线支付'?'selected':''}>在线支付</option>
					<option value="第三方支付" ${order.paytype eq '第三方支付'?'selected':''}>第三方支付</option>
				</select>
			</td>
		</tr>
		<tr>
			<td rowspan="2">发货方式：</td>
			<td rowspan="2">
				<select name="receivedtype">
					<option value="邮政" ${order.receivedtype eq '邮政'?'selected':''}>邮政</option>
					<option value="顺丰" ${order.receivedtype eq '顺丰'?'selected':''}>顺丰</option>
					<option value="平邮" ${order.receivedtype eq '平邮'?'selected':''}>平邮</option>
				</select>
			</td>
			<td rowspan="2">收货人：</td>
			<td>
				<input id="realname" type="text" name="username" value="${order.username}" onkeyup="ruleRealNameKeyUp()"/>
			</td>
			<td rowspan="2">收货人地址：</td>
			<td>
				<input id="address" type="text" name="address" value="${order.address}" onkeyup="ruleAddressKeyUp()"/>
			</td>
		</tr>
		<tr>
			<td><span id="rname_span">中文，2-10个字符</span></td>
			<td><span id="address_span">长度不能大于100</span></td>
		</tr>
		<tr>
			<td rowspan="2">收货人邮编：</td>
			<td>
				<input id="postcard" type="text" name="postcode" value="${order.postcode}" onkeyup="rulePostCardKeyUp()"/>
			</td>
			<td rowspan="2">收货人联系电话：</td>
			<td>
				<input id="phone" type="text" name="phoneno" value="${order.phoneno}" onkeyup="rulePhoneKeyUp()"/>
			</td>
			<td rowspan="2">收货人email：</td>
			<td>
				<input id="email" type="text" name="email" value="${order.email}" onkeyup="ruleEmailKeyUp()"/>
			</td>
		</tr>
		<tr>
			<td><span id="postcard_span">6位数字</span></td>
			<td><span id="phone_span">必须是数字</span></td>
			<td><span id="email_span">格式要正确</span></td>
		</tr>
		<tr>
			<td colspan="6">
				<input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重置"/>
			</td>
		</tr>
	</table>
	</form>
	<script type="text/javascript">
		/*得到元素*/
		function $(id) {
			return document.getElementById(id);
		}
		/*真实姓名填写时的规则*/
		function ruleRealNameKeyUp() {
			var realname = $('realname').value;
			var reg = /^[\u4e00-\u9fa5]{2,10}$/;
			if (reg.test(realname)) {
				$('rname_span').innerHTML="<font color='green' size='2'>姓名正确</font>";
				return true;
			} else {
				$('rname_span').innerHTML="<font color='red' size='2'>姓名不正确</font>";
				return false;
			}
		}
		/*邮箱填写规则*/
		function ruleEmailKeyUp() {
			var email = $('email').value;
			var reg = /^[0-9a-z_]+@[0-9a-z]{2,6}\.(com|cn)$/;
			if (reg.test(email)) {
				$('email_span').innerHTML="<font color='green' size='2'>邮箱正确</font>";
				return true;
			} else {
				$('email_span').innerHTML="<font color='red' size='2'>邮箱不正确</font>";
				return false;
			}
		}
	
		/*电话号码填写规则*/
		function rulePhoneKeyUp() {
			var phone = $('phone').value;
			var reg = /^1[34578]\d{9}$/;
			if (reg.test(phone)) {
				$('phone_span').innerHTML="<font color='green' size='2'>电话正确</font>";
				return true;
			} else {
				$('phone_span').innerHTML="<font color='red' size='2'>电话不正确</font>";
				return false;
			}
		}
	
		/*地址填写规则*/
		function ruleAddressKeyUp() {
			var address = $('address').value;
			if (address.length<=100 && address.length>0) {
				$('address_span').innerHTML="<font color='green' size='2'>地址正确</font>";
				return true;
			} else {
				$('address_span').innerHTML="<font color='red' size='2'>地址不正确</font>";
				return false;
			}
		}
	
		/*邮编填写规则*/
		function rulePostCardKeyUp() {
			var postcard = $('postcard').value;
			var reg = /^\d{6}$/;
			if (reg.test(postcard)) {
				$('postcard_span').innerHTML="<font color='green' size='2'>邮编正确</font>";
				return true;
			} else {
				$('postcard_span').innerHTML="<font color='red' size='2'>邮编不正确</font>";
				return false;
			}
		}
		/*点击修改订单事件*/
		function ruleUpOdSubmit() {
			return ruleRealNameKeyUp()&&ruleEmailKeyUp()&&rulePhoneKeyUp()&&ruleAddressKeyUp()&&rulePostCardKeyUp();
		}
	</script>
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
						<td><img alt="商品图片" src="shopping/upload/${mc.pic}"/></td>
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
			<c:if test="${order.status eq 0}">
				<td>未审核</td>
			</c:if>
			<c:if test="${order.status eq 1}">
				<td>通过</td>
			</c:if>
			<c:if test="${order.status eq 2}">
				<td>未通过</td>
			</c:if>
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
			onclick="javascript:location.href='back/BackOrderServlet?task=query'">返回</button></td>
		</tr>
	</table>
</body>
</html>