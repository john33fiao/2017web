<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*,com.hb.util.OraDB"
    errorPage="../err.jsp"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String sql="select max(deptno)+10 as \"myseq\" from dept";
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int nextnum=0;
	try{
		conn=OraDB.getConnection();
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			nextnum=rs.getInt("myseq");
		}
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	
	%>
	<a href="../"><img alt="logo" src="../imgs/logo.jpg"> </a>
	<h1>dept 추가 페이지</h1>
	<form action="insert.jsp">
	<table>
		<tr>
			<td>deptno</td>
			<td>
				<input readonly="readonly" type="text" name="deptno" value="<%=nextnum%>">
			</td>
		</tr>
		<tr>
			<td>dname</td>
			<td>
				<input type="text" name="dname" >
			</td>
		</tr>
		<tr>
			<td>loc</td>
			<td>
				<input type="text" name="loc">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="추가">			
				<input type="reset" value="취소">			
			</td>
		</tr>	
	</table>
	</form>
</body>
</html>