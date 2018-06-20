<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>졸업 카테고리 등록</title>
</head>
<body>
	<form action="/graduationCategory/add" method="POST">
		카테고리 명 <input type="text" name="name" /> <span style="color:red">${checkName}</span> <br>
		유  형  <select name="grTypeNo">
				<c:forEach items="${listType}" var="type"  varStatus="status">
					<option value="${type.no}">${type.name}</option>
				</c:forEach>
			 </select> <br>
			 
		조  건	<input type="radio"	name="conditionSqeNo" value="1" checked="checked">필수
		 	<input type="radio"	name="conditionSqeNo" value="2">선택  <br>
		
		상세정보 <br>
		<textarea rows="10" cols="50" name="info"></textarea> <br>
		
		<input type="submit" value="등록"/>
		<a href="/graduationCategory/list"><input type="button" value="취소"/></a>
	</form>
</body>
</html>