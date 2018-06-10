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
<title>::: 사용자 검색 :::</title>
</head>
<body>
	<div style="align: center; width: 275px; height: 200; margin: auto;">
		<form action="/advice/searchE" method="get">
			<table style="border_color: white; align: center;">
				<tr>
					<td>이름</td>
					<td><input type="text" id="keyword" name="keyword" /></td>
					<td><input type="submit" value="검색" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div style="align: left;">
		<table style="width: 100%;" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>위치</th>
					<th>등록</th>
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
