<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>졸업 유형 조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>	
		<form action="/graduationType/list" method="GET">
			검색 <input type="text" name="search" />
			<select name="select">
				<option value="type">유형</option>
				<option value="year">연도</option>
			</select>
			<a href="/graduationType/list"><input type="button" value="전체보기"></a>
			<br><br><br>
		</form>
		
		<table style="width:100%" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>유형</th>
					<th>연도</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				
				<c:if test="${ !empty listType}">
					<c:forEach items="${ listType }" var="graduationType" varStatus="status">
						<c:if test="${ graduationType.state eq 'Y'}">	
							<tr>
								<td style="text-align: center;">
									<c:out value="${ status.count }"/>
								</td>
								<td style="text-align: center;">
									<c:out value="${ graduationType.name }"/>
								</td>
								<td style="text-align: center;">
									<c:out value="${ graduationType.year }"/>
								</td>
								<td style="text-align: center;">
									<a href="<c:url value="/graduationType/edit/${graduationType.no}" />">
										<input type="button" value="수정"> 
									</a>
								</td>
								<td style="text-align: center;">
									<a href="<c:url value="/graduationType/remove/${graduationType.no}" />">
										<input type="button" value="삭제"> 
									</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${empty listType}">
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
			<a href="<c:url value="/graduationType/add" />">
				<input type="button" name="add" value="등록"> 
			</a>
		</div>
</body>
</html>