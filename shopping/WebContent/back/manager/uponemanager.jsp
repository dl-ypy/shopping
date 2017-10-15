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
<title>修改管理员信息</title>
<link href="css/register.css" rel="stylesheet"/>
<script src="js/register.js" type="text/javascript"></script>
</head>
<body>
<div id="title">
		</div>
		<div id="login" style="width:400px;">
			<form action="back/BackManagerServlet?task=update&num=one" method="post" onsubmit="return ruleRealNameKeyUp()">
				<input id="mid" type="hidden" name="mid" value="${m.mid}"/>
				<table style="width:400px;">
				<caption style="font-size: 20px; color:red;  font-weight:bold">修改管理员</caption>
					<tr>
						<td id="firsttd">用户名：</td>
						<td id="seondtd"><input id="username" type="text" name="username" value="${m.musername}" readonly="readonly"/><span id="name_span">用户名不可修改</span></td>
					</tr>
					<tr>
						<td id="firsttd">性别：</td>
						<td id="sex">
							<input type="radio" name="sex" value="男" ${m.msex eq '男'?'checked':''}/>男
							<input type="radio" name="sex" value="女" ${m.msex eq '女'?'checked':''}/>女
							<span>只能是男或女</span>
						</td>
					</tr>
					<tr>
						<td id="firsttd">真实姓名：</td>
						<td id="seondtd"><input id="realname" type="text" name="truename" onkeyup="ruleRealNameKeyUp()" value="${m.mtruename}"/><span id="rname_span">中文，2-10个字符</span></td>
					</tr>
					<tr>
						<td id="submit" colspan="2"><input type="submit" value="提交"/><input type="reset" value="重置"/></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>