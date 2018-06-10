<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	function stuPopupOpen() {
	   window.name = "ListForm";
	
	   var option = "width=700, height=610, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	   openWin = window.open("/advice/searchE", "stuForm", option);
	}
	function timePopupOpen() {
	   window.name = "ListForm2";
	
	   var option = "width=700, height=410, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	   openWin = window.open("/schedule/searchT", "timeForm", option);
	}
	function timePopupOpen2() {
	   window.name = "ListForm3";
	
	   var option = "width=700, height=410, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	   openWin = window.open("/schedule/searchT2", "timeForm2", option);
	}
	function timePopupOpen3() {
	   window.name = "ListForm4";
	
	   var option = "width=700, height=410, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	   openWin = window.open("/schedule/searchT3", "timeForm3", option);
	}
	function timePopupOpen4() {
	   window.name = "ListForm5";
	
	   var option = "width=700, height=410, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	   openWin = window.open("/schedule/searchT4", "timeForm4", option);
	}
	function timePopupOpen5() {
	   window.name = "ListForm6";
	
	   var option = "width=700, height=410, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
	   openWin = window.open("/schedule/searchT5", "timeForm5", option);
	}
	function edit() {
	   formData = document.getElementById("form");
	   if (formData.elements['name'].value.replace(/(\s*)/g, "") == "" ) {
	      alert('교수가 입력되지 않았습니다.');
	      return formData.elements['name'].focus();
	   }
	   if (formData.elements['reason'].value.replace(/(\s*)/g, "") == "" ) {
	      alert('사유가 입력되지 않았습니다.');
	      return formData.elements['reason'].focus();
	   }
	   if (formData.elements['begin'].value.replace(/(\s*)/g, "") == "" ) {
	      alert('시작 날짜가 입력되지 않았습니다.');
	      return formData.elements['begin'].focus();
	   }
	   if (formData.elements['finish'].value.replace(/(\s*)/g, "") == "" ) {
	      alert('종료 날짜가 입력되지 않았습니다.');
	      return formData.elements['finish'].focus();
	   }
	   if (formData.elements['mon'].value.replace(/(\s*)/g, "") == "" ) {
	      alert('월요일 입력되지 않았습니다.');
	      return formData.elements['mon'].focus();
	   }
	   if (formData.elements['tue'].value.replace(/(\s*)/g, "") == "" ) {
	      alert('화요일 입력되지 않았습니다.');
	      return formData.elements['tue'].focus();
	   }
	   if (formData.elements['wed'].value.replace(/(\s*)/g, "") == "" ) {
	      alert('수요일 입력되지 않았습니다.');
	      return formData.elements['wed'].focus();
	   }
	   if (formData.elements['thur'].value.replace(/(\s*)/g, "") == "" ) {
	      alert('목요일 입력되지 않았습니다.');
	      return formData.elements['thur'].focus();
	   }
	   if (formData.elements['fri'].value.replace(/(\s*)/g, "") == "" ) {
	      alert('금요일 입력되지 않았습니다.');
	      return formData.elements['fri'].focus();
	   }
	
	
	   var date = formData.elements['begin'].value;
	   var split = date.split('/');
	   var temp = split[2] + "-" + split[0] + "-" + split[1];
	   formData.elements['begin'].value = temp;
	   
	   date = formData.elements['finish'].value;
	   split = date.split('/');
	   temp = split[2] + "-" + split[0] + "-" + split[1];
	   formData.elements['finish'].value = temp;
	
	   formData.submit();
	};
	
	$( function() {
	    $( "#begin" ).datepicker();
	} );
	
	$( function() {
	    $( "#finish" ).datepicker();
	} );
	</script>
   <c:if test="${sessionScope.isLogin}"> 
            <div style="text-align: right;">
               <%@ include file="/WEB-INF/jsp/menubar.jsp" %>
            </div>
       </c:if>
</head>
<body class="left-sidebar">
   <form id="form" name="form"   action="/schedule/add" method="post">
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
                           <h2>교수 일정 등록</h2><br>
                           <font color="RED">${message}</font>
                           
                              <table style="margin-left:15%;" >
                                 <thead>
                                 <c:if test="${sessionScope.power eq 'A'}">
                                 
                                 <tr>
                                        <th style="width: 100px; text-align: center; background-color:#4C4639">
                                          <font color="#FFFFFF">교수</font>
                                       </th>
                                       <td>
                                          <input type="text"
                                        size="10" style="width:50%; border: 2;" id="name"
                                       name="name" maxlength="20" onclick="stuPopupOpen();" />
                                    
                                       </td>
                                   </tr>
                                   </c:if>
                                   <c:if test="${sessionScope.power eq 'P'}">
                                         <input type="hidden" name="name" id="name" value="${sessionScope.name}"/>
                                   </c:if>
                                   <tr>
                                       <th style="width: 100px; text-align: center; background-color:#4C4639">
                                          <font color="#FFFFFF">사유</font>
                                       </th>
                                       <td>
                                          <input type="text" id="reason" name="reason" size="100" style="width:50%; border: 2;"/>
                                   </td>
                                   </tr>
                                   <tr>
                                        <th style="width: 100px; text-align: center; background-color:#4C4639">
                                          <font color="#FFFFFF">기간</font>
                                       </th>
                                       <td>
                                          <input type="text" id="begin" name="begin" style="width: 162px;"/> ~ 
                                          <input type="text" id="finish" name="finish" style="width: 162px;"/>
                                       </td>
                                      
                                   </tr>
                                   <tr>
                                        <th style="width: 100px; text-align: center; background-color:#4C4639">
                                          <font color="#FFFFFF">월</font>
                                       </th>
                                       <td>
                                          <input type="text"
                                       size="10" style="width:50%; border: 2;" id="mon"
                                       name="mon" maxlength="11" onclick="timePopupOpen();" />
                                    
                                       </td>
                                   </tr>
                                   <tr>
                                        <th style="width: 100px; text-align: center; background-color:#4C4639">
                                          <font color="#FFFFFF">화</font>
                                       </th>
                                       <td>
                                          <input type="text"
                                       size="10" style="width:50%; border: 2;" id="tue"
                                       name="tue" maxlength="11" onclick="timePopupOpen2();" />
                                    
                                       </td>
                                   </tr>
                                   <tr>
                                        <th style="width: 100px; text-align: center; background-color:#4C4639">
                                          <font color="#FFFFFF">수</font>
                                       </th>
                                       <td>
                                          <input type="text"
                                       size="10" style="width:50%; border: 2;" id="wed"
                                       name="wed" maxlength="11" onclick="timePopupOpen3();" />
                                    
                                       </td>
                                   </tr>
                                   <tr>
                                        <th style="width: 100px; text-align: center; background-color:#4C4639">
                                          <font color="#FFFFFF">목</font>
                                       </th>
                                       <td>
                                          <input type="text"
                                       size="10" style="width:50%; border: 2;" id="thur"
                                       name="thur" maxlength="11" onclick="timePopupOpen4();" />
                                    
                                       </td>
                                   </tr>
                                   <tr>
                                        <th style="width: 100px; text-align: center; background-color:#4C4639">
                                          <font color="#FFFFFF">금</font>
                                       </th>
                                       <td>
                                          <input type="text"
                                       size="10" style="width:50%; border: 2;" id="fri"
                                       name="fri" maxlength="11" onclick="timePopupOpen5();" />
                                    
                                       </td>
                                   </tr>
                                   
                                  </thead>
                              </table>
                             
                                <input type="button" id="button" name="button" value="전송" onclick="edit();" style="margin-left:40%;"/>
                                 <a href="<c:url value="/schedule/list" />"> 
                                    <input type="button" id="list" name="list" value="취소" />
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