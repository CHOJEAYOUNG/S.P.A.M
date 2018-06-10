
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<script type="text/javascript">
function viewPopupOpen(v) {
	window.name = "viewForm";

	var option = "width=500, height=720, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	openWin = window.open("/advice/view/" + v, "childForm", option);
}
function editPopupOpen(v) {
	window.name = "editForm";

	var option = "width=500, height=720, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	openWin = window.open("/advice/edit/" + v, "childForm", option);
}

function stuPopupOpen() {
	window.name = "ListForm";

	var option = "width=700, height=410, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	openWin = window.open("/advice/searchE", "stuForm", option);
}
</script>
<head>
<title>Left Sidebar - Horizons by TEMPLATED</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/skel.min.js"></script>
<script src="/js/skel-layers.min.js"></script>
<script src="/js/init.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/skel.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/style.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body class="left-sidebar">

	<form action="/advice/listS" method="get">
		<table style="border_color: white; align: center;">
			<tr>
				<td>상태</td>
				<td><select id="assentNo" name="assentNo">
						<option value="0" selected>전부</option>
						<option value="1">승인완료</option>
						<option value="2">승인대기</option>
						<option value="3">승인거절</option>
						<option value="4">상담완료</option>
				</select></td>
				<td>날짜</td>
				<td><input type="date" id="searchDate" name="searchDate" /></td>
				<td><input type="submit" value="검색" /></td>
			</tr>
		</table>
	</form>

	<font color="RED"> ※ 1분기 는 해당 교시의 시작시간부터 25분 2분기는 1분기 종료후 25분
		입니다.</font>
	<br />

	<form action="/spamUser/list" method="POST">
		<table style="width: 100%" border="1">
			<thead>
				<tr bgcolor="#4C4639">
					<th style="width: 40px; text-align: center;"><font
						color="#FFFFFF">번호</font></th>
					<th style="width: 40px; text-align: center;"><font
						color="#FFFFFF">학생</font></th>
					<th style="width: 100px; text-align: center;"><font
						color="#FFFFFF">교시</font></th>
					<th style="width: 100px; text-align: center;"><font
						color="#FFFFFF">분기</font></th>
					<th style="width: 100px; text-align: center;"><font
						color="#FFFFFF">등록 날짜</font></th>
					<th style="width: 100px; text-align: center;"><font
						color="#FFFFFF">상담 날짜</font></th>
					<th style="width: 100px; text-align: center;"><font
						color="#FFFFFF">승인 여부</font>
					<th style="width: 100px; text-align: center;"><font
						color="#FFFFFF">상세 보기</font></th>
				</tr>
				<c:if test="${ !empty listAdvice}">
					<c:forEach items="${listAdvice}" var="advice" varStatus="status">
						<tr>
							<td style="text-align: center; width: 35px;"><c:out
									value="${ status.count }" /></td>
							<td style="text-align: center; width: 100px;"><c:out
									value="${ advice.name }" /></td>
							<td style="text-align: center; width: 100px;"><c:choose>
									<c:when test="${advice.mon ne 0}">
															월요일 <c:out value="${advice.mon}"></c:out>
									</c:when>
									<c:when test="${advice.tue ne 0}">
															화요일 <c:out value="${advice.tue}"></c:out>
									</c:when>
									<c:when test="${advice.wed ne 0}">
															수요일 <c:out value="${advice.wed}"></c:out>
									</c:when>
									<c:when test="${advice.thur ne 0}">
															목요일 <c:out value="${advice.thur}"></c:out>
									</c:when>
									<c:when test="${advice.fri ne 0}">
															금요일 <c:out value="${advice.fri}"></c:out>
									</c:when>
								</c:choose>
							<td style="text-align: center; width: 100px;"><c:out
									value="${ advice.quarter }" /></td>
							<td style="text-align: center; width: 100px;"><c:out
									value="${ advice.registration }" /></td>
							<td style="text-align: center; width: 100px;"><c:out
									value="${ advice.adviceDate }" /></td>
							<td style="text-align: center; width: 100px;"><c:out
									value="${ advice.state }" /></td>
							<td style="text-align: center; width: 100px;"><input
								type="button" id="button_view" name="button_view"
								onclick="viewPopupOpen(${advice.adviceNo})" value="상세보기" /></td>
					</c:forEach>
				</c:if>
			</thead>

		</table>
		<a href="<c:url value="/advice/add" />"> <input type="button"
			id="button_add" name="button_edit" value="등록" />
		</a>

	</form>
</body>
</html>
