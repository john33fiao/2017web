<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="ex09.jsp">
		<p>이름:<input type="text" name="name"></p>
		<p>주소:<input type="text" name="addr"> </p>
		<p>비밀번호:<input type="password" name="pw"> </p>
		<p>
			<textarea rows="3" cols="10" name="area"></textarea>
		</p>
		<p>
			선택 <select name="sel1">
				<option value="a1">item1</option>
				<option value="a2">item2</option>
				<option value="a3">item3</option>
			</select>
		</p>
		<p>
			선택2 
			<input type="radio" name="sel2" value="item1">item1
			<input type="radio" name="sel2" value="item2">item2
			<input type="radio" name="sel2" value="item3">item3
		</p>
		<p>
			선택3
			<input type="checkbox" name="sel3" value="c1">야구
			<input type="checkbox" name="sel3" value="c2">농구
			<input type="checkbox" name="sel3" value="c3">배구
		</p>
		<p><input type="submit" value="전송"> </p>
	</form>
</body>
</html>