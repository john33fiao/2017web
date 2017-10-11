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
		
		if("POST".equals(request.getMethod())){
			bean[0]=request.getParameter("sub");
			bean[2]=request.getParameter("content");
			response.sendRedirect("detail.jsp?idx="+idx);
			return;
		}
		
		bean[2]=bean[2].replaceAll("<br>", "\n");
		
		%>
		<form method="post">
		<input type="hidden" name="idx" value="<%=idx%>">
		<table>
			<tr>
				<td width="100" bgcolor="#cccccc">제목</td>
				<td width="500">
					<input type="text" name="sub" value="<%=bean[0] %>">
				</td>
			</tr>
			<tr>
				<td bgcolor="#cccccc">글쓴이</td>
				<td><%=bean[1] %></td>
			</tr>
			<tr>
				<td colspan="2">
				<textarea cols="50" rows="5" name="content"><%=bean[2] %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
		</form>
		
	<jsp:include page="../template2/footer.jsp"></jsp:include>
</body>
</html>










