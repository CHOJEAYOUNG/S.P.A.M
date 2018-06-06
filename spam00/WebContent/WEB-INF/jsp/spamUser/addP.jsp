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
<script type="text/javascript">
	//입력하지 않은 곳과 전화번호에 특수문자 방지
	function formOnClick() {
		var id = document.getElementById('id').value;
		var birthDate = document.getElementById('birthDate').value;
		var name = document.getElementById('name').value;
		var major = document.getElementById('major').value;
		var num2 = document.getElementById("phoneNo2").value
		var num3 = document.getElementById("phoneNo3").value
		var office = document.getElementById('office').value;
		if (!id) {
			alert("교번을 입력하지 않았습니다!");
			return;
		}
		if (!birthDate) {
			alert("생년월일을 입력하지 않았습니다!");
			return;
		}
		if (!name) {
			alert("이름을 입력하지 않았습니다!");
			return;
		}
		if (!major) {
			alert("학과를 입력하지 않았습니다!");
			return;
		}
		if (!num2) {
			alert("전화번호를 다 입력하지 않았습니다!");
			return;
		}
		if (!num3) {
			alert("전화번호를 다 입력하지 않았습니다!");
			return;
		}
		if (!office) {
			alert("사무실 위치를 입력하지 않았습니다!");
			return;
		}
		var special = "{}[]()<>?_|~`!@#$%^&*-+\"'\\/"

		var num2 = document.getElementById("phoneNo2").value
		var num3 = document.getElementById("phoneNo3").value

		var phoneNumber = num2 + num3

		for (var i = 0; i < phoneNumber.length; i++) {
			if (-1 != special.indexOf(phoneNumber.charAt(i))) {
				alert("전화번호에 특수문자는 입력 할 수 없습니다.");
				return;
			}
		}
		document.getElementById("form").submit();
		return;
	}
	//숫자만 입력(한영키 못막음)
	function showKeyCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 )
		{
			return;
		}
		else
		{
			return false;
		}
	}
	//한글 방지(한글 입력시 사라짐)
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>
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
								<h2>학생 정보</h2>
							</header>
							<div class="row half">
								<section class="6u">
									<ul class="default">
										<c:if test = "${sessionScope.power eq 'A' }" > 
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
								<h2>교수님 개별 등록</h2>
							</header>
							<form id="form" action="/spamUser/oneAdd" method="post"	style="padding-top: 3%; padding-bottom: 3%;">
								<table border="1" width="300" align="center" height="250">
									<tr>
										<td>교번</td>
										<td>
											<input type="text" id="id" name="id" maxlength="10" onkeydown="return showKeyCode(event)" onkeyup='removeChar(event)' style="ime-mode:disabled;" /> 
											<input type="hidden" name="grade" value="0" />
										</td>
									</tr>
									<tr>
										<td>생년월일</td>
										<td>
											<input type="text" size="30" id="birthDate"	name="birthDate" maxlength="6" onkeydown="return showKeyCode(event)" onkeyup='removeChar(event)' style="ime-mode:disabled;" />
										</td>
									</tr>
									<tr>
										<td>이름</td>
										<td><input type="text" name="name" id="name" /></td>
									</tr>
									<tr>
										<td>학과</td>
										<td><input type="text" name="major" id="major" /></td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>
											<select name="phoneNo1" style="width: 10%;">
												<option value="010">010</option>
												<option value="016">016</option>
												<option value="011">011</option>
												<option value="070">070</option>
												<option value="041">041</option>
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="05">05</option>
											</select> - 
											<input type="text"  id="phoneNo2" size="6" name="phoneNo2" maxlength="4" onkeydown="return showKeyCode(event)" onkeyup='removeChar(event)' style="ime-mode:disabled; width: 42%" /> - 
											<input type="text" id="phoneNo3" size="6" name="phoneNo3" maxlength="4" onkeydown="return showKeyCode(event)" onkeyup='removeChar(event)' style="ime-mode:disabled; width: 42%" />
										</td>
									</tr>
									<tr>
										<td>사무실 위치</td>
										<td><input type="text" name="office" id="office" /></td>
									</tr>
									<tr>
										<td>상태</td>
										<td><select name="enrollment">
												<option value="6" selected="selected">재직</option>
												<option value="5">연구년</option>
												<option value="7">이직</option>
										</select></td>
									</tr>
								</table>
								<div style="text-align: center; padding-top: 10px; padding-left: 255px;">
									<input type="button" value="등록" onclick="formOnClick()" />
								</div>
								<div style="text-align: center; padding-top: 10px; padding-left: 10px;">
									<c:out value="교수님의 최초 비밀번호는 생년월일입니다. ex) 941004" />
								</div>
							</form>
					</section>
				</div>
			</div>
		</div>
		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			
	</form>
</body>
</html>