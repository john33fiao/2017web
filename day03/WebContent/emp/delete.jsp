<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    errorPage="../err.jsp"
    import="java.sql.*,com.hb.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String param=request.getParameter("idx");
	int empno=Integer.parseInt(param);
	String sql="delete from emp where empno=?";
	Connection conn=null;
	PreparedStatement pstmt=null;
	int result=0;
	try{
		conn=OraDB.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, empno);
		result=pstmt.executeUpdate();
	}finally{
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	if(result>0){
		response.sendRedirect("list.jsp");
		return;
	}
	
%>
	<h1>삭제 실패</h1>
	<a href="list.jsp">돌아가기</a>
</body>
</html>



