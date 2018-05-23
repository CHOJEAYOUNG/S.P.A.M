<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<form action="/attendance/upload" method="post" enctype="multipart/form-data">
			<div style="text-align: center; padding-top: 15%;">
			<font>제목</font> 
			<input type="text" name="title"/><br> 
			
			<font>취업점수</font>
			<input type="number" name="score" max="100"/> <br> 
			
			<font>강의 날짜</font>
			<input type="date" name="lectureDate"/> <br> 
			
			 <font>강의 시간</font>
			<input type="time" name="lectureTime"/> <br> 
			 
			<font>강의 장소</font>
			<input type="text" name="location"/> <br> 
			
			<font>파일 업로드</font>
			<input type="file" name="uploadfile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"/> <br> 
			<!-- 업로드시 다른 파일 선택 안되서 자바 스크립트 작업 필요! -->
			
			<!-- 경로 변경 필요  -->
			<a href="/attendance/upload"> 
				<input type="button" value="목록"/> 
			</a>
			
			<input type="submit" value="등록" />
		</div>
		</form>
	
	
</body>

</html>