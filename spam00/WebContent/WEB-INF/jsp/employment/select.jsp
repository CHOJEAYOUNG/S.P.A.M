<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String power = "";
power = (String)session.getAttribute("power");
%>
<script type="text/javascript">
function dataSend(){
	opener.document.getElementById("baseWindowLabel").innerText="new";
	window.close();
}
function openAttendance() {
	window.open(
		"selectAttendance", 
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
	<a href="javascript:openAttendance()">비교과</a>
	<a href="javascript:openEmploymentA()">취업A</a>
	<form name="S">
		<a href="javascript:openEmploymentS()">취업S</a>
	</form>
	<!-- <a href="javascript:dataSend()">전송</a> -->

</body>
</html>