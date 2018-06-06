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
<title>::: 상담 목록 조회 :::</title>
<script type="text/javascript">
function viewPopupOpen(v) {
	window.name = "viewForm";

	var option = "width=500, height=720, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	openWin = window.open("/advice/view/" + v, "childForm", option);
}

</script>
</head>
<body>
	<c:if test="${!empty listSpam}">
	
	<c:forEach items="${listAdvice}" var="advice">
						
						학생정보 : <c:out value="${advice.sId}" /> //
						사유 : <c:out value="${advice.cause}" />
						월 : <c:out value="${advice.mon}" />
						화 : <c:out value="${advice.tue}" />
						수 : <c:out value="${advice.wed}" />
						목 : <c:out value="${advice.thur}" />
						금 : <c:out value="${advice.fri}" />
						등록날짜 : <c:out value="${advice.registration}" />
						상담날짜 : <c:out value="${advice.adviceDate}" />
						승인여부 : <c:out value="${advice.state}" />
						
						확인 :
						<c:choose>
						 <c:when test="${sessionScope.power eq'P'} ">
						 	교수
							</c:when>
							<c:when test="${sessionScope.power eq 'S'} ">
						 	학생
							</c:when>
							<c:otherwise>
								제발좀 ${sessionScope.power} ?
							</c:otherwise>
						</c:choose>
							
			<c:if test="${advice.assentDate != null}">
				<c:out value="${advice.assentDate}" />
			</c:if>
			<c:if test="${advice.assentDate == null}">
				<a href="<c:url value="/advice/assent/${advice.adviceNo}" />"> <input
					type="button" value="YES" />
				</a>
			</c:if>
			<input type="button" id="button_view" name="button_view"
								onclick="viewPopupOpen(${advice.adviceNo})" value="보기" />
		
	</c:forEach>
	</c:if>
	<c:if test="${empty listSpam}">
		상담 목록이 없습니다.
	</c:if>
	<br />
	<a href="<c:url value="/advice/add" />"> <input type="button"
		id="button_add" name="button_edit" value="등록" />
	</a>
</body>
</html>