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
		<h1>Detail page</h1>
		<%
		int idx=Integer.parseInt(request.getParameter("idx"));
		ArrayList<String[]> alist=(ArrayList<String[]>)application.getAttribute("bbs");
		String[] bean=alist.get(idx);
		
		//bean[2]=bean[2].replaceAll("&", "&amp;");
		//bean[2]=bean[2].replaceAll(" ", "&nbsp;");
		//bean[2]=bean[2].replaceAll("<", "&lt;");
		//bean[2]=bean[2].replaceAll(">", "&gt;");
		bean[2]=bean[2].replaceAll("\n", "<br>");
		      
		%>
		<table>
			<tr>
				<td width="100" bgcolor="#cccccc">제목</td>
				<td width="500"><%=bean[0] %></td>
			</tr>
			<tr>
				<td bgcolor="#cccccc">글쓴이</td>
				<td><%=bean[1] %></td>
			</tr>
			<tr>
				<td colspan="2"><%=bean[2] %></td>
			</tr>
		</table>
		<p>
			<a href="edit.jsp?idx=<%=idx%>">수정</a>
		</p>
		
	<jsp:include page="../template2/footer.jsp"></jsp:include>
</body>
</html>










