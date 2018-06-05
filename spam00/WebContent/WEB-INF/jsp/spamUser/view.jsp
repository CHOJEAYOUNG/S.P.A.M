<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Left Sidebar - Horizons by TEMPLATED</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/skel.min.js"></script>
<script src="/js/skel-layers.min.js"></script>
<script src="/js/init.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/skel.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/style.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body class="left-sidebar">
	<form action="/spamUser/list" method="POST">
		<!-- Header -->
		<div id="header">
			<div class="container">
				<!-- Logo -->
				<h1>
					<a href="#" id="logo">Untitled</a>
				</h1>
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="">Dropdown</a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li><a href="#">Etiam dolore nisl</a></li>
								<li><a href="">Phasellus consequat</a>
									<ul>
										<li><a href="#">Lorem ipsum dolor</a></li>
										<li><a href="#">Phasellus consequat</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
										<li><a href="#">Veroeros feugiat</a></li>
									</ul></li>
								<li><a href="#">Veroeros feugiat</a></li>
							</ul></li>
						<li><a href="left-sidebar.html">Left Sidebar</a></li>
						<li><a href="right-sidebar.html">Right Sidebar</a></li>
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
								<h2>학생 정보</h2>
							</header>
							<div class="row half">
								<section class="6u">
									<ul class="default">
										<c:if test = "${sessionScope.power eq 'A' }" > 
											<li><a href="/spamUser/listAdd">일괄 등록</a></li>
											<li><a href="/spamUser/oneAddS">학생 개별 등록</a></li>
											<li><a href="/spamUser/oneAddP">교수 개별 등록</a></li>
											<li><a href="/spamUser/list">학생 목록</a></li>
										</c:if>
										<li><a href="/logout">로그 아웃</a></li>
									</ul>
								</section>
							</div>
						</section>
						<c:if test = "${sessionScope.power eq 'A' }" >
							<section>
								<header class="major">
									<h2>학생 검색</h2>
								</header>
									<ul class="default">
										<select name="select">
											<option value="1">학번</option>
											<option value="2">이름</option>
											<option value="3">신분</option>
										</select>
										<input type="text" name="search" />
										<input type="submit" value="검색" style="margin-left: 86%;" />
									</ul>
							</section>
						</c:if>
					</div>

					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<header class="major">
								<h2>학생 정보 보기</h2>
							</header>
							<div style="overflow:auto; width:102%; height:100%; padding-bottom:5%; ">
								<table style="width: 100%" border="1">
									<thead>
										<tr bgcolor="#4C4639" > 
											<th style="width: 150px; text-align: center;"><font color="#FFFFFF">아이디</font></th>
											<th style="width: 100px; text-align: center;"><font color="#FFFFFF">신분</font></th>
											<th style="width: 130px; text-align: center;"><font color="#FFFFFF">이름</font></th>
											<th style="width: 100px; text-align: center;"><font color="#FFFFFF">학년</font></th>
											<th style="width: 300px; text-align: center;"><font color="#FFFFFF">학과</font></th>
											<th style="width: 300px; text-align: center;"><font color="#FFFFFF">전화번호</font></th>
											<c:if test="${ spamuser.power eq 'S' }">
												<th style="width: 120px; text-align: center;"><font color="#FFFFFF">생년월일</font></th>
											</c:if>
											<c:if test="${ spamuser.power eq 'P' }">
												<th style="width: 150px; text-align: center;"><font color="#FFFFFF">사무실 위치</font></th>
											</c:if>
											<c:if test="${ spamuser.power eq 'S' }">
												<th style="width: 200px; text-align: center;"><font color="#FFFFFF">취업유형</font></th>
												<th style="width: 200px; text-align: center;"><font color="#FFFFFF">졸업유형</font></th>
											</c:if>
											<th style="width: 100px; text-align: center;"><font color="#FFFFFF">상태</font></th>
										</tr>
										<c:if test="${ !empty spamuser}">
											<tr>
												<td style="text-align: left; width: 150px; text-align: center;">
													<c:out value="${spamuser.id}"/>
												</td>
												<c:if test="${ spamuser.power eq 'A' }">
													<td style="text-align: left; width: 100px; text-align: center;">
														조교
													</td>
												</c:if>
												<c:if test="${ spamuser.power eq 'P' }">
													<td style="text-align: left; width: 100px; text-align: center;">
														교수
													</td>
												</c:if>
												<c:if test="${ spamuser.power eq 'S' }">
													<td style="text-align: left; width: 100px; text-align: center; ">
														학생
													</td>
												</c:if>
												<td style="text-align: left; width: 130px; text-align: center;">
													<c:out value="${ spamuser.name }"/>
												</td>
												<c:if test="${ spamuser.power eq 'S'}">
													<td style="text-align: left; width: 100px; text-align: center;">
														<c:out value="${ spamuser.grade }"/>
													</td>
												</c:if>
												<c:if test="${ !(spamuser.power eq 'S')}">
													<td style="text-align: left; width: 100px; text-align: center;">
														-
													</td>
												</c:if>
												<td style="text-align: left; width: 300px; text-align: center; " >
													<c:out value="${ spamuser.major }"/>
												</td>
												<td style="text-align: left; width: 300px; text-align: center;">
													<c:out value="${ spamuser.phoneNo }"/>
												</td>
												<c:if test="${ spamuser.power eq 'S' }">
													<td style="text-align: left; width: 100px; text-align: center;">
														<c:out value="${ spamuser.birthDate }"/>
													</td>
												</c:if>
												<c:if test="${ spamuser.power eq 'P' }">
													<td style="text-align: left; width: 100px; text-align: center;">
														<c:out value="${ spamuser.office }"/>
													</td>
												</c:if>
												<c:if test="${ spamuser.power eq 'S' }">
													<td style="text-align: left; width: 100px; text-align: center;">
														<c:out value="${ spamuser.empNo }"/>
													</td>
													<td style="text-align: left; width: 100px; text-align: center;">
														<c:out value="${ spamuser.grNo }"/>
													</td>
												</c:if>
												<c:forEach items="${ enrollment }" var="enrollment" varStatus="status">
													<c:if test="${enrollment.enrollmentNo eq spamuser.enrollment}">
														<td style="text-align: left; width: 100px; text-align: center;">
																<c:out value="${ enrollment.enrollmentContent }"/>
														</td>
													</c:if>
												</c:forEach>
											</tr>
										</c:if>
									</thead>
								</table>
								<c:if test="${ spamuser.power eq 'S' }">
									<div style="overflow:auto; width:100%; height:500px; padding-top:10%; ">
										<c:out value="${ spamuser.name }" />님의 취업 유형은 
										<c:forEach items="${ listEmpType }" var="empType" varStatus="status">
											<c:if test='${ spamuser.empNo eq empType.no}'>
												<c:out value="${empType.name}" />
											</c:if>
										</c:forEach>
										입니다.
										<table style="width: 100%" border="1">
											<thead>
												<tr bgcolor="#4C4639" >
													<th style="width: 100px;"><font color="#FFFFFF">번호</font></th>
													<th style="width: 100px;"><font color="#FFFFFF">제목</font></th>
													<th style="width: 100px;"><font color="#FFFFFF">점수</font></th>
													<th style="width: 100px;"><font color="#FFFFFF">등록일</font></th>
												</tr>
												<c:forEach items="${ listEmp }" var="employment" varStatus="status">
													<tr>
														<td style="text-align: center;">
															<c:out value="${status.count}"/>
														</td>
														<c:if test="${ !(employment.empcNo eq 0)}">
															<c:forEach items="${ empCategory }" var="category" varStatus="status">
																<c:if test="${ employment.empcNo eq category.no}">
																	<td style="text-align: center;">
																		<c:out value="${category.name}"/>
																	</td>
																	<td style="text-align: center;">
																		<c:out value="${category.score}"/>
																	</td>
																	<td style="text-align: center;">
																		<c:out value="${ employment.registration }"/>
																	</td>
																</c:if>
															</c:forEach>
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
																				<c:out value="${attendance.registrationDate}"/>										
																		</td>
																	</c:if>
															</c:forEach>
														</c:if>
													</tr>
											</c:forEach>
											</thead>
										</table>
									</div>
								</c:if>
								<c:if test="${ spamuser.power eq 'S' }">
									<div style="overflow:auto; width:100%; height:500px; padding-top:10%; ">
										<c:out value="${ spamuser.name }" />님의 졸업 유형은 
										<c:forEach items="${ listGrType }" var="listGrType" varStatus="status">
											<c:if test='${ spamuser.grNo eq listGrType.no}'>
												<c:out value="${listGrType.name}" />
											</c:if>
										</c:forEach>
										입니다.
										<table style="width: 100%" border="1">
											<thead>
												<tr bgcolor="#4C4639" >
													<th style="width: 100px;"><font color="#FFFFFF">번호</font></th>
													<th style="width: 100px;"><font color="#FFFFFF">제목</font></th>
													<th style="width: 100px;"><font color="#FFFFFF">등록일</font></th>
												</tr>
												<c:forEach items="${ listGr }" var="graduation" varStatus="status">
													<tr>
														<td style="text-align: center;">
															<c:out value="${status.count}"/>
														</td>
														<c:forEach items="${ grCategory }" var="category" varStatus="status">
															<td style="text-align: center;">
																<c:out value="${category.name}"/>
															</td>
														</c:forEach>			
														<td style="text-align: center;">
															<c:out value="${ graduation.registration }"/>
														</td>
													</tr>
											</c:forEach>
											</thead>
										</table>
									</div>
								</c:if>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<div id="footer">
			<!-- Copyright -->
			<div class="copyright">Tel: 041-530-2212 (선문대학교 컴퓨터공학과 과사무실)</div>
		</div>
	</form>
</body>
</html>