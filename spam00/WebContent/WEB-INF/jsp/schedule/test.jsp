<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<script type="text/javascript">
	function stuPopupOpen() {
		window.name = "ListForm";

		var option = "width=700, height=1700, resizable=no, scrollbars=yes, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
		openWin = window.open("/advice/searchE", "stuForm", option);
	}
	function strSplit(v) {
		var strArray = v.split('-');
		console.log(strArray[0] + ',' + strArray[1]);

		opener.document.getElementById("period").value = strArray[0]
		opener.document.getElementById("quarter").value = strArray[1]
		closeWin();
	}

	function closeWin() {
		window.self.close();
	}
	
	function edit() {
		
		
		formData = document.getElementById("form");
		var date = formData.elements['searchDate'].value;
		var split = date.split('/');
		var temp = split[2] + "-" + split[0] + "-" + split[1];
		formData.elements['searchDate'].value = temp;
		
		formData.submit();
	};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>학과 업무 관리 시스템</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/skel.min.js"></script>
<script src="/js/skel-layers.min.js"></script>
<script src="/js/init.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/style.css" />
</head>
<body id="main" class="wrapper style1">
	<h2 style="text-align: center;">상담 시간 선택</h2>
	<form action="/schedule/test" method="get" id="form" name="form">
		<table style="margin-left: 15%">
			<thead>
				<tr>
					<th
						style="width: 100px; text-align: center; background-color: #4C4639"><font
						color="#FFFFFF">교수</font></th>
					<td><input type="text" readonly="true" style="width: 300px;"
						id="name" name="name" maxlength="20" /></td>
				</tr>
				<th
					style="width: 100px; text-align: center; background-color: #4C4639"><font
					color="#FFFFFF">날짜</font></th>
				<td><input type="text" readonly="true" id="searchDate"
					name="searchDate" style="width: 200px;" /><input type="button"
					value="검색" onclick="edit();" style="width: 100px;" /></td>
				</tr>
			</thead>
		</table>
	</form>
	<c:if test="${nameCheck eq null}">
   ${message}   
      정보 입력 버튼 클릭하시오
   </c:if>
	<c:if test="${nameCheck ne null}">
		<c:forEach items="${mapSchedule}" var="map" varStatus="status">
			<c:if test="${map.value ne 'no'}">
				<table>
					<thead>
						<tr>
							<th
								style="width: 100px; text-align: center; background-color: #4C4639"><font
								color="#FFFFFF">교시-분기</font></th>
							<td><c:out value="${map.key}" /></td>
						</tr>
						<tr>
							<th
								style="width: 100px; text-align: center; background-color: #4C4639"><font
								color="#FFFFFF">불가 사유</font></th>
							<td><c:out value="${map.value}" /></td>
						</tr>
					</thead>
				</table>
			</c:if>
			<c:if test="${map.value eq 'no'}">
				<table>
					<thead>
						<tr>
							<th
								style="width: 100px; text-align: center; background-color: #4C4639"><font
								color="#FFFFFF">교시-분기</font></th>
							<td><c:out value="${map.key}" /></td>
						</tr>
						<tr>
							<th
								style="width: 100px; text-align: center; background-color: #4C4639"><font
								color="#FFFFFF">불가 사유</font></th>
							<td><input type="button" id="id" value="선택"
								onclick="strSplit('${map.key}');" /></td>
						</tr>
					</thead>
				</table>
			</c:if>
		</c:forEach>
	</c:if>
</body>
</html>