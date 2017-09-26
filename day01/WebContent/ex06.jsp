<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String addr=request.getRemoteAddr();
	String prtc=request.getProtocol();
	out.print("client ip:"+addr+"<br>");
	out.print("server ip:"+request.getServerName()+"<br>");
	out.print(prtc+"<br>");
	out.print("client port:"+request.getRemotePort()+"<br>");
	out.print("server port:"+request.getServerPort()+"<br>");
	out.print("server context:"+request.getContextPath()+"<br>");
	out.print("server URI:"+request.getRequestURI()+"<br>");
	out.print("server ContentType:"+request.getContentType()+"<br>");
	%>
</body>
</html>