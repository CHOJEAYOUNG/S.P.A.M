<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	int year, yearMin, yearMax;
	int yearResult, yearCount;
	int month;
	int date;
	List<String> yearList = new ArrayList<String>();
	Calendar now = Calendar.getInstance();
	year = now.get(Calendar.YEAR);
	month = now.get(Calendar.MONTH)+1;
	date = now.get(Calendar.DATE);
	yearMin = now.get(Calendar.YEAR) - 10; // 현재 연도 - 10
	yearMax = now.get(Calendar.YEAR); // 최대 연도
	yearCount = yearMax - yearMin;
%>

<html  disable-url-rewriting="true">
<script type="text/javascript">
function checkNull() {
	var name = document.getElementById('name').value;
	var required = document.getElementById('required').value;
	var choice = document.getElementById('choice').value;
	
	
	if(!name || name == " ") {
		alert("유형명을 입력해주세요.");
		return false;
	}
	if(!required || required == " ") {
		alert("필수 점수를 입력해주세요.");
		return false;
	}
	if(!choice || choice == " ") {
		alert("선택 점수를 입력해주세요.");
		return false;
	}
	return true;
}

function setAlpha(obj) {
	val = obj.value;
	re = /[^a-zA-Z]/gi;
	obj.value = val.replace(re,"");
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
								<h2>취업 타입 등록</h2>
								<form action="/employmentType/add" method="POST">
								
								<table style="margin-left:15%;" >
										<thead>
											<tr>
								                <th style=" text-align: center; background-color:#4C4639">
								                  	<font color="#FFFFFF">유      형</font>
								                 </th>
								                 <td>
								                 	<input type="text" id="name" name="name" maxlength="1" style="width:300px;" onkeyup='setAlpha(this)'  style="ime-mode:disabled;" placeholder="       영어 한글자"/>${checkName}
								                 </td>
								            </tr>
								            <tr>
								                <th style=" text-align: center; background-color:#4C4639">
								                  	<font color="#FFFFFF">필수 점수</font>
								                 </th>
								                 <td>
								                 	<input type="text" id="required" name="required" style="width:300px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/>
								                 </td>
								            </tr>
								            <tr>
								                <th style=" text-align: center; background-color:#4C4639">
								                  	<font color="#FFFFFF">선택 점수</font>
								                 </th>
								                 <td>
								                 	<input type="text" id="choice" name="choice" style="width:300px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/>
								                 </td>
								            </tr>
								            <tr>
								                <th style=" text-align: center; background-color:#4C4639">
								                  	<font color="#FFFFFF">연  도</font>
								                 </th>
								                 <td>
								                 	<select name="year">
													<%-- // 연도선택을 위한 연도출력을 동적으로 변경 --%>
														<%yearResult = yearMin;
											
														for(int i=0; yearResult<=yearMax; i++) { %>
											
														<option value=<%=yearResult%> <% if(year == yearResult){%>selected="selected"<%} %> ><%=yearResult%></option>
											
														<%String.valueOf(yearResult++); } %>
											
													</select>
								                 </td>
								            </tr>
								        </thead>
								 </table>
									<div style="text-align: right;">
										<input type="submit" value="등록" onclick="return checkNull()"/>
										<a href="/employmentType/list"><input type="button" value="목록" /></a>
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