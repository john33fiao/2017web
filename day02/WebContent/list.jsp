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
			<h1>학생 리스트</h1>
			
			<table width="400" border="1" cellspacing="0">
				<tr>
					<td>학번</td>
					<td>이름</td>
				</tr>
				<%
String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";				
String user="scott";
String password="tiger";
String sql="select num,name from student01 order by num";
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
	//C:\Program Files\Java\jdk1.8.0_141\jre\lib\ext
	//C:\Program Files\Java\jdk1.8.0_141\jre\lib
	//C:\Program Files\Java\jdk1.8.0_141\lib
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,password);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
				while(rs.next()){
				%>
				<tr>
					<td><%=rs.getInt(1) %></td>
					<td><%=rs.getString(2) %></td>
				</tr>
				<%
				}
}catch (Exception ex){
	out.print("<h2>err)</h2>접속에러입니다<br>잠시후 제접속 바랍니다");
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
				%>
			</table>
			
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