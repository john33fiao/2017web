<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%! 
	/* 선언부 - 클래스 안 , 메인메서드 밖(단,생성자 제외) */
	public int func(int a, int b){
		return a*b;
	}
	%>
	<!-- <h1>구구단</h1> -->
	<table width="400" border="1">
	
	<tr>
	<%
	/* 스크립트릿 - 메인메서드 안 */
	for(int i=2; i<10; i++){ %>
		<td><%=i %>단</td>
	<%} %>
	</tr>
	<%for(int i=1; i<10; i++){ %>
	<tr>
		<%for(int j=2; j<10; j++){ %>
		<td><%=j %>x<%=i %>=<%=func(i,j) %></td>
		<!-- //표현식 -->
		<%} %>
	</tr>
	<%} %>
	</table>
</body>
</html>










