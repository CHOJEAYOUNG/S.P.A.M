<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="ddsmoothmenu.css" rel="stylesheet" type="text/css">
<title>취업 카테고리 조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>	
		<form action="/employmentCategory/list" method="GET">
			검색 <input type="text" name="search" />
			<select name="select">
				<option value="name">카테고리 명</option>
				<option value="condition">조건</option>
			</select>
			<a href="/employmentCategory/list"><input type="button" value="전체보기"></a>
			<br><br><br>
		</form>
		
		<table style="width:100%" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리 명</th>
					<th>유형</th>
					<th>조건</th>
					<th>점수</th>
					<th>상세보기</th>
				</tr>
				
				<c:if test="${ !empty listCategory}">
					<c:forEach items="${ listCategory }" var="employmentCategory" varStatus="status">
						<c:if test="${employmentCategory.state eq 'Y'}">
							<tr>
								<td style="text-align: center;">
									<c:out value="${status.count}"/>
								</td>
								<td style="text-align: center;">
									<c:out value="${ employmentCategory.name }"/>
								</td>
								<td style="text-align: center;">
									<c:forEach items="${ listType }" var="employmentType" varStatus="status">
										<c:if test="${employmentType.no eq employmentCategory.empTypeNo}">
											<c:out value="${employmentType.name}"/>
										</c:if>
									</c:forEach>
								</td>
								<td style="text-align: center;">
									<c:if test="${employmentCategory.conditionSqeNo eq 1}">
										<c:out value="필수"/>
									</c:if>
									<c:if test="${employmentCategory.conditionSqeNo eq 2}">
										<c:out value="선택"/>
									</c:if>
								</td>
								<td style="text-align: center;">
									<c:out value="${ employmentCategory.score }"/>
								</td>
								<td style="text-align: center;">
									<a href="<c:url value="/employmentCategory/view/${employmentCategory.no}"/>">
										<input type="button" value="상세보기"> 
									</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${empty listCategory}">
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
			<a href="<c:url value="/employmentCategory/add" />">
				<input type="button" name="add" value="등록"> 
			</a>
		</div>
</body>
</html>