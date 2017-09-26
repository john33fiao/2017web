<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.OutputStream" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String msg="hello world";
	byte[] byt = msg.getBytes();
	OutputStream os=response.getOutputStream();
	os.write(byt,0,byt.length);
	os.flush();
	//os.close();
	%>
</body>
</html>






