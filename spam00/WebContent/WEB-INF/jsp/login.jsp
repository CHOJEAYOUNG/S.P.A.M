<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="/css/ie/html5shiv.js"></script><![endif]-->
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/skel.min.js"></script>
<script src="/js/skel-layers.min.js"></script>
<script src="/js/init.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/skel.css" />
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
</head>
<body class="homepage">
	<form action="/login" method="POST">
		<!-- Header -->
		<div id="header">
			<div class="container">
				<!-- Logo -->
				<h1>
					<a href="/main" id="logo">S.P.A.M</a>
				</h1>

			</div>
		</div>
		<div id="main" class="wrapper style1">
			<section class="container"> <header class="major">
			<h2>로 그 인</h2>
			</header>
			<div style="text-align: center;">
				<table style="width: 100%;" border="1">
					<tr>
						<td><font size=5>아이디</font></td>
						<td><input type="text" name="id"
							style="height: 35px; border: 1px solid #000000; background-color: #ffffff; color: #000000;" />
						</td>
						<td rowspan="2"><input type="submit"  value="로그인" class="loginbtn alt" /></td>
					</tr>
					<tr>
						<td><font size=5>비밀번호</font></td>
						<td><input type="password" name="passWord"
							style="height: 35px; border: 1px solid #000000; background-color: #ffffff; color: #000000;" />
						</td>
					</tr>
					<tr>

					</tr>
				</table>


			</div>
			<div
				style="text-align: center; padding-top: 5%; padding-bottom: 15%;">
				※ 비밀번호 분실시 학과로 와서 찾아주세요</div>
			</section>
		</div>
	</form>
	<!-- Footer -->
		<%@ include file="../jsp/footer.jsp" %>
</body>
</html>