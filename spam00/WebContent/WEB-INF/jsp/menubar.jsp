<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>학과 업무 관리 시스템</title>
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
<body>

	<c:if test = "${sessionScope.power eq 'A'}">
		<font color="#FFFFFF"><c:out value = "이름 : 조교 ${sessionScope.id}님"  /></font>
	</c:if>
	<c:if test = "${sessionScope.power eq 'P'}">
		<font color="#FFFFFF"><c:out value = "이름 : ${ sessionScope.name} 교수님"  /></font>
	</c:if>
	<c:if test = "${sessionScope.power eq 'S'}">
		<font color="#FFFFFF"><c:out value = "학번 : ${ sessionScope.id} 이름 : ${ sessionScope.name}"  /></font>
	</c:if>
	<a href="/logout" class="button alt">로 그 아 웃</a> 

</body>
</html>