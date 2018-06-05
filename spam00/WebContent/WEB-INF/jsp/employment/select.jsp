<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
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
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>학과 업무 관리 시스템</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
    	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
	</head>
	<body  id="main" class="wrapper style1">
		<header>
			<div style="text-align: center;">
				<h3>등록할 항목을 선택하세요.</h3>
			</div>
			<c:if test="${power eq 'A' }">
				<a href="javascript:openAttendance()"><input type="button" value="비교과" style="width:230px; height:150px"></a>
				<a href="javascript:openEmploymentA()"><input type="button" value="취업" style="width:230px; height:150px"></a>
			</c:if>
			<c:if test="${power eq 'S' }">
				<a href="javascript:openEmploymentS()"><input type="button" value="취업" style="width:230px; height:150px"></a>
			</c:if>
		</header>
	</body>
</html>