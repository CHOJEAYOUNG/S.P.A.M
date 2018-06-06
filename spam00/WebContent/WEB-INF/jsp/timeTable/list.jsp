<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="../../main/assets/css/main.css" rel="stylesheet" />
<title>::: 시간표 목록 조회 :::</title>
</head>
<body>

<div id="wrapper">
	<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<h1>시간표 조회</h1>
					<p>교시의 정보를 조회 또는 수정이 가능합니다.</p>
				</header>

			</div>
		</div>

	<table style="width: 100%;" border="1">
		<thead>
			<tr>
				<th style="text-align: center;">교시</th>
				<th style="text-align: center;">시작시간</th>
				<th style="text-align: center;">종료시간</th>
				
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty listTimeTable}">
				<c:forEach items="${listTimeTable}" var="timeTable">
					<tr>						
						<td style="text-align: center;"><c:out 
								value="${timeTable.period}" /></td>
						<td style="text-align: center;"><c:out 
								value="${timeTable.beginHour}" /> : 
								<c:out value="${timeTable.beginMinutes}"/></td>
						<td style="text-align: center;"><c:out 
								value="${timeTable.finishHour}" /> :
								<c:out value="${timeTable.finishMinutes}"/>
								</td>
						<td style="text-align: center;">
						<a href="<c:url value="/timeTable/edit/${timeTable.period}" />">	
						<input type="button" id="button_edit" name="button_edit" value="수정" />
						</a>	
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty listTimeTable}">
				<tr>
					<td style="text-align: center;" colspan="7">시간표가 존재하지 않습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>


	<div style="text-align: right; padding-top: 10px;">
		<a href="<c:url value="/timeTable/add" />"> <input type="button"
			id="button_add" name="button_add" value="등록" />
		</a>
	</div>
	</div>

	
</body>
</html>