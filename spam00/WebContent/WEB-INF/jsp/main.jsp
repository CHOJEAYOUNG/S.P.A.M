<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SPAM 로그인</title>
</head>
<body>
	<div style="overflow:auto; width:100%; height:500px; padding-bottom:5%; ">
		<table style="width: 100%" border="1">
			<thead>
				<tr bgcolor="#4C4639" >
					<th style="width: 35px;"><font color="#FFFFFF">번호</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">아이디</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">신분</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">이름</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">생년월일</font></th>
				</tr>
				<c:if test="${ !empty listSpam}">
					<c:forEach items="${ listSpam }" var="spamUser" varStatus="status">
					<tr>
						<td style="text-align: left; width: 35px;">
							<c:out value="${ status.count }"/>
						</td>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamUser.spamId }"/>
						</td>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamUser.rank }"/>
						</td>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamUser.name }"/>
						</td>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamUser.birthDay }"/>
						</td>
					</tr>
					</c:forEach>
				</c:if>
			</thead>
		</table>
	</div>
	<c:if test="${ sessionScope.rank eq 'A' }">
		<font size="30">조교</font>
	</c:if>
	
	<c:if test="${ sessionScope.rank eq 'P' }">
		<font size="30">교수</font>
	</c:if>
	
	<c:if test="${ sessionScope.rank eq 'S' }">
		<font size="30">학생</font>
	</c:if>
</body>
</html>