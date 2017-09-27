<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 5*4 table -->
	<!-- 1,3,4 low : 1 -->
	<!-- 2 low : 5 -->
	<table width="100%" border="0">
		<tr>
			<td colspan="5">
			<!-- header -->
			<a href="index.jsp">
			<img alt="logo" src="imgs/logo.jpg">
			</a>
			</td>
		</tr>
		<tr align="center" bgcolor="red">
			<!-- 메뉴 -->
			<td></td>
			<td width="150"><a href="list.jsp">보기</a></td>
			<td width="150"><a href="add.jsp">학생등록</a></td>
			<td width="150"><a href="edit.jsp">성적입력</a></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="5">
			<!-- content -->
			<h1>성적입력 페이지</h1>
			<%-- <p>num:<%=request.getParameter("num") %> </p>
			<p>kor:<%=request.getParameter("kor") %></p>
			<p>eng:<%=request.getParameter("eng") %></p>
			<p>math:<%=request.getParameter("math") %></p> --%>
<%
	String param1=request.getParameter("num");
	String param2=request.getParameter("kor");
	String param3=request.getParameter("eng");
	String param4=request.getParameter("math");
	int num=Integer.parseInt(param1.trim());
	int kor=Integer.parseInt(param2.trim());
	int eng=Integer.parseInt(param3.trim());
	int math=Integer.parseInt(param4.trim());
	String sql="update student01 set ";
	sql+=" kor="+kor;
	sql+=",eng="+eng;
	sql+=",math="+math;	
	sql+=" where num="+num;
	System.out.println(sql);
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id="scott";
	String pw="tiger";
	String driver="oracle.jdbc.driver.OracleDriver";
	Connection conn=null;
	Statement stmt=null;
	int result=0;
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,id,pw);
		stmt=conn.createStatement();
		result=stmt.executeUpdate(sql);
	}catch(Exception ex){
		out.print("<h2>에러</h2><p>제접속해보시고 관리자에게 문의하세요</p>");
	}finally{
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	if(result>0)out.print("<h2>성적입력 완료</h2>");
	else
		out.print("<h2>에러</h2><p>입력을 확인하세요</p>");
%>
			<!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5">
			<!-- footer -->
			<img alt="logo2" src="imgs/logo2.jpg" align="left">
(주)한빛이엔아이 ｜ 사업자등록번호 : 220-85-43667 ｜ 통신판매신고 : 마포 제 0358호<br>
한빛ENI : 02-707-1480 / (121-854) 서울시 마포구 신수동 63-14 구프라자 3층 / 대표이사 : 염기호<br>
개인정보보호관리책임자 : 허윤<br>
Copyright (c) 2015 한빛교육센터 All rights reserved.<br>
			
			</td>
		</tr>
	
	
	</table>
</body>
</html>