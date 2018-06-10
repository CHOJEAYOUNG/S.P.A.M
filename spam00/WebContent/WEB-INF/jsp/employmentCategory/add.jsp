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
function checkNull() {
	var name = document.getElementById('name').value;
	var score = document.getElementById('score').value;
	var info = document.getElementById('info').value;
	
	if(!name) {
		alert("유형명을 입력해주세요.");
		return false;
	}
	if(!score) {
		alert("점수를 입력해주세요.");
		return false;
	}
	if(!info) {
		alert("상세 내용을 입력해주세요.");
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

	<head>
		<c:if test="${sessionScope.isLogin}"> 
		      <div style="text-align: right;">
		         <%@ include file="/WEB-INF/jsp/menubar.jsp" %>
		      </div>
		 </c:if>
	</head>
	<body class="left-sidebar">

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
								<h2>취업 카테고리 등록</h2>
									<form action="/employmentCategory/add" method="POST">
										<table style="margin-left:15%;" >
											<thead>
												<tr>
													 <th style=" text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">카테고리 명</font>
								                 </th>
								                 <td>
								                 	<input type="text" id="name" name="name" style="width:300px;"/>${checkName}<br>
								                  </td>
												</tr>
												<tr>
													 <th style=" text-align: center; background-color:#4C4639">
								                  	<font color="#FFFFFF">유  형</font>
									                 </th>
									                 <td>
									                 	<select name="empTypeNo" style="width:50px;">
															<c:forEach items="${listType}" var="type"  varStatus="status">
																<option value="${type.no}">${type.name}</option>
															</c:forEach>
													 </select>
								                  </td>
												</tr>
												<tr>
													<th style=" text-align: center; background-color:#4C4639">
								                  	<font color="#FFFFFF">조  건</font>
									                </th>
									              	<td>
									              	   <input type="radio"	name="conditionSqeNo" value="1" checked="checked">필수
										 				<input type="radio"	name="conditionSqeNo" value="2">선택  <br>
								                  	</td>
												</tr>
												<tr>
													<th style=" text-align: center; background-color:#4C4639">
								                  	<font color="#FFFFFF">점  수</font>
									                </th>
									              	<td>
									        			<input type="text" id="score" name="score" style="width:300px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/> <br>
								                  	</td>
												</tr>
												<tr>
													<th style=" text-align: center; background-color:#4C4639">
								                  	<font color="#FFFFFF">상세정보</font>
									                </th>
									              	<th>
									        			<textarea rows="5" cols="3" id="info" name="info" style="width: 300px;"></textarea>
								                  	</th>
												</tr>
											</thead>
										</table>
										<div style="text-align: center;">
											<input type="submit" value="등록" onclick="return checkNull()"/>
											<a href="/employmentCategory/list"><input type="button" value="취소"/></a>
										</div>
									</form>
								</header>
							</section>
						</div>
					
					</div>
				</div>
			</div>

		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	</body>
</html>