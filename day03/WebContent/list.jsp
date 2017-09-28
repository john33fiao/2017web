<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.hb.util.OraDB" %>
<%@ page errorPage="err.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="./"><img alt="logo" src="./imgs/logo.jpg"> </a>
	<table border="1" bordercolor="gray" cellspacing="0">
		<tr>
			<td>사번</td>
			<td>이름</td>
			<td>부서</td>
			<td>지역</td>
		</tr>
<%
	String sql="select empno,ename,dname,loc from ";
	sql+=" emp inner join dept on";
	sql+=" emp.deptno=dept.deptno";
	System.out.println(sql);
	
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		conn=OraDB.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()){
%>	
		<tr>
			<td><%=rs.getInt("empno") %></td>
			<td><%=rs.getString("ename") %></td>
			<td><%=rs.getString("dname") %></td>
			<td><%=rs.getString("loc") %></td>
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