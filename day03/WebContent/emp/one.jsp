<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="../err.jsp"
    import="java.sql.*,com.hb.util.*,java.util.HashMap"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="../"><img alt="logo" src="../imgs/logo.jpg"> </a>
<%
	String param=request.getParameter("idx");
	int empno=Integer.parseInt(param);
	String sql="select * from emp where empno=?";
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	HashMap<String,Object> map = new HashMap<String,Object>();
	try{
		conn=OraDB.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, empno);
		rs=pstmt.executeQuery();
		if(rs.next()){
			map.put("empno", rs.getInt("empno"));
			map.put("ename", rs.getString("ename"));
			map.put("job", rs.getString("job"));
			map.put("mgr", rs.getInt("mgr"));
			map.put("hiredate", rs.getDate("hiredate"));
			map.put("sal", rs.getInt("sal"));
			map.put("comm", rs.getInt("comm"));
			map.put("deptno", rs.getInt("deptno"));
		}
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();		
	}
%>
	
	
	<table>
		<tr>
			<td>empno</td>
			<td><%=map.get("empno") %></td>
		</tr>
		<tr>
			<td>ename</td>
			<td><%=map.get("ename") %></td>
		</tr>
		<tr>
			<td>job</td>
			<td><%=map.get("job") %></td>
		</tr>
		<tr>
			<td>mgr</td>
			<td><%=map.get("mgr") %></td>
		</tr>
		<tr>
			<td>hiredate</td>
			<td><%=map.get("hiredate") %></td>
		</tr>
		<tr>
			<td>sal</td>
			<td><%=map.get("sal") %></td>
		</tr>
		<tr>
			<td>comm</td>
			<td><%=map.get("comm") %></td>
		</tr>
		<tr>
			<td>dept</td>
			<td><%=map.get("deptno") %></td>
		</tr>
	</table>
	<a href="edit.jsp?idx=<%=map.get("empno")%>&sal=<%=map.get("sal") %>&comm=<%=map.get("comm") %>">[수정]</a>
	<a href="delete.jsp?idx=<%=map.get("empno")%>">[삭제]</a>
</body>
</html>








