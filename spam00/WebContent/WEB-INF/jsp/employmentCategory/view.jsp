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
											<li><a href="/employment/list">취업 점수</a></li>
											<c:if test="${power eq 'A' }">
												<li><a href="/employmentCategory/list">취업 카테고리</a></li>
												<li><a href="/employmentType/list">취업 유형</a></li>
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
									<form action="/employmentCategory/add" method="POST">
										<input type="hidden" name="no" value="${category.no}">
										카테고리 명 <input type="text" name="name" value="${category.name}" style="width:300px; background-color: #e2e2e2;"readonly="readonly"/> <br>
										유  형 <input type="text" name="empTypeNo" value="${typeName}" style="width:50px; background-color: #e2e2e2;"readonly="readonly"/> <br>
										<c:if test="${category.conditionSqeNo eq 1}">
											조  건	<input type="text"	name="conditionSqeNo" value="필수" style="width:300px; background-color: #e2e2e2;"readonly="readonly">
										</c:if>			
										<c:if test="${category.conditionSqeNo eq 2}">
											조  건	<input type="text"	name="conditionSqeNo" value="선택" style="width:300px; background-color: #e2e2e2;"readonly="readonly">
										</c:if>	<br>
										점  수 <input type="text" name="score" value="${category.score}" style="width:300px; background-color: #e2e2e2;"readonly="readonly"/> <br>
										
										상세정보 <br>
										<textarea rows="3" cols="50" name="info" style="background-color: #e2e2e2;" readonly="readonly">${category.info}</textarea> <br>
										
										<div>
											<a href="/employmentCategory/remove/${no}"><input type="button" value="삭제"/></a>
											<a href="/employmentCategory/edit/${no}"><input type="button" value="수정"/></a>
											<a href="/employmentCategory/list"><input type="button" value="목록"/></a>
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