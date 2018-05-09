<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>취업 유형 조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>	
		<form action="/employmentType/list" method="GET">
			검색 <input type="text" name="search" />
			<select name="select">
				<option value="type">유형</option>
				<option value="year">연도</option>
			</select>
			<a href="/employmentType/list"><input type="button" value="전체보기"></a>
			<br><br><br>
		</form>
		
		<table style="width:100%" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>유형</th>
					<th>필수점수</th>
					<th>선택점수</th>
					<th>연도</th>
					<th>상태</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				
				<c:if test="${ !empty listType}">
					<c:forEach items="${ listType }" var="employmentType" varStatus="status">
						<tr>
							<td style="text-align: center;">
								<c:out value="${ employmentType.no }"/>
							</td>
							<td style="text-align: center;">
								<c:out value="${ employmentType.name }"/>
							</td>
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
								<c:out value="${ employmentType.state }"/>
							</td>
							<td style="text-align: center;">
								<a href="<c:url value="/employmentType/edit?no=${employmentType.no}" />">
									<input type="button" name="edit" value="수정"> 
								</a>
							</td>
							<td style="text-align: center;">
								<a href="<c:url value="/employmentType/remove?no=${employmentType.no}" />">
									<input type="button" name="remove" value="삭제"> 
								</a>
							</td>
						</tr>
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
			<a href="<c:url value="/employmentType/add" />">
				<input type="button" name="add" value="등록"> 
			</a>
		</div>
</body>
</html>