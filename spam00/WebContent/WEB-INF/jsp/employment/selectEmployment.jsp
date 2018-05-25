<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>취업 선택</h2>
	<form action="/employment/confirm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${user.id}"/>
				<input type="hidden" name="name" value="${user.name}"/>
		<table style="width:100%" border="1">
			<thead>
				<tr>
					<th>선택</th>
					<th>카테고리 명</th>
					<th>유형</th>
					<th>조건</th>
					<th>점수</th>
				</tr>
				
 				<c:if test="${ !empty listCategory}">
					<c:forEach items="${ listCategory }" var="employmentCategory" varStatus="status">
						<c:if test="${employmentCategory.state eq 'Y'}">
							<tr>
								<td style="text-align: center;">
										<input type="radio" name="no" value="${ employmentCategory.no }"> 
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
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${empty listCategory}">
					<tr>
						<td style="text-align: center;" colspan="7">
							목록이 존재하지 않습니다.
						</td>
					</tr>
				</c:if>
			</thead>
		</table>
		<h2>파일 업로드</h2>
		<input type="file" name="file" />
		<input type="submit" value="전송" />
	</form>
</body>
</html>