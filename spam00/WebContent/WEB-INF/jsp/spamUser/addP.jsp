<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자 개별등록</title>
</head>
<script type="text/javascript">
function editOnClick() {
	var special = "{}[]()<>?_|~`!@#$%^&*-+\"'\\/"
			
	var num1 = document.getElementById("phoneNo1").value
	var num2 = document.getElementById("phoneNo2").value
	var num3 = document.getElementById("phoneNo3").value
			
	var phoneNumber = num1 + num2 + num3

	
	for (var i = 0; i < phoneNumber.length; i++) {
		if (-1 != special.indexOf(phoneNumber.charAt(i))) {
			alert("전화번호에 특수문자는 입력 할 수 없습니다.");
			return;
		}
	}
	document.getElementById("edit").submit();
	return;
}
</script>
<body>
<form id="edit" action="/spamUser/oneAdd" method="post" style="padding-top: 3%; padding-bottom: 3%;">
		<table border="1" width="300" align="center" height="250" >
			<tr>
				<td>교번</td>
				<td>
					<input type="text" name="id" />
					<input type="hidden" name="grade"  value="0"/>
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" size="30" name="birthDate"
					maxlength="16" ></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name"/>
				</td>
			</tr>
			<tr>
				<td>학과</td>
				<td>
					<input type="text" name="major"/>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<select name="phoneNo1">
						<option value="010">010</option>
						<option value="016">016</option>
						<option value="011">011</option>
						<option value="070">070</option>
						<option value="041">041</option>
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="05">05</option>
					</select>
					-
					<input type="text" id="phoneNo2" size="6" name="phoneNo2" maxlength="4" onkeydown='return onlyNumber(event)' style='ime-mode:disabled;' /> - 
					<input type="text" id="phoneNo3" size="6" name="phoneNo3" maxlength="4" onkeydown='return onlyNumber(event)' style='ime-mode:disabled;' />
				</td>
			</tr>
			<tr>
				<td>사무실 위치</td>
				<td>
					<input type="text" name="office"/>
				</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>
					<select name="enrollment">
							<option value="6" selected="selected">재직</option>
							<option value="5">연구년</option>
							<option value="7">이직</option>
					</select>
				</td>
			</tr>
		</table>
		<div style="text-align: center; padding-top: 10px; padding-left: 255px; ">
			<input type="submit" value="등록" />
		</div>
			<div style="text-align: center; padding-top: 10px; padding-left: 10px; ">
				<c:out  value="교수님의 최초 비밀번호는 생년월일입니다. ex) 941004"/>
			</div>
	</form>
	<a href="/spamUser/list"> 
			<input	type="button" value="취소" />
	</a>
</body>
</html>