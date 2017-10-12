<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String sabun=request.getParameter("sabun");
	String name=request.getParameter("name");
	String pay=request.getParameter("pay");
	String ur=request.getParameter("url");
	String url="main.jsp";
	if(ur==null)url="main.jsp";
	else if("main".equals(ur))url="main.jsp";
	else if("list".equals(ur))url="list.jsp";
	else if("add".equals(ur))url="add.jsp";
	else if("detail".equals(ur))url="detail.jsp";
	else if("edit".equals(ur))url="edit.jsp";
%>
	<table width="100%" align="center">
		<!-- header -->
		<tr>
			<td height="120" background="imgs/header.png">
			
			</td>
		</tr>
		<!-- menu -->
		<tr>
			<td bgcolor="#cccccc" align="center">
				<a href="index.jsp?url=main">HOME</a>
				<a href="index.jsp?url=list">게시판보기</a>
				<a href="index.jsp?url=add">게시판작성</a>
				<a href="#">etc..</a>
			</td>
		</tr>
		<!-- content -->
		<tr>
			<td>
				<jsp:include page="<%=url %>">
					<jsp:param value="<%=sabun %>" name="sabun"/>
					<jsp:param value="<%=name %>" name="name"/>
					<jsp:param value="<%=pay %>" name="pay"/>
				</jsp:include>
			</td>
		</tr>
		<!-- content end -->
		<!-- footer -->
		<tr>
			<td bgcolor="#cccccc">
				(주)한빛이엔아이 ｜ 사업자등록번호 : 220-85-43667 ｜ 통신판매신고 : 마포 제 0358호
				<br>한빛ENI : 02-707-1480 / (121-854) 서울시 마포구 신수동 63-14 구프라자 3층 / 대표이사 : 염기호
				<br>개인정보보호관리책임자 : 허윤
				<br>Copyright (c) 2015 한빛교육센터 All rights reserved.
			</td>
		</tr>
	</table>
</body>
</html>