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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<!-- <script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
</script> -->


</head>


<body>

	<div class="place">
		<span>商品信息管理：</span>
	</div>

	<div class="rightinfo">

		<div class="tools">

			<ul class="toolbar">
				<li class="click"><a href="back/McServlet?task=type"><span><img
							src="images/t01.png" /></span>添加</a></li>
				<form action="back/McServlet" method="post" style="float:left;" >
					<li><label>商品名称</label><input id="mcname" value="${mcname}" name="mcname" type="text"
						class="scinput" /></li>
					<li><label>是否缺货</label> 
					<select class="select3" name="flag" id="flag">
							<option value="" >未选择</option>
							<option value="1" ${flag eq 1?'selected':''}>是</option>
							<option value="0" ${flag eq 0?'selected':''}>否</option>
					</select></li>
					<li><label>价格</label> 
					<select class="select3" name="price" id="price">
							<option value="-1">未选择</option>
							<option value="0" ${price eq 0?'selected':'' }>0-100</option>
							<option value="100" ${price eq 100?'selected':'' }>100-500</option>
							<option value="500" ${price eq 500?'selected':'' }>500-1000</option>
							<option value="1000" ${price eq 1000?'selected':'' }>1000-5000</option>
							<option value="5000" ${price eq 5000?'selected':'' }>5000以上</option>
					</select></li> <label>&nbsp;</label>
					<input name="" type="submit" class="scbtn" value="查询" />
				</form>
			</ul>

			<ul class="toolbar1">
				<li><span><img src="images/t05.png" /></span>设置</li>
			</ul>

		</div>


		<table class="tablelist">
			<tr>
				<th><input name="" type="checkbox" value="" checked="checked" /></th>
				<th>商品编号<i class="sort"><img src="images/px.gif" /></i></th>
				<th>商品名称</th>
				<!-- <th align="center" >商品描述</th> -->
				<th>商品价格</th>
				<th>商品图片</th>
				<th>是否缺货</th>
				<th>所属类编号</th>
				<th>添加时间</th>
				<th>数量</th>
				<th>操作</th>
			</tr>
			<tbody>
				<c:forEach var="mc" items="${p.list}">
					<tr>
						<td align="center"><input name="" type="checkbox" value="" /></td>
						<td id="mcid">${mc.mcid}</td>
						<td>${mc.mcname }</td>
						<td>${mc.price }</td>
						<td><img alt="" src="/shopping/upload/${mc.pic}" width="50" height="50"/></td>
						<td>${mc.flag eq 0?'不缺货':'缺货'  }</td>
						<td>${mc.smalltypeid }</td>
						<td>${mc.createdate }</td>
						<td>${mc.quantity  }</td>
						<td><a href="back/McServlet?task=updatequery&mcid=${mc.mcid}&smallid=${mc.smalltypeid}" class="tablelink">修改</a> 
						<a href="javascript:del(${mc.mcid})" class="tablelink">删除</a></td>
					</tr>

				</c:forEach>
		</table>
		
		<script type="text/javascript">
			function del(val) {
				if (confirm("确定要删除此条记录？")) {
					location.href="back/McServlet?task=delete&mcid="+val;
				}
			}
		</script>
		
		<form id="changePage" action="back/McServlet" method="post">
			<input id="currentPage" type="hidden" name="currentPage"
				value="${p.currentPage}" /> <input id="pageSize" type="hidden"
				name="pageSize" value="${p.pageSize}" />
				<input type="hidden" name="mcname" value="${mcname}"/>
				<input type="hidden" name="flag" value="${flag}"/>
				<input type="hidden" name="price" value="${price}"/>
		</form>

		<jsp:include page="/back/pageBar.jsp"></jsp:include>
	</div>

</body>
</html>
