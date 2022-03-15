<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBCTest.jsp</title>
</head>
<body>
<%

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost/bigdata";
String user = "root";
String password = "rootpass";

ArrayList<String> userId = new ArrayList<String>();
System.out.println("접속");
try{ 
	
	// driver
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	String sql = "select * from users";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
		userId.add(rs.getString("id"));
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	rs.close();
	pstmt.close();
	conn.close();
}
System.out.println("접속2");
%>
<h1>User ID</h1>
<ul>
<%for(String id: userId){ %>
	<li><%=id %>
<%} %>
</ul>
<html>
</html>
</body>
</html>







