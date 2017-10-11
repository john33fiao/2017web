<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*,com.hb.util.MyOra"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
	int sabun=Integer.parseInt(request.getParameter("sabun"));
	String name=request.getParameter("name");
	int pay=Integer.parseInt(request.getParameter("pay"));
	
	String sql="insert into guest02 values (?,?,sysdate,?)";
	
	Connection conn=MyOra.getConnection();
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, sabun);
	pstmt.setString(2, name);
	pstmt.setInt(3, pay);
	pstmt.executeUpdate();
%>

<body>
	<h1>입력완료</h1>
	<a href="list.jsp">[LIST]</a>
</body>
</html>









