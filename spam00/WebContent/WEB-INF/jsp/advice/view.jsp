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
		�������� : <c:out value="${advice.pId}" /> <br/>
		�л����� : <c:out value="${advice.sId}" /> <br/>
						���� : <c:out value="${advice.cause}" /> <br/>
						�� : <c:out value="${advice.mon}" /> <br/>
						ȭ : <c:out value="${advice.tue}" /> <br/>
						�� : <c:out value="${advice.wed}" /> <br/>
						�� : <c:out value="${advice.thur}" /> <br/>
						�� : <c:out value="${advice.fri}" /> <br/>
						��ϳ�¥ : <c:out value="${advice.registration}" /> <br/>
						��㳯¥ : <c:out value="${advice.adviceDate}" /> <br/>
						���ο��� : <c:out value="${advice.state}" /> <br/>
						<c:if test="${!empty advice.cause}">
							�������� : <c:out value="${advice.cause}" /> <br/>
						</c:if>
		<input type="button" id="button_ok" name="button_ok" value="�ݱ�"
			onclick="closeWin();" />
		<a href="<c:url value="/remove/${advice.adviceNo}" />">
		<input type="button" id="button_ok" name="button_ok" value="�ݱ�"
			onclick="closeWin();" />
		</a>
</body>
</html>