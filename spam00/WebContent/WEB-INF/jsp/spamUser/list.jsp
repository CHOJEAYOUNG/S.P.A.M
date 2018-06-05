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
							<div style="overflow: auto; width: 100%; height: 1000px;">
								<table style="width: 100%" border="1">
									<thead>
										<tr bgcolor="#4C4639">
											<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">번호</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">학번</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">이름</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">학년</font></th>
											<th style="width: 120px; text-align: center;"><font
												color="#FFFFFF">학과</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">신분</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">상태</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">보기</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">수정</font></th>
										</tr>
										<c:if test="${ !empty listSpam}">
											<c:forEach items="${ listSpam }" var="spamuser"
												varStatus="status">
												<tr>
													<td style="text-align: center; width: 35px;"><c:out
															value="${ status.count }" /></td>
													<td style="text-align: center; width: 100px;"><c:out
															value="${ spamuser.id }" /></td>
													<td style="text-align: center; width: 100px;"><c:out
															value="${ spamuser.name }" /></td>
													<c:if test="${ spamuser.power eq 'S'}">
														<td style="text-align: center; width: 100px;"><c:out
																value="${ spamuser.grade }" /></td>
													</c:if>
													<c:if test="${ !(spamuser.power eq 'S')}">
														<td style="text-align: center; width: 100px;">-</td>
													</c:if>
													<td style="text-align: center; width: 100px;"><c:out
															value="${ spamuser.major }" /></td>
													<c:if test="${ spamuser.power eq 'A' }">
														<td style="text-align: center; width: 100px;">조교</td>
													</c:if>
													<c:if test="${ spamuser.power eq 'P' }">
														<td style="text-align: center; width: 100px;">교수</td>
													</c:if>
													<c:if test="${ spamuser.power eq 'S' }">
														<td style="text-align: center; width: 100px;">학생</td>
													</c:if>
													<c:forEach items="${ enrollment }" var="enrollment"
														varStatus="status">
														<c:if
															test="${enrollment.enrollmentNo eq spamuser.enrollment}">
															<td style="text-align: center; width: 100px;"><c:out
																	value="${ enrollment.enrollmentContent }" /></td>
														</c:if>
													</c:forEach>
													<td style="text-align: center;"><a
														href="<c:url value="/spamUser/viewPA/${spamuser.id}" /> ">
															<input type="button" value="상세보기" />
													</a></td>
													<c:if test="${ !(spamuser.power eq 'P') }">
														<c:if test="${ sessionScope.power eq 'A' }">
															<td style="text-align: center;"><a
																href="<c:url value="/spamUser/edit/${spamuser.id}" /> ">
																	<input type="button" value="수정" />
															</a></td>
														</c:if>
														<c:if test="${ !(sessionScope.power eq 'A') }">
															<td>수정권한 없음</td>
														</c:if>
													</c:if>
													<c:if test="${ spamuser.power eq 'P' }">
														<td style="text-align: center;"><a
															href="<c:url value="/spamUser/edit/${spamuser.id}" /> ">
																<input type="button" value="수정" />
														</a></td>
													</c:if>
												</tr>
											</c:forEach>
										</c:if>
									</thead>
								</table>
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