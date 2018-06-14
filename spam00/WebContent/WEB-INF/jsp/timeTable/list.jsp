<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<c:if test="${sessionScope.isLogin}">
	<div style="text-align: right;">
		<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
	</div>
</c:if>
</head>
<body class="left-sidebar">
	<form action="/attendance/list" method="post">
		<!-- Header -->
		<div id="header">
			<div class="container">

				<!-- Logo -->
				<h1>
					<a href="/main" id="logo">S.P.A.M</a>
				</h1>

				<!-- Nav -->
				<%@ include file="/WEB-INF/jsp/navbar.jsp"%>
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
							<ul class="default">

								<c:if test="${sessionScope.power eq 'A' }">
									<li><a href="/schedule/list">교수 일정 조회</a></li>
									<li><a href="/schedule/add">교수 일정 등록</a></li>
									<li><a href="/timeTable/list">시간표 조회</a></li>
									<li><a href="/timeTable/add">시간표 등록</a></li>
								</c:if>
								<c:if test="${sessionScope.power eq 'P' }">
									<li><a href="/schedule/list">일정 조회</a></li>
									<li><a href="/schedule/add">일정 등록</a></li>
								</c:if>

							</ul>
						</section>

					</div>

					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<header class="major">
								<h2>시간표 조회</h2>

								<table style="overflow: auto; width: 100%" border="1">
									<thead>
										<tr bgcolor="#4C4639">
											<th style="width: 35px; text-align: center;"><font
												color="#FFFFFF">교시</font></th>
											<th style="width: 120px; text-align: center;"><font
												color="#FFFFFF">시작시간</font></th>
											<th style="width: 110px; text-align: center;"><font
												color="#FFFFFF">종료시간</font></th>
											<th style="width: 110px; text-align: center;"><font
												color="#FFFFFF">수정</font></th>
											<th style="width: 110px; text-align: center;"><font
												color="#FFFFFF">삭제</font></th>
										</tr>

										<c:if test="${!empty listTimeTable}">
											<c:forEach items="${listTimeTable}" var="timeTable">
												<tr>
													<td style="text-align: center;"><c:out
															value="${timeTable.period}" /></td>
													<td style="text-align: center;"><c:out
															value="${timeTable.beginHour}" /> : <c:out
															value="${timeTable.beginMinutes}" /></td>
													<td style="text-align: center;"><c:out
															value="${timeTable.finishHour}" /> : <c:out
															value="${timeTable.finishMinutes}" /></td>
													<td style="text-align: center;"><a
														href="<c:url value="/timeTable/edit/${timeTable.period}" />">
															<input type="button" id="button_edit" name="button_edit"
															value="수정" />
													</a></td>
													<td style="text-align: center;"><a
														href="<c:url value="/timeTable/remove/${timeTable.period}" />"> <input
															type="button" id="button_remove" name="button_remove"
															value="삭제" />
													</a></td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty listTimeTable}">
											<tr>
												<td style="text-align: center;" colspan="7">시간표가 존재하지
													않습니다.</td>
											</tr>
										</c:if>

									</thead>
								</table>
								<br>
								<br>
								<br>
								<div style="text-align: center; padding-top: 20px;">
									<a href="<c:url value="/timeTable/add" />"> <input
										type="button" id="button_add" name="button_add" value="등록" />
									</a>
								</div>
							</header>
						</section>
					</div>

				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/jsp/footer.jsp"%>

	</form>
</body>







<body>

	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<h1>시간표 조회</h1>
					<p>교시의 정보를 조회 또는 수정이 가능합니다.</p>
				</header>

			</div>
		</div>

		<table style="width: 100%;" border="1">
			<thead>
				<tr>
					<th style="text-align: center;">교시</th>
					<th style="text-align: center;">시작시간</th>
					<th style="text-align: center;">종료시간</th>

				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty listTimeTable}">
					<c:forEach items="${listTimeTable}" var="timeTable">
						<tr>
							<td style="text-align: center;"><c:out
									value="${timeTable.period}" /></td>
							<td style="text-align: center;"><c:out
									value="${timeTable.beginHour}" /> : <c:out
									value="${timeTable.beginMinutes}" /></td>
							<td style="text-align: center;"><c:out
									value="${timeTable.finishHour}" /> : <c:out
									value="${timeTable.finishMinutes}" /></td>
							<td style="text-align: center;"><a
								href="<c:url value="/timeTable/edit/${timeTable.period}" />">
									<input type="button" id="button_edit" name="button_edit"
									value="수정" />
							</a>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty listTimeTable}">
					<tr>
						<td style="text-align: center;" colspan="7">시간표가 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>


		<div style="text-align: right; padding-top: 10px;">
			<a href="<c:url value="/timeTable/add" />"> <input type="button"
				id="button_add" name="button_add" value="등록" />
			</a>
		</div>
	</div>


</body>
</html>