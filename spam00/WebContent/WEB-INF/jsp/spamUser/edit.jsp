<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<% 
	String power = (String)session.getAttribute("power");
%>
<html>
<head>
<script type="text/javascript">
	//입력하지 않은 곳과 전화번호에 특수문자 방지
	function formOnClick() {
		var id = document.getElementById('id').value;
		var password = document.getElementById("password").value
		var name = document.getElementById('name').value;
		var grade = document.getElementById('grade').value;
		var major = document.getElementById('major').value;
		var num2 = document.getElementById("phoneNo2").value
		var num3 = document.getElementById("phoneNo3").value
		if (!id) {
			alert("학번을 입력하지 않았습니다!");
			return;
		}
		if (!password) {
			alert("비밀번호를 입력하지 않았습니다!");
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
		var special = "{}[]()<>?_|~`!@#$%^&*-+\"'\\/"
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
	function formOnClick2() {
		var id = document.getElementById('id').value;
		var password = document.getElementById("password").value
		var name = document.getElementById('name').value;
		var major = document.getElementById('major').value;
		var num2 = document.getElementById("phoneNo2").value
		var num3 = document.getElementById("phoneNo3").value
		var office = document.getElementById('office').value;
		if (!id) {
			alert("교번을 입력하지 않았습니다!");
			return;
		}
		if (!password) {
			alert("비밀번호를 입력하지 않았습니다!");
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
	//숫자만 입력(한영키 못막음)=학년입력전용
	function showKeyCode2(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( ( keyID >=49 && keyID <= 55 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 )
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
	function aalert() {
		alert("비밀번호를 수정해주세요!");
	}
</script>
		<c:if test="${sessionScope.isLogin}"> 
		      <div style="text-align: right;">
		         <%@ include file="/WEB-INF/jsp/menubar.jsp" %>
		      </div>
		 </c:if>
</head>
<c:if test="${sam eq '1'}" >
<body class="left-sidebar" onload="aalert()">
</c:if>
<c:if test="${!(sam eq '1')}" >
<body class="left-sidebar" >
</c:if>	
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
											<li><a href="/spamUser/listEdit">학생 학년 일괄 변경</a></li>
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
								<h2>정보 수정</h2>
							</header>
				<form id="form" action="/spamUser/edit" method="post" style="padding-top: 3%; padding-bottom: 3%;">
				<table style="margin-left: 15%;">
					<thead>
						<tr>
							<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">아이디</font></th>
							<td>
								<c:out value="${spamuser.id}" />
								<input type="hidden" name="id" value="${spamuser.id}" id="id"/>
							</td>
						</tr>
						<tr>
							<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">비밀번호</font></th>
							<td><input type="password" name="passWord"
								maxlength="16" value="${spamuser.passWord}" id="password" size="10" style="ime-mode:disabled; width:300px; border: 2;"  ></td>
						</tr>
						<tr>
							<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">이름</font></th>
							<td>
								<c:if test="${!(spamuser.power eq 'A')}" >
									<c:out value="${spamuser.name}" />
									<input type="hidden" name="name" value="${spamuser.name}" id="name"/>
								</c:if>
								<c:if test="${spamuser.power eq 'A'}" >
									<input type="text" name="name" maxlength="60" value = "${spamuser.name}" id="name" style="width: 300px;"/>
								</c:if>
							</td>
						</tr>
						<c:if test="${sessionScope.power eq 'A'}" >
							<c:if test="${spamuser.power eq 'S'}" >
								<tr>
									<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">학년</font></th>
									<td>
										<input type="text" name="grade" id="grade" value = "${spamuser.grade}" maxlength="1" onkeydown="return showKeyCode2(event)" onkeyup='removeChar(event)' style="ime-mode:disabled; width:300px;" />
									</td>
								</tr>
							</c:if>
							<c:if test="${spamuser.power eq 'P'}" >
								<input type="hidden" name="grade" value = "0"/>
							</c:if>
						</c:if>
						<c:if test="${sessionScope.power eq 'S'}" >
							<tr>
								<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">학년</font></th>
								<td>
									<c:out value="${spamuser.grade}" />
									<input type="hidden" name="grade" id="grade" value = "${spamuser.grade}"  />
								</td>
							</tr>
						</c:if>
						<tr>
							<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">학과</font></th>
							<td>
								<input type="text" name="major" id="major" value = "${spamuser.major}"  style="width:300px;"/>
							</td>
						</tr>
						<tr>
							<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">전화번호</font></th>
							<td>
								<select name="phoneNo1" style="width:60px;">
								<c:if test="${spamuser.phoneNo1 eq '010'}" >
									<option value="010" selected="selected">010</option>
								</c:if>
								<c:if test="${!(spamuser.phoneNo1 eq '010')}" >
									<option value="010">010</option>
								</c:if>
								<c:if test="${spamuser.phoneNo1 eq '016'}" >
									<option value="016" selected="selected">016</option>
								</c:if>
								<c:if test="${!(spamuser.phoneNo1 eq '016')}" >
									<option value="016">016</option>
								</c:if>
								<c:if test="${spamuser.phoneNo1 eq '011'}" >
									<option value="011" selected="selected">011</option>
								</c:if>
								<c:if test="${!(spamuser.phoneNo1 eq '011')}" >
									<option value="011">011</option>
								</c:if>
								<c:if test="${spamuser.phoneNo1 eq '070'}" >
									<option value="070" selected="selected">070</option>
								</c:if>
								<c:if test="${!(spamuser.phoneNo1 eq '070')}" >
									<option value="070">070</option>
								</c:if>
								<c:if test="${spamuser.phoneNo1 eq '041'}" >
									<option value="041" selected="selected">041</option>
								</c:if>
								<c:if test="${!(spamuser.phoneNo1 eq '041')}" >
									<option value="041">041</option>
								</c:if>
								<c:if test="${spamuser.phoneNo1 eq '02'}" >
									<option value="02" selected="selected">02</option>
								</c:if>
								<c:if test="${!(spamuser.phoneNo1 eq '02')}" >
									<option value="02">02</option>
								</c:if>
								<c:if test="${spamuser.phoneNo1 eq '031'}" >
									<option value="031" selected="selected">031</option>
								</c:if>
								<c:if test="${!(spamuser.phoneNo1 eq '031')}" >
									<option value="031">031</option>
								</c:if>
								<c:if test="${spamuser.phoneNo1 eq '05'}" >
									<option value="05" selected="selected">05</option>
								</c:if>
								<c:if test="${!(spamuser.phoneNo1 eq '05')}" >
									<option value="05" >05</option>
								</c:if>
								</select>
								-
								<input type="text" id="phoneNo2" size="6" name="phoneNo2" maxlength="4" value="${spamuser.phoneNo2}" onkeydown="return showKeyCode(event)" onkeyup='removeChar(event)' style="ime-mode:disabled; width: 104px;" /> - 
								<input type="text" id="phoneNo3" size="6" name="phoneNo3" maxlength="4" value="${spamuser.phoneNo3}" onkeydown="return showKeyCode(event)" onkeyup='removeChar(event)' style="ime-mode:disabled; width: 104px;" />
							</td>
						</tr>
						<c:if test="${!(sessionScope.power eq 'S')}" >
							<c:if test="${!(spamuser.power eq 'S')}" >
								<tr>
									<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">사무실 위치</font></th>
									<td>
										<input type="text" id="office" name="office" maxlength="60" value = "${spamuser.office}" style="width: 300px;"/>
									</td>
								</tr>
							</c:if>
						</c:if>
						<tr>
							<c:if test="${sessionScope.power eq 'A'}" >
							<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">상태</font></th>
							<td>
							<c:if test="${(spamuser.power eq 'S')}" >
								<select name="enrollment" style="width:300px;">
									<c:if test="${spamuser.enrollment eq '1'}" >
										<option value="1" selected="selected">재학</option>
									</c:if>
									<c:if test="${!(spamuser.enrollment eq '1')}" >
										<option value="1">재학</option>
									</c:if>
									<c:if test="${spamuser.enrollment eq '2'}" >
										<option value="2" selected="selected">휴학</option>
									</c:if>
									<c:if test="${!(spamuser.enrollment eq '2')}" >
										<option value="2">휴학</option>
									</c:if>
									<c:if test="${spamuser.enrollment eq '3'}" >
										<option value="3" selected="selected">자퇴</option>
									</c:if>
									<c:if test="${!(spamuser.enrollment eq '3')}" >
										<option value="3">자퇴</option>
									</c:if>
									<c:if test="${spamuser.enrollment eq '4'}" >
										<option value="4" selected="selected">졸업</option>
									</c:if>
									<c:if test="${!(spamuser.enrollment eq '4')}" >
										<option value="4">졸업</option>
									</c:if>
								</select>
							</c:if>
								
							<c:if test="${!(spamuser.power eq 'S')}" >
								<select name="enrollment" style="width:300px;">
									<c:if test="${spamuser.enrollment eq '5'}" >
										<option value="5" selected="selected">연구년</option>
									</c:if>
									<c:if test="${!(spamuser.enrollment eq '5')}" >
										<option value="5">연구년</option>
									</c:if>
									<c:if test="${spamuser.enrollment eq '6'}" >
										<option value="6" selected="selected">재직</option>
									</c:if>
									<c:if test="${!(spamuser.enrollment eq '6')}" >
										<option value="6">재직</option>
									</c:if>
									<c:if test="${spamuser.enrollment eq '7'}" >
										<option value="7" selected="selected">이직</option>
									</c:if>
									<c:if test="${!(spamuser.enrollment eq '7')}" >
										<option value="7">이직</option>
									</c:if>
								</select>
							</c:if>
							</td>
							</c:if>
						</tr>
						<c:if test="${spamuser.power eq 'S'}" >
							<tr>
								<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">취업 유형</font></th>
								<td>
									<select name="empNo" style="width:300px;">
										<c:forEach items="${ listEmp }" var="employmentType" varStatus="status">
											<c:if test="${employmentType.no eq spamuser.empNo}"> 
												<option value="${ employmentType.no }" selected="selected" >${ employmentType.name }</option>
											</c:if>
											<c:if test="${!(employmentType.no eq spamuser.grNo)}"> 
												<option value="${ employmentType.no }">${ employmentType.name }</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:if>
						<c:if test="${spamuser.power eq 'S'}" >
							<tr>
								<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">졸업 유형</font></th>
								<td>
									<select name="grNo" style="width:300px;">
										<c:forEach items="${ listGr }" var="grType" varStatus="status">
											<c:if test="${grType.no eq spamuser.grNo}"> 
												<option value="${ grType.no }" selected="selected" >${ grType.name }</option>
											</c:if>
											<c:if test="${grType.no eq spamuser.grNo}"> 
												<option value="${ grType.no }"  >${ grType.name }</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:if>
						<c:if test="${(sessionScope.power eq 'A')}" >
							<c:if test="${(spamuser.power eq 'S')}" >
								<tr>
									<th style="width: 100px; text-align: center; background-color:#4C4639"><font color="#FFFFFF">카드 번호</font></th>
									<td>
										<input type="text" name="cardNo" maxlength="60" value = "${spamuser.cardNo}" style="width: 300px;" />
									</td>
								</tr>
							</c:if>
						</c:if>
					</table>
					<div style="text-align: center; padding-top: 10px;">
						<c:if test="${spamuser.power eq 'S'}">
							<input type="button" value="수정" onclick="formOnClick()" />
						</c:if>
						<c:if test="${spamuser.power eq 'P'}">
							<input type="button" value="수정" onclick="formOnClick2()" />
						</c:if>
						<c:if test="${spamuser.power eq 'A'}">
							<input type="button" value="수정" onclick="formOnClick2()" />
						</c:if>
					</div>
					</form>
						</section>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			
</body>
</html>