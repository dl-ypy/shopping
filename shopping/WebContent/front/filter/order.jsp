<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href=<%=basePath%>/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/register.js" type="text/javascript"></script>
<style type="text/css">
	table, tr{
		width: 600px;
		margin: 0 auto;
		border: 1px solid #caf2ff;
		border-collapse: collapse;   /*取消间距*/
	}
	
	tr {
		height: 40px;
	}
	
	caption {
		font-size: 20px;
		font-weight: bold;
		color:#013E86;
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
	<div class="order">
	<form action="filter/OrderServlet" method="post" onsubmit="return ruleAddOdSubmit()">
		<table>
			<caption>下订单</caption>
			<tr>
				<td class="first">所购商品种类数：</td>
				<td><input type="text" value="${SHOPCAR.totalType }" readonly="readonly"/></td>
				<td></td>
			</tr>
			<tr>
				<td class="first">所购商品总件数：</td>
				<td><input type="text" value="${SHOPCAR.totalCount }" readonly="readonly"/></td>
				<td></td>
			</tr>
			<tr>
				<td class="first">价格总计：</td>
				<td><input type="text" value="￥${SHOPCAR.totalPrice }" readonly="readonly"/></td>
				<td></td>
			</tr>
			<tr>
				<td class="first">订单日期：</td>
				<!-- 得到当前系统时间 -->
				<td><input type="text" value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="<%=new Date()%>"/>" readonly="readonly"/></td>
				<td></td>
			</tr>
			<tr>
				<td class="first">付款方式：</td>
				<td><select name="paytype">
					<option value="货到付款">货到付款</option>
					<option value="在线支付">在线支付</option>
					<option value="第三方支付">第三方支付</option>
				</select></td>
				<td></td>
			</tr>
			<tr>
				<td class="first">发货方式：</td>
				<td><select name="receivedtype">
					<option value="邮政">邮政</option>
					<option value="顺丰">顺丰</option>
					<option value="平邮">平邮</option>
				</select></td>
				<td></td>
			</tr>
			<tr><td colspan="3"><hr/></td></tr>	
			<tr>
				<td class="first">收货人姓名：</td>
				<td><input type="text" id="realname" name="username" value="${USER.truename }" onkeyup="ruleRealNameKeyUp()"/><span id="rname_span">中文，2-10个字符</span></td>
				<td></td>
			</tr>	
			<tr>
				<td class="first">收货人地址：</td>
				<td><input id="address" type="text" name="address"  value="${USER.address }" onkeyup="ruleAddressKeyUp()"/><span id="address_span">长度不能大于100</span></td>
				<td></td>
			</tr>	
			<tr>
				<td class="first">收货人邮编：</td>
				<td><input id="postcard" type="text" name="postcard"  value="${USER.postcade }" onkeyup="rulePostCardKeyUp()"/><span id="postcard_span">6位数字</span></td>
				<td></td>
			</tr>	
			<tr>
				<td class="first">收货人电话：</td>
				<td><input id="phone" type="text" name="phone"  value="${USER.phoneno }" onkeyup="rulePhoneKeyUp()"/><span id="phone_span">必须是数字</span></td>
				<td></td>
			</tr>	
			<tr>
				<td class="first">收货人邮箱：</td>
				<td><input id="email" type="text" name="email"  value="${USER.email }" onkeyup="ruleEmailKeyUp()"/><span id="email_span">格式要正确</span></td>
				<td></td>
			</tr>	
			<tr>
				<td colspan="3" style="text-align: center">
					<input type="submit" value="下订单"/>&nbsp;&nbsp;&nbsp;&nbsp;
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
		/*点击添加订单事件*/
		function ruleAddOdSubmit() {
			return ruleRealNameKeyUp()&&ruleEmailKeyUp()&&rulePhoneKeyUp()&&ruleAddressKeyUp()&&rulePostCardKeyUp();
		}
	</script>
	</div>
</body>
</html>