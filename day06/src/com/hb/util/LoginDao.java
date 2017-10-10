package com.hb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@203.236.209.193:1521:xe";
	private String id="scott";
	private String pw="tiger";
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(driver);
		conn=DriverManager.getConnection(url, id, pw);
		return conn;
	}
	
	public boolean login(int sabun, String name){
		String sql="select count(*) as cnt"
				+" from guest02 where sabun=? and name=?";
		int result=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);	
			pstmt.setInt(1, sabun);
			pstmt.setString(2, name);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt("cnt");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		boolean tf=false;
		if(result>0)tf=true;
		return tf;
	}
}












