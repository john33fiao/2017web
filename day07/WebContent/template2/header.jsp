<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String path = request.getParameter("path");
%>
	<table cellspacing="0" align="center" width="943">
		<tr>
			<td align="right" height="120" colspan="2"  background="<%=path %>./imgs/header.png">
				<a href="<%=path %>./user/login.jsp">로그인</a>||
				<a href="<%=path %>./user/join.jsp">회원가입</a>
			</td>
		</tr>
