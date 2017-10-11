<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String rootPath = request.getParameter("path");
%>
	<table cellspacing="0" align="center" width="943">
		<tr>
			<td align="right" height="120" colspan="2"  background="<%=rootPath %>/imgs/header.png">
				<a href="<%=rootPath %>/login/login.jsp">로그인</a>||
				<a href="<%=rootPath %>/login/join.jsp">회원가입</a>
			</td>
		</tr>
