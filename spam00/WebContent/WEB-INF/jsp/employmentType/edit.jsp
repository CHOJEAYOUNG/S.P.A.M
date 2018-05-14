<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
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
	yearMax = now.get(Calendar.YEAR); // 최대 연도
	yearCount = yearMax - yearMin;
%>

<html  disable-url-rewriting="true">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>취업 유형 수정</title>
</head>
<body>
	<form action="/employmentType/edit" method="POST">
		유  형 <input type="text" name="name" value="${type.name}" /><span style="color:red">${checkName}</span> <br>
		점  수 <br> <input type="hidden" name="no" value="${type.no}">
		필  수 <input type="text" name="required" value="${type.required}" /><span style="color:red">${checkRequired}</span> <br>
		선  택 <input type="text" name="choice" value="${type.choice}" /><span style="color:red">${checkChoice}</span> <br>
		
		연  도 <select name="year">
		<%-- // 연도선택을 위한 연도출력을 동적으로 변경 --%>
			<%yearResult = yearMin;

			for(int i=0; yearResult<=yearMax; i++) { %>

			<option value=<%=yearResult%> <% if(year == yearResult){%>selected="selected"<%} %> ><%=yearResult%></option>

			<%String.valueOf(yearResult++); } %>

		</select> <br>
		<input type="submit" value="수정" />
	</form>
	<a href="/employmentType/list"><input type="button" value="취소" /></a>
</body>
</html>