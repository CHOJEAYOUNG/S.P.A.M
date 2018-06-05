<%@page import="com.spam.domain.Attendance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>SPAM 비교과 출석 상세 조회</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/skel.css" />
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
		
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body class="left-sidebar">
		<form action="/attendance/view" method="post">
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
									<h2>비교과 출석</h2>
								</header>
								<ul class="default">
									<li><a href="/attendance/upload">비교과 출석 등록</a></li>
									<li><a href="/attendance/list">비교과 출석 목록 조회</a></li>
								</ul>
							</section>
							<section>
								<header class="major">
									<h2>검색</h2>
								</header>
								<select name="select">
								   	   <option value="title">비교과제목</option>
								       <option value="location">위치</option>
								       <option value="score">점수</option>
								</select>
								<input type="text" name="search" />
         						
							</section>
						</div>
						
						<!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header class="major">
									<h2>비교과 출석 상세 조회</h2><br>
								      <table style="margin-left:15%;" >
								      	<thead>
								    	  <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">제목</font>
							                  </th>
							                  <td>
							                  	<c:out value = "${attendance.title}"/>
							                  </td>
							              </tr>
							              <tr>
							                  <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">취업점수</font>
							                  </th>
							                  <td>
							                  	<c:out value = " ${attendance.score}"/> <br> 
											  </td>
							              </tr>
							              <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">등록한 날짜</font>
							                  </th>
							                  <td>
							                  	<c:out value = " ${attendance.registrationDate}"/><br>
							                  </td>
							              </tr>
							              <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">강의 날짜</font>
							                  </th>
							                  <td>
							                  	<c:out value = " ${attendance.lectureDate}"/><br>
							                  </td>
							              </tr>
							              <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">강의 시간</font>
							                  </th>
							                  <td>
												 <c:out value = " ${attendance.lectureTime}"/><br>
							                  </td>
							              </tr>
							              <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">강의 장소</font>
							                  </th>
							                  <td>
							                  	<c:out value = " ${attendance.location}"/><br>
	
											  </td>
							              </tr>
							              <tr>
							                  <th style="width: 140px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">업로드한 파일</font>
							                  </th>
							                  <td>
							                  	<a href="<c:out value = "/attendance/fileU/${attendance.uploadFileNameWithS}"/>">
													${attendance.uploadFileName}
												</a> 
											 </td>
							              </tr>
							               <tr>
							                  <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">정보 추가된 파일</font>
							                  </th>
							                  <td>
							                  	<a href="<c:out value = "/attendance/fileM/${attendance.makedFileNameWithS}"/>">
													 ${attendance.makedFileName}
												</a>
											 </td>
							              </tr>
							             </thead>
							        
							        </table>
										<a href="/attendance/list">
											<input type="button" value="목록조회" style="margin-left:40%;"/> 
										</a>
										 
								        <a href="<c:url value="/attendance/remove/${attendance.attendanceNo}" />">
								             <input type="button" value="삭제"> 
								        </a>

										<br><br>
									<table>
										<thead>
								    	  <tr bgcolor="#4C4639">
								    	  	  <th style="width: 35px; text-align: center;">
							                  	<font color="#FFFFFF">번호</font></th>
							                  <th style="width: 35px; text-align: center;">
							                  	<font color="#FFFFFF">학번</font></th>
							                  <th style="width: 120px; text-align: center;">
							                  	<font color="#FFFFFF" >이름</font></th>
							                  <th style="width: 110px; text-align: center;">
							                  	<font color="#FFFFFF">학과</font></th>
							                  <th style="width: 40px; text-align: center;">
							                  	<font color="#FFFFFF">학년</font></th>
							                  <th style="width: 110px; text-align: center;">
							                  	<font color="#FFFFFF">전화번호</font></th>
							                  
							               </tr>
							               <c:if test="${!empty listStudent}">
												<c:forEach items = "${ listStudent}" var="spamUser" varStatus = "status">
													<tr>
														<td style="text-align: center;">
															<c:out value = "${status.count}"/>
														</td>
														<td style="text-align: center;">
															<c:out value = "${spamUser.id}"/>
														</td>
														<td style="text-align: center;">
															<c:out value = "${spamUser.name}"/>
														</td>
														<td style="text-align: center;">
															<c:out value = "${spamUser.major}"/>
														</td>
														<td style="text-align: center;">
															<c:out value = "${spamUser.grade}"/>
														</td>
														<td style="text-align: center;">
															<c:out value = "${spamUser.phoneNo}"/>
														</td>
													</tr>
												</c:forEach>
											</c:if>
								            
								         </thead>
									</table>
								</header>
							</section>
						</div>
					</div>
				</div>
			</div>
			</form>
			<!-- Footer -->
			<div id="footer">
					<!-- Copyright -->
					<div class="copyright">
						Tel: 041-530-2212 (선문대학교 컴퓨터공학과 과사무실)
					</div>
			</div>
	</body>
</html>


