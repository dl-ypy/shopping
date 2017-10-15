<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<head>
<base href=<%=basePath%>/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注册页面</title>
<link href="css/register.css" rel="stylesheet"/>
<script src="js/register.js" type="text/javascript"></script>
</head>
<body>
<div id="title">
			<center><span>请填写注册信息</span></center>
		</div>
		<div id="login">
			<form action="UserServlet?task=register" method="post" onsubmit="return ruleSubmit()">
				<table>
					<tr>
						<td id="firsttrtd"><span>以下均为必须填</span></td>
					</tr>
					<tr>
						<td id="firsttd">用户名：</td>
						<td id="seondtd"><input id="username" type="text" name="username" onkeyup="ruleNameKeyUp()"/><span id="name_span">必须是英文字母或数字，长度3-15</span></td>
					</tr>
					<tr>
						<td id="firsttd">密码：</td>
						<td id="seondtd"><input id="password" type="password" name="password" onkeyup="rulePWDKeyUp()"/><span id="pwd_span">长度3-15</span></td>
					</tr>
					<tr>
						<td id="firsttd">确认密码：</td>
						<td id="seondtd"><input id="apassword" type="password" name="password2" onkeyup="ruleAffirmPWDKeyUp()"/><span id="apwd_span">值要和密码框的值相同</span></td>
					</tr>
					<tr>
						<td id="firsttd">性别：</td>
						<td id="sex">
							<input type="radio" name="usersex" value="男" checked="checked"/>男
							<input type="radio" name="usersex" value="女"/>女
							<span>只能是男或女</span>
						</td>
					</tr>
					<tr>
						<td id="firsttd">真实姓名：</td>
						<td id="seondtd"><input id="realname" type="text" name="truename" onkeyup="ruleRealNameKeyUp()"/><span id="rname_span">中文，2-10个字符</span></td>
					</tr>
					<tr>
						<td id="firsttd">出生日期：</td>
						<td id="seondtd"><input id="birthday" type="text" name="birthday" onkeyup="ruleBirthdayKeyUp()"/><span id="birthday_span">格式yyyy-mm-dd，按此日期算出的年龄应大于等于10岁</span></td>
					</tr>
					<tr>
						<td id="firsttd">电子邮箱：</td>
						<td id="seondtd"><input id="email" type="text" name="email" onkeyup="ruleEmailKeyUp()"/><span id="email_span">格式要正确</span></td>
					</tr>
					<tr>
						<td id="firsttd">电话号码：</td>
						<td id="seondtd"><input id="phone" type="text" name="phoneno" onkeyup="rulePhoneKeyUp()"/><span id="phone_span">必须是数字</span></td>
					</tr>
					<tr>
						<td id="firsttd">地址：</td>
						<td id="seondtd"><input id="address" type="text" name="address"  onkeyup="ruleAddressKeyUp()"/><span id="address_span">长度不能大于100</span></td>
					</tr>
					<tr>
						<td id="firsttd">邮编：</td>
						<td id="seondtd"><input id="postcard" type="text" name="postcard" onkeyup="rulePostCardKeyUp()"/><span id="postcard_span">6位数字</span></td>
					</tr>
					<tr>
						<td id="submit" colspan="2"><input type="submit" value="提交"/><input type="reset" value="重置"/></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>