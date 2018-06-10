<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE HTML>

<html>
	<head>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 	<link rel="stylesheet" href="/resources/demos/style.css">
	  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">
		
		function formOnClick() {
			formData = document.getElementById("form");
		    var title = document.getElementById('title').value;
		    var score = document.getElementById('score').value;
		    var lectureDate = document.getElementById('lectureDate').value;
		  
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
		    
		 var date = formData.elements['lectureDate'].value;
		 var split = date.split('/');
		 var temp = split[2] + "-" + split[0] + "-" + split[1];
		 formData.elements['lectureDate'].value = temp;
		      
		 formData.submit();
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
		
		$( function() {
	          $( "#lectureDate" ).datepicker();
	    } );
		</script>
         <c:if test="${sessionScope.isLogin}"> 
		      <div style="text-align: right;">
		         <%@ include file="/WEB-INF/jsp/menubar.jsp" %>
		      </div>
		 </c:if>
	</head>
	<body class="left-sidebar">
		<form action="/attendance/upload" id = "form" method="post" enctype="multipart/form-data">
		
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
								<section class="6u">
									<ul class="default">
										<c:if test = "${sessionScope.power eq 'A' }" > 
											<li><a href="/employment/list">취업 점수</a></li>
											<li><a href="/employmentCategory/list">취업 카테고리</a></li>
											<li><a href="/employmentType/list">취업 유형</a></li>
											<li><a href="/attendance/upload">비교과 출석 등록</a></li>
											<li><a href="/attendance/list">비교과 출석 목록 조회</a></li>
										</c:if>
										<c:if test = "${sessionScope.power eq 'S' }" > 
											<li><a href="/employment/list">취업 점수</a></li>
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
							                  
										
							                  <td>
												 <input type="text" name="lectureDate" id="lectureDate" style="width:50%; border: 2;"> <br> 
							                  </td>
							              </tr>
							              <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">강의 시간</font>
							                  </th>
							                  <td>
							                  
							                  <select id="lectureTime_hour" name="lectureTime_hour" style="width:24%; border: 2;">
                                       <option value=" " selected disabled hidden>==시간==</option>
                                       <option value="01">1</option>
                                       <option value="02">2</option>
                                       <option value="03">3</option>
                                       <option value="04">4</option>
                                       <option value="05">5</option>
                                       <option value="06">6</option>
                                       <option value="07">7</option>
                                       <option value="08">8</option>
                                       <option value="09">9</option>
                                       <option value="10">10</option>
                                       <option value="11">11</option>
                                       <option value="12">12</option>
                                    </select>
                                    :
                                    <select id="lectureTime_min" name="lectureTime_min" style="width:24%; border: 2;">
                                       <option value=" " selected disabled hidden>==분==</option>
                                     
                                       <option value="00">00</option>
                                       <option value="05">05</option>
                                       <option value="10">10</option>
                                       <option value="15">15</option>
                                       <option value="20">20</option>
                                       <option value="25">25</option>
                                       <option value="30">30</option>
                                       <option value="35">35</option>
                                       <option value="40">40</option>
                                       <option value="45">45</option>
                                       <option value="50">50</option>
                                       <option value="55">55</option>
                                       
                                    </select>
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
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			
	</body>
</html>