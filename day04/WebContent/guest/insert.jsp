<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="2;url=list.jsp">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
%>
	<%
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id="scott";
	String pw="tiger";
	int cnt=0;
	String param1=request.getParameter("sabun");
	int sabun=Integer.parseInt(param1.trim());
	String name=request.getParameter("name").trim();
	String sql="select count(*) from guest01 where sabun=?";
	String sql2="insert into guest01 (sabun,name,nalja) ";
	sql2+="values (?,?,sysdate)";
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url,id,pw);
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, sabun);
		rs=pstmt.executeQuery();
		if(rs.next()){
			cnt=rs.getInt("count(*)");
		}
	}catch(Exception e){
		
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
	}
	
	if(cnt>0){
		response.sendRedirect("add.jsp?msg="+sabun);
	}else{
		try{
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, sabun);
			pstmt.setString(2, name);
			cnt=pstmt.executeUpdate();
		}catch(Exception e){
			
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	%>
	<%@ include file="/template/header.jsp" %>
	<h1>입력 성공</h1>
	<%@ include file="/template/footer.jsp" %>
</body>
</html>













