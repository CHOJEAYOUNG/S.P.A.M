<%@page import="java.io.File"%>
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
<title>졸업 기준 상세 조회</title>
</head>
<body>
	<form action="/graduation/edit" method="post">
		<input type="hidden" name="grlNo" value="${graduation.grlNo}">
		학번<input type="text" name="id" value="${spamuser.id}" readOnly="readonly" />
		이름<input type="text" name="nameS" value="${spamuser.name}" readOnly="readonly" />
	 	취업 유형<input type="text" name="grNo" value="${spamuser.grNo}" readOnly="readonly" /> <br>
		제목<input type="text" name="nameC" value="${category.name} (${category.info})" readOnly="readonly" />
		등록일<input type="text" name="registration" value="${graduation.registration}" readOnly="readonly" />
		조건
		<c:if test="${category.conditionSqeNo eq 1}">
			<input type="text" name="conditionSqeNo" value="필수" readOnly="readonly" />
		</c:if>
		<c:if test="${category.conditionSqeNo eq 2}">
			<input type="text" name="conditionSqeNo" value="선택" readOnly="readonly" />
		</c:if> <br>
		파일명 <a href="<c:out value = "/graduation/download/${graduation.grlNo}"/>">${graduation.originalName}
		</a>다운로드 하는중<br>
		승인 여부
		<c:if test="${ graduation.assentNo eq 1}">
			<span style="color:blue">승인</span>
			${graduation.assentDate}
		</c:if>
		
		<c:if test="${ graduation.assentNo eq 2}">
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
		
		<c:if test="${ graduation.assentNo eq 3}">
			<span style="color:red">거절</span>
			${graduation.assentDate} <br>
			거절사유 <br>
			<textarea rows="1" cols="15" name="cause" readonly="readonly">${graduation.cause}</textarea> <br>
		</c:if> <br>
		<c:if test="${power eq 'S' && graduation.assentNo ne 1}">
			<a href="/graduation/remove/${graduation.grlNo}"><input type="button" value="삭제"/></a>
		</c:if>
		<a href="/graduation/list"><input type="button" value="목록"/></a>
	</form>
</body>
</html>