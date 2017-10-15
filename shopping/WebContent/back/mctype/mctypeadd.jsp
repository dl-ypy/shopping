<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href=<%=basePath%>/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>

<body>
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">商品类别</a></li> 
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <div class="formtext">Hi，<b>admin</b>，欢迎您使用添加商品类别功能！</div>
    
    <form action="back/McTypeServlet?task=add" method="post" onsubmit="return ruleNumKeyUp()">
	    <ul class="forminfo">
	    <li><label>类别名称<b>*</b></label><input id="name" name="typename" type="text" 
	    	class="dfinput" onkeyup="ruleNumKeyUp()"/><i id="remind">标题不能超过30个字符</i>
	    </li>
	   
	    <li><label>父类别名称<b>*</b></label>  
	    	<div class="vocation">
			    <select class="select1" name="fatherid">
				    <option value="0">无</option>
				    <c:forEach var="mc" items="${list}">
					    <option value="${mc.typeid}">${mc.typename}</option>
				    </c:forEach>
			    </select>
		    </div>
	    </li>
	    
	
	    <li><label>&nbsp;</label><input type="submit" class="btn" value="提交"/></li>
	    </ul>
    </form>
    
    <script type="text/javascript">
	    /*限制字数大于0，少于30*/
	    function ruleNumKeyUp() {
	    	var address = document.getElementById("name").value;
	    	if (address.length<=30 && address.length>0) {
	    		document.getElementById('remind').innerHTML="<font color='green' size='2'>格式正确</font>";
	    		return true;
	    	} else {
	    		document.getElementById('remind').innerHTML="<font color='red' size='2'>字数大于0小于30</font>";
	    		return false;
	    	}
	    }
    </script>
    
    </div> 
    
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
