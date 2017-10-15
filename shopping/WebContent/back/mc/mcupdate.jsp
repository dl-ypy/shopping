<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/mc/mcAddAndUpd.js"></script>
</head>

<body>

    <div class="formbody">
    
    <div class="formtitle"><span>商品信息</span></div>
	<form action="back/McServlet?task=update" method="post" enctype="multipart/form-data" onsubmit="return ruleNumKeyUp()&&submitFun()">   
	    <input type="hidden" name="mcid" value="${mc.mcid}"/>
	    <ul class="forminfo">
	    <li><label>商品名称</label><input id="name" name="mcname" type="text" class="dfinput" value="${mc.mcname}" onkeyup="ruleNumKeyUp()"/><i id="remind">标题不能超过30个字符</i></li>
	    <li><label>商品描述</label><input name="mcdecx" type="text" class="dfinput" value="${mc.mcdecx}"/></li>
	    <li><label>商品价格</label><input name="price" id="price" type="text" class="dfinput" value="${mc.price}" onkeyup="priceKeyUp()"/><i id="price_i">价格不超过10000000</i></li>
	    <li><label>商品大类</label>
		    <select name="big" id="bigs" class="dfinput" onchange="change(this.value)"  onblur="bigSelect()">
		    	<option value="-1">请选择</option>
		    	<c:forEach var="big" items="${bigList}">
		    		<option value="${big.typeid}" ${mt.fatherid eq big.typeid?'selected':'' }>${big.typename}</option>
		    	</c:forEach>
		    </select><i id="big_i"></i></li>
	    <li><label>商品小类</label>
	    	<select  id="smalltypeid" name="smalltypeid" class="dfinput" onblur="smallSelect()">
	    		<option value="-1">请选择</option>
	    		<c:forEach var="big" items="${bigList}">
	    			<c:if test="${big.typeid eq mt.fatherid}">
			    		<c:forEach var="mtList" items="${mtList}">
			    			<c:if test="${mtList.fatherid eq big.typeid}">
			    				<option value="${mtList.typeid}" ${mc.smalltypeid eq mtList.typeid?'selected':''}>${mtList.typename}</option>
				    		</c:if>
				    	</c:forEach>
		    		</c:if>
		    	</c:forEach>
		    </select><i id="smalltypeid_i"></i></li>
		<li><label>商品库存</label><input name="quantity" id="quantity" type="text" class="dfinput" value="${mc.quantity}" onkeyup="quantityKeyUp()"/><i id="quantity_i">必须是数字，不超过10000000</i></li>
	    <li><label>商品图片</label><input name="pic" type="file"/></li>
	    <li><label>&nbsp;</label><input type="submit" class="btn" value="提交"/></li>
	    </ul>
    </form> 
    </div>
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
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
