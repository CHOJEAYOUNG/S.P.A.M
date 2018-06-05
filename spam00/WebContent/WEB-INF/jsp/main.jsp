<%@page import="com.spam.domain.Attendance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>S.P.A.M </title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />

		<script src="/js/jquery.min.js"></script>
		<script src="/js/jquery.dropotron.min.js" ></script>
		<script src="/js/skel.min.js" ></script>
		<script src="/js/skel-layers.min.js" ></script>
		<script src="/js/init.js" ></script>
	
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/skel.css" />
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
		
	</head>
	<body class="homepage">

			<div id="header">
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="#" id="logo">S.P.A.M</a></h1>
					
					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li>
									<h1><a href="">상담</a></h1>
									<ul>
										<li><a href="#">상담 예약</a></li>
										<li><a href="#">상담 예약 조회</a></li>
							<!-- 	<li><a href="#">Etiam dolore nisl</a></li>
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
										<li><a href="#">Veroeros feugiat</a></li>  -->
									</ul>
								</li>
								<li><h1><a href="">취업 점수</a></h1></li>
								<li><h1><a href="">졸업 점수</a></h1></li>
								<li>
									<h1><a href="">내 정보</a></h1>
									<ul>
										<li><a href="#">정보 조회</a></li>
										<li><a href="#">정보 수정</a></li>
									</ul>
								</li>
							</ul>
						</nav>

					<!-- Banner -->
						<div id="banner">
							<div class="container">
								<section>
									<header class="major">
										<h2>"Hello World!"</h2>
										<span class="byline" style="">해당페이지는 선문대학교 컴퓨터공학과 사용자간의 원활한 의사소통을 위해  만들었습니다.<br>학과에 관한 공지사항은  &ndash; <a href="http://cs.sunmoon.ac.kr/">선문대학교 컴퓨터공학과 홈페이지</a> &ndash; 를 참고하여 주시길 바랍니다.</span>
									</header>
									<c:if test = "${sessionScope.isLogin}" >  
										<a href="/logout" class="loginbtn alt">로 그 아 웃</a> 
									</c:if>
									<c:if test = "${!sessionScope.isLogin}" >
										<a href="/login" class="loginbtn alt">로 그 인</a>
									</c:if> 
									
								</section>			
							</div>
						</div>
				</div>
			</div>

		<!-- Footer -->
			<div id="footer">
					<!-- Copyright -->
					<div class="copyright">
						Tel: 041-530-2212 (선문대학교 컴퓨터공학과 과사무실)
					</div>
			</div>
	</body>
</html>