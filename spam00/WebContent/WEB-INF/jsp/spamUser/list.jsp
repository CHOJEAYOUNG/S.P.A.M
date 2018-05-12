<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SPAM 로그인</title>
</head>
<body>
	<div style="overflow:auto; width:100%; height:500px; padding-bottom:5%; ">
		<table style="width: 100%" border="1">
			<thead>
				<tr bgcolor="#4C4639" >
					<th style="width: 35px;"><font color="#FFFFFF">번호</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">학번</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">이름</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">학년</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">학과</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">신분</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">상태</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">보기</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">수정</font></th>
				</tr>
				<c:if test="${ !empty listSpam}">
					<c:forEach items="${ listSpam }" var="spamUser" varStatus="status">
					<tr>
						<td style="text-align: left; width: 35px;">
							<c:out value="${ status.count }"/>
						</td>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamUser.id }"/>
						</td>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamUser.name }"/>
						</td>
						<c:if test="${ spamUser.power eq 'S'}">
							<td style="text-align: left; width: 100px;">
								<c:out value="${ spamUser.grade }"/>
							</td>
						</c:if>
						<c:if test="${ !(spamUser.power eq 'S')}">
							<td style="text-align: left; width: 100px;">
								-
							</td>
						</c:if>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamUser.major }"/>
						</td>
						<c:if test="${ spamUser.power eq 'A' }">
							<td style="text-align: left; width: 100px;">
								조교
							</td>
						</c:if>
						<c:if test="${ spamUser.power eq 'P' }">
							<td style="text-align: left; width: 100px;">
								교수
							</td>
						</c:if>
						<c:if test="${ spamUser.power eq 'S' }">
							<td style="text-align: left; width: 100px;">
								학생
							</td>
						</c:if>
						<c:forEach items="${ enrollment }" var="enrollment" varStatus="status">
							<c:if test="${enrollment.enrollmentNo eq spamUser.enrollment}">
								<td style="text-align: left; width: 100px;">
										<c:out value="${ enrollment.enrollmentContent }"/>
								</td>
							</c:if>
						</c:forEach>
						<td style="text-align: center;"><a
							href="<c:url value="/spamUser/viewPA/${spamUser.id}" /> "> <input
								type="button" value="상세보기" />
						</a></td>
						<td style="text-align: center;"><a
							href="<c:url value="/spamUser/edit/${spamUser.id}" /> "> <input
								type="button" value="수정" />
						</a></td>
					</tr>
					</c:forEach>
				</c:if>
			</thead>
		</table>
	</div>
</body>
</html>