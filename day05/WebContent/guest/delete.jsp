<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/template/header.jspf" %>
<%
	System.out.println("delete page");
	String sql="delete from guest01 where sabun=?";
	
	int sabun=Integer.parseInt(request.getParameter("idx"));
	int result=0;
	System.out.println("step1");
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, sabun);
	System.out.println("step2:"+sql);
		result=pstmt.executeUpdate();
	System.out.println("step3");
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	System.out.println("step4");
	response.sendRedirect("list.jsp");
%>