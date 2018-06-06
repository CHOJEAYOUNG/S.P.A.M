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
									<section>
			                      		<header class="major">
			                           		<h2>검색</h2>
			                      		</header>
			                        	<form action="/graduationCategory/list" method="GET">
											<input type="text" id="search" name="search" style="width:200px;"/>
											<select name="select">
												<option value="name">카테고리 명</option>
												<option value="condition">조건</option>
											</select>
											<div style="text-align: right;">
												<a href="/graduationCategory/list"><input type="button" value="전체보기"></a>
												<input type="submit" value="검색" onclick="return checkNull()">
											</div>
										</form>
		                    		</section>
								</div>
							</section>
						</div>
						
						<!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header class="major">
								<h3>졸업 카테고리</h3>
									<table style="width:100%; text-align: center;" border="1">
										<thead>
											<tr>
												<th>번호</th>
												<th>카테고리 명</th>
												<th>유형</th>
												<th>조건</th>
												<th>상세보기</th>
											</tr>
											
											<c:if test="${ !empty listCategory}">
												<c:forEach items="${ listCategory }" var="graduationCategory" varStatus="status">
													<c:if test="${graduationCategory.state eq 'Y'}">
														<tr>
															<td style="text-align: center;">
																<c:out value="${status.count}"/>
															</td>
															<td style="text-align: center;">
																<c:out value="${ graduationCategory.name }"/>
															</td>
															<td style="text-align: center;">
																<c:forEach items="${ listType }" var="graduationType" varStatus="status">
																	<c:if test="${graduationType.no eq graduationCategory.grTypeNo}">
																		<c:out value="${graduationType.name}"/>
																	</c:if>
																</c:forEach>
															</td>
															<td style="text-align: center;">
																<c:if test="${graduationCategory.conditionSqeNo eq 1}">
																	<c:out value="필수"/>
																</c:if>
																<c:if test="${graduationCategory.conditionSqeNo eq 2}">
																	<c:out value="선택"/>
																</c:if>
															</td>
															<td style="text-align: center;">
																<a href="<c:url value="/graduationCategory/view/${graduationCategory.no}"/>">
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
										<a href="<c:url value="/graduationCategory/add" />">
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