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
	<%!
		public boolean isDisitValid(String msg){
			boolean result=false;
			msg=msg.trim();
			for(int i=0; i<msg.length(); i++){
				if(Character.isDigit(msg.charAt(i))){}else{
					result=true;
					break;
				}	
			}
			return result;
		}
	
		public boolean isNullValid(String msg){
			boolean result=false;
			msg=msg.trim();
			if(msg.length()==0){
				return true;
			}
			
			return result;
		}
	%>
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
	
	if(isNullValid(params[0])||isNullValid(params[1])){
		response.sendRedirect("add.jsp");
		return;
	}
	if(isDisitValid(params[0])||isDisitValid(params[7])){
		response.sendRedirect("add.jsp");
		return;
	}
	int empno=Integer.parseInt(params[0].trim());
	String name=params[1];
	String job=params[2];
	int mgr=Integer.parseInt(params[3]);
	String nalja=params[4]+"/"+params[5]+"/"+params[6];
	int sal=Integer.parseInt(params[7].trim());
	int deptno=Integer.parseInt(params[9]);
	String sql="insert into emp values ("
				+empno+",'"+name+"','"+job+"',"+mgr+",'"+nalja;
	if("".equals(params[8].trim())){
		sql+="',"+sal+",null,"+deptno+")";
	}else{
		int comm=Integer.parseInt(params[8].trim());
		sql+="',"+sal+","+comm+","+deptno+")";
	}
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
	System.out.println(sql);
	%>
</body>
</html>










