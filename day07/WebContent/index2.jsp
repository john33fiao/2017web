<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	String rootPath = request.getContextPath();
%>
<body background="<%=rootPath %>/imgs/bg.png">
	<%@ include file="template1/header.jspf" %>
	<%@ include file="template1/menu.jspf" %>
	<%@ include file="template1/aside.jspf" %>
		<img alt="" src="imgs/index.png">			
	<%@ include file="template1/footer.jspf" %>
</body>
</html>