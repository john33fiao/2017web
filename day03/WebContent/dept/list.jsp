<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*,com.hb.util.OraDB"
    errorPage="/err.jsp"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="../"><img alt="logo" src="../imgs/logo.jpg"></a>
	<table border="1" cellspacing="0" bordercolor="gray">
		<tr>
			<td>deptno</td>
			<td>dname</td>
			<td>loc</td>
		</tr>
<%
	String sql="select loc,dname,deptno from dept order by deptno";
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
			<td><%=rs.getInt("deptno") %></td>
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
	<p><a href="add.jsp">[입력]</a></p>
</body>
</html>