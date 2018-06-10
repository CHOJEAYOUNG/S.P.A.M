<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function fileCheck() {
	var radio = document.getElementsByName('empcNo');
	var file = document.getElementById("file");
	var fileName = file.value;
	var id = null;
	for(var i = 0 ; i < radio.length; i++) {
		if(radio[i].checked == true) {
			id = radio[i].value;
		}
	}
	
	if(id == null) {
		alert("취업 카테고리를 선택하세요");
		return false;
	} 
	
	if (fileName == "") {
		alert('파일을 선택해주세요.');
		return false;
	}
	
	if (fileName.split('.').pop() == "exe") {
		alert('exe 파일은 불가합니다.');
		category.value = "";
		file.value = "";
		return false;
	}
	return true;
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<!--
	Horizons by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->

	<head>
		<title>학과 업무 관리 시스템</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<script src="/js/jquery.min.js"></script>
		<script src="/js/jquery.dropotron.min.js"></script>
		<script src="/js/skel.min.js"></script>
		<script src="/js/skel-layers.min.js"></script>
		<script src="/js/init.js"></script>
    	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->
	</head>
	<body  id="main" class="wrapper style1">
		<div style="text-align: center;">
			<h2>취업 선택</h2>
		</div>
		<form action="/employment/add" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${user.id}"/>
			<input type="hidden" name="name" value="${user.name}"/>
			<table style="width:100%" border="1">
				<thead>
					<tr bgcolor="#4C4639">
						<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">선택</font></th>
						<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">카테고리 명</font></th>
						<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">유형</font></th>
						<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">조건</font></th>
						<th style="width: 40px; text-align: center;"><font
												color="#FFFFFF">점수</font></th>
					</tr>
					
	 				<c:if test="${ !empty listCategory}">
						<c:forEach items="${ listCategory }" var="employmentCategory" varStatus="status">
							<c:if test="${employmentCategory.state eq 'Y'}">
								<tr>
									<td style="text-align: center;">
											<input type="radio" id="empcNo" name="empcNo" value="${ employmentCategory.no }"> 
										</td>
									<td style="text-align: center;">
										<c:out value="${ employmentCategory.name }"/>
									</td>
									<td style="text-align: center;">
										<c:forEach items="${ listType }" var="employmentType" varStatus="status">
											<c:if test="${employmentType.no eq employmentCategory.empTypeNo}">
												<c:out value="${employmentType.name}"/>
											</c:if>
										</c:forEach>
									</td>
									<td style="text-align: center;">
										<c:if test="${employmentCategory.conditionSqeNo eq 1}">
											<c:out value="필수"/>
										</c:if>
										<c:if test="${employmentCategory.conditionSqeNo eq 2}">
											<c:out value="선택"/>
										</c:if>
									</td>
									<td style="text-align: center;">
										<c:out value="${ employmentCategory.score }"/>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${empty listCategory}">
						<tr>
							<td style="text-align: center;" colspan="7">
								목록이 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
				</thead>
			</table>
			<h2>파일 업로드</h2>
			<input type="file" id="file" name="file" />
			<input type="submit" value="완료" onclick="return fileCheck()"/>
		</form>
	</body>
</html>