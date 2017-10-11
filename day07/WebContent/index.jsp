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
<body>
	<!-- ACTION TAG -->
	<jsp:include page="template2/header.jsp">
		<jsp:param value="" name="path"></jsp:param>
	</jsp:include>
	<jsp:include page="template2/menu.jsp">
		<jsp:param value="" name="path"/>
	</jsp:include>
		<img alt="" src="imgs/index.png">
	
	<jsp:include page="template2/footer.jsp"></jsp:include>
	
</body>
</html>














