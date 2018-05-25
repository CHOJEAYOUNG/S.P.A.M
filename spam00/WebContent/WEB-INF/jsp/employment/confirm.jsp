<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>
	<h2>확인</h2>
	</form>
		학번 <input type="text" name="id" value="${id}" readonly="readonly"/> <br>
		이름 <input type="text" value="${nameS}" readonly="readonly"/> <br>
		카테고리명 <input type="text" name="name" value="${category.name}" readonly="readonly"/> <br>
		<c:if test="${category.conditionSqeNo eq 1}">
			조  건	<input type="text"	name="conditionSqeNo" value="필수" readonly="readonly">
		</c:if>			
		<c:if test="${category.conditionSqeNo eq 2}">
			조  건	<input type="text"	name="conditionSqeNo" value="선택" readonly="readonly">
		</c:if>	<br>
		점  수 <input type="text" name="score" value="${category.score}" readonly="readonly"/> <br>
</body>
</html>