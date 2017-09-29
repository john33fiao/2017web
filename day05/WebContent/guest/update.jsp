<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/template/header.jspf" %>
<%
	System.out.println("update page");
	String sql="update guest01 set ";
	//sql+="name=?,nalja=to_date(?,'yyyy-mm-dd'),pay=? where sabun=?";
	sql+="name=?,nalja=?,pay=? where sabun=?";
	
	int sabun=Integer.parseInt(request.getParameter("sabun"));
	String name=request.getParameter("name");
	String nalja=request.getParameter("nalja");
	int pay=Integer.parseInt(request.getParameter("pay"));
	int result=0;
	System.out.println("step1");
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, nalja);
		pstmt.setInt(3, pay);
		pstmt.setInt(4, sabun);
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
	if(result>0)response.sendRedirect("detail.jsp?idx="+sabun);
	else response.sendRedirect("edit.jsp?sabun="
		+sabun+"&name="+name+"&nalja="+nalja+"&pay="+pay);
%>