<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function closeWin() {
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
    	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
	</head>


<body  id="main" class="wrapper style1">
	<div style="text-align: center" >
		<h2>상담 내용</h2>
	</div>
	<c:if test="${empty message}">
		<input type="hidden" id="adviceNo" name="adviceNo" value="${advice.adviceNo}">
		<table style="margin-left: 15%;">
			<thead>
				<tr>
					<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">교수정보</font></th>
					<td>
						<c:out value="${advice.name}" />
					</td>
				</tr>
				<tr>
					<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">사유</font></th>
					<td>
						<c:out value="${advice.reason}" />
					</td>
				</tr>
				<tr>
					<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">교시</font></th>
					<td>
						<c:choose>
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
					</td>
				</tr>
				<tr>
					<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">등록날짜</font></th>
					<td>
						<c:out value="${advice.registration}" />
					</td>
				</tr>
				<tr>
					<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">상담날짜</font></th>
					<td>
						<c:out value="${advice.adviceDate}" />
					</td>
				</tr>
				<tr>
					<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">승인여부</font></th>
					<td>
						<c:out value="${advice.state}" />
					</td>
				</tr>
				<c:if test="${!empty advice.cause}">
					<tr>
						<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">거절사유</font></th>
						<td>
							<c:out value="${advice.cause}" />
						</td>
					</tr>
				</c:if>
			</thead>
		</table>
	</c:if>
	<c:if test="${!empty message}">
			${message}
	</c:if>
		<div style="text-align: center" >
			<c:if test="${sessionScope.power ne 'P' }">
		
		<a href="<c:url value="/advice/remove/${advice.adviceNo}" />"> <input
									type="button" id="list" name="list" value="삭제" />
								</a>
		</c:if>
		
		<input type="button" id="button_ok" name="button_ok" value="닫기"
			onclick="closeWin();" />
		</div>
</body>
</html>