<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function add() {
	from.submit();
	window.self.close();
}
function closeWin() {
	window.self.close();
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form id="form" name="form"	action="<c:url value="/advice/edit" />" method="get">
		<input type="hidden" id="adviceNo" name="adviceNo" value="${advice.adviceNo}" /></br>
		거절사유 :<br />
		<input type="text" id="cause" name="cause"/>
		<br /> 
	</form>
		 <input	type="button" id="add" name="add" value="등록" onclick="add();"/>
	 <input	type="button" id="close" name="close"value="취소" onclick="closeWin();"/>
</body>
</html>