<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/template/header.jspf" %>
	<%@ include file="/template/menu.jspf" %>
	<%
	String param=request.getParameter("idx");
	String sql="select * from guest01 where sabun=?";
	int sabun=0;
	String name=null;
	Date nalja=null;
	int pay=0;
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,user,password);
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(param));
		rs=pstmt.executeQuery();
		if(rs.next()){
			sabun=rs.getInt("sabun");
			name=rs.getString("name");
			nalja=rs.getDate("nalja");
			pay=rs.getInt("pay");
		}
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	%>
	<h1>상세페이지</h1>
	<form action="edit.jsp">
	<input type="hidden" name="sabun" value="<%=sabun%>">
	<input type="hidden" name="name" value="<%=name%>">
	<input type="hidden" name="nalja" value="<%=nalja%>">
	<input type="hidden" name="pay" value="<%=pay%>">
	<table>
		<tr>
			<td>사번</td>
			<td><%=sabun %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=nalja %></td>
		</tr>
		<tr>
			<td>금액</td>
			<td><%=pay %></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="수정이동">
			<a href="#">[삭제]</a>
			</td>
		</tr>
	</table>
	</form>
	<%@ include file="/template/footer.jspf" %>
</body>
</html>