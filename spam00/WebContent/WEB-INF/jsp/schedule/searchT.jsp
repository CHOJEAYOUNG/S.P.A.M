<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {


	// 체크 박스 모두 체크

	$("#checkAll").click(function() {

		$("input[name=box]:checkbox").each(function() {

			$(this).prop("checked", true);

		});

	});


	// 체크 박스 모두 해제

	$("#uncheckAll").click(function() {

		$("input[name=box]:checkbox").each(function() {

			$(this).prop("checked", false);

		});

	});


	// 체크 되어 있는 값 추출

	$("#getCheckedAll").click(function() {
		var test='0';
		$("input[name=box]:checked").each(function() {
			if(test == '0'){
				test = $(this).val();
			}else{
			test = test +","+ $(this).val();
			}
			

		});
		
		opener.document.getElementById("mon").value = test

		closeWin();

	});




});

function closeWin() {
	window.self.close();
}


</script>

<head>
<title>::: 월요일 교시 선택 :::</title>
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
		<input type="button" id="checkAll" value="전체선택" />

		<input type="button" id="uncheckAll" value="전채선택 해제" />

		<font color="RED"> ※ 해당 요일에 스케줄이 없을시 체크박스 미 체크후 선택 버튼을 누르시오</font>

	<div style="align: center;">
		<table style="width: 100%;" border="1">
			<thead>
				<tr bgcolor="#4C4639">
					<th style="text-align: center; width: 35px;"><font color="#FFFFFF">교시</font></th>
					<th style="text-align: center; width: 35px;"><font color="#FFFFFF">시작시간</font></th>
					<th style="text-align: center; width: 35px;"><font color="#FFFFFF">종료시간</font></th>
					<th style="text-align: center; width: 35px;"><font color="#FFFFFF">등록</font></th>
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
							<td style="text-align: center;">		
							<input type="checkbox" name="box" value="${timeTable.period}" />
							</td>
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
	<div style="text-align: center; margin: auto;">
		<input type="button" id="getCheckedAll" value="선택" />
		<input type="button" id="button_ok" name="button_ok" value="닫기"
			onclick="closeWin();" />
	</div> 




</body>