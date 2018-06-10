<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function closeWin() {
	window.self.close();
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<c:if test="${empty message}">
		<input type="hidden" id="adviceNo" name="adviceNo" value="${advice.adviceNo}">
		교수정보 : <c:out value="${advice.name}" /> <br/>
						사유 : <c:out value="${advice.reason}" /> <br/>
						<c:choose>
						<c:when test="${advice.mon ne 0}">
														
															월요일 <c:out value="${advice.mon}"></c:out>
														</c:when>
														<c:when test="${advice.tue ne 0}">
															화요일 <c:out value="${advice.tue}"></c:out>
														</c:when>
														<c:when test="${advice.wed ne 0}">
															수요일 <c:out value="${advice.wed}"></c:out>
														</c:when>
														<c:when test="${advice.thur ne 0}">
															목요일 <c:out value="${advice.thur}"></c:out>
														</c:when>
														<c:when test="${advice.fri ne 0}">
															금요일 <c:out value="${advice.fri}"></c:out>
														</c:when>
													</c:choose><br/>
						등록날짜 : <c:out value="${advice.registration}" /> <br/>
						상담날짜 : <c:out value="${advice.adviceDate}" /> <br/>
						승인여부 : <c:out value="${advice.state}" /> <br/>
						
						<c:if test="${!empty advice.cause}">
							거절사유 : <c:out value="${advice.cause}" /> <br/>
						</c:if>
		<c:if test="${sessionScope.power ne 'P' }">
		<a href="<c:url value="/advice/remove/${advice.adviceNo}" />"> <input
									type="button" id="list" name="list" value="취소" />
								</a>
		</c:if>
		</c:if>
		<c:if test="${!empty message}">
			${message} <br/>
		</c:if>
		<input type="button" id="button_ok" name="button_ok" value="닫기"
			onclick="closeWin();" />
		
</body>
</html>