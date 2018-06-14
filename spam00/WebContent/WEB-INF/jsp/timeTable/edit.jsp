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
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}

	function edit() {
		formData = document.getElementById("form");
		if (formData.elements['period'].value.replace(/(\s*)/g, "") == "") {
			alert('교시가 입력되지 않았습니다.');
			return formData.elements['period'].focus();
		}

		if (formData.elements['beginHour'].value.replace(/(\s*)/g, "") == "") {
			alert('시작 시간에 시간이 입력되지 않았습니다.');
			return formData.elements['beginHour'].focus();
		} else if (formData.elements['beginHour'].value == "시간을 입력하시오 ex)09") {
			alert('시작 시간에 분이 입력되지 않았습니다.');
			return formData.elements['beginHour'].focus();
		}
		if (formData.elements['beginMinutes'].value.replace(/(\s*)/g, "") == "") {
			alert('시작 시간에 시간이 입력되지 않았습니다.');
			return formData.elements['beginMinutes'].focus();
		} else if (formData.elements['beginMinutes'].value == "분을 입력하시오 ex)30") {
			alert('시작 시간에 분이 입력되지 않았습니다.');
			return formData.elements['beginMinutes'].focus();
		}
		if (formData.elements['finishHour'].value.replace(/(\s*)/g, "") == "") {
			alert('종료 시간에 시간이 입력되지 않았습니다.');
			return formData.elements['finishHour'].focus();
		} else if (formData.elements['finishHour'].value == "시간을 입력하시오 ex)10") {
			alert('종료 시간에 분이 입력되지 않았습니다.');
			return formData.elements['finishHour'].focus();
		}
		if (formData.elements['finishMinutes'].value.replace(/(\s*)/g, "") == "") {
			alert('종료 시간에 시간이 입력되지 않았습니다.');
			return formData.elements['finishMinutes'].focus();
		} else if (formData.elements['finishMinutes'].value == "분을 입력하시오 ex)20") {
			alert('종료 시간에 분이 입력되지 않았습니다.');
			return formData.elements['finishMinutes'].focus();
		}

		formData.submit();
	};
</script>
<head>
<c:if test="${sessionScope.isLogin}">
	<div style="text-align: right;">
		<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
	</div>
</c:if>
</head>
<body class="left-sidebar">


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
							<h2>학생 정보</h2>
						</header>
						<div class="row half">
							<section class="6u">
								<ul class="default">
									<c:if test="${sessionScope.power eq 'A' }">
										<li><a href="/spamUser/listAdd">일괄 등록</a></li>
										<li><a href="/spamUser/oneAddS">학생 개별 등록</a></li>
										<li><a href="/spamUser/oneAddP">교수 개별 등록</a></li>
										<li><a href="/spamUser/list">학생 목록</a></li>
									</c:if>
									<li><a href="/logout">로그 아웃</a></li>
								</ul>
							</section>
						</div>
					</section>
					<c:if test="${sessionScope.power eq 'A' }">
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
							<h2>시간표 수정</h2>
						</header>
						
						<table style="margin-left: 15%;">
							<thead>
							<thead>
								<tr>
									<th
										style="text-align: center; background-color: #4C4639; width: 100px;">
										<font color="#FFFFFF">목록</font>
									</th>
									<td style="width: 300px;">&nbsp&nbsp내용</td>
								</tr>
							</thead>
							<tbody>
								<form id="form" name="form"
									action="<c:url value="/timeTable/edit" />" method="post">
								<tr>
									<th
										style="text-align: center; background-color: #4C4639; width: 100px;"><font
										color="#FFFFFF">교시</font></th>
									<td style="width: 300px;">&nbsp &nbsp ${timeTable.period} <input
										type="hidden" id="period" name="period" value="${timeTable.period}">
									</td>
								</tr>
								<tr>
									<th
										style="text-align: center; background-color: #4C4639; width: 100px;">
										<font color="#FFFFFF">시작시간</font>
									</th>
									<td style="width: 300px;"><input type="text"
										id="beginHour" name="beginHour" value="${timeTable.beginHour}"
										maxlength="2" style="ime-mode: disabled; width: 130px;" /><font
										color="red">${message1}</font> : <input type="text"
										id="beginMinutes" name="beginMinutes"
										value="${timeTable.beginMinutes}" maxlength="2"
										style="ime-mode: disabled; width: 130px;" /><font color="red">${message1}</font>
									</td>
								</tr>
								<tr>
									<th
										style="text-align: center; background-color: #4C4639; width: 100px;">
										<font color="#FFFFFF">종료시간</font>
									</th>
									<td style=""><input type="text" id="finishHour"
										name="finishHour" value="${timeTable.finishHour}"
										maxlength="2" style="ime-mode: disabled; width: 130px;" /> <font
										color="red">${message2}</font>: <input type="text"
										id="finishMinutes" name="finishMinutes"
										value="${timeTable.finishMinutes}" maxlength="2"
										style="ime-mode: disabled; width: 130px;" /> <font
										color="red">${message2}</font></td>
								</tr>
								</form>
							</tbody>
						</table>
						${message}
						<div style="text-align: center; padding-top: 10px;">
							<input type="button" id="button_add" name="button_add" value="등록"
								title="등록" onclick="edit();" /> <a
								href="<c:url value="/timeTable/list" />"> <input
								type="button" id="button_list" name="button_list" value="목록" />
							</a>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>


</body>
</html>