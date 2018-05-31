<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String power = "";
power = (String)session.getAttribute("power");
%>
<script type="text/javascript">
function openAttendance() {
	window.open(
		"searchA", 
		"open the window",
		"toolbar=no, width=500, height=500, top=150, left=150"
	);
}
function openEmploymentA() {
	window.open(
		"searchE", 
		"open the window",
		"toolbar=no, width=500, height=500, top=150, left=150"
	);
}
function openEmploymentS() {
	 var myForm = document.S;
	 var url = "/employment/selectEmployment";

	window.open(
		"","selectEmployment", 
		"open the window",
		"toolbar=no, width=500, height=500, top=150, left=150");
	myForm.action =url; 
	myForm.method="post";
	myForm.submit();
}
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h2>선택</h2>
	<c:if test="${power eq 'A' }">
		<a href="javascript:openAttendance()">비교과</a>
		<a href="javascript:openEmploymentA()">취업</a>
	</c:if>
	<c:if test="${power eq 'S' }">
		<a href="javascript:openEmploymentS()">취업</a>
	</c:if>
</body>
</html>