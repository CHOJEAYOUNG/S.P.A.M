<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String power = "";
power = (String)session.getAttribute("power");
%>

<script type="text/javascript">
function showDiv( id,check ) {
	if(check=='s') {
		document.all[ id ].style.visibility = 'visible';	
	} else {
    document.all.cause.style.visibility = 'hidden'; 
	}
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
</head>
<body>
	<form action="/employment/edit" method="post">
		<input type="hidden" name="emplNo" value="${employment.emplNo}">
		학번<input type="text" name="id" value="${spamuser.id}" readOnly="readonly" />
		이름<input type="text" value="${spamuser.name}" readOnly="readonly" />
	 	취업 유형<input type="text" name="empNo" value="${employmentType.name}" readOnly="readonly" /> <br>
	 	<c:if test="${employment.empcNo ne 0}">
			제목<input type="text" value="${category.name}" readOnly="readonly" />
			조건
			<c:if test="${category.conditionSqeNo eq 1}">
				<input type="text" name="conditionSqeNo" value="필수" readOnly="readonly" />
			</c:if>
			<c:if test="${category.conditionSqeNo eq 2}">
				<input type="text" name="conditionSqeNo" value="선택" readOnly="readonly" />
			</c:if> <br>
	 	</c:if>
	 	<c:if test="${employment.empcNo eq 0}">
			제목<input type="text" value="${attendance.title}" readOnly="readonly" />
			조건 <input type="text" value="비교과" readOnly="readonly" />
	 	</c:if>
		등록일<input type="text" name="registration" value="${employment.registration}" readOnly="readonly" />
		<c:if test="${employment.empcNo ne 0}">
			상세 정보 <input type="text" name="info" value="${category.info} " readOnly="readonly" /><br>
			파일명 <a href="<c:out value = "/employment/download/${employment.emplNo}"/>">${employment.originalName}</a>다운로드 하는중
	 	</c:if> <br>
		승인 여부
		<c:if test="${ employment.assentNo eq 1}">
			<span style="color:blue">승인</span>
			${employment.assentDate}
		</c:if>
		
		<c:if test="${ employment.assentNo eq 2}">
			<c:if test="${power ne 'A'}">
				<span style="color:green">대기</span>
			</c:if>
			<c:if test="${power eq 'A' }">
				<input type="radio" name="assentNo" value="1" onClick="showDiv( 'cause','h' );"/> 승인
				<input type="radio" name="assentNo" value="3" onClick="showDiv( 'cause','s' );"/> 거절
				<br>
				<textarea rows="1" cols="15" name="cause" placeholder="거절사유" style="visibility:hidden"></textarea> <br>
				<input type="submit" value="완료">
			</c:if>
		</c:if>
		
		<c:if test="${ employment.assentNo eq 3}">
			<span style="color:red">거절</span>
			${employment.assentDate} <br>
			거절사유 <br>
			<textarea rows="1" cols="15" name="cause" readonly="readonly">${employment.cause}</textarea> <br>
		</c:if> <br>
		<c:if test="${power eq 'S' && employment.assentNo ne 1}">
			<a href="/employment/remove/${employment.emplNo}"><input type="button" value="삭제"/></a>
		</c:if>
		<a href="/employment/list"><input type="button" value="목록"/></a>
	</form>
</body>
</html>