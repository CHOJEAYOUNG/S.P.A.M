<%@page import="com.spam.domain.Attendance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="/attendance/view" method="post">
		<div style="text-align: center; padding-top: 15%;">
		<font>제목</font> 
		<c:out value = "${attendance.title}"/><br>
		
		<font>취업점수</font>
		<c:out value = "${attendance.score}"/><br> 
		
		<font>등록한 날짜</font>
		<c:out value = "${attendance.registrationDate}"/><br>
			
		<font>강의 날짜</font>
		<c:out value = "${attendance.lectureDate}"/><br>
		
		<font>강의 시간</font>
		<c:out value = "${attendance.lectureTime}"/><br>
			 
		<font>강의 장소</font>
		<c:out value = "${attendance.location}"/><br>
	
		<font>업로드한 파일</font>
		<a href="<c:out value = "/attendance/fileU/${attendance.uploadFileNameWithS}"/>">
			 ${attendance.uploadFileName}
		</a><br>
		
		<font>정보 추가된 파일</font>
		<a href="<c:out value = "/attendance/fileM/${attendance.makedFileNameWithS}"/>">
			 ${attendance.makedFileName}
		</a><br>
		
		<a href="/attendance/upload">
			<input type="button" value="목록"/> 
		</a>
			
		<input type="submit" value="등록" />
	</div>
	</form>
</body>

</html>