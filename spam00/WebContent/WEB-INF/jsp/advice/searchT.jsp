<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function setTimeTalbeText(v) {
	opener.document.getElementById("period").value = v

	closeWin();
}

function closeWin() {
	window.self.close();
}
</script>
<head>
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
       <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
</head>
<body  id="main" class="wrapper style1">
	<h2 style="text-align: center;">시간표 선택</h2>
	<div style="align: left;">
		<table style="width: 100%;" border="1">
			<thead>
				<tr bgcolor="#4C4639">
					<th style="width: 20px; text-align: center;">
						<font color="#FFFFFF">교시</font></th>
					<th style="width: 20px; text-align: center;">
						<font color="#FFFFFF">시작시간</font></th>
					<th style="width: 20px; text-align: center;">
						<font color="#FFFFFF">종료시간</font></th>
					<th style="width: 20px; text-align: center;">
						<font color="#FFFFFF">등록</font></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty listTimeTable}">
					<c:forEach items="${listTimeTable}" var="timeTable" varStatus="status">
						<tr>
							<td style="text-align: center;"><c:out value="${timeTable.period}" /></td>

							<td style="text-align: center;"><c:out value="${timeTable.beginHour}" />
							:<c:out value="${timeTable.beginMinutes}" />
							</td>
							<td style="text-align: center;"><c:out value="${timeTable.finishHour}" />
							:<c:out value="${timeTable.finishMinutes}" />
							</td>

							<td style="text-align: center;"><input type="button"
								id="id" name="id" value="선택"
								onclick="setTimeTalbeText(${timeTable.period});" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty listTimeTable}">
					<tr>
						<td style="text-align: center;" colspan="5">목록이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<div style="align: center; width: 100px; height: 200; margin: auto;">
		<input type="button" id="button_ok" name="button_ok" value="닫기"
			onclick="closeWin();" />
	</div> 

</body>
