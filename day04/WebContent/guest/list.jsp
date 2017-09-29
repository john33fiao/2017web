<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*,java.util.*,com.hb.dto.JavaBean"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
%>
<%
	ArrayList<JavaBean> list= new ArrayList<JavaBean>();
	JavaBean bean=null;
	String sql="select rownum as rn, sabun, name, nalja, pay ";
	sql+=" from guest01 order by rn desc";
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe"
				,"scott","tiger");
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			bean=new JavaBean();
			bean.setRn(rs.getInt("rn"));
			bean.setSabun(rs.getInt("sabun"));
			bean.setName(rs.getString("name"));
			bean.setNalja(rs.getDate("nalja"));
			bean.setPay(rs.getInt("pay"));
			list.add(bean);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	
%>

	<%@ include file="../template/header.jsp" %>
	<p>HOME>LIST</p>
	<h1>리스트페이지</h1>
	<table width="80%" align="center">
		<tr>
			<td>글번호</td>
			<td>사번</td>
			<td>이름</td>
			<td>날짜</td>
			<td>금액</td>
		</tr>
<%
for(JavaBean dto : list){
%>	
		<tr>
			<td><%=dto.getRn() %></td>
			<td><%=dto.getSabun()%></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getNalja() %></td>
			<td><%=dto.getPay() %></td>
		</tr>
<%
}
%>		
	</table>
	<p><a href="add.jsp">입력</a></p>
	<%@ include file="../template/footer.jsp" %>

</body>
</html>