<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<script type="text/javascript">
	
	function check() {
		var period = document.getElementById('period').value;
		var beginHour = document.getElementById('beginHour').value;
		var beginMinutes = document.getElementById('beginMinutes').value;
		var finishHour = document.getElementById('finishHour').value;
		var finishMinutes = document.getElementById('finishMinutes').value;
		
		
		if (!period) {
			alert('교시가 입력되지 않았습니다.');
			return;
		}
		if (!beginHour || !beginMinutes) {
			alert('시작시간이 입력되지 않았습니다.');
			return;
		}
		if (!finishHour || !finishMinutes) {
			alert('종료시간이 입력되지 않았습니다.');
			return;
		}
		document.getElementById("form").submit();
		
		return;
	};
</script>
	<head>
         <c:if test="${sessionScope.isLogin}"> 
		      <div style="text-align: right;">
		         <%@ include file="/WEB-INF/jsp/menubar.jsp" %>
		      </div>
		 </c:if>
	</head>

	<body class="left-sidebar">
		<form id="form" name="form"
						action="<c:url value="/timeTable/add" />" method="post">
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
									<h2>시간표 등록</h2><br>
								      	<font color="red">${message}</font>
								      <table style="margin-left:15%;" >
								      	<thead>
								    	  <tr>
							                   <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">교시</font>
							                  </th>
							                  <td>
							                  	<input type="number" id="period" name="period" min="1" max="10" maxlength="2" size="10" style="width:50%; border: 2;"
											 />
							                  </td>
							              </tr>
							              <tr>
							                  <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">시작시간</font>
							                  </th>
							                  <td>
							                  	<input type="number" id="beginHour" name="beginHour" min="0" max="23" placeholder="시간   EX)10" maxlength="2"  size="10"
													style="width:25%; border: 2;" />
										
												<input type="number" id="beginMinutes" name="beginMinutes" min="0" max="59" placeholder="분   EX)30" maxlength="2" size="10"
													style="width:25%; border: 2;" />
										
											  </td>
							              </tr>
							               <tr>
							                  <th style="width: 100px; text-align: center; background-color:#4C4639">
							                  	<font color="#FFFFFF">종료시간</font>
							                  </th>
							                  <td>
							                  	<input type="number" id="finishHour" name="finishHour" min="0" max="24" placeholder="시간   EX)11" maxlength="2"  size="10"
													style="width:25%; border: 2;"/>
										
												<input type="number" id="finishMinutes" name="finishMinutes" min="0" max="59" placeholder="분   EX)20" maxlength="2" size="10"
													style="width:25%; border: 2;"/>
										
											  </td>
							              </tr>
							             
							             </thead>
							         </table>
							        
								        <input type="button" value="등록" onclick="check()" style="margin-left:40%;" /> 
											
											<a href="<c:url value="/timeTable/list" />"> 
												<input type="button" id="button_list" name="button_list" value="목록" />
											</a>
							        
								</header>
							</section>
						</div>
					</div>
				</div>
			</div>
			</form>
			<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	</body>
</html>