<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>구구단</h1>
	<table width="400" border="1">
		<%
		for(int j=0; j<10; j++){
			out.print("<tr>");
			for(int i=2; i<10; i++){
				if(j==0){
					out.print("<td>"+i+"단</td>");
				}else{
					out.print("<td>"+i+"x"+j+"</td>");
				}
			}
			out.print("</tr>");
		}
		%>
			
	</table>
</body>
</html>