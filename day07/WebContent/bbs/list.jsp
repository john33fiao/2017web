<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.ArrayList"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../template2/header.jsp">
		<jsp:param value="." name="path"/>
	</jsp:include>
	<jsp:include page="../template2/menu.jsp">
		<jsp:param value="." name="path"/>
	</jsp:include>
		<h1>LIST PAGE</h1>
		<%
		ArrayList<String[]> alist=(ArrayList<String[]>)application.getAttribute("bbs");
		if(alist!=null){
		%>	
		<table border="1" cellspacing="0">
			<tr>
				<td width="100">글번호</td>
				<td width="400">제목</td>
				<td width="100">글쓴이</td>
			</tr>
		<%
		for(int i=alist.size()-1; i>=0; i--){
			String[] msgs=alist.get(i);
		%>			
			<tr>
				<td><%=i+1 %></td>
				<td><a href="detail.jsp?idx=<%=i%>"><%=msgs[0] %></a></td>
				<td><%=msgs[1] %></td>
			</tr>
		<%} %>			
					
		</table>
		<%}else{ %>
			<h3>작성된 글 없음</h3>			
		<%} %>			
	<jsp:include page="../template2/footer.jsp"></jsp:include>
</body>
</html>











