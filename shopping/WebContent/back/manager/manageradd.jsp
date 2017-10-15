<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<html>
<head>
<base href=<%=basePath%>/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注册页面</title>
<link href="css/register.css" rel="stylesheet"/>
<script src="js/register.js" type="text/javascript"></script>
</head>
<body>
<div id="title">
			<center><span>添加管理员</span></center>
		</div>
		<div id="login">
			<form action="back/BackManagerServlet?task=add" method="post" onsubmit="return ruleManagerSubmit()">
				<table>
					<tr>
						<td id="firsttrtd"><span>以下均为必须填</span></td>
					</tr>
					<tr>
						<td id="firsttd">用户名：</td>
						<td id="seondtd"><input id="username" type="text" name="username" onkeyup="ruleNameKeyUp()"/><span id="name_span">必须是英文字母或数字，长度3-15</span></td>
					</tr>
					<tr>
						<td id="firsttd">性别：</td>
						<td id="sex">
							<input type="radio" name="sex" value="男" checked="checked"/>男
							<input type="radio" name="sex" value="女"/>女
							<span>只能是男或女</span>
						</td>
					</tr>
					<tr>
						<td id="firsttd">真实姓名：</td>
						<td id="seondtd"><input id="realname" type="text" name="truename" onkeyup="ruleRealNameKeyUp()"/><span id="rname_span">中文，2-10个字符</span></td>
					</tr>
					<tr>
						<td id="submit" colspan="2"><input type="submit" value="提交"/><input type="reset" value="重置"/></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>