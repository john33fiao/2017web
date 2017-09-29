<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.ArrayList"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/template/header.jspf" %>
	<%@include file="/template/menu.jspf" %>
	<h1>LIST PAGE</h1>
	<%
	ArrayList<Object[]> list=new ArrayList<Object[]>();
	try{
		String sql="select * from guest01";
		Class.forName(driver);
		conn=DriverManager.getConnection(url,user,password);
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			Object[] cols=new Object[4];
			for(int i=0; i<cols.length; i++)	
				cols[i]=rs.getObject(i+1);
			list.add(cols);
		}
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	%>
	
	<table width="80%" border="1">
		<tr>
			<td>사번</td>
			<td>이름</td>
			<td>날짜</td>
			<td>금액</td>
		</tr>
<%
	for(int i=0; i<list.size(); i++){
		Object[] obj=list.get(i);
%>
		<tr>
		<%for(int j=0; j<obj.length;j++){%>
			<td><%=obj[j] %></td>
		<%}%>
		</tr>
<%}%>
	</table>
	
	<%@include file="/template/footer.jspf" %>
</body>
</html>