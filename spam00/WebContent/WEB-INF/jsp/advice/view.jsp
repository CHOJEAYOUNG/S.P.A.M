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
		<input type="hidden" id="adviceNo" name="adviceNo" value="${advice.adviceNo}">
		교수정보 : <c:out value="${advice.pId}" /> <br/>
		학생정보 : <c:out value="${advice.sId}" /> <br/>
						사유 : <c:out value="${advice.cause}" /> <br/>
						월 : <c:out value="${advice.mon}" /> <br/>
						화 : <c:out value="${advice.tue}" /> <br/>
						수 : <c:out value="${advice.wed}" /> <br/>
						목 : <c:out value="${advice.thur}" /> <br/>
						금 : <c:out value="${advice.fri}" /> <br/>
						등록날짜 : <c:out value="${advice.registration}" /> <br/>
						상담날짜 : <c:out value="${advice.adviceDate}" /> <br/>
						승인여부 : <c:out value="${advice.state}" /> <br/>
						<c:if test="${!empty advice.cause}">
							거절사유 : <c:out value="${advice.cause}" /> <br/>
						</c:if>
		<input type="button" id="button_ok" name="button_ok" value="닫기"
			onclick="closeWin();" />
		<a href="<c:url value="/remove/${advice.adviceNo}" />">
		<input type="button" id="button_ok" name="button_ok" value="닫기"
			onclick="closeWin();" />
		</a>
</body>
</html>