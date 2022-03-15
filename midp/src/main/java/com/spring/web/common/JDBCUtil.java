package com.spring.web.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
	
	public static Connection getConnection() {
		Connection conn = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/bigdata";
		String user = "root";
		String password = "rootpass";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return conn;
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null){ rs.close(); }
			if(pstmt != null){ pstmt.close(); }
			if(conn != null){ conn.close(); }
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			rs = null;
			pstmt = null;
			conn = null;
		}
	}
	
	public static void close(PreparedStatement pstmt, Connection conn) {
		try {
			if(pstmt != null){ pstmt.close(); }
			if(conn != null){ conn.close(); }
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pstmt = null;
			conn = null;
		}
	}

}
