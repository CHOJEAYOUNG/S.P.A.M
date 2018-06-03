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

function openWindow() {
	window.open(
		"select", 
		"open the window",
		"toolbar=no, width=500, height=500, top=150, left=150");
}

function openWindowS() {
	var myForm = document.S;
	 var url = "/employment/selectEmployment";
	 window.open("" ,"selectEmployment", 
	       "toolbar=no, width=540, height=467, directories=no, status=no,    scrollorbars=no, resizable=no"); 
	 myForm.action =url; 
	 myForm.method="post";
	 myForm.target="selectEmployment";
	 myForm.testVal = 'test';
	myForm.submit();
}

function checkNull() {
	var id = document.getElementById('id').value;
	
	if(!id) {
		alert("학번을 입력해주세요.");
		return false;
	}
	return true;
}
function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>학과 업무 관리 시스템</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<script src="/js/jquery.min.js"></script>
		<script src="/js/jquery.dropotron.min.js"></script>
		<script src="/js/skel.min.js"></script>
		<script src="/js/skel-layers.min.js"></script>
		<script src="/js/init.js"></script>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/skel.css" />
    	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
	</head>
	<body class="left-sidebar">

		<!-- Header -->
			<div id="header">
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="#" id="logo">Untitled</a></h1>
					
					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li>
									<a href="">Dropdown</a>
									<ul>
										<li><a href="#">Lorem ipsum dolor</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
										<li>
											<a href="">Phasellus consequat</a>
											<ul>
												<li><a href="#">Lorem ipsum dolor</a></li>
												<li><a href="#">Phasellus consequat</a></li>
												<li><a href="#">Magna phasellus</a></li>
												<li><a href="#">Etiam dolore nisl</a></li>
												<li><a href="#">Veroeros feugiat</a></li>
											</ul>
										</li>
										<li><a href="#">Veroeros feugiat</a></li>
									</ul>
								</li>
								<li><a href="/employment/list">취업 점수</a></li>
								<li><a href="/graduation/list">졸업 기준</a></li>
								<li><a href="no-sidebar.html">No Sidebar</a></li>
							</ul>
						</nav>

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
									<h2>취업 점수</h2>
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
									<form action="/employment/list" method="get">
										<c:if test="${power ne 'S' }">
											검색 <input type="text" name="id" id="id" style=width:200px; placeholder="학번" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/>
											<input type="submit"value="검색" style="text-align:center;" onclick="return checkNull()"/>
											<a href="/employment/list"><input type="button" value="새로고침"></a>
											<br>
										</c:if>
										<br><br><br>
										<table style="width:100%; text-align: center;" border="1">
											<thead>
												<c:if test="${ !empty listEmp}">
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>점수</th>
														<th>조건</th>
														<th>등록일</th>
														<th>승인여부</th>
														<th>상세보기</th>
													</tr>
													<c:forEach items="${ listEmp }" var="employment" varStatus="status">
														<tr>
															<td style="text-align: center;">
																<c:out value="${status.count}"/>
															</td>
															<c:if test="${ employment.empcNo ne 0}">
																<c:forEach items="${ listCategory }" var="category" varStatus="status">
																	<c:if test="${ employment.empcNo eq category.no}">
																		<td style="text-align: center;">
																			<c:out value="${category.name}"/>
																		</td>
																		<td style="text-align: center;">
																			<c:out value="${category.score}"/>
																		</td>
																		<td style="text-align: center;">
																			<c:if test="${ category.conditionSqeNo eq 1}">
																				<c:out value="필수"/>										
																			</c:if>
																			<c:if test="${ category.conditionSqeNo eq 2}">
																				<c:out value="선택"/>										
																			</c:if>
																		</td>
																	</c:if>
																</c:forEach>				
																<td style="text-align: center;">
																	<c:out value="${ employment.registration }"/>
																</td>
																<td style="text-align: center;">
																	<c:if test="${ employment.assentNo eq 1}">
																		<span style="color:blue">승인</span>
																	</c:if>
																	<c:if test="${ employment.assentNo eq 2}">
																		<span style="color:green">대기</span>
																	</c:if>
																	<c:if test="${ employment.assentNo eq 3}">
																		<span style="color:red">거절</span>
																	</c:if>
																</td>
																<td style="text-align: center;">
																	<a href="<c:url value="/employment/view/${employment.emplNo}"/>">
																		<input type="button" value="상세보기"> 
																	</a>
																</td>
															</c:if>
															<c:if test="${ employment.empcNo eq 0}">
																<c:forEach items="${ listAttendance }" var="attendance" varStatus="status">
																	<c:if test="${ employment.attendanceNo eq attendance.attendanceNo}">
																		<td style="text-align: center;">
																			<c:out value="${attendance.title}"/>
																		</td>
																		<td style="text-align: center;">
																			<c:out value="${attendance.score}"/>
																		</td>
																		<td style="text-align: center;">
																				<c:out value="비교과"/>										
																		</td>
																	</c:if>
																</c:forEach>				
																<td style="text-align: center;">
																	<c:out value="${ employment.registration }"/>
																</td>
																<td style="text-align: center;">
																	<c:if test="${ employment.assentNo eq 1}">
																		<span style="color:blue">승인</span>
																	</c:if>
																	<c:if test="${ employment.assentNo eq 2}">
																		<span style="color:green">대기</span>
																	</c:if>
																	<c:if test="${ employment.assentNo eq 3}">
																		<span style="color:red">거절</span>
																	</c:if>
																</td>
																<td style="text-align: center;">
																	<a href="<c:url value="/employment/view/${employment.emplNo}"/>">
																		<input type="button" value="상세보기"> 
																	</a>
																</td>
															</c:if>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${empty listEmp}">
													<tr>
														<td style="text-align: center;" colspan="7">
															학생을 검색해주세요.
														</td>
													</tr>
												</c:if>
											</thead>
										</table>
										<br><br><br>
										<c:if test="${power ne 'S' }">
											<div style="text-align: right; padding-top: 10px;">
												<a href="javascript:openWindow()"><input type="button" value="등록"/></a>
											</div>
										</c:if>
									</form>
									<c:if test="${power eq 'S' }">
										<form action="/employment/selectEmployment" method="post" name="S">
											<a href="javascript:openWindowS()"><input type="button" value="등록"/></a>
										</form>
									</c:if>
								</header>
							</section>
						</div>
					</div>
				</div>
			</div>

		<!-- Footer -->
			<div id="footer">
				<div class="container">

					<!-- Lists -->
						<div class="row">
							<div class="8u">
								<section>
									<header class="major">
										<h2>Donec dictum metus</h2>
										<span class="byline">Quisque semper augue mattis wisi maecenas ligula</span>
									</header>
									<div class="row">
										<section class="6u">
											<ul class="default">
												<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
												<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
												<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
												<li><a href="#">Cras vitae metus aliquam  pharetra.</a></li>
											</ul>
										</section>
										<section class="6u">
											<ul class="default">
												<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
												<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
												<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
												<li><a href="#">Cras vitae metus aliquam  pharetra.</a></li>
											</ul>
										</section>
									</div>
								</section>
							</div>
							<div class="4u">
								<section>
									<header class="major">
										<h2>Donec dictum metus</h2>
										<span class="byline">Mattis wisi maecenas ligula</span>
									</header>
									<ul class="contact">
										<li>
											<span class="address">Address</span>
											<span>1234 Somewhere Road #4285 <br />Nashville, TN 00000</span>
										</li>
										<li>
											<span class="mail">Mail</span>
											<span><a href="#">someone@untitled.tld</a></span>
										</li>
										<li>
											<span class="phone">Phone</span>
											<span>(000) 000-0000</span>
										</li>
									</ul>	
								</section>
							</div>
						</div>
					<!-- Copyright -->
						<div class="copyright">
							Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
						</div>
				</div>
			</div>
	</body>
</html>