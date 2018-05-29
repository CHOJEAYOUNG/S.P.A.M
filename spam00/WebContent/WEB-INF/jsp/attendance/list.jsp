<%@page import="com.spam.domain.Attendance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>	
	<form action="/attendance/list" method="post">
			검색 <input type="text" name="search" />
			<select name="select">
				<option value="type">유형</option>
				<option value="year">연도</option>
			</select>
			<a href="/attendance/list"><input type="button" value="전체보기"></a>
			<br><br><br>
		</form>
		
		<table style="width:100%" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>시간</th>
					<th>위치</th>
					<th>점수</th>
					<th>상세조회</th>
					<th>삭제</th>
				</tr>
				
				<c:if test="${ !empty attendanceList}">
					<c:forEach items="${ attendanceList }" var="attendance" varStatus="status">
						<tr>
							<td style="text-align: center;">
								<c:out value="${ attendance.attendanceNo }"/>
							</td>
							<td style="text-align: center;">
								<c:out value="${ attendance.title }"/>
							</td>
							<!-- 
							<td style="text-align: center;">
								<c:out value="${ employmentType.required }"/>
							</td>
							<td style="text-align: center;">
								<c:out value="${ employmentType.choice }"/>
							</td>
							<td style="text-align: center;">
								<c:out value="${ employmentType.year }"/>
							</td>
							<td style="text-align: center;">
								<a href="<c:url value="/employmentType/edit/${employmentType.no}" />">
									<input type="button" value="수정"> 
								</a>
							</td>
							<td style="text-align: center;">
								<a href="<c:url value="/employmentType/remove/${employmentType.no}" />">
									<input type="button" value="삭제"> 
								</a>
							</td>
							-->
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty attendanceList}">
					<tr>
						<td style="text-align: center;" colspan="7"/>
							목록이 존재하지 않습니다.
						</td>
					</tr>
					 
				</c:if>
				
			</thead>
		</table>
		<br><br><br>
		<div style="text-align: right; padding-top: 10px;"> 
			<a href="<c:url value="/employmentType/add" />">
				<input type="button" name="add" value="등록"> 
			</a>
		</div>
</body>
</html>