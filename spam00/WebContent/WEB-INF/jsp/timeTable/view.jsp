<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="../../main/assets/css/main.css" rel="stylesheet" />
<title>::: 스케줄 상세 조회 :::</title>
</head>
<body>
	<c:forEach items="${listSchdule}" var="schdule">
											
						넘버 : <c:out value="${schdule.scheduleNo}" /> //
						시작날짜 : <c:out value="${schdule.begin}" /> //
						종료날짜 : <c:out value="${schdule.finish}" />
						<br/>
	</c:forEach>
	<a href="<c:url value="/schedule/edit/#{scheduleNo}" />">
	<input type="button" id="button_add" name="button_edit" value="수정" />
	</a>
</body>
</html>