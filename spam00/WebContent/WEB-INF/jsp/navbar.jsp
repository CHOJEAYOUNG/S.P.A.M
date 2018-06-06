<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>목차</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="/css/ie/html5shiv.js"></script><![endif]-->
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/skel.min.js"></script>
<script src="/js/skel-layers.min.js"></script>
<script src="/js/init.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/skel.css" />
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
</head>
<body class="homepage">
				<c:if test="${sessionScope.power eq 'A'}">
					<nav id="nav">
							<ul>
								<li>
									<h1><a href="">-조교-상담</a></h1>
									<ul>
										<li><a href="">상담 예약 조회</a></li>
										<li><a href="">교수님 시간표 등록</a></li>
									</ul>
								</li>
								<li><h1><a href="">취업 점수</a></h1>
									<ul>
										<li><a href="/employment/list">취업 점수</a></li>
										<li><a href="/employmentCategory/list">취업 카테고리</a></li>
										<li><a href="/employmentType/list">취업 유형</a></li>
										<li><a href="">비교과 출석</a>
											<ul>
												<li><a href="/attendance/upload">등록</a></li>
												<li><a href="/attendance/list">목록 조회</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li><h1><a href="">졸업 점수</a></h1>
									<ul>
										<li><a href="/graduation/list">졸업 점수</a></li>
										<li><a href="/graduationCategory/list">졸업 카테고리</a></li>
										<li><a href="/graduationType/list">졸업 유형</a></li>
									</ul>
								</li>
								<li>
									<h1><a href="">사용자 정보</a></h1>
									<ul>
										<li><a href="">등록</a>
											<ul>
												<li><a href="/spamUser/listAdd">학생 일괄 등록</a></li>
												<li><a href="/spamUser/oneAddP">학생 개별 등록</a></li>
												<li><a href="/spamUser/oneAddP">교수 개별 등록</a></li>
											</ul>
										</li>
										<li><a href="/spamUser/list">학생 목록 조회</a></li>
										<li><a href="">시간표 관리</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					</c:if>
					<c:if test="${sessionScope.power eq 'S'}">
					<nav id="nav">
							<ul>
								<li>
									<h1><a href="">-학생-상담</a></h1>
									<ul>
										<li><a href="">상담 예약</a></li>
										<li><a href="">상담 예약 조회</a></li>
									</ul>
								</li>
								<li><h1><a href="">취업 점수</a></h1></li>
								<li><h1><a href="">졸업 점수</a></h1></li>
								<li><h1><a href="/spamUser/viewPA/${spamuser.id}">내 정보</a></h1></li>
							</ul>
						</nav>
					</c:if>
					<c:if test="${sessionScope.power eq 'P'}">
					<nav id="nav">
							<ul>
								<li>
									<h1><a href="">-교수-상담</a></h1>
									<ul>
										<li><a href=""></a></li>
										<li><a href="">상담 예약 조회</a></li>
									</ul>
								</li>
								<li>
									<h1><a href="">사용자 정보</a></h1>
									<ul>
										<li><a href="">학생 조회</a></li>
										<li><a href="/spamUser/viewPA/${sessionScope.id}">내 정보 조회</a></li>
										<li><a href="">일정표</a>
											<ul>
												<li><a href="">등록</a></li>
												<li><a href="">수정</a></li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
						</nav>
					</c:if>
</body>
</html>