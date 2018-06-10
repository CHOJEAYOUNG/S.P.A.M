
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
<script type="text/javascript">
function viewPopupOpen(v) {
	window.name = "viewForm";

	var option = "width=500, height=720, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	openWin = window.open("/advice/view/" + v, "childForm", option);
}
function editPopupOpen(v) {
	window.name = "editForm";

	var option = "width=500, height=720, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	openWin = window.open("/advice/edit/" + v, "childForm", option);
}

function stuPopupOpen() {
	window.name = "ListForm";

	var option = "width=700, height=410, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	openWin = window.open("/advice/searchE", "stuForm", option);
}
</script>

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
									 <c:if test = "${sessionScope.power eq 'S' }" > 
			                           <li><a href="/advice/add">상담 신청</a></li>
			                           <li><a href="/advice/list">상담 신청 내용 조회</a></li>
			                         </c:if>
			                          <c:if test = "${sessionScope.power eq 'P' }" > 
			                           <li><a href="/advice/list">상담 예약 조회</a></li>
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
							<h2>상담 정보 보기</h2>
							<form action="/advice/list" method="get">
								<table style="border_color: white; align: center;">
									<tr>
										<td>상태</td>
										<td><select id="assentNo" name="assentNo">
												<option value="0" selected>전부</option>
												<option value="1">승인완료</option>
												<option value="2">승인대기</option>
												<option value="3">승인거절</option>
												<option value="4">상담완료</option>
										</select></td>
										<td>날짜</td>
										<td><input type="date" id="searchDate" name="searchDate" /></td>
										<td><input type="submit" value="검색" /></td>
									</tr>
								</table>
							</form>
							<font color="RED"> ※ 1분기 는 해당 교시의 시작시간부터 25분 2분기는 1분기 종료후
								25분 입니다.</font><br />
						</header>
						<div style="overflow: auto; width: 100%; height: 1000px;">
							<table style="width: 100%" border="1">
								<thead>
									<tr bgcolor="#4C4639">
										<th style="width: 50px; text-align: center;"><font
											color="#FFFFFF">번호</font></th>
										<th style="width: 40px; text-align: center;"><font
											color="#FFFFFF">학생</font></th>
										<th style="width: 100px; text-align: center;"><font
											color="#FFFFFF">교시</font></th>
										<th style="width: 50px; text-align: center;"><font
											color="#FFFFFF">분기</font></th>
										<th style="width: 100px; text-align: center;"><font
											color="#FFFFFF">등록날짜</font></th>
										<th style="width: 100px; text-align: center;"><font
											color="#FFFFFF">상담날짜</font></th>
										<th style="width: 100px; text-align: center;"><font
											color="#FFFFFF">승인여부</font></th>
										<th style="width: 50px; text-align: center;"><font
											color="#FFFFFF">승인</font></th>
										<th style="width: 50px; text-align: center;"><font
											color="#FFFFFF">거절</font></th>
										<th style="width: 100px; text-align: center;"><font
											color="#FFFFFF">상세 보기</font></th>
									</tr>
									<c:if test="${ !empty listAdvice}">
										<c:forEach items="${listAdvice}" var="advice"
											varStatus="status">
											<tr>
												<td style="text-align: center; width: 40px;"><c:out
														value="${ status.count }" /></td>
												<td style="text-align: center; width: 100px;"><c:out
														value="${ advice.name }" /></td>
												<td style="text-align: center; width: 100px;"><c:choose>
														<c:when test="${advice.mon ne 0}">
															월요일 <c:out value="${advice.mon}"></c:out>
														</c:when>
														<c:when test="${advice.tue ne 0}">
															화요일 <c:out value="${advice.tue}"></c:out>
														</c:when>
														<c:when test="${advice.wed ne 0}">
															수요일 <c:out value="${advice.wed}"></c:out>
														</c:when>
														<c:when test="${advice.thur ne 0}">
															목요일 <c:out value="${advice.thur}"></c:out>
														</c:when>
														<c:when test="${advice.fri ne 0}">
															금요일 <c:out value="${advice.fri}"></c:out>
														</c:when>
													</c:choose>
												<td style="text-align: center; width: 100px;"><c:out
														value="${ advice.quarter }" /></td>
												<td style="text-align: center; width: 100px;"><c:out
														value="${ advice.registration }" /></td>
												<td style="text-align: center; width: 100px;"><c:out
														value="${ advice.adviceDate }" /></td>
												<td style="text-align: center; width: 100px;"><c:out
														value="${ advice.state }" /></td>
												<td style="text-align: center; width: 100px;"><c:if
														test="${advice.assentDate == null}">
														<a
															href="<c:url value="/advice/assent/${advice.adviceNo}" />">
															<input type="button" value="승인" />
														</a>
													</c:if> <c:if test="${advice.assentDate != null}">
														<c:out value="${ advice.assentDate }" />
													</c:if></td>
												<td style="text-align: center; width: 100px;"><c:if
														test="${advice.assentNo != 4} ">
														<input type="button" id="button_edit" name="button_edit"
															onclick="editPopupOpen(${advice.adviceNo})" value="거절" />
													</c:if> <c:if test="${advice.assentNo == 4 }">
														<c:out value="상담이 완료된 예약입니다" />
													</c:if></td>

												<td style="text-align: center; width: 100px;"><input
													type="button" id="button_view" name="button_view"
													onclick="viewPopupOpen(${advice.adviceNo})" value="상세보기" />
												</td>
												<td style="text-align: center; width: 100px;"><c:if
														test="${advice.assentNo == 1}">

														<a
															href="<c:url value="/advice/assent/${advice.adviceNo}" />">
															<input type="button" value="상담 완료" />
														</a>
													</c:if></td>
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
	<div id="footer">
		<!-- Copyright -->
		<div class="copyright">Tel: 041-530-2212 (선문대학교 컴퓨터공학과 과사무실)</div>
	</div>
</body>
</html>
