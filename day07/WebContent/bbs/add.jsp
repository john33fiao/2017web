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
<%
	ArrayList<String[]> bbs=(ArrayList<String[]>)application.getAttribute("bbs");
	if(bbs==null){
		bbs=new ArrayList<String[]>();
	}
	if("POST".equals(request.getMethod())){
		String[] params=new String[3];
		params[0]=request.getParameter("sub");
		params[1]=request.getParameter("name");
		params[2]=request.getParameter("content");
		
		bbs.add(params);
		application.setAttribute("bbs", bbs);
		
		response.sendRedirect("list.jsp");
		return;
	}
%>
<body>
	<jsp:include page="../template2/header.jsp">
		<jsp:param value="." name="path"/>
	</jsp:include>
	<jsp:include page="../template2/menu.jsp">
		<jsp:param value="." name="path"/>
	</jsp:include>
		<h1>ADD PAGE</h1>
		<form method="post">
			<table border="0">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="sub" size="50">
					</td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="5" cols="50" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="작성">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	<jsp:include page="../template2/footer.jsp"></jsp:include>
</body>
</html>








