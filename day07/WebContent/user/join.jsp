<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.*"
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
<%
	
	if("POST".equals(request.getMethod())){
		if(!request.getParameter("pw").equals(request.getParameter("pw2"))){
			response.sendRedirect("join.jsp?msg=pwErr");
			return;
		}
		ArrayList<HashMap<String,String>> users=(ArrayList<HashMap<String,String>>)application.getAttribute("users");
		if(users==null){
			users=new ArrayList<HashMap<String,String>>();
			application.setAttribute("users", users);
		}
		String id=request.getParameter("id");
		for(int i=0; i<users.size(); i++){
			if(id.equals(users.get(i).get("id"))){
				response.sendRedirect("join.jsp?msg=IDoverlap");
				return;
			}
		}
		
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		map.put("name", name);
		users.add(map);
%>
		<h1>JOIN SECCESS</h1>
		<br><br><br><br>
<%		
	}else{
		String msg=request.getParameter("msg");
		if(msg!=null)out.println("<h3>ERR:["+msg+"]</h3>");
%>
		<h1>JOIN US</h1>
		<form method="post">
			<table>
				<tr>
					<td width="150" bgcolor="#cccccc">id</td>
					<td>
						<input type="text" name="id">
					</td>
				</tr>
				<tr>
					<td bgcolor="#cccccc">pw</td>
					<td>
						<input type="text" name="pw">
					</td>
				</tr>
				<tr>
					<td bgcolor="#cccccc">re:pw</td>
					<td>
						<input type="text" name="pw2">
					</td>
				</tr>
				<tr>
					<td bgcolor="#cccccc">name</td>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="JOIN">
						<input type="reset" value="CANCEL">
					</td>
				</tr>
			</table>
		</form>
	<%} %>
	<jsp:include page="../template2/footer.jsp"></jsp:include>
</body>
</html>




