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
		
		opener.document.getElementById("tue").value = test

		closeWin();

	});




});

function closeWin() {
	window.self.close();
}


</script>

<head>
<title>::: 호요일 교시 선택 :::</title>
</head>
<body>
		<input type="button" id="checkAll" value="전체선택" />

		<input type="button" id="uncheckAll" value="전채선택 해제" />

		<font color="RED"> ※ 해당 요일에 스케줄이 없을시 체크박스 미 체크후 선택 버튼을 누르시오</font>

	<div style="align: left;">
		<table style="width: 100%;" border="1">
			<thead>
				<tr>
					<th>교시</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>등록</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty listTimeTable}">
					<c:forEach items="${listTimeTable}" var="timeTable" varStatus="status">
						<tr>
							<td style="text-align: left;"><c:out value="${timeTable.period}" /></td>

							<td style="text-align: left;"><c:out value="${timeTable.beginHour}" />
							:<c:out value="${timeTable.beginMinutes}" />
							</td>
							<td style="text-align: left;"><c:out value="${timeTable.finishHour}" />
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
	<div style="align: center; width: 100px; height: 200; margin: auto;">
		<input type="button" id="getCheckedAll" value="선택" />
		<input type="button" id="button_ok" name="button_ok" value="닫기"
			onclick="closeWin();" />
	</div> 




</body>