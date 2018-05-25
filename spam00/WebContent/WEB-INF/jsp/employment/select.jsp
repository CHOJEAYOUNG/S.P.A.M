<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
function openEmployment() {
	window.open(
		"searchE", 
		"open the window",
		"toolbar=no, width=500, height=500, top=150, left=150"
	);
}
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	<h2>선택</h2>
	<a href="javascript:openAttendance()">비교과</a>
	<a href="javascript:openEmployment()">취업</a>
	<a href="javascript:dataSend()">전송</a>

</body>
</html>