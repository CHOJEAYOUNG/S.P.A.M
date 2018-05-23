<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SPAM 로그인</title>
</head>
<body>
	<div style="text-align: center; padding-top: 15%; ">
		<form action="/login" method="POST">
			<font size=5>&nbsp;아이디&nbsp;</font> <input type="text" name="id" style="height: 50px;" size=50 /><br> <font size=5>비밀번호</font>
			<input type="password" name="passWord" style="height: 50px;" size=50 /> <br> <input type="submit" value="로그인" />
		</form>
	</div>
	<div style="text-align: center; padding-top: 5%; padding-bottom: 15%; ">
		※ 비밀번호 분실시 학과로 와서 찾아주세요
	</div>
</body>
</html>