<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="../../main/assets/css/main.css" rel="stylesheet" />
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
		if (formData.elements['period'].value.replace(/(\s*)/g, "") == "" ) {
			alert('교시가 입력되지 않았습니다.');
			return formData.elements['period'].focus();
		}

		if (formData.elements['beginHour'].value.replace(/(\s*)/g, "") == "" ) {
			alert('시작 시간에 시간이 입력되지 않았습니다.');
			return formData.elements['beginHour'].focus();
		}else if(formData.elements['beginHour'].value == "시간을 입력하시오 ex)09") {
			alert('시작 시간에 분이 입력되지 않았습니다.');
			return formData.elements['beginHour'].focus();
		}
		if (formData.elements['beginMinutes'].value.replace(/(\s*)/g, "") == "" ) {
			alert('시작 시간에 시간이 입력되지 않았습니다.');
			return formData.elements['beginMinutes'].focus();
		}else if(formData.elements['beginMinutes'].value == "분을 입력하시오 ex)30") {
			alert('시작 시간에 분이 입력되지 않았습니다.');
			return formData.elements['beginMinutes'].focus();
		}
		if (formData.elements['finishHour'].value.replace(/(\s*)/g, "") == "" ) {
			alert('종료 시간에 시간이 입력되지 않았습니다.');
			return formData.elements['finishHour'].focus();
		}else if(formData.elements['finishHour'].value == "시간을 입력하시오 ex)10"){
			alert('종료 시간에 분이 입력되지 않았습니다.');
			return formData.elements['finishHour'].focus();
		}
		if (formData.elements['finishMinutes'].value.replace(/(\s*)/g, "") == "" ) {
			alert('종료 시간에 시간이 입력되지 않았습니다.');
			return formData.elements['finishMinutes'].focus();
		}else if(formData.elements['finishMinutes'].value == "분을 입력하시오 ex)20"){
			alert('종료 시간에 분이 입력되지 않았습니다.');
			return formData.elements['finishMinutes'].focus();
		}

		formData.submit();
	};
</script>
<title>::: 시간표 관리 수정 :::</title>
</head>
<body>

	<!-- Wrapper -->
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<h1>시간표 추가</h1>


				<!-- Table -->
				<section>
					<form id="form" name="form"
						action="<c:url value="/timeTable/edit" />" method="post">
					
						<div class="table-wrapper">
							<table class="alt" >
								<thead>
									<tr>
										<th style="text-align:center;">목록</th>
										<th style="text-align:center;">내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align:center;">교시</td>
										<td style="text-align: center;">
										${period}
										<input type="hidden" id="period" name="period" value="${period}">
										</td>
									</tr>
									<tr>
										<td style="text-align:center;">시작시간</td>
										<td style="text-align: center;"><input type="text" id="beginHour"
											name="beginHour" value="${timeTable.beginHour}" maxlength="2" style='ime-mode: disabled;'
											 /><font color="red">${message1}</font>:
											<input type="text" id="beginMinutes"
											name="beginMinutes" value="${timeTable.beginMinutes}" maxlength="2" style='ime-mode: disabled;'
											 /><font color="red">${message1}</font></td>											 
									</tr>
									
									<tr>
										<td style="text-align:center;">종료시간</td>
										<td style="text-align: center;"><input type="text" id="finishHour"
											name="finishHour" value="${timeTable.finishHour}" maxlength="2" style='ime-mode: disabled;'
											/><font color="red">${message2}</font>:
											<input type="text" id="finishMinutes"
											name="finishMinutes" value="${timeTable.finishMinutes}" maxlength="2" style='ime-mode: disabled;'
											/><font color="red">${message2}</font>
									</tr>
									
									
								</tbody>
							</table>
					</form>
					<table class="alt">
						<thead>
							<tr>
								<th></th>
								<th>
								<th colspan="1">
								<td><div style="text-align: right; padding-top: 10px;">
										<input type="button" id="button_add" name="button_add"
											value="등록" title="등록" onclick="edit();" /> <a
											href="<c:url value="/timeTable/list" />"> 
											&nbsp; &nbsp; &nbsp; 
										<a href="<c:url value="/timeTable/list" />"> 
										<input type="button" id="button_list" name="button_list" value="목록" />
										</a>
								</td>
							</tr>
						</thead>
					</table>
				</section>
			</div>
			</div>


			<!-- Scripts -->
			<script src="../../main/assets/js/jquery.min.js"></script>
			<script src="../../main/assets/js/skel.min.js"></script>
			<script src="../../main/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../../main/assets/js/main.js"></script>
</body>
</html>