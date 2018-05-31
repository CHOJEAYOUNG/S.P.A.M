<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>졸업 기준 관리</title>
</head>
	<h2>학생을 선택하세요.</h2>
	<form action="/graduation/search" method="get">
		검 색 <input type="text" name="search" />
			<select name="select">
				<option value="id">학번</option>
				<option value="name">이름</option>
			</select>
	</form>
	<form action="/graduation/selectGraduation" method="post">
		
		<table style="width:100%" border="1">
				<thead>
					<tr>
						<th>선택</th>
						<th>학번</th>
						<th>이름</th>
						<th>학년</th>
					</tr>
					<c:if test="${ !empty listSpam}">
						<c:forEach items="${ listSpam }" var="spamUser" varStatus="status">
							<c:if test="${ spamUser.power eq 'S'}">	
								<tr>
									<td style="text-align: center;">
										<input type="radio" name="id" value="${ spamUser.id }"> 
									</td>
									<td style="text-align: center;">
										<c:out value="${ spamUser.id }"/>
									</td>
									<td style="text-align: center;">
										<c:out value="${ spamUser.name }"/>
									</td>
									<td style="text-align: center;">
										<c:out value="${ spamUser.grade }"/>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${empty listSpam}">
						<tr>
							<td style="text-align: center;" colspan="7">
								목록이 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
				</thead>
			</table>
			<br>
			<input type="submit" value="다음"/>
		</form>
</body>
</html>