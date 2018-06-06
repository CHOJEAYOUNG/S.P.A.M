<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String power = "";
power = (String)session.getAttribute("power");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>취업 점수 목록 조회</title>
</head>
<script type="text/javascript">
function checkNull() {
	var name = document.getElementById('name').value;
	var info = document.getElementById('info').value;
	
	if(!name) {
		alert("유형명을 입력해주세요.");
		return false;
	}
	if(!info) {
		alert("상세 내용을 입력해주세요.");
		return false;
	}
	return true;
}
</script>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<c:if test="${sessionScope.isLogin}"> 
		      <div style="text-align: right;">
		         <%@ include file="/WEB-INF/jsp/menubar.jsp" %>
		      </div>
		 </c:if>
	</head>
	<body class="left-sidebar">

		<!-- Header -->
			<div id="header">
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="/main" id="logo">S.P.A.M</a></h1>
					
					<!-- Nav -->
						<%@ include file="/WEB-INF/jsp/navbar.jsp" %>

				</div>
			</div>

		<!-- Main -->
			<div id="main" class="wrapper style1">
				<div class="container">
					<div class="row">
					
						<!-- Sidebar -->
						<div id="sidebar" class="4u sidebar">
							<section>
								<header class="major">
									<h2>목록</h2>
								</header>
								<div class="row half">
									<section class="8u">
										<ul class="default">
											<li><a href="/graduation/list">졸업 점수</a></li>
											<c:if test="${power eq 'A' }">
												<li><a href="/graduationCategory/list">졸업 카테고리</a></li>
												<li><a href="/graduationType/list">졸업 유형</a></li>
											</c:if>
										</ul>
									</section>
								</div>
							</section>
						</div>
						
						<!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header class="major">
								<form action="/graduationCategory/edit" method="POST">
									<input type="hidden" name="no" value="${category.no}">
									카테고리 명 <input type="text" id="name" name="name" value="${category.name}"/> <span style="color:red">${checkName}</span> <br>
									유  형  <select name="grTypeNo">
											<c:forEach items="${listType}" var="type"  varStatus="status">
												<option value="${type.no}">${type.name}</option>
											</c:forEach>
										 </select> <br>
									
									<c:if test="${category.conditionSqeNo eq 1}">
										조  건	<input type="radio"	name="conditionSqeNo" value="1" checked="checked"> 필수
										    <input type="radio"	name="conditionSqeNo" value="2"> 선택
									</c:if>			
									<c:if test="${category.conditionSqeNo eq 2}">
										조  건	<input type="radio"	name="conditionSqeNo" value="1"> 필수
											<input type="radio"	name="conditionSqeNo" value="2" checked="checked"> 선택
									</c:if>	<br>
									
									상세정보 <br>
									<textarea rows="3" cols="50" id="info" name="info">${category.info}</textarea> <br>
									
									<div style="text-align: right;">
										<input type="submit" value="수정" onclick="return checkNull()"/>
										<a href="/graduationCategory/view/${category.no}"><input type="button" value="취소"/></a>
									</div>
								</form>
								</header>
							</section>
						</div>
					
					</div>
				</div>
			</div>

		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			
	</body>
</html>