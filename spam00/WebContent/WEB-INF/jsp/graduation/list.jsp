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
</head>
<script type="text/javascript">
function openWindow() {
	window.open(
		"search", 
		"open the window",
		"toolbar=no, width=500, height=500, top=150, left=150");
}

function openWindowS() {
	var myForm = document.S;
	 var url = "/graduation/selectGraduation";
	 window.open("" ,"selectGraduation", 
	       "toolbar=no, width=540, height=467, directories=no, status=no,    scrollorbars=no, resizable=no"); 
	 myForm.action =url; 
	 myForm.method="post";
	 myForm.target="selectGraduation";
	myForm.submit();
}

function checkNull() {
	var id = document.getElementById('id').value;
	
	if(!id) {
		alert("학번을 입력해주세요.");
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
<html>
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
									<section class="8u">
										<ul class="default">
											<li><a href="/graduation/list">졸업 점수</a></li>
											<c:if test="${power eq 'A' }">
												<li><a href="/graduationCategory/list">졸업 카테고리</a></li>
												<li><a href="/graduationType/list">졸업 유형</a></li>
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
									<h2>졸업 점수 조회</h2>
										<form action="/graduation/list" method="get">
											<c:if test="${power ne 'S' }">
												<input type="text" name="id" id="id" placeholder="학번" style="width:200px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/>
												<input type="submit"value="검색" onclick="return checkNull()"/>
												<br>
											</c:if>
										</form>
										<br><br><br>
										 <table style="width:100%; text-align: center;" border="1">
											<thead>
												<c:if test="${ !empty listGr}">
												<tr bgcolor="#4C4639">
													<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF"> 번호</font></th>
													<c:if test="${power eq 'A'}">
															<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF"> 이름</font></th>
														</c:if>
													<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">제목</font></th>
													<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">조건</font></th>
													<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">등록일</font></th>
													<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">승인여부</font></th>
													<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">상세보기</font></th>
												</tr>
													<c:forEach items="${ listGr }" var="graduation" varStatus="status">
														
															<tr>
																<td style="text-align: center;">
																	<c:out value="${status.count}"/>
																</td>
																<c:if test="${power eq 'A'}">
																<c:forEach items="${ listSpamuser }" var="spamuser" varStatus="status">
																	<c:if test="${spamuser.id eq graduation.id}">
																		<td style="text-align: center;">
																			<c:out value="${spamuser.name}"/>
																		</td>
																	</c:if>
																</c:forEach>
															</c:if>
																<c:forEach items="${ listCategory }" var="category" varStatus="status">
																	<c:if test="${ graduation.grcNo eq category.no}">
																		<td style="text-align: center;">
																			<c:out value="${category.name}"/>
																		</td>
																		<td style="text-align: center;">
																			<c:if test="${ category.conditionSqeNo eq 1}">
																				<c:out value="필수"/>										
																			</c:if>
																			<c:if test="${ category.conditionSqeNo eq 2}">
																				<c:out value="선택"/>										
																			</c:if>
																		</td>
																	</c:if>
																</c:forEach>				
																<td style="text-align: center;">
																	<c:out value="${ graduation.registration }"/>
																</td>
																<td style="text-align: center;">
																	<c:if test="${ graduation.assentNo eq 1}">
																		<span style="color:blue">승인</span>
																	</c:if>
																	<c:if test="${ graduation.assentNo eq 2}">
																		<span style="color:green">대기</span>
																	</c:if>
																	<c:if test="${ graduation.assentNo eq 3}">
																		<span style="color:red">거절</span>
																	</c:if>
																</td>
																<td style="text-align: center;">
																	<a href="<c:url value="/graduation/view/${graduation.grlNo}"/>">
																		<input type="button" value="상세보기"> 
																	</a>
																</td>
															</tr>
														
													</c:forEach>
												</c:if>
												<c:if test="${empty listGr}">
													<tr>
														<td style="text-align: center;" colspan="7">
															목록이 없습니다.
														</td>
													</tr>
												</c:if>
											</thead>
										</table>
										<br><br><br>
										<c:if test="${power ne 'S' }">
											<div style="text-align: right; padding-top: 10px;">
												<a href="javascript:openWindow()"><input type="button" value="등록"></a>
											</div>
										</c:if>
									<c:if test="${power eq 'S' }">
										<form action="/graduation/selectGraduation" method="post" name="S">
											<a href="javascript:openWindowS()"><input type="button" value="등록"> </a>
										</form>
									</c:if>
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