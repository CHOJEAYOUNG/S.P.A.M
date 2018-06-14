<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function add() {
		formData = document.getElementById("form");
		formData.submit();
	}
	function closeWin() {
		opener.location.reload();
		window.self.close();
	}
</script>
<head>
<title>학과 업무 관리 시스템</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/skel.min.js"></script>
<script src="/js/skel-layers.min.js"></script>
<script src="/js/init.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/style.css" />
</head>
<body id="main" class="wrapper style1">
	<c:if test="${empty message}">

		<form id="form" name="form" action="<c:url value="/advice/edit" />"
			method="get">
			<input type="hidden" id="adviceNo" name="adviceNo"
				value="${advice.adviceNo}" />
			<div style="text-align: center">
				<h2>거절사유</h2>
			</div>
			<table>
				<thead>
					<tr>
						<td style="width: 50px; text-align: center;"><input
							type="text" id="cause" name="cause" style="width: 300px" /></td>
					</tr>
				</thead>
			</table>
			<div style="text-align: center"></div>
		</form>
		<input type="button" id="add" name="add" value="등록" onclick="add();" />
		<input type="button" id="close" name="close" value="취소"
			onclick="closeWin();" />
	</c:if>
	<c:if test="${!empty message}">
		<div style="text-align: center">
			<h2>거절사유</h2>
		</div>
		<table>
			<thead>
				<tr>
					${message}
					<td />
				</tr>
			</thead>
		</table>
		<div style="text-align: center">
			<input type="button" id="close" name="close" value="확인"
				onclick="closeWin();" />
		</div>
	</c:if>
</body>
</html>
