<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>취업 점수 목록 조회</title>
</head>
<script type="text/javascript">

function openWindow() {
	window.open(
		"select", 
		"open the window",
		"toolbar=no, width=500, height=500, top=150, left=150"
	);
}	
function check(){
	var str = document.getElementById('id');
    var blank_pattern = /^\s+|\s+$/g;

    if( str.value == '' || str.value == null ){
        alert( '값을 입력해주세요' );
        return false;
    } else if( str.value.replace( blank_pattern, '' ) == "" ){
        alert(' 공백만 입력되었습니다 ');
        return false;
    } else {
    	return true;
    }
    
}
function captureReturnKey(e) {
    if(e.keyCode==13 && e.srcElement.type != 'textarea')
    return false;
}


</script>
<body>
	<form action="/employment/list" method="GET" onkeydown="return captureReturnKey(event)" onsubmit="return check()">
		검색 <input type="text" name="id" id="id"/>
		<input type="submit"value="검색"/>
		<br><br><br>
		<%-- <c:if test="${!empty spamuser.id}">
			<input type="text" name="id" value="#{spamuser.id}" readonly="readonly" />
			<input type="text" name="id" value="#{spamuser.name}" readonly="readonly" />
			<input type="text" name="id" value="#{spamuser.empNo}" readonly="readonly" />
		</c:if> --%>
		 
		 <br>
		 <table style="width:100%" border="1">
			<thead>
				
				
				<c:if test="${ !empty listEmp}">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>점수</th>
					<th>조건</th>
					<th>등록일</th>
					<th>승인여부</th>
					<th>상세보기</th>
				</tr>
				
					<c:forEach items="${ listEmp }" var="employment" varStatus="status">
						<tr>
							<td style="text-align: center;">
								<c:out value="${status.count}"/>
							</td>
							<td style="text-align: center;">
								<c:out value="비교과 조회"/>
							</td>
							<td style="text-align: center;">
								<c:out value="점수 취, 비"/>
							</td>
							<td style="text-align: center;">
								<c:out value="조건 취, 비"/>
							</td>
							<td style="text-align: center;">
								<c:out value="${ employment.registration }"/>
							</td>
							<td style="text-align: center;">
								<c:if test="${ employment.assentNo eq 1}">
									<span style="color:blue">승인</span>
								</c:if>
								<c:if test="${ employment.assentNo eq 2}">
									<span style="color:green">대기</span>
								</c:if>
								<c:if test="${ employment.assentNo eq 3}">
									<span style="color:red">거절</span>
								</c:if>
							</td>
							<td style="text-align: center;">
								<a href="<c:url value="/employment/view/${employment.emplNo}"/>">
									<input type="button" value="상세보기"> 
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty listEmp}">
					<tr>
						<td style="text-align: center;" colspan="7"/>
							학생을 검색해주세요.
						</td>
					</tr>
				</c:if>
			</thead>
		</table>
		<br><br><br>
		<div style="text-align: right; padding-top: 10px;"> 
			<a href="javascript:openWindow()">등록</a>
			나는 <label id="baseWindowLabel" > base </label>
			<%-- <a href="<c:url value="/employment/add" />">
				<input type="button" name="add" value="등록" onclick="javascript:openWindow()"> 
			</a> --%>
		</div>
	</form>
</body>
</html>