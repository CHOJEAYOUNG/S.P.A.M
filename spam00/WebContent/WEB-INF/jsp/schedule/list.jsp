<%@page import="com.spam.domain.Attendance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>

<html>
<script type="text/javascript">
	function viewPopupOpen(v) {
		window.name = "viewForm";

		var option = "width=500, height=720, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
		openWin = window.open("/schedule/view/" + v, "childForm", option);
	}
	function stuPopupOpen() {
		window.name = "ListForm";

		var option = "width=700, height=410, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
		openWin = window.open("/schedule/searchE", "stuForm", option);
	}
</script>
	<head>
		<c:if test="${sessionScope.isLogin}"> 
		      <div style="text-align: right;">
		         <%@ include file="/WEB-INF/jsp/menubar.jsp" %>
		      </div>
		 </c:if>
		
	</head>
	<body class="left-sidebar">
		
		<!-- Header -->
			<div id="header">
				<div class="container">
						
					<!-- Logo -->
						<h1><a href="/main" id="logo">S.P.A.M</a></h1>
						 
					<!-- Nav -->
						<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
				</div>
			</div>

		<!-- Main -->
			<div id="main" class="wrapper style1">
				<div class="container">
					<div class="row">
					
						<!-- Sidebar -->
						<div id="sidebar" class="4u sidebar">
							<section>
                        <header class="major">
                           <h2>목록</h2>
                        </header>
                        <ul class="default">
                        
                         <c:if test = "${sessionScope.power eq 'A' }" > 
                           <li><a href="/schedule/list">교수 일정 조회</a></li>
                           <li><a href="/schedule/add">교수 일정 등록</a></li>
                           <li><a href="/timeTable/list">시간표 조회</a></li>
                           <li><a href="/timeTable/add">시간표 등록</a></li>
                         </c:if>
                          <c:if test = "${sessionScope.power eq 'P' }" > 
                           <li><a href="/schedule/list">일정 조회</a></li>
                           <li><a href="/schedule/add">일정 등록</a></li>
                         </c:if>
                         
                        </ul>
                     </section>
							
						</div>
						
						<!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header class="major">
									<h2>교수 일정표 조회</h2>
									<c:if test="${sessionScope.power eq 'A'}">
									<form action="/schedule/list" method="post">
									<input type="text"
										style="text-align: left; width:150px;" id="name"
										name="name" maxlength="20" onclick="stuPopupOpen();" placeholder="교수님 이름" />
					
									<input type="submit" value="검색" />
									</form>
									</c:if>
								      <table style="overflow:auto; width:100%" border="1">
								      	<thead>
								    	  <tr bgcolor="#4C4639">
							                  <th style="width: 35px; text-align: center;">
							                  	<font color="#FFFFFF">번호</font></th>
							                  <th style="width: 30px; text-align: center;">
							                  	<font color="#FFFFFF" >이름</font></th>
							                  <th style="width: 40px; text-align: center;">
							                  	<font color="#FFFFFF">교시</font></th>
							                  <th style="width: 120px; text-align: center;">
							                  	<font color="#FFFFFF">기간</font></th>
							                  <th style="width: 40px; text-align: center;">
							                  	<font color="#FFFFFF">이유</font></th>
							                  <th style="width: 30px; text-align: center;">
							                  	<font color="#FFFFFF">수정</font></th>
							                  <th style="width: 30px; text-align: center;">
							                  	<font color="#FFFFFF">삭제</font></th>
							               </tr>
							               
								            <c:if test="${ !empty listSchdule}"> 
												<c:forEach items="${listSchdule}" var="schedule" varStatus="status">
													<tr>
														<td style="text-align: center; width: 35px;"><c:out
																value="${ status.count }" /></td>
														<td style="text-align: center; width: 35px;"><c:out
																value="${ schedule.name }" /></td>
														<td style="text-align: center; width: 35px;"><c:choose>
																<c:when test="${schedule.mon ne 0}">
																							월요일 <c:out value="${schedule.mon}"></c:out>
																</c:when>
																<c:when test="${schedule.tue ne 0}">
																							화요일 <c:out value="${schedule.tue}"></c:out>
																</c:when>
																<c:when test="${schedule.wed ne 0}">
																							수요일 <c:out value="${schedule.wed}"></c:out>
																</c:when>
																<c:when test="${schedule.thur ne 0}">
																							목요일 <c:out value="${schedule.thur}"></c:out>
																</c:when>
																<c:when test="${schedule.fri ne 0}">
																							금요일 <c:out value="${schedule.fri}"></c:out>
																</c:when>
															</c:choose></td>
														<td style="text-align: center; width: 35px;"><c:out
																value="${ schedule.begin }" /> ~ <c:out
																value="${ schedule.finish }" /></td>
														<td style="text-align: center; width: 35px;"><c:out
																value="${ schedule.reason }" /> 
																</td>
															<td style="text-align: center; width: 35px;"><a
															href="<c:url value="/schedule/edit/${schedule.scheduleNo}"/>">
																<input type="button" value="수정" />
														</a></td>
														<td style="text-align: center; width: 35px;"><a
															href="<c:url value="/schedule/remove/${schedule.scheduleNo}"/>">
																<input type="button" value="삭제" />
														</a></td>
												</c:forEach>
												
											</c:if>
								            <c:if test="${empty listSchdule}">
								               <tr>
								                  <td style="text-align: center;" colspan="7"/>
								                    		등록된 일정이 없습니다.
								                  </td>
								               </tr>
								                
								            </c:if>
								            
								         </thead>
								      </table>
								      <br><br><br>
								      <div style="text-align: center; padding-top: 20px;"> 
								         <a href="<c:url value="/schedule/add"/>"> <input type="button"
												value="등록" />
											</a>
								      </div>
								</header>
							</section>
						</div>
					
					</div>
				</div>
			</div>

			<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
			
		
	</body>
</html>