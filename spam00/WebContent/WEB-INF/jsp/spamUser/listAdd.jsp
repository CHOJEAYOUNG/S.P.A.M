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
	<form action="/spamUser/listAdd" method="POST" enctype="multipart/form-data">
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
						<c:if test = "${sessionScope.power eq 'A' }" >
							<section>
								<header class="major">
									<h2>학생 검색</h2>
								</header>
									<ul class="default">
										<select name="select">
											<option value="1">학번</option>
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
								<h2>학생 일괄 등록</h2>
							</header>
							<form action="/spamUser/listAdd" method="post" enctype="multipart/form-data">
								
									
										<table style="margin-left:15%;" >
											<thead>
												 <tr>
									                   <th style="width: 100px; text-align: center; background-color:#4C4639">
									                  	<font color="#FFFFFF">파일 업로드</font>
									                  </th>
									                  <td>
									                  	<input type="file" name="uploadfile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />
														</td>
									              </tr>
									             </thead>
									            </table>
										
									<input type="submit" value="일괄등록" style="margin-left:40%;" />
								
							</form>
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