<%@page import="com.sun.xml.internal.ws.Closeable"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page errorPage="/err.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.hb.util.OraDB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% String root=request.getContextPath(); %>
<a href="<%=root %>/"><img alt="logo" src="<%=root %>/imgs/logo.jpg"></a>
<table bordercolor="gray" border="1" cellspacing="0">
	<tr>
		<td>사번</td>
		<td>이름</td>
		<td>연봉</td>
		<td>입사일</td>
	</tr>
<%
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
	conn=OraDB.getConnection();
	stmt=conn.createStatement();
	rs=stmt.executeQuery("select empno,ename,sal,hiredate from emp order by hiredate");
	while(rs.next()){
%>
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getInt(3) %></td>
			<td><%=rs.getDate(4) %></td>
		</tr>
<%	
	}
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>
</table>
</body>
</html>










