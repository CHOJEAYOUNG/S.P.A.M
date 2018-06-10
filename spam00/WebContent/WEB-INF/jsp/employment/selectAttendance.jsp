<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function checkRadio() {
	var radio = document.getElementsByName('attendanceNo');
	var id = null;
	for(var i = 0 ; i < radio.length; i++) {
		if(radio[i].checked == true) {
			id = radio[i].value;
		}
	}
	if(id == null) {
		alert("비교과를 선택하세요");
		return false;
	} else {
		return true;
	}
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

</script>
<body>
	<h2>비교과 선택</h2>
	<form action="/employment/addAttendance" method="post">
				<input type="hidden" name="id" value="${user.id}"/>
				<input type="hidden" name="name" value="${user.name}"/>
				
		<table style="width:100%" border="1">
			<thead>
				<tr>
					<th>선1택</th>
					<th>비교과 명</th>
					<th>강의날짜</th>
					<th>강의장소</th>
					<th>점수</th>
				</tr>
				
 				<c:if test="${ !empty listAttendance}">
					<c:forEach items="${ listAttendance }" var="attendance" varStatus="status">
							<tr>
								<td style="text-align: center;">
										<input type="radio" name="attendanceNo" value="${ attendance.attendanceNo }"> 
									</td>
								<td style="text-align: center;">
									<c:out value="${ attendance.title }"/>
								</td>
								<td style="text-align: center;">
									<c:out value="${attendance.registrationDate}"/>
								</td>
								<td style="text-align: center;">
									<c:out value="${attendance.location}"/>
								</td>
								<td style="text-align: center;">
									<c:out value="${ attendance.score }"/>
								</td>
							</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty listAttendance}">
					<tr>
						<td style="text-align: center;" colspan="7">
							목록이 존재하지 않습니다.
						</td>
					</tr>
				</c:if>
			</thead>
		</table>
		<input type="submit" value="전송" onclick="return checkRadio()"/>
	</form>
</body>
</html>