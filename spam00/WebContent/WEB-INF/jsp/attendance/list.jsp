<%@page import="com.spam.domain.Attendance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>

<html>
   <head>
      <title>SPAM 비교과 출석 목록 조회</title>
      <meta http-equiv="content-type" content="text/html; charset=utf-8" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
      <script src="js/jquery.min.js"></script>
      <script src="js/jquery.dropotron.min.js"></script>
      <script src="js/skel.min.js"></script>
      <script src="js/skel-layers.min.js"></script>
      <script src="js/init.js"></script>
      
      <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/skel.css" />
      <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
      
      <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
   </head>
   <body class="left-sidebar">
      <form action="/attendance/list" method="post">
      <!-- Header -->
         <div id="header">
            <div class="container">
                  
               <!-- Logo -->
                  <h1><a href="#" id="logo">S.P.A.M</a></h1>
               
               <!-- Nav -->
                  <nav id="nav">
                     <ul>
                        <li>
                           <a href="">상담</a>
                        </li>
                        <li>
                           <a href=""></a>
                           <ul>
                              <li><a href="#">Lorem ipsum dolor</a></li>
                              <li><a href="#">Magna phasellus</a></li>
                              <li><a href="#">Etiam dolore nisl</a></li>
                              <li>
                                 <a href="">Phasellus consequat</a>
                                 <ul>
                                    <li><a href="#">Lorem ipsum dolor</a></li>
                                    <li><a href="#">Phasellus consequat</a></li>
                                    <li><a href="#">Magna phasellus</a></li>
                                    <li><a href="#">Etiam dolore nisl</a></li>
                                    <li><a href="#">Veroeros feugiat</a></li>
                                 </ul>
                              </li>
                              <li><a href="#">Veroeros feugiat</a></li>
                           </ul>
                        </li>
                        <li>
                           <a href="">졸업</a>
                           <ul>
                              <li><a href="#">Lorem ipsum dolor</a></li>
                              <li><a href="#">Magna phasellus</a></li>
                              <li><a href="#">Etiam dolore nisl</a></li>
                              <li>
                                 <a href="">Phasellus consequat</a>
                                 <ul>
                                    <li><a href="#">Lorem ipsum dolor</a></li>
                                    <li><a href="#">Phasellus consequat</a></li>
                                    <li><a href="#">Magna phasellus</a></li>
                                    <li><a href="#">Etiam dolore nisl</a></li>
                                    <li><a href="#">Veroeros feugiat</a></li>
                                 </ul>
                              </li>
                              <li><a href="#">Veroeros feugiat</a></li>
                           </ul>
                        </li>
                        <li><a href="left-sidebar.html">취업 점수</a></li>
                        <li><a href="right-sidebar.html">졸업 점수</a></li>
                        <li><a href="no-sidebar.html">사용자 정보</a></li>
                     </ul>
                  </nav>

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
                           <h2>비교과 출석</h2>
                        </header>
                        <ul class="default">
                           <li><a href="/attendance/upload">비교과 출석 등록</a></li>
                           <li><a href="/attendance/list">비교과 출석 목록 조회</a></li>
                        </ul>
                     </section>
                     <section>
                        <header class="major">
                           <h2>검색</h2>
                        </header>
                        <select name="select">
                                 <option value="title">비교과제목</option>
                               <option value="location">위치</option>
                               <option value="score">점수</option>
                        </select>
                        <input type="text" name="search" />
                           
                     </section>
                  </div>
                  
                  <!-- Content -->
                  <div id="content" class="8u skel-cell-important">
                     <section>
                        <header class="major">
                           <h2>비교과 출석 목록 조회</h2>
                           
                              <table style="overflow:auto; width:100%" border="1">
                                 <thead>
                                 <tr bgcolor="#4C4639">
                                       <th style="width: 35px; text-align: center;">
                                          <font color="#FFFFFF">번호</font></th>
                                       <th style="width: 120px; text-align: center;">
                                          <font color="#FFFFFF" >비교과 제목</font></th>
                                       <th style="width: 110px; text-align: center;">
                                          <font color="#FFFFFF">시간</font></th>
                                       <th style="width: 80px; text-align: center;">
                                          <font color="#FFFFFF">위치</font></th>
                                       <th style="width: 35px; text-align: center;">
                                          <font color="#FFFFFF">점수</font></th>
                                       <th style="width: 60px; text-align: center;">
                                          <font color="#FFFFFF">상세조회</font></th>
                                       <th style="width: 60px; text-align: center;">
                                          <font color="#FFFFFF">삭제</font></th>
                                    </tr>
                                    
                                    <c:if test="${ !empty attendanceList}">
                                       <c:forEach items="${ attendanceList }" var="attendance" varStatus="status">
                                          <tr>
                                             <td style="text-align: center;">
                                                <c:out value="${ status.count }"/>
                                             </td>
                                             <td style="text-align: center;">
                                                <c:out value="${ attendance.title }"/>
                                             </td>
                                              
                                             <td style="text-align: center;">
                                                <c:out value="${ attendance.lectureDate } / ${attendance.lectureTime}"/>
                                             </td>
                                             <td style="text-align: center;">
                                                <c:out value="${ attendance.location }"/>
                                             </td>
                                             <td style="text-align: center;">
                                                <c:out value="${ attendance.score }"/>
                                             </td>
                                             <td style="text-align: center;">
                                                <a href="<c:url value="/attendance/view/${attendance.attendanceNo}" />">
                                                   <input type="button" value="상세조회">
                                                </a>
                                             </td>
                                             <td style="text-align: center;">
                                                <a href="<c:url value="/attendance/remove/${attendance.attendanceNo}" />">
                                                   <input type="button" value="삭제"> 
                                                </a>
                                             </td>
                                          </tr>
                                       </c:forEach>
                                    </c:if>
                                    <c:if test="${empty attendanceList}">
                                       <tr>
                                          <td style="text-align: center;" colspan="7"/>
                                                   목록이 존재하지 않습니다.
                                          </td>
                                       </tr>
                                        
                                    </c:if>
                                    
                                 </thead>
                              </table>
                              <br><br><br>
                              <div style="text-align: center; padding-top: 20px;"> 
                                 <a href="<c:url value="/attendance/upload" />">
                                    <input type="button" name="add" value="등록"> 
                                 </a>
                              </div>
                        </header>
                     </section>
                  </div>
               
               </div>
            </div>
         </div>

         <!-- Footer -->
         <div id="footer">
               <!-- Copyright -->
               <div class="copyright">
                  Tel: 041-530-2212 (선문대학교 컴퓨터공학과 과사무실)
               </div>
         </div>
      </form>
   </body>
</html>