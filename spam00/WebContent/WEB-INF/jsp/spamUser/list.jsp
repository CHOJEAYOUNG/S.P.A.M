<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
		<c:if test="${sessionScope.isLogin}"> 
		      <div style="text-align: right;">
		         <%@ include file="/WEB-INF/jsp/menubar.jsp" %>
		      </div>
		 </c:if>
</head>
<body class="left-sidebar">
	<form action="/spamUser/list" method="POST">
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
											<li><a href="/spamUser/list">사용자 목록 조회</a></li>
											<li><a href="/spamUser/listAdd">학생 일괄 등록</a></li>
											<li><a href="/spamUser/oneAddS">학생 개별 등록</a></li>
											<li><a href="/spamUser/oneAddP">교수 개별 등록</a></li>
											<li><a href="/spamUser/viewPA/${spamuser.id}">내 정보 보기</a></li>
											<li><a href="/spamUser/edit/${spamuser.id}">내 정보 수정</a></li>
										</c:if>
										<c:if test = "${sessionScope.power eq 'S' }" > 
											<li><a href="/spamUser/viewPA/${spamuser.id}">내 정보 조회</a></li>
											<li><a href="/spamUser/edit/${spamuser.id}">내 정보 수정</a></li>
										</c:if>
										<c:if test = "${sessionScope.power eq 'P' }" > 
											<li><a href="/spamUser/list">사용자 조회</a></li>
											<li><a href="/spamUser/viewPA/${sessionScope.id}">내 정보 조회</a></li>
											<li><a href="/spamUser/edit/${sessionScope.id}">내 정보 수정</a></li>
										</c:if>
									</ul>
								</section>
							</div>
						</section>
						<c:if test = "${!(sessionScope.power eq 'S') }" >
							<section>
								<header class="major">
									<h2>사용자 검색</h2>
								</header>
									<ul class="default">
										<select name="select">
											<option value="1">학번(교번)</option>
											<option value="2">이름</option>
											<option value="3">신분</option>
										</select>
										<input type="text" name="search" />
										<input type="submit" value="검색" style="margin-left: 86%;" />
									</ul>
							</section>
						</c:if>
					</div>

					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							
								<header class="major">
									<h2>사용자 목록 조회</h2>
								</header>
							
							
							
							<div style="overflow: auto; width: 100%; height: 1000px;">
								<table style="width: 100%" border="1">
									<thead>
										<tr bgcolor="#4C4639">
											<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">번호</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">학번</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">이름</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">학년</font></th>
											<th style="width: 120px; text-align: center;"><font
												color="#FFFFFF">학과</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">신분</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">상태</font></th>
											<th style="width: 100px; text-align: center;"><font
												color="#FFFFFF">보기</font></th>
											<c:if test= "${ sessionScope.power eq 'A'}">
												<th style="width: 100px; text-align: center;"><font
													color="#FFFFFF">수정</font>
												</th>
											</c:if>
										</tr>
										<c:if test="${ !empty listSpam}">
											<c:forEach items="${ listSpam }" var="spamuser"
												varStatus="status">
												<tr>
													<td style="text-align: center; width: 35px;"><c:out
															value="${ status.count }" /></td>
													<td style="text-align: center; width: 100px;"><c:out
															value="${ spamuser.id }" /></td>
													<td style="text-align: center; width: 100px;"><c:out
															value="${ spamuser.name }" /></td>
													<c:if test="${ spamuser.power eq 'S'}">
														<td style="text-align: center; width: 100px;"><c:out
																value="${ spamuser.grade }" /></td>
													</c:if>
													<c:if test="${ !(spamuser.power eq 'S')}">
														<td style="text-align: center; width: 100px;">-</td>
													</c:if>
													<td style="text-align: center; width: 100px;"><c:out
															value="${ spamuser.major }" /></td>
													<c:if test="${ spamuser.power eq 'A' }">
														<td style="text-align: center; width: 100px;">조교</td>
													</c:if>
													<c:if test="${ spamuser.power eq 'P' }">
														<td style="text-align: center; width: 100px;">교수</td>
													</c:if>
													<c:if test="${ spamuser.power eq 'S' }">
														<td style="text-align: center; width: 100px;">학생</td>
													</c:if>
													<c:forEach items="${ enrollment }" var="enrollment"
														varStatus="status">
														<c:if
															test="${enrollment.enrollmentNo eq spamuser.enrollment}">
															<td style="text-align: center; width: 100px;"><c:out
																	value="${ enrollment.enrollmentContent }" /></td>
														</c:if>
													</c:forEach>
													<td style="text-align: center;"><a
														href="<c:url value="/spamUser/viewPA/${spamuser.id}" /> ">
															<input type="button" value="상세보기" />
													</a></td>
													<c:if test="${ sessionScope.power eq 'A' }">
														<td style="text-align: center;"><a
															href="<c:url value="/spamUser/edit/${spamuser.id}" /> ">
																<input type="button" value="수정" />
														</a></td>
													</c:if>
												</tr>
											</c:forEach>
										</c:if>
									</thead>
								</table>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			
	</form>
</body>
</html>