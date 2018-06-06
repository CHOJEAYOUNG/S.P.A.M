<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	id <input type="text" id="id" name="id" value="#{schedule.id}"/>
	begin <input type="date" id="begin" name="begin" value="#{schedule.begin}"/>
	finish <input type="date" id="finish" name="finish" value="#{schedule.finish}"/>
	mon <input type="text" id="mon" name="mon" value="#{schedule.mon}"/>
</body>
</html>