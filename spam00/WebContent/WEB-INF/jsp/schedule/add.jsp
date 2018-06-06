<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
스케줄 등록 창입니다.
	${message}
	<form id="form" name="form"	action="<c:url value="/schedule/add" />" method="post">
			아이디	<input type="text" id="id" name="id"/><br/>
			사유		<input type="text" id="reason" name="reason"/><br/>
			기간  	<input type="date" id="begin" name="begin"/> ~
					<input type="date" id="finish" name="finish"/><br/>
			월	<input type="text" id="mon" name="mon"/><br/>
			화	<input type="text" id="tue" name="tue"/><br/>
			수	<input type="text" id="wed" name="wed"/><br/>
			목	<input type="text" id="thur" name="thur"/><br/>
			금	<input type="text" id="fri" name="fri"/><br/>
			분기	<input type="text" id="quarter" name="quarter"/> <br/>		
		<input type="submit" value="전송"/>	
	</form>

</body>
</html>