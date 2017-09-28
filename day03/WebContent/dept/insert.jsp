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
	int deptno=Integer.parseInt(request.getParameter("deptno"));
	String dname=request.getParameter("dname");
	String loc=request.getParameter("loc");
	String sql="insert into dept";
	sql+=" (deptno,dname,loc) values (?,?,?)";
	Connection conn=null;
	PreparedStatement pstmt=null;
	int result=0;
	try{
		conn=OraDB.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, deptno);
		pstmt.setString(2, dname);
		pstmt.setString(3, loc);
		result=pstmt.executeUpdate();
	}finally{
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	if(result>0){
		response.sendRedirect("list.jsp");
	}else{
		response.sendRedirect("add.jsp");		
	}
%>







</body>
</html>