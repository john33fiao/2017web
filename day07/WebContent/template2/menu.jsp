<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	String path=request.getParameter("path");
    %>
<tr>
	<td colspan="2" align="center" bgcolor="#cccccc">
		<a href="<%=path%>./">HOME</a>
		<%if(session.getAttribute("name")==null){ %>
		<a href="<%=path%>./user/login.jsp">LIST</a>
		<%}else{ %>
		<a href="<%=path%>./bbs/list.jsp">LIST</a>
		<%} %>
		<a href="<%=path%>./bbs/add.jsp">ADD</a>
	</td>
</tr>
<tr>
	<td width="100" bgcolor="#ffffff"></td>
	<td bgcolor="#ffffff">