<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

	<%@ include file="/template/header.jspf" %>
	<%
		String sql="select count(*) as cnt from guest01 where sabun=?";
		String sql2="insert into guest01 values (?,?,sysdate,0)";
		String param1=request.getParameter("sabun").trim();
		String param2=request.getParameter("name").trim();
		String path=null;
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url,user,password);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(param1));
			rs=pstmt.executeQuery();
			if(rs.next()){
					System.out.println("step1");
				if(rs.getInt("cnt")>0){
					path="add";
				}else{
					System.out.println("step2");
					pstmt=conn.prepareStatement(sql2);
					pstmt.setInt(1, Integer.parseInt(param1));
					pstmt.setString(2,param2);
					pstmt.executeUpdate();
					path="list";
					}
					System.out.println("step3");
			}
		}catch(Exception e){
			
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			path+=".jsp";
			response.sendRedirect(path);
		}
	%>
