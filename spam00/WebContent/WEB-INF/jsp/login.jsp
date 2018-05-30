<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
</head>
<body class="homepage">
	<form action="/login" method="POST">
		<!-- Header -->
		<div id="header">
			<div class="container">
				<!-- Logo -->
				<h1>
					<a href="#" id="logo">Horizons</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="">Dropdown</a>
						<ul>
							<li><a href="#">Lorem ipsum dolor</a></li>
							<li><a href="#">Magna phasellus</a></li>
							<li><a href="#">Etiam dolore nisl</a></li>
							<li><a href="">Phasellus consequat</a>
								<ul>
									<li><a href="#">Lorem ipsum dolor</a></li>
									<li><a href="#">Phasellus consequat</a></li>
									<li><a href="#">Magna phasellus</a></li>
									<li><a href="#">Etiam dolore nisl</a></li>
									<li><a href="#">Veroeros feugiat</a></li>
								</ul></li>
							<li><a href="#">Veroeros feugiat</a></li>
						</ul></li>
					<li><a href="left-sidebar.html">Left Sidebar</a></li>
					<li><a href="right-sidebar.html">Right Sidebar</a></li>
					<li><a href="no-sidebar.html">No Sidebar</a></li>
				</ul>
				</nav>
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
						<td rowspan="2"><input type="submit" value="로그인" /></td>
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
	<div id="footer">
		<div class="container">

			<!-- Lists -->
			<div class="row">
				<div class="8u">
					<section> <header class="major">
					<h2>Donec dictum metus</h2>
					<span class="byline">Quisque semper augue mattis wisi
						maecenas ligula</span> </header>
					<div class="row">
						<section class="6u">
						<ul class="default">
							<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
							<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
							<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
							<li><a href="#">Cras vitae metus aliquam pharetra.</a></li>
						</ul>
						</section>
						<section class="6u">
						<ul class="default">
							<li><a href="#">Pellentesque elit non gravida blandit.</a></li>
							<li><a href="#">Lorem ipsum dolor consectetuer elit.</a></li>
							<li><a href="#">Phasellus nibh pellentesque congue.</a></li>
							<li><a href="#">Cras vitae metus aliquam pharetra.</a></li>
						</ul>
						</section>
					</div>
					</section>
				</div>
				<div class="4u">
					<section> <header class="major">
					<h2>Donec dictum metus</h2>
					<span class="byline">Mattis wisi maecenas ligula</span> </header>
					<ul class="contact">
						<li><span class="address">Address</span> <span>1234
								Somewhere Road #4285 <br />Nashville, TN 00000
						</span></li>
						<li><span class="mail">Mail</span> <span><a href="#">someone@untitled.tld</a></span>
						</li>
						<li><span class="phone">Phone</span> <span>(000)
								000-0000</span></li>
					</ul>
					</section>
				</div>
			</div>

			<!-- Copyright -->
			<div class="copyright">
				Design: <a href="http://templated.co">TEMPLATED</a> Images: <a
					href="http://unsplash.com">Unsplash</a> (<a
					href="http://unsplash.com/cc0">CC0</a>)
			</div>
		</div>
	</div>
</body>
</html>