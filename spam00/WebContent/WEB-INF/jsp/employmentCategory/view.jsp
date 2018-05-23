<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취업 카테고리 조회</title>
</head>
<body>
	<form action="/employmentCategory/add" method="POST">
		<input type="hidden" name="no" value="${category.no}">
		카테고리 명 <input type="text" name="name" value="${category.name}" readonly="readonly"/> <br>
		유  형 <input type="text" name="empTypeNo" value="${typeName}" readonly="readonly"/> <br>
		<c:if test="${category.conditionSqeNo eq 1}">
			조  건	<input type="text"	name="conditionSqeNo" value="필수" readonly="readonly">
		</c:if>			
		<c:if test="${category.conditionSqeNo eq 2}">
			조  건	<input type="text"	name="conditionSqeNo" value="선택" readonly="readonly">
		</c:if>	<br>
		점  수 <input type="text" name="score" value="${category.score}" readonly="readonly"/> <br>
		
		상세정보 <br>
		<textarea rows="10" cols="50" name="info" readonly="readonly">${category.info}</textarea> <br>
		
		<a href="/employmentCategory/remove/${no}"><input type="button" value="삭제"/></a>
		<a href="/employmentCategory/edit/${no}"><input type="button" value="수정"/></a>
		<a href="/employmentCategory/list"><input type="button" value="목록"/></a>
	</form>
</body>
</html>