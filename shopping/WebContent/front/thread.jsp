<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="js/register.js" type="text/javascript"></script>
<style type="text/css">
	.msg th, td{
		border:1px solid #caf2ff;
		font-size: 15px;
		font-weight: bold;
		border-collapse: collapse;
	}
	
	.msg {
		width: 400px;
		color:blue;
	}
	
	.mc_list input {
		color:blue;
		line-height: 25px !important;
		border: 1px solid !important;
	}
	
	.mc_list tr {
		height: 30px;
	}
	
	.mc_list .left {
		text-align: right;
		background-color: #E4F1FA;
	}
	
	.mc_list span {
		font-size: 10px;
		line-height: 10px;
		color: #CCCCCB;
	}
	span {
		display: inline !important;
	}
	
</style>
</head>
<body>

<jsp:include page="top.jsp">
<jsp:param value="3" name="flag"/>
</jsp:include>

<!--主题部分开始-->
<div id="main">
	<div class="limit_width">
		<!--主体左边部分开始-->
		<div id="mid_left">
			<!--会员中心开始-->
			<div class="goods">
				<div class="n_title">
					<span>会员中心</span>
				</div>
				<div class="n_content" style="text-align: center">
					<ul style="list-style: none;">
						<li style="margin-top: 15px"><a href="javascript:change('msg','pwd','up')">基本资料显示</a></li>
						<li style="margin-top: 15px"><a href="javascript:change('up','pwd','msg')">用户资料修改</a></li>
						<li style="margin-top: 15px"><a href="javascript:change('pwd','msg','up')">密码修改</a></li>
					</ul>
				</div>
			</div>
			<!--会员中心结束-->
			<script type="text/javascript">
				function change(id1,id2,id3) {
					document.getElementById(id2).style.display="none";
					document.getElementById(id3).style.display="none";
					document.getElementById(id1).style.display="";
				}
			</script>
		</div>
		<!--主体左边部分结束-->
		<!--主体右边部分开始-->
		<div id="mid_right">
			<div class="mc_list">
			
				<!-- 显示用户信息 -->
				<div id="msg" style="width: 400px; margin: 0 auto">
					<table class="msg">
						<caption style="font-size: 20px; color:red; font-weight:bold">用户基本信息</caption>
						<tr>
							<td class="left">用户名：</td>
							<td><input type="text" name="username" value="${USER.username}"/></td>
						</tr>
						<tr>
							<td class="left">性别：</td>
							<td><input type="text" name="usersex" value="${USER.usersex eq 1?'男':'女'}"/></td>
						</tr>
						<tr>
							<td class="left">真实姓名：</td>
							<td><input type="text" name="truename" value="${USER.truename}"/></td>
						</tr>
						<tr>
							<td class="left">出生日期：</td>
							<td><input type="text" name="birthday" value="${USER.birthday}"/></td>
						</tr>
						<tr>
							<td class="left">电子邮箱：</td>
							<td><input type="text" name="email" value="${USER.email}"/></td>
						</tr>
						<tr>
							<td class="left">电话号码：</td>
							<td><input type="text" name="phoneno" value="${USER.phoneno}"/></td>
						</tr>
						<tr>
							<td class="left">地址：</td>
							<td><input type="text" name="address" value="${USER.address}"/></td>
						</tr>
						<tr>
							<td class="left">邮编：</td>
							<td><input type="text" name="postcade" value="${USER.postcade}"/></td>
						</tr>
						<tr>
							<td class="left">注册时间：</td>
							<td><input type="text" name="regdate" value="${USER.regdate}"/></td>
						</tr>
						<tr>
							<td class="left">最后登陆时间：</td>
							<td><input type="text" name="lastaccess" value="${USER.lastaccess}"/></td>
						</tr>
						<tr>
							<td class="left">登陆次数：</td>
							<td><input type="text" name="login" value="${USER.login}"/></td>
						</tr>
					</table>
				</div>
				
				<!-- 修改用户信息 -->
				<div id="up" style="display: none; width: 550px; margin: 0 auto">
					<form action="UserServlet?task=update" method="post" onsubmit="return ruleUpSubmit()">
						<input type="hidden" name="userid" value="${USER.userid}"/>
						<input type="hidden" name="password" value="${USER.password}"/>
						<table class="upmsg" style="width: 550px;">
							<caption style="font-size: 20px; color:red;  font-weight:bold">修改信息</caption>
							<tr>
								<td class="left">用户名：</td>
								<td id="seondtd"><input id="username" type="text" name="username" value="${USER.username }" onkeyup="ruleNameKeyUp()"/><span id="name_span">必须是英文字母或数字，长度3-15</span></td>
							</tr>
							<tr>
								<td class="left">性别：</td>
								<td id="sex">
									<input type="radio" name="usersex" value="男" ${USER.usersex eq 1?'checked':''}/>男
									<input type="radio" name="usersex" value="女" ${USER.usersex eq 0?'checked':''}/>女
									<span>只能是男或女</span>
								</td>
							</tr>
							<tr>
								<td class="left">真实姓名：</td>
								<td id="seondtd"><input id="realname" type="text" name="truename" value="${USER.truename}" onkeyup="ruleRealNameKeyUp()"/><span id="rname_span">中文，2-10个字符</span></td>
							</tr>
							<tr>
								<td class="left">电子邮箱：</td>
								<td id="seondtd"><input id="email" type="text" name="email" value="${USER.email}" onkeyup="ruleEmailKeyUp()"/><span id="email_span">格式要正确</span></td>
							</tr>
							<tr>
								<td class="left">电话号码：</td>
								<td id="seondtd"><input id="phone" type="text" name="phoneno" onkeyup="rulePhoneKeyUp()" value="${USER.phoneno}"/><span id="phone_span">必须是数字</span></td>
							</tr>
							<tr>
								<td class="left">地址：</td>
								<td id="seondtd"><input id="address" type="text" name="address" value="${USER.address}" onkeyup="ruleAddressKeyUp()"/><span id="address_span">长度不能大于100</span></td>
							</tr>
							<tr>
								<td class="left">邮编：</td>
								<td id="seondtd"><input id="postcard" type="text" name="postcard" value="${USER.postcade}" onkeyup="rulePostCardKeyUp()"/><span id="postcard_span">6位数字</span></td>
							</tr>
							<tr style="text-align: center">
								<td id="submit" colspan="2"><input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/></td>
							</tr>
						</table>
					</form>
				</div>
				
				<!-- 修改密码 -->
				<div id="pwd" style="width: 400px; margin: 0 auto; margin-top: 100px; display: none">
					<form action="UserServlet?task=updatePwd" method="post" onsubmit="return ruleUpPwdSubmit('${USER.password}')">
						<input type="hidden" name="username" value="${USER.username}"/>
						<input type="hidden" name="userid" value="${USER.userid}"/>
						<table class="uppwd" style="width: 400px;">
							<caption style="color:red; font-size: 20px; font-weight: bold;">修改密码</caption>
							<tr>
								<td class="left">旧密码：</td>
								<td id="seondtd"><input id="old" type="text" name="oldpwd" value="" onkeyup="ruleOldPwdKeyUp('${USER.password}')"/><span id="old_span"></span></td>
							</tr>
							<tr>
								<td class="left">新密码：</td>
								<td id="seondtd"><input id="password" type="password" name="password" onkeyup="rulePWDKeyUp()"/><span id="pwd_span">长度3-15</span></td>
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
					<!--商品信息开始-->
				</div>
		</div>
		<!--主体右边部分结束-->
	</div>
</div>

</body>
</html>