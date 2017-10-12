<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.*,java.sql.*,com.hb.util.MyOra,com.hb.bean.GuestDto"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
// 리스트의 기능 : 페이지,검색
String param=request.getParameter("page");
String param2=request.getParameter("plimit");
String param3=request.getParameter("keyword");
int pg=1;
int plimit=10;
String keyword="";

if(param!=null)pg=Integer.parseInt(param);
if(param2!=null)plimit=Integer.parseInt(param2);
if(param3!=null)keyword=param3;

int pstart=1+(pg-1)*plimit;
int pend=pstart+plimit-1;
ArrayList<GuestDto> list = new ArrayList<GuestDto>();
String sql="select * from ";
sql+="(select rownum as rn,sabun,name,nalja,pay ";
sql+="from (select sabun,name,nalja,pay ";
sql+="from guest02 where name like '%";
sql+=keyword+"%' order by sabun desc)) ";
sql+="where rn between "+pstart+" and "+pend;
int tot=0;
Connection conn= MyOra.getConnection();

Statement stmt=conn.createStatement();
String sql2="select count(*) as cnt from guest02 ";
		sql2+=" where name like '%"+keyword+"%'";
ResultSet rs=stmt.executeQuery(sql2);
if(rs.next()){
	tot=rs.getInt("cnt");
}
if(rs!=null)rs.close();
if(stmt!=null)stmt.close();

stmt=conn.createStatement();
rs=stmt.executeQuery(sql);

while(rs.next()){
	GuestDto bean = new GuestDto();
	bean.setNum(rs.getInt("rn"));
	bean.setSabun(rs.getInt("sabun"));
	bean.setName(rs.getString("name"));
	bean.setNalja(rs.getDate("nalja"));
	bean.setPay(rs.getInt("pay"));
	list.add(bean);
}

if(rs!=null)rs.close();
if(stmt!=null)stmt.close();
if(conn!=null)conn.close();
%>
<body>
	<h1>리스트 페이지(tot:<%=tot %>개)</h1>
	
	<form action="">
		<select name="plimit">
			<option value="5">5개</option>
			<option value="10" selected="selected">10개</option>
			<option value="15">15개</option>
		</select>
		<input type="submit" value="보기">
	</form>
	
	<table>
		<tr>
			<td>글번호</td>
			<td>사번</td>
			<td>이름</td>
			<td>날짜</td>
			<td>금액</td>
		</tr>
		<%
		for(GuestDto bean:list){
		%>
		<tr>
			<td><%=bean.getNum() %></td>
			<td><%=bean.getSabun() %></td>
			<td><%=bean.getName() %></td>
			<td><%=bean.getNalja() %></td>
			<td><%=bean.getPay() %></td>
		</tr>
		<%} %>
	</table>
	
	<%
	int limit=10;
	int start=(pg-1)/limit*limit;
	int end=((pg-1)/limit+1)*limit;
	if(end>(tot-1)/plimit+1)end=(tot-1)/plimit+1;
	// 1,2,3,~~10 ->10
	// 11,12,13,~~20 ->20
	if(start-1>0){
	%>
	<a href="list.jsp?page=<%=start-1 %>&plimit=<%=plimit%>&keyword=<%=keyword%>">[이전]</a>
	<%}
	for(int i=start; i<end; i++){
	%>
	[<a href="list.jsp?page=<%=i+1 %>&plimit=<%=plimit%>&keyword=<%=keyword%>">
	<%
		out.print(i+1);
	%>
	</a>]
	<%
	}
	if(end<(tot-1)/plimit+1){
	%>
	<a href="list.jsp?page=<%=end+1 %>&plimit=<%=plimit%>&keyword=<%=keyword%>">[다음]</a>
	<%} %>
	
	
	<br><br>
	<form action="">
		<input type="text" name="keyword">
		<input type="hidden" name="plimit" value="<%=plimit%>">
		<input type="submit" value="검색">
	</form>
</body>
</html>







