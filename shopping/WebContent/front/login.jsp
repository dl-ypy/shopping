<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.ypy.shopping.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<head>
<base href=<%=basePath%>/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})
	});
</script>

</head>

<body style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">

	<%
		String musername = CookieUtil.getCookie(request, "musername");
		String mpassword = CookieUtil.getCookie(request, "mpassword");
	%>

	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>


	<div class="logintop">
		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li><a href="index.jsp">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>

	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">
			<form action="ManagerServlet" method="post">
				<ul>
					<li><input name="username" type="text" class="loginuser" value="<%=musername%>"/></li>
					<li><input name="password" type="password" class="loginpwd" value="<%=mpassword%>"/></li>
					<li><input type="submit" class="loginbtn" value="登录"/>
					<label><input name="rember" id="rember" type="checkbox" onclick="ruleRemberSelect()"/>记住密码</label><label style="color:red; font-weight: bold;">${fail}</label></li>
				</ul>
			</form>

		</div>
		<script type="text/javascript">
			var select = false;
			/*判断是否选择记住密码*/
			function ruleRemberSelect() {
				if (select == false) {
					select = true;
				} else {
					select = false;
				}
				if (select) {
					document.getElementById("rember").value = "selected";
				}
			} 
		</script>
	</div>

	<div class="loginbm">
		版权所有 2017 <a href="http://www.uimaker.com">uimaker.com</a>
		仅供学习交流，勿用于任何商业用途
	</div>


	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>
