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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/main.css" rel="stylesheet"  type="text/css" />
<script src="js/main.js" type="text/javascript"></script>
</head>
<body>
	<!--头部内容开始-->
<div id="header">
	<!--头部顶部开始-->
    <div id="header_top">
        <div class="limit_width">
            <!--顶部左边部分-->
            <div id="top_left">
            	<span>
                您好，${USER.truename}，欢迎来到XX店铺！ 请${not empty USER?'<a href="Javascript:back()">注销</a>':'<a href="front/userLogin.jsp">登录</a>'}|
                 <a href="front/register.jsp">免费注册</a>
                </span>
            </div>
            
            <script type="text/javascript">
            	function back() {
					if (confirm("确定要注销吗？")) {
	            		location.href="LogoutServlet?task=front";
					}
            	}
            </script>
            
            <!--顶部右边部分-->
            <div id="top_right">
            	<ul>
                	<li><a href="#">我的订单</a></li>
                	<li><a href="#">我的一号店</a></li>
                    <li><a href="#">帮助中心</a></li>
                    <li><a href="#">联系客服</a></li>
                    <li><a href="#">加入收藏</a></li>
                    <li id="service"><a href="#">服务热线:</a></li>
                    <li id="phonee">400-8888-666</li>
                </ul>
            
            </div>
        </div>
    </div>
    <!--头部顶部结束-->
   
    <!--头部中部开始-->
    <div id="header_mid">
    	<ul>
    		<li id=${param.flag eq 1?'firstPage':'' }><a href="IndexServlet">首页</a></li>
            <li id=${param.flag eq 2?'firstPage':'' }><a href="front/second.jsp">积分兑换</a></li>
            <li id=${param.flag eq 3?'firstPage':'' }><a href="front/thread.jsp">会员中心</a></li>
            <li id=${param.flag eq 4?'firstPage':'' }><a href="filter/OrderServlet?task=query&userid=${USER.userid}">查看订单</a></li>
    	</ul>
    </div>
    <!--头部中部结束-->
    
    <!--头部底部开始-->
    <div id="header_bottom">
    	<div class="limit_width">
        	<div id="category"><p>所有商品分类</p></div>
        	<div id="search"> 
        		<form id="form" action="IndexServlet" method="post">
        			<input type="text" name="mcname" id="in_text" value="${mcname}"/>
        			<input type="hidden" name="typeid" value="${typeid}"/>
        			<input type="image" src="img/btn_search.jpg"/>
        		</form>
        	</div>
            <div id="hot">
            	
            	<ul>
            		<li>热门搜索:</li>
            		<li><a href="#">贝玲妃</a> </li>
            		<li><a href="#">SKII</a></li>
            		<li><a href="#">阿芙</a></li>
            	</ul>
            	
            </div>
            <div id="cart">
            	<ul>
            		<li id="cart1"><span style="color: #157128;">购物车
            		<font id="count" style="color:red; font-weight: bold;">${not empty SHOPCAR.totalCount?SHOPCAR.totalCount:0 }</font>件物品</span></li>
            		<li id="cart2"><a href="front/shopCar.jsp">去结算</a></li>
            	</ul>
            	
            </div>
        </div>    
    
    </div>
     <!--头部底部结束-->
</div> 
<!--头部内容结束-->
<marquee>活动大促销</marquee>
</body>
</html>