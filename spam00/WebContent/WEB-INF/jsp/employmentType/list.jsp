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
											<li><a href="/employment/list">취업 점수</a></li>
											<c:if test="${power eq 'A' }">
												<li><a href="/employmentCategory/list">취업 카테고리</a></li>
												<li><a href="/employmentType/list">취업 유형</a></li>
											</c:if>
										</ul>
									</section>
								<section>
		                      		<header class="major">
		                           		<h2>검색</h2>
		                      		</header>
		                        	<form action="/employmentType/list" method="GET">
										<input type="text" id="search" name="search" style="width:200px;"/>
										<select name="select">
											<option value="type">유형</option>
											<option value="year">연도</option>
										</select>
										<div style="text-align: right;">
											<a href="/employmentType/list"><input type="button" value="전체보기"></a>
											<input type="submit"value="검색" onclick="return checkNull()"/>
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
								<h3>취업 유형</h3>
								<table style="width:100%; text-align: center;" border="1">
									<thead>
										<tr>
											<th>번호</th>
											<th>유형</th>
											<th>필수점수</th>
											<th>선택점수</th>
											<th>연도</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
										
										<c:if test="${ !empty listType}">
											<c:forEach items="${ listType }" var="employmentType" varStatus="status">
												<c:if test="${ employmentType.state eq 'Y'}">	
													<tr>
														<td style="text-align: center;">
															<c:out value="${ status.count }"/>
														</td>
														<td style="text-align: center;">
															<c:out value="${ employmentType.name }"/>
														</td>
														<td style="text-align: center;">
															<c:out value="${ employmentType.required }"/>
														</td>
														<td style="text-align: center;">
															<c:out value="${ employmentType.choice }"/>
														</td>
														<td style="text-align: center;">
															<c:out value="${ employmentType.year }"/>
														</td>
														<td style="text-align: center;">
															<a href="<c:url value="/employmentType/edit/${employmentType.no}" />">
																<input type="button" value="수정"> 
															</a>
														</td>
														<td style="text-align: center;">
															<a href="<c:url value="/employmentType/remove/${employmentType.no}" />">
																<input type="button" value="삭제"> 
															</a>
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${empty listType}">
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
									<a href="<c:url value="/employmentType/add" />">
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