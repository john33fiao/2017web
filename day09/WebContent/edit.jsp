<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class="com.hb.bean.GuestDto"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
	<h1>수정페이지</h1>
	<form action="update.jsp">
		<p>사번
			<input type="text" value="<%=bean.getSabun() %>" name="sabun" readonly="readonly">
		</p>
		<p>이름
			<input type="text" value="<%=bean.getName() %>" name="name">
		</p>
		<p>금액
			<input type="text" value="<%=bean.getPay() %>" name="pay">
		</p>
		<p>
			<input type="submit" value="수정">
			<input type="reset" value="취소">
		</p>
	</form>
</body>
</html>