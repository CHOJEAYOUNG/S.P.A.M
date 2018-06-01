<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해당 사용자 보기</title>
</head>
<body>
	<div style="overflow:auto; width:100%; height:500px; padding-bottom:5%; ">
		<table style="width: 100%" border="1">
			<thead>
				<tr bgcolor="#4C4639" > 
					<th style="width: 100px;"><font color="#FFFFFF">아이디</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">신분</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">이름</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">학년</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">학과</font></th>
					<th style="width: 100px;"><font color="#FFFFFF">전화번호</font></th>
					<c:if test="${ spamuser.power eq 'S' }">
						<th style="width: 100px;"><font color="#FFFFFF">생년월일</font></th>
					</c:if>
					<c:if test="${ spamuser.power eq 'P' }">
						<th style="width: 100px;"><font color="#FFFFFF">사무실 위치</font></th>
					</c:if>
					<c:if test="${ spamuser.power eq 'S' }">
						<th style="width: 100px;"><font color="#FFFFFF">취업유형</font></th>
						<th style="width: 100px;"><font color="#FFFFFF">졸업유형</font></th>
					</c:if>
					<th style="width: 100px;"><font color="#FFFFFF">상태</font></th>
				</tr>
				<c:if test="${ !empty spamuser}">
					<tr>
						<td style="text-align: left; width: 100px;">
							<c:out value="${spamuser.id}"/>
						</td>
						<c:if test="${ spamuser.power eq 'A' }">
							<td style="text-align: left; width: 100px;">
								조교
							</td>
						</c:if>
						<c:if test="${ spamuser.power eq 'P' }">
							<td style="text-align: left; width: 100px;">
								교수
							</td>
						</c:if>
						<c:if test="${ spamuser.power eq 'S' }">
							<td style="text-align: left; width: 100px;">
								학생
							</td>
						</c:if>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamuser.name }"/>
						</td>
						<c:if test="${ spamuser.power eq 'S'}">
							<td style="text-align: left; width: 100px;">
								<c:out value="${ spamuser.grade }"/>
							</td>
						</c:if>
						<c:if test="${ !(spamuser.power eq 'S')}">
							<td style="text-align: left; width: 100px;">
								-
							</td>
						</c:if>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamuser.major }"/>
						</td>
						<td style="text-align: left; width: 100px;">
							<c:out value="${ spamuser.phoneNo }"/>
						</td>
						<c:if test="${ spamuser.power eq 'S' }">
							<td style="text-align: left; width: 100px;">
								<c:out value="${ spamuser.birthDate }"/>
							</td>
						</c:if>
						<c:if test="${ spamuser.power eq 'P' }">
							<td style="text-align: left; width: 100px;">
								<c:out value="${ spamuser.office }"/>
							</td>
						</c:if>
						<c:if test="${ spamuser.power eq 'S' }">
							<td style="text-align: left; width: 100px;">
								<c:out value="${ spamuser.empNo }"/>
							</td>
							<td style="text-align: left; width: 100px;">
								<c:out value="${ spamuser.grNo }"/>
							</td>
						</c:if>
						<c:forEach items="${ enrollment }" var="enrollment" varStatus="status">
							<c:if test="${enrollment.enrollmentNo eq spamuser.enrollment}">
								<td style="text-align: left; width: 100px;">
										<c:out value="${ enrollment.enrollmentContent }"/>
								</td>
							</c:if>
						</c:forEach>
					</tr>
				</c:if>
			</thead>
		</table>
		<c:if test="${ spamuser.power eq 'S' }">
			<div style="overflow:auto; width:100%; height:500px; padding-top:10%; ">
				<c:out value="${ spamuser.name }" />님의 취업 유형은 
				<c:forEach items="${ empCategory }" var="empCategory" varStatus="status">
					<c:if test='${ spamuser.empNo eq empCategory.empTypeNo}'>
						<c:out value="${empCategory.name}" />
					</c:if>
				</c:forEach>
				입니다.
				<table style="width: 100%" border="1">
					<thead>
						<tr bgcolor="#4C4639" >
							<th style="width: 100px;"><font color="#FFFFFF">번호</font></th>
							<th style="width: 100px;"><font color="#FFFFFF">제목</font></th>
							<th style="width: 100px;"><font color="#FFFFFF">점수</font></th>
							<th style="width: 100px;"><font color="#FFFFFF">등록일</font></th>
						</tr>
						<c:forEach items="${ listEmp }" var="employment" varStatus="status">
							<tr>
								<td style="text-align: center;">
									<c:out value="${status.count}"/>
								</td>
								<c:forEach items="${ empCategory }" var="category" varStatus="status">
									<c:if test="${ employment.empcNo eq category.no}">
										<td style="text-align: center;">
											<c:out value="${category.name}"/>
										</td>
										<td style="text-align: center;">
											<c:out value="${category.score}"/>
										</td>
									</c:if>
								</c:forEach>			
								<td style="text-align: center;">
									<c:out value="${ employment.registration }"/>
								</td>
							</tr>
					</c:forEach>
					</thead>
				</table>
			</div>
		</c:if>
	</div>
</body>
</html>