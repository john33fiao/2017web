<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
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

	<%
	if("POST".equals(request.getMethod())){
		ArrayList<HashMap<String,String>> users= (ArrayList<HashMap<String,String>>)application.getAttribute("users");
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		boolean result=false;
		for(int i=0; i<users.size(); i++){
			HashMap<String,String> user=users.get(i);
			if(user.get("id").equals(id)&&user.get("pw").equals(pw)){
				//로그인 처리
				session.setAttribute("name", user.get("name"));
				result=true;
				break;
			}
		}
		if(result){
	%>
		<jsp:include page="../template2/header.jsp">
		<jsp:param value="." name="path"/>
		</jsp:include>
		<jsp:include page="../template2/menu.jsp">
			<jsp:param value="." name="path"/>
		</jsp:include>
		<h1>LOGIN SUCCESS</h1>
	<%
		}else{
	%>
		<jsp:include page="../template2/header.jsp">
		<jsp:param value="." name="path"/>
		</jsp:include>
		<jsp:include page="../template2/menu.jsp">
			<jsp:param value="." name="path"/>
		</jsp:include>
		<h1>LOGIN FALSE</h1>
	<%
		}
	}else{
	%>
		<jsp:include page="../template2/header.jsp">
		<jsp:param value="." name="path"/>
		</jsp:include>
		<jsp:include page="../template2/menu.jsp">
			<jsp:param value="." name="path"/>
		</jsp:include>
		<h1>LOGIN PAGE</h1>
		<form method="post">
			<table>
				<tr>
					<td>id</td>
					<td>
						<input type="text" name="id">
					</td>
				</tr>
				<tr>
					<td>pw</td>
					<td>
						<input type="password" name="pw">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="LOGIN">
						<input type="reset" value="CANCEL">
					</td>
				</tr>
				
			</table>
		
		</form>
	<%} %>
	<jsp:include page="../template2/footer.jsp"/>	
</body>
</html>