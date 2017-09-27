<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"
    %>
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
			<h1>학생등록 페이지</h1>
			
			<%
String name=request.getParameter("name");
name=name.trim();
if(name==null || "".equals(name)){
	response.sendRedirect("add.jsp");
	return;
}
String sql="insert into student01 (num,name) values ";
sql+="(student01_seq.nextval,'"+name+"')";
System.out.println(sql);			
String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
String user="scott";
String password="tiger";
Connection conn=null;
Statement stmt=null;
int result=0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url, user, password);
	stmt=conn.createStatement();
	result=stmt.executeUpdate(sql);
}catch(Exception ex){
	out.print("<h2>입력실패</h2>");		
	out.print("<p>데이터베이스 오류</p>");		
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
if(result>0){
	out.print("<h2>입력완료</h2>");
	out.print("<p>"+name+" 학생이 추가되었습니다</p>");		
}else{
	out.print("<h2>입력실패</h2>");	
	out.print("<p>다시 입력바랍니다</p>");		
}
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