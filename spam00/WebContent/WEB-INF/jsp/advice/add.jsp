<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script type="text/javascript">
	function stuPopupOpen() {
		window.name = "ListForm";

		var option = "width=700, height=410, resizable=no, scrollbars=no, status=no, toolbar=yes, directories=yes, menubar=yes, location=no;";
		openWin = window.open("/advice/searchE", "stuForm", option);
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	������ ��� â�Դϴ�. ${message}
 	<form id="form" name="form" action="<c:url value="/advice/add" />"
		method="post">

		<input type="hidden" id="id" name="id" value=${ sessionScope.id } />
		���� ���̵� <input type="text"
			style="text-align: left; background-color: skyblue;" id="pId"
			name="pId" maxlength="11" onclick="stuPopupOpen();" /> <br /> ����<br />
		<textarea name="reason" id="reason" cols="40" rows="8"></textarea>
		<br /> ��� ��¥ <input type="date" id="adviceDate" name="adviceDate" /><br />
		���� <select id="day" name="day">
			<option value="mon" selected>��</option>
			<option value="tue">ȭ</option>
			<option value="wed">��</option>
			<option value="thur">��</option>
			<option value="fri">��</option>
		</select> <br /> ���� <select id="period" name="period">
			<option value="0" selected disabled hidden>==�����ϼ���==</option>
			<option value="1">1����</option>
			<option value="2">2����</option>
			<option value="3">3����</option>
			<option value="4">4����</option>
			<option value="5">5����</option>
		</select>
			�б� 
		<select id="quarter" name="quarter">
			<option value="0" selected disabled hidden>==�����ϼ���==</option>
			<option value="1">1�б�</option>
			<option value="2">2�б�</option>
		</select><br /><input type="submit" value="����" />
	</form>
	<%-- <form id="form" name="form" action="<c:url value="/advice/add" />"
		method="post">
		ADVICE_NO <input type="text" id="adviceNo" name="adviceNo" />,
		S_ID <input type="text" id="sId" name="sId" /> 
		P_ID <input type="text" id="pId" name="pId" />
		ASSENT_NO <input type="text" id="assentNo" name="assentNo" />
		ADVICE_DATE <input type="date" id="adviceDate" name="adviceDate" />
		REASON <input type="text" id="reason" name="reason" />
		MON <input type="text" id="mon" name="mon" />
		TUE <input type="text" id="tue" name="tue" />
		WED <input type="text" id="wed" name="wed" />
		THUR <input type="text" id="thur" name="thur" />
		FRI <input type="text" id="fri" name="fri" />
		QUARTER <input type="text" id="quarter" name="quarter" />
		<input type="submit" value="����"/>
	</form> --%>
</body>
</html>