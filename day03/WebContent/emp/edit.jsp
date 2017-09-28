<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="../"><img alt="logo" src="../imgs/logo.jpg"> </a>
	<h1>수정페이지</h1>
	<form action="update.jsp">
	<table>
		<tr>
			<td>empno</td>
			<td><input type="text" name="empno" value="<%=request.getParameter("idx") %>" readonly="readonly"></td>
		</tr>
		<tr>
			<td>sal</td>
			<td><input type="text" name="sal" value="<%=request.getParameter("sal")%>"></td>
		</tr>
		<tr>
			<td>comm</td>
			<td><input type="text" name="comm" value="<%=request.getParameter("comm")  %>"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>