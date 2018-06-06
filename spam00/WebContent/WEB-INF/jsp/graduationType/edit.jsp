<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String power = "";
power = (String)session.getAttribute("power");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>취업 점수 목록 조회</title>
</head>
<%
	int year, yearMin, yearMax;
	int yearResult, yearCount;
	int month;
	int date;
	List<String> yearList = new ArrayList<String>();
	Calendar now = Calendar.getInstance();
	year = now.get(Calendar.YEAR);
	month = now.get(Calendar.MONTH)+1;
	date = now.get(Calendar.DATE);
	yearMin = now.get(Calendar.YEAR) - 10; // 현재 연도 - 10
	yearMax = now.get(Calendar.YEAR); // 최대 연도
	yearCount = yearMax - yearMin;
%>

<html  disable-url-rewriting="true">
<script type="text/javascript">
function checkNull() {
	var name = document.getElementById('name').value;
	
	if(!name) {
		alert("유형명을 입력해주세요.");
		return false;
	}
	return true;
}

function setAlpha(obj) {
	val = obj.value;
	re = /[^a-zA-Z]/gi;
	obj.value = val.replace(re,"");
}
</script>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<c:if test="${sessionScope.isLogin}"> 
		      <div style="text-align: right;">
		         <%@ include file="/WEB-INF/jsp/menubar.jsp" %>
		      </div>
		 </c:if>
	</head>
	<body class="left-sidebar">

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
									<section class="8u">
										<ul class="default">
											<li><a href="/graduation/list">졸업 점수</a></li>
											<c:if test="${power eq 'A' }">
												<li><a href="/graduationCategory/list">졸업 카테고리</a></li>
												<li><a href="/graduationType/list">졸업 유형</a></li>
											</c:if>
										</ul>
									</section>
								</div>
							</section>
						</div>
						
						<!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header class="major">
									<form action="/graduationType/edit" method="POST">
										유  형 <input type="text" id="name" name="name" value="${type.name}" style="width:300px;" maxlength="1"  onkeyup='setAlpha(this)'  style="ime-mode:disabled;" placeholder="       영어 한글자"/>${checkName}<br>
										<input type="hidden" name="no" value="${type.no}"/>
										연  도 <select name="year">
										<%-- // 연도선택을 위한 연도출력을 동적으로 변경 --%>
											<%yearResult = yearMin;
								
											for(int i=0; yearResult<=yearMax; i++) { %>
								
											<option value=<%=yearResult%> <% if(year == yearResult){%>selected="selected"<%} %> ><%=yearResult%></option>
								
											<%String.valueOf(yearResult++); } %>
								
										</select> <br>
										<div style="text-align: right;">
											<input type="submit" value="수정" onclick="return checkNull()"/>
											<a href="/graduationType/list"><input type="button" value="취소" /></a>
										</div>
									</form>
								</header>
							</section>
						</div>
					
					</div>
				</div>
			</div>

		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			
	</body>
</html>