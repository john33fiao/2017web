<%@page import="com.hb.dao.GuestDao"%>
<%@page import="com.hb.util.MyOra"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.*,com.hb.bean.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<GuestDto> list=null;
	GuestDao dao = new GuestDao();
	list=dao.selectAll();
%>
	<h1>리스트 페이지</h1>
	<table>
		<tr>
			<td>사번</td>
			<td>이름</td>
			<td>날짜</td>
			<td>금액</td>
		</tr>
		<%
		for(int i=0; i<list.size(); i++){
			GuestDto bean=list.get(i);
		%>
		<tr>
			<td><%=bean.getSabun() %></td>
			<td><%=bean.getName() %></td>
			<td><%=bean.getNalja() %></td>
			<td><%=bean.getPay() %></td>
		</tr>
		<%} %>
	</table>
	<a href="add.jsp">[add]</a>
</body>
</html>