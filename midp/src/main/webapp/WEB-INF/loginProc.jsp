<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%
// login.jsp -> loginProc.jsp

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");	
String pw = request.getParameter("password");	

%>

<%
// db
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost/bigdata";
String user = "root";
String password = "rootpass";

boolean isLogin = false;
String name = "";

try{
	// driver
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	String sql = "select name from users where id=? and password=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	rs = pstmt.executeQuery(); // 성공 : ResultSet
	if(rs.next()){
		isLogin = true;
		name = rs.getString("name");
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs != null){ rs.close(); }
	if(pstmt != null){ pstmt.close(); }
	if(conn != null){ conn.close(); }
}
%>

<%if(!isLogin){ %>
<script>
alert('Login Fail!!');
history.back();
</script>
<%}else{ 
// session
session.setAttribute("id", id);
session.setAttribute("name", name);
response.sendRedirect("main.jsp");
} 
%>

