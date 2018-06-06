<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.*"%>
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
<script type="text/javascript">
function showDiv( id,check ) {
	if(check=='s') {
		document.all[ id ].style.visibility = 'visible';	
	} else {
    document.all.cause.style.visibility = 'hidden'; 
	}
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
									<form action="/graduation/edit" method="post">
										<input type="hidden" name="grlNo" value="${graduation.grlNo}" style="width:200px; background-color: #e2e2e2;" >
										학번 <input type="text" name="id" value="${spamuser.id}" readOnly="readonly" style="width:200px; background-color: #e2e2e2;"  />
										이름 <input type="text" name="nameS" value="${spamuser.name}" readOnly="readonly" style="width:200px; background-color: #e2e2e2;" />
									 	졸업 유형<input type="text" name="grNo" value="${graduationType.name}" readOnly="readonly" style="width:200px; background-color: #e2e2e2;" /> <br>
										제목 <input type="text" name="nameC" value="${category.name}" readOnly="readonly" style="width:200px; background-color: #e2e2e2;" />
										조건 
										<c:if test="${category.conditionSqeNo eq 1}">
											<input type="text" name="conditionSqeNo" value="필수" readOnly="readonly" checked="checked" style="width:200px; background-color: #e2e2e2;" />
										</c:if>
										<c:if test="${category.conditionSqeNo eq 2}">
											<input type="text" name="conditionSqeNo" value="선택" readOnly="readonly" style="width:200px; background-color: #e2e2e2;" />
										</c:if>
										등록일<input type="text" name="registration" value="${graduation.registration}" readOnly="readonly" style="width:200px; background-color: #e2e2e2;" />
										<br>
										상세 정보  <input type="text" name="info" value="${category.info} " readOnly="readonly" style="background-color: #e2e2e2;" />
										파일명
										<c:if test="${ notfound eq 'N'}"><span style="color: red;">파일이 존재하지 않습니다.</span></c:if>
										 <c:if test="${ notfound ne 'N'}"><a href="<c:out value = "/graduation/download/${graduation.grlNo}"/>">${graduation.originalName}</a></c:if>
										<br>
										승인 여부
										<c:if test="${ graduation.assentNo eq 1}">
											<span style="color:blue">승인</span>
											${graduation.assentDate}
										</c:if>
										
										<c:if test="${ graduation.assentNo eq 2}">
											<c:if test="${power ne 'A'}">
												<span style="color:green">대기</span>
											</c:if>
											<c:if test="${power eq 'A' }">
												<input type="radio" name="assentNo" value="1" checked="checked" onClick="showDiv( 'cause','h' );"/> 승인
												<input type="radio" name="assentNo" value="3" onClick="showDiv( 'cause','s' );"/> 거절
												<br>
												<textarea rows="1" cols="15" name="cause" placeholder="거절사유" style="visibility:hidden"></textarea> <br>
												<div style="text-align: right;">
													<input type="submit" value="완료">
													<a href="/graduation/list"><input type="button" value="목록"/></a>
												</div>
											</c:if>
										</c:if>
										
										<c:if test="${ graduation.assentNo eq 3}">
											<span style="color:red">거절</span>
											${graduation.assentDate} <br>
											거절사유 <br>
											<textarea rows="1" cols="15" name="cause" readonly="readonly">${graduation.cause}</textarea> <br>
										</c:if> <br>
										<c:if test="${power eq 'S' && graduation.assentNo ne 1}">
											<div style="text-align: right;">
												<a href="/graduation/remove/${graduation.grlNo}"><input type="button" value="삭제"/></a>
												<a href="/graduation/list"><input type="button" value="목록"/></a>
											</div>
										</c:if>
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