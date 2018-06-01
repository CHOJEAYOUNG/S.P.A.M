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
										<li><a href="/spamUser/listAdd">일괄 등록</a></li>
										<li><a href="/spamUser/oneAddS">학생 개별 등록</a></li>
										<li><a href="/spamUser/oneAddP">교수 개별 등록</a></li>
									</ul>
								</section>
							</div>
						</section>
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
					</div>

					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<header class="major">
								<h2>학생 일괄 등록</h2>
							</header>
							<form action="/spamUser/listAdd" method="post" enctype="multipart/form-data">
								<div style="text-align: center; padding-top: 15%;">
									<table border="1" width="300" align="center" height="250">
										<tr>
											<td>취업 유형</td>
											<td>
												<select name="empNo">
													<c:forEach items="${ listEmp }" var="employmentType" varStatus="status">
														<option value="${ employmentType.no }">${ employmentType.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td>졸업 유형</td>
											<td>
												<select name="grNo">
													<c:forEach items="${ listGr }" var="grType" varStatus="status">
														<option value="${ grType.no }">${ grType.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td>파일 업로드</td>
											<td>
												<input type="file" name="uploadfile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />
											</td>
										</tr>
										</table>
									<input type="submit" value="일괄등록" />
								</div>
							</form>
					</section>
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