<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SPAM 로그인</title>
</head>
<body>
	<form action="/spamUser/listAdd" method="post" enctype="multipart/form-data">
		<div style="text-align: center; padding-top: 15%;">
			<font>취업 유형</font>
				<select name="empNo">
						<c:forEach items="${ listEmp }" var="employmentType" varStatus="status">
							<option value="${ employmentType.no }">${ employmentType.name }</option>
						</c:forEach>
				</select>
			<br>
			<font>졸업 유형</font>
				
			<br>
			<font>파일 업로드</font>
			<input type="file" name="uploadfile"
				accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />
			<br>
			<input type="submit" />
		</div>
	</form>
</body>
</html>