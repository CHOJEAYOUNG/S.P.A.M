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
	<c:if test="${sessionScope.isLogin}"> 
      <div style="text-align: right;">
         <%@ include file="../jsp/menubar.jsp" %>
      </div>
   </c:if>
			<div id="header">
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="/main" id="logo">S.P.A.M</a></h1>
						 
					<!-- Nav -->
						<%@ include file="../jsp/navbar.jsp" %>
						
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
		<%@ include file="../jsp/footer.jsp" %>
		
	</body>
</html>