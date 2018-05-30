<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>학생 목록 보기</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<script src="/html/js/jquery.min.js"></script>
		<script src="/html/js/jquery.dropotron.min.js"></script>
		<script src="/html/js/skel.min.js"></script>
		<script src="/html/js/skel-layers.min.js"></script>
		<script src="/html/js/init.js"></script>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/skel.css" />
    	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
	</head>
	<body class="no-sidebar">

		<!-- Header -->
			<div id="header">
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="#" id="logo">Untitled</a></h1>
					
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
					<section>
						<header class="major">
							<h2>학생 정보 보기</h2>
							<span class="byline">모든 학생의 정보를 볼수 있습니다.</span>
						</header>
					</section>
				
	<div style="overflow: auto; width: 100%; height: 1000px;">
         <table style="width: 100%" border="1">
            <thead>
               <tr bgcolor="#4C4639">
                  <th style="width: 35px; text-align: center;"><font color="#FFFFFF">번호</font></th>
                  <th style="width: 100px; text-align: center;"><font color="#FFFFFF">학번</font></th>
                  <th style="width: 100px; text-align: center;"><font color="#FFFFFF">이름</font></th>
                  <th style="width: 100px; text-align: center;"><font color="#FFFFFF">학년</font></th>
                  <th style="width: 100px; text-align: center;"><font color="#FFFFFF">학과</font></th>
                  <th style="width: 100px; text-align: center;"><font color="#FFFFFF">신분</font></th>
                  <th style="width: 100px; text-align: center;"><font color="#FFFFFF">상태</font></th>
                  <th style="width: 100px; text-align: center;"><font color="#FFFFFF">보기</font></th>
                  <th style="width: 100px; text-align: center;"><font color="#FFFFFF">수정</font></th>
               </tr>
               <c:if test="${ !empty listSpam}">
                  <c:forEach items="${ listSpam }" var="spamuser" varStatus="status">
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
                           <c:if test="${enrollment.enrollmentNo eq spamuser.enrollment}">
                              <td style="text-align: center; width: 100px;"><c:out
                                    value="${ enrollment.enrollmentContent }" /></td>
                           </c:if>
                        </c:forEach>
                        <td style="text-align: center;"><a
                           href="<c:url value="/spamUser/viewPA/${spamuser.id}" /> ">
                              <input type="button" value="상세보기" />
                        </a></td>
                        <c:if test="${ !(spamuser.power eq 'P') }">
                           <c:if test="${ sessionScope.power eq 'A' }">
                              <td style="text-align: center;"><a
                                 href="<c:url value="/spamUser/edit/${spamuser.id}" /> ">
                                    <input type="button" value="수정" />
                              </a></td>
                           </c:if>
                           <c:if test="${ !(sessionScope.power eq 'A') }">
                              <td>수정권한 없음</td>
                           </c:if>
                        </c:if>
                        <c:if test="${ spamuser.power eq 'P' }">
                           <td style="text-align: center;"><a
                              href="<c:url value="/spamUser/edit/${spamuser.id}" /> "> <input
                                 type="button" value="수정" />
                           </a></td>
                        </c:if>
                     </tr>
                  </c:forEach>
               </c:if>
            </thead>
         </table>
	   </div>
   </div>
   <c:if test="${ sessionScope.power eq 'A' }">
      <div
         style="overflow: auto; width: 100%; height: 500px; padding-top: 1%; text-align: center;">
         <a href="<c:url value="/spamUser/listAdd" /> "> <input
            type="button" value="일괄등록" />
         </a> <a href="<c:url value="/spamUser/oneAddS" /> "> <input
            type="button" value="학생개별등록" />
         </a> <a href="<c:url value="/spamUser/oneAddP" /> "> <input
            type="button" value="교수개별등록" />
         </a>
      </div>
   </c:if>
	</div>
		<!-- Footer -->
			<div id="footer">
				<div class="container">

					<!-- Lists -->
						<div class="row">
							<div class="8u">
								<section>
									<header class="major">
										<h2>Donec dictum metus</h2>
										<span class="byline">Quisque semper augue mattis wisi maecenas ligula</span>
									</header>
									<div class="row">
										<section class="6u">
											<ul class="default">
												<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
												<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
												<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
												<li><a href="#">Cras vitae metus aliquam  pharetra.</a></li>
											</ul>
										</section>
										<section class="6u">
											<ul class="default">
												<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
												<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
												<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
												<li><a href="#">Cras vitae metus aliquam  pharetra.</a></li>
											</ul>
										</section>
									</div>
								</section>
							</div>
							<div class="4u">
								<section>
									<header class="major">
										<h2>Donec dictum metus</h2>
										<span class="byline">Mattis wisi maecenas ligula</span>
									</header>
									<ul class="contact">
										<li>
											<span class="address">Address</span>
											<span>1234 Somewhere Road #4285 <br />Nashville, TN 00000</span>
										</li>
										<li>
											<span class="mail">Mail</span>
											<span><a href="#">someone@untitled.tld</a></span>
										</li>
										<li>
											<span class="phone">Phone</span>
											<span>(000) 000-0000</span>
										</li>
									</ul>	
								</section>
							</div>
						</div>

					<!-- Copyright -->
						<div class="copyright">
							Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
						</div>

				</div>
			</div>
	</body>
</html>