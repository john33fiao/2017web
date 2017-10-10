<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="com.hb.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	String rootPath = request.getContextPath();
%>
<body background="<%=rootPath %>/imgs/bg.png">
	<table align="center">
		<tr>
			<td align="right" height="155" colspan="2"  background="<%=rootPath %>/imgs/header.png">
				<%
				if(session.getAttribute("result")==null){
				%>
				<a href="<%=rootPath %>/login/login.jsp">로그인</a>||
				<%}else{ %>
				<a href="<%=rootPath %>/login/logout.jsp">로그아웃</a>||
				<%} %>
				<a href="<%=rootPath %>/login/join.jsp">회원가입</a>
			</td>
		</tr>
		<tr>
			<td align="center" height="50" colspan="2" bgcolor="red">
				<a href="<%=rootPath %>/">HOME</a>||
				<a href="<%=rootPath %>/guest/list.jsp">리스트</a>||
				<a href="<%=rootPath %>/guest/add.jsp">입력</a>||
				<a href="#">menu4</a>
			</td>
		</tr>
		<tr>
			<td height="316" width="211"  background="<%=rootPath %>/imgs/aside.png">
			</td>
			<td valign="top" bgcolor="#ffffff">
<%
	String param1=request.getParameter("sabun").trim();
	String param2=request.getParameter("name").trim();
	int sabun=Integer.parseInt(param1);
	String name=param2;
	LoginDao dao=new LoginDao();
	boolean result2=dao.login(sabun, name);
	if(result2){
		//세션 스코프로 result=true을 기억 시킴
		//com.hb.util.LoginDto result= new com.hb.util.LoginDto();
		// result.setName(name);
		//session.setAttribute("result", result);
%>				
				<h1>로그인성공</h1>
				<jsp:useBean class="com.hb.util.LoginDto" id="result" scope="session">
					<jsp:setProperty  value="<%=name %>" property="name" name="result"/>
				</jsp:useBean>
				
				<p>
					<a href="logout.jsp">로그아웃</a>
				</p>
<%
	}else{
		response.sendRedirect("login.jsp");
	}
%>
			</td>
		</tr>
		<tr>
			<td height="158" width="943" background="<%=rootPath %>/imgs/footer.png" colspan="2">
				(주)한빛이엔아이 ｜ 사업자등록번호 : 220-85-43667 ｜ 통신판매신고 : 마포 제 0358호
한빛ENI : 02-707-1480 / (121-854) 서울시 마포구 신수동 63-14 구프라자 3층 / 대표이사 : 염기호
개인정보보호관리책임자 : 허윤
Copyright (c) 2015 한빛교육센터 All rights reserved.
			</td>
		</tr>
	</table>
</body>
</html>