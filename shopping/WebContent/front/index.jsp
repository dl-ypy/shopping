<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<html>
<head>
<base href=<%=basePath%>/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/main.css" rel="stylesheet"  type="text/css" />
<script src="js/main.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="top.jsp">
<jsp:param value="1" name="flag"/>
</jsp:include>

<!--主题部分开始-->
<div id="main">
	<div class="limit_width">
		<!--主体左边部分开始-->
		<div id="mid_left">
			<div class="notice">
				<div class="n_title">
					<span> 公告栏</span>
				</div>
				<div class="n_content"></div>
			</div>
			<!--商品分类开始-->
			<div class="goods">
				<div class="n_title">
					<span> 商品分类</span>
				</div>
				<div class="n_content">
					<c:forEach var="big" items="${type}">
						<c:if test="${big.fatherid eq 0}">
							<dt><a href="javascript:change(dd_${big.typeid})">${big.typename}</a></dt>
							<c:forEach var="small" items="${type}">
								<c:if test="${small.fatherid eq big.typeid}">
									<dd>
										---><a href="IndexServlet?typeid=${small.typeid}">${small.typename}</a>
									</dd>
								</c:if>
							</c:forEach>
						</c:if>
						<dl>
						</dl>
					</c:forEach>
				</div>
			</div>
			<!--商品分类结束-->
			<script type="text/javascript">
				function change(id) {
					document.getElementById(id).style.display="";
				}
			</script>
		</div>
		<!--主体左边部分结束-->
		<!--主体右边部分开始-->
		<div id="mid_right">
			<div class="mc_list">
				<!--商品信息开始-->
				<c:forEach var="mcl" items="${p.list}">
					<div class="mc_list_left">
						<image class="mc_image" src="/shopping/upload/${mcl.pic}" ></image>
					</div>
					<div class="mc_list_right">
						<p>${mcl.mcname }</p>
						<p>单价：￥${mcl.price }</p>
						<p>是否缺货：${mcl.flag eq 1?'是':'否' }</p>
						<p id="mc_message">详情：${mcl.mcdecx}</p>
						<p id="mc_button"><input type="image" src="img/detail.jpg" onclick="javascript:Location.href='back/McServlet?task=queryOne&mcid=${mcl.mcid}'">
						<input type="image" src="img/pay.jpg" onclick="shopCar(${mcl.mcid})">
						</p>
					</div>
				</c:forEach>
				<div style="clear: both;"></div>
			</div>
			<script type="text/javascript">
				
			</script>
		</div>
		<!--主体右边部分结束-->
	</div>
</div>

<script type="text/javascript">
	function shopCar(val) {
		//获取XMLHttpRequest对象
		var xmlhttp = new XMLHttpRequest();
		//打开连接通道
		xmlhttp.open("POST", "ShopCarServlet?task=add&mcid="+val, true);
		//发送请求
		xmlhttp.send();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var data = eval(xmlhttp.responseText);
				if (data == "-1") {
					alert("此商品已卖完，请选择其他商品！");
				} else {
					document.getElementById("count").innerHTML = data;
				}
			}
		}
	}
	
	
	
</script>
<!--主体部分结束-->
<div style="clear: both;"></div>
		<form action="IndexServlet" method="post" id="changePage">
			<input id="currentPage" type="hidden" name="currentPage" value="${p.currentPage}"/>
			<input id="pageSize" type="hidden" name="pageSize" value="${p.pageSize}"/>
			<input type="hidden" name="mcname" value="${mcname}"/>
			<input type="hidden" name="typeid" value="${typeid}"/>
		</form>

		<jsp:include page="/back/pageBar.jsp"></jsp:include>
<hr />
<!--底部内容开始-->
<div id="footer">
	
</div>
<!--底部内容结束-->
</body>
</html>