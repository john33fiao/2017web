<%@page import="com.sun.xml.internal.ws.Closeable"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="../err.jsp" 
    import="java.sql.*,com.hb.util.OraDB,java.util.Date"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="../"><img alt="logo" src="../imgs/logo.jpg"></a>
	<form action="insert.jsp">
		<table>
			<tr>
				<td>empno</td>
				<td><input type="text" name="num"> </td>
			</tr>
			<tr>
				<td>ename</td>
				<td><input type="text" name="name"> </td>
			</tr>
			<tr>
				<td>job</td>
				<td>
					<select name="jab">
						<option>clerk</option>
						<option>saleman</option>
						<option>manager</option>
						<option>analyst</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>mgr</td>
				<td>
					<select name="mgr">
					<%
String sql="select empno,ename from emp";
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
	conn=OraDB.getConnection();
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	while(rs.next()){
					%>
<option value="<%=rs.getInt("empno")%>"><%=rs.getString("ename") %></option>
					<%
	}
}finally{
	
}
					%>	
					</select>
				</td>
			</tr>
			<tr>
				<td>hiredate</td>
				<td>
				<% 
				Date date=new Date(); 
				int year=date.getYear()+1900;
				int month=date.getMonth()+1;
				int day=date.getDate();
				System.out.println(year);
				%>
					<select name="year">
						<option><%=year-1 %></option>
						<option selected="selected"><%=year %></option>
						<option><%=year+1 %></option>
					</select>년
					<select name="month">
					<%
					for(int i=1; i<13; i++){ 
						if(i>9){
					%>
						<option<%if(i==month)out.print(" selected=\"selected\""); %>><%=i %></option>
					<%
						}else{
					%>
						<option<%if(i==month)out.print(" selected=\"selected\""); %>>0<%=i %></option>	
					<%
						}
					} 
					%>
					</select>월
					<select name="day">
					<%
					for(int i=1; i<32; i++){
						if(i>9){
					%>
						<option<%if(i==day)out.print(" selected=\"selected\""); %>><%=i %></option>
					<%
						}else{
					%>
						<option<%if(i==day)out.print(" selected=\"selected\""); %>>0<%=i %></option>	
					<%
						}
					} %>
					</select>일
				</td>
			</tr>
			<tr>
				<td>sal</td>
				<td><input type="text" name="sal"> </td>
			</tr>
			<tr>
				<td>comm</td>
				<td><input type="text" name="comm"></td>
			</tr>
			<tr>
				<td>deptno</td>
				<td>
					<select name="deptno">
					<%
String sql2="select deptno,dname,loc from dept";
					try{
						conn=OraDB.getConnection();
						stmt=conn.createStatement();
						rs=stmt.executeQuery(sql2);
						while(rs.next()){
					%>
<option value="<%=rs.getInt("deptno")%>"><%=rs.getString("dname") %>(<%=rs.getString("loc") %>)</option>
					<%
						}
					}finally{
						if(rs!=null)rs.close();
						if(stmt!=null)stmt.close();
						if(conn!=null)conn.close();
					}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="전송">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>