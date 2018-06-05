<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function checkRadio() {
	var radio = document.getElementsByName('id');
	var id = null;
	for(var i = 0 ; i < radio.length; i++) {
		if(radio[i].checked == true) {
			id = radio[i].value;
		}
	}
	if(id == null) {
		alert("학생을 선택하세요");
		return false;
	} else {
		return true;
	}
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>학과 업무 관리 시스템</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<script src="/js/jquery.min.js"></script>
		<script src="/js/jquery.dropotron.min.js"></script>
		<script src="/js/skel.min.js"></script>
		<script src="/js/skel-layers.min.js"></script>
		<script src="/js/init.js"></script>
    	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
	</head>
	<body  id="main" class="wrapper style1">
		<h2>학생을 선택하세요.</h2>
		<form action="/graduation/search" method="get">
			검 색 <input type="text" name="search" style="width: 150px;"/>
				<select name="select">
					<option value="id">학번</option>
					<option value="name">이름</option>
				</select>
		</form>
		<form action="/graduation/selectGraduation" method="post">
		
		<table style="width:100%" border="1">
				<thead>
					<tr>
						<th>선택</th>
						<th>학번</th>
						<th>이름</th>
						<th>학년</th>
					</tr>
					<c:if test="${ !empty listSpam}">
						<c:forEach items="${ listSpam }" var="spamUser" varStatus="status">
							<c:if test="${ spamUser.power eq 'S'}">	
								<tr>
									<td style="text-align: center;">
										<input type="radio" id="id" name="id" value="${ spamUser.id }"> 
									</td>
									<td style="text-align: center;">
										<c:out value="${ spamUser.id }"/>
									</td>
									<td style="text-align: center;">
										<c:out value="${ spamUser.name }"/>
									</td>
									<td style="text-align: center;">
										<c:out value="${ spamUser.grade }"/>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${empty listSpam}">
						<tr>
							<td style="text-align: center;" colspan="7">
								목록이 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
				</thead>
			</table>
			<br>
			<div style="text-align: right;">
				<input type="submit" value="다음" onclick="return checkRadio()"/>
			</div>
		</form>
	</body>
</html>