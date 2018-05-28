<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link type="text/css" rel="stylesheet" href="C:/Users/Lim/Desktop/templatemo_352_station_shop/templatemo_352_station_shop/index.html" media="screen"/>

<%
String power = "";
power = (String)session.getAttribute("power");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>취업 점수 목록 조회</title>
</head>
<script type="text/javascript">

function openWindow() {
	window.open(
		"select", 
		"open the window",
		"toolbar=no, width=500, height=500, top=150, left=150");
}

function openWindowS() {
	var myForm = document.S;
	 var url = "/employment/selectEmployment";
	 window.open("" ,"selectEmployment", 
	       "toolbar=no, width=540, height=467, directories=no, status=no,    scrollorbars=no, resizable=no"); 
	 myForm.action =url; 
	 myForm.method="post";
	 myForm.target="selectEmployment";
	 myForm.testVal = 'test';
	myForm.submit();
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
		<c:if test="${power ne 'S' }">
			검색 <input type="text" name="id" id="id"/>
			<input type="submit"value="검색"/>
		</c:if>
		<br><br><br>
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
								<c:forEach items="${ listCategory }" var="category" varStatus="status">
									<c:if test="${ employment.empcNo eq category.no}">
										<td style="text-align: center;">
											<c:out value="${category.name} (${category.info})"/>
										</td>
										<td style="text-align: center;">
											<c:out value="${category.score}"/>
										</td>
										<td style="text-align: center;">
											<c:if test="${ category.conditionSqeNo eq 1}">
												<c:out value="필수"/>										
											</c:if>
											<c:if test="${ category.conditionSqeNo eq 2}">
												<c:out value="선택"/>										
											</c:if>
										</td>
									</c:if>
								</c:forEach>				
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
						<td style="text-align: center;" colspan="7">
							학생을 검색해주세요.
						</td>
					</tr>
				</c:if>
			</thead>
		</table>
		<br><br><br>
		<c:if test="${power ne 'S' }">
			<div style="text-align: right; padding-top: 10px;">
				<a href="javascript:openWindow()">등록</a>
				<!-- 나는 <label id="baseWindowLabel" > base </label> -->
			</div>
		</c:if>
	</form>
	<c:if test="${power eq 'S' }">
		<form action="/employment/selectEmployment" method="post" name="S">
			<a href="javascript:openWindowS()">등록</a>
		</form>
	</c:if>
</body>
</html>