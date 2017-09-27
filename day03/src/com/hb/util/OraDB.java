package com.hb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OraDB {
	private static Connection conn;
	
	public static Connection getConnection(){
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url,id,pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
