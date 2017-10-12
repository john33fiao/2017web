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
<body>
	<jsp:useBean id="bean" class="com.hb.bean.GuestDto"></jsp:useBean>
	<jsp:setProperty property="sabun" name="bean"/>
	<jsp:setProperty property="name" name="bean"/>
	<jsp:setProperty property="pay" name="bean"/>
	<%
	//GuestDto bean=new GuestDto();
	// bean.setSabun(req.getp("sabun"));
	String sql="insert into guest02 values (?,?,sysdate,?)";	
	Connection conn=MyOra.getConnection();
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, bean.getSabun());
	pstmt.setString(2, bean.getName());
	pstmt.setInt(3, bean.getPay());
	pstmt.executeUpdate();
	
	%>

</body>
</html>