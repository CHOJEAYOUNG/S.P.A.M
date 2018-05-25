<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정</title>
</head>
<body>
	<input type="text" name="id" value="${spamuser.id}" readOnly="readonly" />
	<input type="text" name="nameS" value="${spamuser.name}" readOnly="readonly" />
	<input type="text" name="empNo" value="${spamuser.empNo}" readOnly="readonly" /> <br>
	<input type="text" name="nameC" value="${category.name}" readOnly="readonly" />
	<input type="text" name="nameC" value="${employment.registration}" readOnly="readonly" />
	<input type="text" name="conditionSqeNo" value="${employment.registration}" readOnly="readonly" />
	<c:if test="${category.conditionSqeNo eq 1}">
		<input type="text" name="conditionSqeNo" value="필수" readOnly="readonly" />
	</c:if>
	<c:if test="${category.conditionSqeNo eq 2}">
		<input type="text" name="conditionSqeNo" value="선택" readOnly="readonly" />
	</c:if> <br>
	파일명 <br>
	승인 여부 
	<c:if test="${ employment.assentNo eq 1}">
		<span style="color:blue">승인</span>
		${employment.assentDate}
	</c:if>
	<c:if test="${ employment.assentNo eq 2}">
		<input type="radio" name="assentNo" value="1" /> 승인
		<input type="radio" name="assentNo" value="3" /> 거절
	</c:if>
	<c:if test="${ employment.assentNo eq 3}">
		<span style="color:red">거절</span>
		${employment.assentDate}
	</c:if> <br>
	거절사유 <br>
	<textarea rows="1" cols="15" name="cause"></textarea> <br>
	<a href="/employment/list"><input type="button" value="목록"/></a>
</body>
</html>