<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int year, yearMin, yearMax;
	int yearResult, yearCount;
	int month;
	int date;
	List<String> yearList = new ArrayList<String>();
	Calendar now = Calendar.getInstance();
	year = now.get(Calendar.YEAR);
	month = now.get(Calendar.MONTH)+1;
	date = now.get(Calendar.DATE);
	yearMin = now.get(Calendar.YEAR) - 10; // 현재 연도 - 10
	yearMax = now.get(Calendar.YEAR); // 최대 연도는 '현재연도 + 1'
	yearCount = yearMax - yearMin;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>취업 유형 등록</title>
</head>
<body>
	<form action="/graduationType/add" method="POST">
		유  형 <input type="text" name="name" /><span style="color:red">${checkName}</span> <br>
		연  도 <select name="year">
		<%-- // 연도선택을 위한 연도출력을 동적으로 변경 --%>
			<%yearResult = yearMin;

			for(int i=0; yearResult<=yearMax; i++) { %>

			<option value=<%=yearResult%> <% if(year == yearResult){%>selected="selected"<%} %> ><%=yearResult%></option>

			<%String.valueOf(yearResult++); } %>

		</select> <br>
		
		<input type="submit" value="등록" />
	</form>
	<a href="/graduationType/list"><input type="button" value="목록" /></a>
</body>
</html>