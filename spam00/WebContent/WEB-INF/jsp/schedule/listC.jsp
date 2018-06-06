<%@ page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr" import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%
   //데이터베이스를 연결하는 관련 변수를 선언한다
  Connection conn= null;
  PreparedStatement pstmt = null;
   //데이터베이스를 연결하는 관련 정보를 문자열로 선언한다.
  String jdbc_driver= "oracle.jdbc.driver.OracleDriver"; //JDBC 드라이버의 클래스 경로
  String jdbc_url= "jdbc:oracle:thin:@localhost:1521";  //접속하려는 데이터베이스의 정보
   //JDBC 드라이버 클래스를 로드한다.
  Class.forName("oracle.jdbc.driver.OracleDriver");
   //데이터베이스 연결 정보를 이용해서 Connection 인스턴스를 확보한다.
  conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521", "mybatis", "mybatis!");
  if (conn== null) {
   out.println("No connection is made!");
  }
  %>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>calendar</title>
 </head>
 <body>
  <%
  java.util.Calendar cal=java.util.Calendar.getInstance(); //Calendar객체 cal생성
  int currentYear=cal.get(java.util.Calendar.YEAR); //현재 날짜 기억
  int currentMonth=cal.get(java.util.Calendar.MONTH);
  int currentDate=cal.get(java.util.Calendar.DATE);
  String Year=request.getParameter("year"); //나타내고자 하는 날짜
  String Month=request.getParameter("month");
  int year, month;
  if(Year == null && Month == null){ //처음 호출했을 때
  year=currentYear;
  month=currentMonth;
  }
  else { //나타내고자 하는 날짜를 숫자로 변환
   year=Integer.parseInt(Year);
   month=Integer.parseInt(Month);
   if(month<0) { month=11; year=year-1; } //1월부터 12월까지 범위 지정.
   if(month>11) { month=0; year=year+1; }
  }
  %>
  <center>
  <table border=0> <!-- 달력 상단 부분, 더 좋은 방법이 없을까? -->
   <tr>
    <td align=left width=200> <!-- 년 도-->
    <a href="calendar.jsp?year=<%out.print(year-1);%>&month=<%out.print(month);%>">◀</a>
    <% out.print(year); %>년
    <a href="calendar.jsp?year=<%out.print(year+1);%>&month=<%out.print(month);%>">▶</a>
    </td>
    <td align=center width=300> <!-- 월 -->
    <a href="calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month-1);%>">◀</a>
    <% out.print(month+1); %>월
    <a href="calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month+1);%>">▶</a>
    </td>
    <td align=right width=200><% out.print(currentYear + "-" + (currentMonth+1) + "-" + currentDate); %></td>
   </tr>
  </table>
  <table border=1 cellspacing=0> <!-- 달력 부분 -->
   <tr>
    <td width=100>일</td> <!-- 일=1 -->
    <td width=100>월</td> <!-- 월=2 -->
    <td width=100>화</td> <!-- 화=3 -->
    <td width=100>수</td> <!-- 수=4 -->
    <td width=100>목</td> <!-- 목=5 -->
    <td width=100>금</td> <!-- 금=6 -->
    <td width=100>토</td> <!-- 토=7 -->
   </tr>
   <tr height=30>
   <%
   cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
   int startDay=cal.get(java.util.Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
   int end=cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
   int br=0; //7일마다 줄 바꾸기
   for(int i=0; i<(startDay-1); i++) { //빈칸출력
    out.println("<td>&nbsp;</td>");
    br++;
    if((br%7)==0) {
     out.println("<br>");
    }
   }
   for(int i=1; i<=end; i++) { //날짜출력
    out.println("<td>" + i + "<br>");
      //메모(일정) 추가 부분
      int memoyear, memomonth, memoday;
      try{
        // select 문장을 문자열 형태로 구성한다.
       String sql= "SELECT calendarmemo_year, calendarmemo_month, calendarmemo_day, calendarmemo_contents FROM calendarmemo";
       pstmt= conn.prepareStatement(sql);
        // select 를 수행하면 데이터 정보가 ResultSet 클래스의 인스턴스로 리턴
       ResultSet rs= pstmt.executeQuery();
       while (rs.next()) { // 마지막 데이터까지 반복함.
        //날짜가 같으면 데이터 출력
        memoyear=rs.getInt("calendarmemo_year");
        memomonth=rs.getInt("calendarmemo_month");
        memoday=rs.getInt("calendarmemo_day");
        if(year==memoyear && month+1==memomonth && i==memoday) {
         out.println(rs.getString("calendarmemo_contents")+"<br>"); 
        }
       }
       rs.close();
      }
      catch(Exception e) {
       System.out.println(e);
      };
    out.println("</td>");
    br++;
    if((br%7)==0 && i!=end) {
     out.println("</tr><tr height=30>");
    }
   }
   while((br++)%7!=0) //말일 이후 빈칸출력
    out.println("<td>&nbsp;</td>");
   %>
   </tr>
  </table>
  </center>       
 </body>
</html>
   <%
        //사용한 자원을 반납한다.
       pstmt.close();
       conn.close();
   %>