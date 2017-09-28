<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.Enumeration"%>
<%@ page import="java.sql.*,com.hb.util.OraDB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	Enumeration<String> enm=request.getParameterNames();
	String[] pname=new String[10];
	String[] params=new String[10];
	int idx=0;
	while(enm.hasMoreElements()){
		pname[idx]=enm.nextElement();
		params[idx]=request.getParameter(pname[idx]);
		idx++;
	}
	/* for(int i=0; i<params.length; i++){
		System.out.println(pname[i]+":"+params[i]);
	} */
	int empno =Integer.parseInt(params[0]);
	String name=params[1];
	String job=params[2];
	int mgr=Integer.parseInt(params[3]);
	String nalja=params[4]+"/"+params[5]+"/"+params[6];
	int sal=Integer.parseInt(params[7]);
	int comm=Integer.parseInt(params[8]);
	int deptno=Integer.parseInt(params[9]);
	
	String sql="insert into emp values ("
		+empno+",'"+name+"','"+job+"',"+mgr+",'"+nalja
		+"',"+sal+","+comm+","+deptno+")";
	//System.out.println(sql);
	Connection conn=null;
	Statement stmt=null;
	int result=0;
	try{
		conn=OraDB.getConnection();
		stmt=conn.createStatement();
		result=stmt.executeUpdate(sql);
	}finally{
		if(stmt!=null)stmt.close();
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










