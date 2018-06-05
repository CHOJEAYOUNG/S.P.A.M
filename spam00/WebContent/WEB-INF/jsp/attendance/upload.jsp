<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE HTML>



<html>
	<head>
		<%-- <%@ include file="/WEB-INF/jsp/layout/header.jsp" %> --%>
<script type="text/javascript">
	
	function formOnClick() {
	   
	    var title = document.getElementById('title').value;
	    var score = document.getElementById('score').value;
	    var lectureDate = document.getElementById('lectureDate').value;
	    var lectureTime = document.getElementById('lectureTime').value;
	    var location = document.getElementById("location").value
	    var uploadfile = document.getElementById("uploadfile").value
	   
	    if (!title) {
	       alert("비교과 제목을 입력하지 않았습니다!");
	       return;
	    }
	    if (!score) {
	       alert("취업점수를 입력하지 않았습니다!");
	       return;
	    }
	    if (!lectureDate) {
	       alert("강의 날짜를 입력하지 않았습니다!");
	       return;
	    }
	    if (!lectureTime) {
	       alert("강의 시간을 입력하지 않았습니다!");
	       return;
	    }
	    if (!location) {
	       alert("강의 위치를 입력하지 않았습니다!");
	       return;
	    }
	    if (!uploadfile) {
	       alert("파일을 업로드 하지 않았습니다!");
	       return;
	    }
	    
	    var special = "{}[]()<>?_|~`!@#$%^&*-+\"'\\/"
	
	    for (var i = 0; i < score.length; i++) {
	       if (-1 != special.indexOf(score.charAt(i))) {
	          alert("취업점수에 특수문자는 입력 할 수 없습니다.");
	          return;
	       }
	 }
	    document.getElementById("form").submit(); 
	    return;
	}
	    
	 //숫자만 입력(한영키 못막음)
	 function showKeyCode(event) {
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 )
	    {
	       return;
	    }
	    else
	    {
	       return false;
	    }
	 }
	 //한글 방지(한글 입력시 사라짐)
	 function removeChar(event) {
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	       return;
	    else
	       event.target.value = event.target.value.replace(/[^0-9]/g, "");
	 }
	
	
	function excelCheck() {
		var excelName = document.getElementById("uploadfile").files[0].name;
		
		var excelNameSplit = excelName.split(".").reverse();
		
		if (excelNameSplit[0].toLowerCase() != "xlsx") {
			alert("확장자 .xlsx인 엑셀 파일만 업로드 가능합니다.");
			document.getElementById("uploadfile").value = "";
		} else {
		}
	}
	
</script>

		<title>SPAM 비교과 출석 등록</title>
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
		<form action="/attendance/upload" id = "form" method="post" enctype="multipart/form-data">
		
		<!-- Header -->
			<div id="header">
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="#" id="logo">S.P.A.M</a></h1>
					
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
         						<!-- 전송 버튼 생성 필요 -->
							</section>
						</div>
						
						<!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header class="major">
									<h2>비교과 출석 등록</h2><br>
								      <table style="margin-left:15%;" >
								      	<thead>
								    	  <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">제목</font>
							                  </th>
							                  <td>
												 <input type="text" name="title" id="title" size="10" style="width:50%; border: 2;">
							                  </td>
							              </tr>
							              <tr>
							                  <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">취업점수</font>
							                  </th>
							                  <td>
							                  	<input type="text" name="score" id="score" max="100" size="10" style="width:50%; border: 2; ime-mode:disabled;" onkeydown="return showKeyCode(event)" onkeyup='removeChar(event)'> 
											  </td>
							              </tr>
							              <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">강의 날짜</font>
							                  </th>
							                  <%
													Date date = new Date();
													SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
													String strdate = simpleDateFormat.format(date);
												%>
										
							                  <td>
												 <input type="date" name="lectureDate" id="lectureDate" max=<%= strdate%> style="width:50%; border: 2;"> <br> 
							                  </td>
							              </tr>
							              <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">강의 시간</font>
							                  </th>
							                  <td>
												 <input type="time" name="lectureTime" id="lectureTime" size="10" style="width:50%; border: 2;"> <br> 
							                  </td>
							              </tr>
							              <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">강의 장소</font>
							                  </th>
							                  <td>
												<input type="text" name="location" id="location" size="10" style="width:50%; border: 2;"> 
							                  </td>
							              </tr>
							              <tr>
							                  <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">파일 업로드</font>
							                  </th>
							                  <td>
							                  	<input type="file" name="uploadfile" id = "uploadfile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" size="10"  onchange="excelCheck()" style="width:50%; border: 2;"> 
												</td>
							              </tr>
							             </thead>
							         </table>
							        
										<a href="/attendance/list"> 
											<input type="button" value="목록" style="margin-left:40%;"/> 
										</a>	
										<input type="button" value="등록" onclick="formOnClick()" />
									
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