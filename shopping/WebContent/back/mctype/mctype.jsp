<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href=<%=basePath%> />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
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
</script>


</head>


<body>

	<div class="rightinfo">

		<div class="tools">

			<ul class="toolbar">
				<a href="back/McTypeServlet?task=father">
					<li class="click"><span><img src="images/t01.png" /></span>添加</li>
				</a>
				<li class="click"><span><img src="images/t02.png" /></span>修改</li>
				<li><span><img src="images/t03.png" /></span>删除</li>
				<li><span><img src="images/t04.png" /></span>统计</li>
			</ul>


			<ul class="toolbar1">
				<li><span><img src="images/t05.png" /></span>设置</li>
			</ul>

		</div>


		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" /></th>
					<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
					<th>类别名称</th>
					<th>父类别编号</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="mt" items="${p.list}">
					<c:if test="${mt.fatherid eq 0}">
						<%-- <tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>${mt.typeid}</td>
							<td align="left">${mt.typename}</td>
							<td>${mt.fatherid}</td>
							<td><a class="tablelink" href="back/McTypeServlet?task=updatequery&typeid=${mt.typeid}">修改</a><a  class="tablelink" href="javascript:del(${mt.typeid})">删除</a></td>
						</tr>
						<c:forEach var="small" items="${list}">
							<c:if test="${small.fatherid eq mt.typeid}">
								<tr>
									<td><input name="" type="checkbox" value="" /></td>
									<td>${small.typeid}</td>
									<td align="center">${small.typename}</td>
									<td>${small.fatherid}</td>
									<td><a class="tablelink" href="back/McTypeServlet?task=updatequery&typeid=${small.typeid}">修改</a><a  class="tablelink" href="javascript:del(${small.typeid})">删除</a></td>
								</tr>
							</c:if>
						</c:forEach> --%>
						<tr>
							<td><input name="" type="checkbox" value="" /></td>
							<td>${mt.typeid}</td>
							<td>${mt.typename}</td>
							<td>${mt.fatherid}</td>
							<td><a class="tablelink" href="back/McTypeServlet?task=updatequery&typeid=${mt.typeid}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="tablelink" href="javascript:del(${mt.typeid})">删除</a></td>
						</tr>
					</c:if>
					<c:if test="${mt.fatherid ne 0}">
					<tr>
						<td><input name="" type="checkbox" value="" /></td>
						<td>${mt.typeid}</td>
						<td align="center">${mt.typename}</td>
						<td>${mt.fatherid}</td>
						<td><a class="tablelink" href="back/McTypeServlet?task=updatequery&typeid=${mt.typeid}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="tablelink" href="javascript:del(${mt.typeid})">删除</a></td>
					</tr>
					</c:if>
				</c:forEach>

			</tbody>
		</table>
		
		<form action="back/McTypeServlet" method="post" id="changePage">
			<input id="currentPage" type="hidden" name="currentPage"/>
			<input id="pageSize" type="hidden" name="pageSize"/>
		</form>
		
		<script type="text/javascript">
			function del(value) {
				if (confirm("确定要删除此条记录？")) {
					if (confirm("删除此商品类别会将属于该类的商品一起删除！！！")) {
						location.href="back/McTypeServlet?task=delete&typeid="+value;
					}
				}
			}
		</script>

		<jsp:include page="/back/pageBar.jsp"></jsp:include>  <!-- 分页 -->
		
		<div class="tip">
			<div class="tiptop">
				<span>提示信息</span><a></a>
			</div>

			<div class="tipinfo">
				<span><img src="images/ticon.png" /></span>
				<div class="tipright">
					<p>是否确认对信息的修改 ？</p>
					<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
				</div>
			</div>

			<div class="tipbtn">
				<input name="" type="button" class="sure" value="确定" />&nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>

		</div>
	</div>

	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>
