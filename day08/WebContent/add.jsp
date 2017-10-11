<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>입력페이지</h1>
	<form action="insert.jsp" method="post">
		<p>
			<label for="sabun">sabun</label>
			<input type="text" name="sabun">
		</p>
		<p>
			<label for="name">name</label>
			<input type="text" name="name">
		</p>
		<p>
			<label for="pay">pay</label>
			<input type="text" name="pay">
		</p>
		<p>
			<input type="submit" value="입력">
			<input type="reset" value="취소">
		</p>
	</form>
</body>
</html>