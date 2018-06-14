<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function setNameText(v) {
	opener.document.getElementById("name").value = v

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

<body id="main" class="wrapper style1">
	<div style="align: center; width: 275px; height: 200; margin: auto;">
		 <h2>교수님 선택</h2>
		<form action="/advice/searchE" method="get">
			<table style="border_color: white; align: center;">
				<tr>
					<td><input type="text" id="keyword" name="keyword" placeholder="이름"/></td>
					<td><input type="submit" value="검색" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div style="align: left;">
		<table style="width: 100%;" border="1">
			<thead>
				<tr bgcolor="#4C4639">
					<th style="width: 40px; text-align: center;">
						<font color="#FFFFFF">번호</font></th>
					<th style="width: 40px; text-align: center;">
						<font color="#FFFFFF">이름</font></th>
					<th style="width: 40px; text-align: center;">
						<font color="#FFFFFF">위치</font></th>
					<th style="width: 40px; text-align: center;">
						<font color="#FFFFFF">등록</font></th>
					
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty listSpam}">
					<c:forEach items="${listSpam}" var="spam" varStatus="status">
						<tr>
							<td style="text-align: center;"><c:out
									value="${status.count}" /></td>

							<td style="text-align: left;"><c:out value="${spam.name}" /></td>

							<td style="text-align: left;"><c:out value="${spam.office}" /></td>
							
							<td style="text-align: center;"><input type="button"
								id="name" name="name" value="선택"
								onclick="setNameText('${spam.name}');" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty listSpam}">
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
