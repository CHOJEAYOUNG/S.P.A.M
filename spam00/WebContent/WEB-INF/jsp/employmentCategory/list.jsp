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

function openWindow() {
	window.open(
		"select", 
		"open the window",
		"toolbar=no, width=500, height=500, top=150, left=150");
}

function openWindowS() {
	var myForm = document.S;
	 var url = "/employment/selectEmployment";
	 window.open("" ,"selectEmployment", 
	       "toolbar=no, width=540, height=467, directories=no, status=no,    scrollorbars=no, resizable=no"); 
	 myForm.action =url; 
	 myForm.method="post";
	 myForm.target="selectEmployment";
	 myForm.testVal = 'test';
	myForm.submit();
}

function checkNull() {
	var id = document.getElementById('search').value;
	
	if(!id) {
		alert("입력해주세요.");
		return false;
	}
	return true;
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
						<section>
		                      		<header class="major">
		                           		<h2>검색</h2>
		                      		</header>
		                      		
		                        	<form action="/employmentCategory/list" method="GET">
										<input type="text" id="search" name="search" style="width:200px;"/>
										<select name="select">
											<option value="name">카테고리 명</option>
											<option value="condition">조건</option>
										</select>
										<div style="text-align: right;">
											<a href="/employmentCategory/list"><input type="button" value="전체보기"></a>
											<input type="submit" value="검색" onclick="return checkNull()">
										</div>
									</form>
	                    		</section>
								
							
						</div>
						
						<!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header class="major">
								<h2>취업 카테고리</h2>
									<table style="width:100%; text-align: center;" border="1">
										<thead>
											<tr bgcolor="#4C4639">
												<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">번호</font></th>
												<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">카테고리 명</font></th>
												<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">유형</font></th>
												<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">조건</font></th>
												<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">점수</font></th>
												<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">상세보기</font></th>
											</tr>
											
											<c:if test="${ !empty listCategory}">
												<c:forEach items="${ listCategory }" var="employmentCategory" varStatus="status">
													<c:if test="${employmentCategory.state eq 'Y'}">
														<tr>
															<td style="text-align: center;">
																<c:out value="${status.count}"/>
															</td>
															<td style="text-align: center;">
																<c:out value="${ employmentCategory.name }"/>
															</td>
															<td style="text-align: center;">
																<c:forEach items="${ listType }" var="employmentType" varStatus="status">
																	<c:if test="${employmentType.no eq employmentCategory.empTypeNo}">
																		<c:out value="${employmentType.name}"/>
																	</c:if>
																</c:forEach>
															</td>
															<td style="text-align: center;">
																<c:if test="${employmentCategory.conditionSqeNo eq 1}">
																	<c:out value="필수"/>
																</c:if>
																<c:if test="${employmentCategory.conditionSqeNo eq 2}">
																	<c:out value="선택"/>
																</c:if>
															</td>
															<td style="text-align: center;">
																<c:out value="${ employmentCategory.score }"/>
															</td>
															<td style="text-align: center;">
																<a href="<c:url value="/employmentCategory/view/${employmentCategory.no}"/>">
																	<input type="button" value="상세보기"> 
																</a>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${empty listCategory}">
												<tr>
													<td style="text-align: center;" colspan="7">
														목록이 존재하지 않습니다.
													</td>
												</tr>
											</c:if>
										</thead>
									</table>
									<br><br><br>
									<div style="text-align: right; padding-top: 10px;"> 
										<a href="<c:url value="/employmentCategory/add" />">
											<input type="button" name="add" value="등록"> 
										</a>
									</div>
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