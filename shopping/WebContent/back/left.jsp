<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<base href="<%=basePath%>"> 
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>通讯录</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>商品管理
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="back/McTypeServlet" target="rightFrame">商品类别管理</a><i></i></li>
        <li><cite></cite><a href="back/McServlet" target="rightFrame">商品信息管理</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>用户管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="back/BackUserServlet?task=query" target="rightFrame">普通用户管理</a><i></i></li>
        <li><cite></cite><a href="back/BackManagerServlet?task=query&mid=${manager.mid}" target="rightFrame">管理员管理</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="images/leftico03.png" /></span>个人资料管理</div>
    <ul class="menuson">
    <li><cite></cite><a href="back/BackManagerServlet?task=queryone&mid=${manager.mid}" target="rightFrame">显示个人资料</a><i></i></li>
        <li><cite></cite><a href="back/BackManagerServlet?task=updatequery&mid=${manager.mid}&num=one" target="rightFrame">个人资料修改</a><i></i></li>
        <li><cite></cite><a href="back/BackManagerServlet?task=queryone&mid=${manager.mid}&flag=pwd" target="rightFrame">密码修改</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="images/leftico04.png" /></span>订单管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="back/BackOrderServlet?task=query" target="rightFrame">订单管理</a><i></i></li>
    </ul>
    
    </dd>   
    
    </dl>
    
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
