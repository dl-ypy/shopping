<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="js/register.js" type="text/javascript"></script>
<style type="text/css">
	#pwd th, td{
		border:1px solid #caf2ff;
		font-size: 15px;
		font-weight: bold;
		border-collapse: collapse;
	}

	#pwd input {
		color:blue;
		line-height: 25px !important;
		border: 1px solid !important;
	}
	
	#pwd tr {
		height: 30px;
	}
	
	#pwd .left {
		text-align: right;
		background-color: #E4F1FA;
	}
	
	#pwd span {
		font-size: 10px;
		line-height: 10px;
		color: #CCCCCB;
	}
</style>
</head>
<body>
	<div id="pwd" style="width: 400px; margin: 0 auto; margin-top: 100px;">
		<form action="back/BackManagerServlet?task=uppwd" method="post" onsubmit="return ruleUpPwdSubmit('${m.mpassword}')">
			<input type="hidden" name="mid" value="${m.mid}"/>
			<table class="uppwd" style="width: 400px;">
				<caption style="color:red; font-size: 20px; font-weight: bold;">修改密码</caption>
				<tr>
					<td class="left">旧密码：</td>
					<td id="seondtd"><input id="old" type="text" name="oldpwd" onkeyup="ruleOldPwdKeyUp('${m.mpassword}')"/><span id="old_span"></span></td>
				</tr>
				<tr>
					<td class="left">新密码：</td>
					<td id="seondtd"><input id="password" type="password" name="mpassword" onkeyup="rulePWDKeyUp()"/><span id="pwd_span">长度3-15</span></td>
				</tr>
				<tr>
					<td class="left">确认密码：</td>
					<td id="seondtd"><input id="apassword" type="password" name="password2" onkeyup="ruleAffirmPWDKeyUp()"/><span id="apwd_span">值要和密码框的值相同</span></td>
				</tr>
				<tr style="text-align: center">
					<td id="submit" colspan="2"><input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>