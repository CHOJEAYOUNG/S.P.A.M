<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>

<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function stuPopupOpen() {
		window.name = "ListForm";

		var option = "width=800, height=500, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
		openWin = window.open("/advice/searchE", "stuForm", option);
	};
	function timePopupOpen() {
		window.name = "ListForm2";

		var option = "width=700, height=410, resizable=no, scrollbars=yes, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
		openWin = window.open("/schedule/test", "timeForm", option);

	}
	function sendName() {
		openWin.document.getElementById("name").value = document
				.getElementById("name").value;
		
		openWin.document.getElementById("searchDate").value = document
				.getElementById("adviceDate").value;
		
		
		
	}
	function edit() {
		formData = document.getElementById("form");
		
		if (formData.elements['name'].value.replace(/(\s*)/g, "") == "") {
			alert('교수가 입력되지 않았습니다.');
			return formData.elements['name'].focus();
		}
		if (formData.elements['reason'].value.replace(/(\s*)/g, "") == "") {
			alert('사유가 입력되지 않았습니다.');
			return formData.elements['reason'].focus();
		}
		if (formData.elements['adviceDate'].value.replace(/(\s*)/g, "") == "") {
			alert('날짜가 입력되지 않았습니다.');
			return formData.elements['adviceDate'].focus();
		}
		if (formData.elements['period'].value.replace(/(\s*)/g, "") == "") {
			alert('교시가 입력되지 않았습니다.');
			return formData.elements['period'].focus();
		}
		if (formData.elements['quarter'].value.replace(/(\s*)/g, "") == "") {
			alert('분기가 입력되지 않았습니다.');
			return formData.elements['quarter'].focus();
		}

		var date = formData.elements['adviceDate'].value;
		var split = date.split('/');
		var temp = split[2] + "-" + split[0] + "-" + split[1];
		formData.elements['adviceDate'].value = temp;

		formData.submit();
	};

	$(function() {
		$("#adviceDate").datepicker();
	});
</script>
<c:if test="${sessionScope.isLogin}">
	<div style="text-align: right;">
		<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
	</div>
</c:if>
</head>
<body class="left-sidebar">
	<form id="form" name="form" action="<c:url value="/advice/add" />"
		method="post">
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
								<li><a href="/advice/add">상담 등록</a></li>
								<li><a href="/advice/list">상담 신청 내역 조회</a></li>
							</ul>
						</section>

					</div>

					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
							<header class="major">
								<h2>상담 신청</h2>

								<input type="hidden" id="sId" name="sId"
									value=${ sessionScope.id } />
								<table style="margin-left: 15%;">
									<thead>
										<tr>
											<th
												style="width: 100px; text-align: center; background-color: #4C4639">
												<font color="#FFFFFF">교수</font>
											</th>
											<td><input type="text" size="10"
												style="width: 50%; border: 2;" id="name" name="name"
												maxlength="20" onclick="stuPopupOpen();" /></td>
										</tr>
										<tr>
											<th
												style="width: 100px; text-align: center; background-color: #4C4639">
												<font color="#FFFFFF">사유</font>
											</th>
											<td><textarea name="reason" id="reason" cols="40"
													rows="1" style="width: 50%; border: 2;"></textarea></td>
										</tr>
										<tr>
											<th
												style="width: 100px; text-align: center; background-color: #4C4639">
												<font color="#FFFFFF">상담 날짜</font>
											</th>
											<td><input type="text" id="adviceDate" name="adviceDate"
												style="width: 50%; border: 2;" />
												<input type="button" id="정보 입력" value="정보입력" onclick="sendName();"/></td>

										</tr>
										<tr>
											<th
												style="width: 100px; text-align: center; background-color: #4C4639">
												<font color="#FFFFFF">교시</font>
											</th>
											<td><input type="text" size="10" readonly="true"
												style="width: 50%; border: 2;" id="period" name="period"
												maxlength="11" onclick="timePopupOpen();" /></td>
										</tr>
										<tr>
											<th
												style="width: 100px; text-align: center; background-color: #4C4639">
												<font color="#FFFFFF">분기</font>
											</th>
											<td><input type="text" readonly="true" id="quarter" name="quarter"/>
											</td>
										</tr>

									</thead>
								</table>
								※ 1분기 는 해당 교시의 시작시간부터 25분 2분기는 1분기 종료후 25분 입니다.<br />
								<br /> <input type="button" id="button" name="button" value="전송"
									onclick="edit();" style="margin-left: 40%;" /> <a
									href="<c:url value="/advice/list" />"> <input type="button"
									value="취소" />
								</a>

							</header>
						</section>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/footer.jsp"%>

</body>
</html>