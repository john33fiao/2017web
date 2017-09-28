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
	String param1=request.getParameter("sal");
	String param2=request.getParameter("comm");
	String param3=request.getParameter("empno");
	String sql="update emp set sal=?,comm=? where empno=?";
	Connection conn=null;
	PreparedStatement pstmt=null;
	int result=0;
	try{
		conn=OraDB.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(param1));
		pstmt.setInt(2, Integer.parseInt(param2));
		pstmt.setInt(3, Integer.parseInt(param3));
		result=pstmt.executeUpdate();
	}finally{
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();		
	}
	String re=null;
	if(result>0){
		re="one.jsp?idx="+request.getParameter("empno");
	}else{
		re="edit.jsp?idx="+param3+"&sal="+param1+"&comm="+param2;
	}
	response.sendRedirect(re);
	%>
</body>
</html>













