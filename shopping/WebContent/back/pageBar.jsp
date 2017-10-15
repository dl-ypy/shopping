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
</head>
<body>
	<div class="pagin">
			<div class="message">
				共<i class="blue">${p.totalCount}</i>条记录，共<i class="blue">${p.pageCount}</i>页，每页显示
				<select onchange="funPageSize(this.value)">
					<option value="5" ${p.pageSize eq 5?'selected':''}>5</option>
					<option value="10" ${p.pageSize eq 10?'selected':''}>10</option>
					<option value="15" ${p.pageSize eq 15?'selected':''}>15</option>
				</select>条，
				跳转到第&nbsp;<i class="blue">
				<select onchange="funGoPage(this.value)">
					<c:forEach var="i" begin="1" end="${p.pageCount}" step="1">
						<option value="${i}" ${p.currentPage eq i?'selected':''}>${i}</option>
					</c:forEach>
				</select>&nbsp;</i>页
			</div>
			
			
			<ul class="paginList">
				<li class="paginItem"><a href="javascript:funFirstPage()">首页</a></li>
				<li class="paginItem"><a href="javascript:funBackPage()">上一页</a></li>
				<li class="paginItem"><a href="javascript:funNextPage()">下一页</a></li>
				<li class="paginItem"><a href="javascript:funLastPage()">尾页</a></li>
			</ul>
			
			<script type="text/javascript">
				function $(id) {
					return document.getElementById(id);
				}	
				function funPageSize(value) {
					$("currentPage").value=1;
					$("pageSize").value=value;
					$("changePage").submit();
				}
				function funGoPage(value) {
					$("currentPage").value=value;
					$("pageSize").value=${p.pageSize};
					$("changePage").submit();
				}
				function funFirstPage() {
					$("currentPage").value=1;
					$("pageSize").value=${p.pageSize};
					$("changePage").submit();
				}
				function funBackPage() {
					$("currentPage").value=${p.currentPage eq 1?1:p.currentPage-1};
					$("pageSize").value=${p.pageSize};
					$("changePage").submit();
				}
				function funNextPage() {
					$("currentPage").value=${p.currentPage eq p.pageCount?p.pageCount:p.currentPage+1};
					$("pageSize").value=${p.pageSize};
					$("changePage").submit();
				}
				function funLastPage() {
					$("currentPage").value=${p.pageCount};
					$("pageSize").value=${p.pageSize};
					$("changePage").submit();
				}
			</script>
		</div>
</body>
</html>