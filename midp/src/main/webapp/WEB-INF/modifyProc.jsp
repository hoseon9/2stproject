<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");
String pw = request.getParameter("password");	
String name = request.getParameter("name");	
String role = request.getParameter("role");	
%>

<%
// db - update
Connection conn = null;
PreparedStatement pstmt = null;
int rs = 0;

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost/bigdata";
String user = "root";
String password = "rootpass";


try{
	// driver
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	String sql = "update users set password=?, name=?, role=? where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pw);
	pstmt.setString(2, name);
	pstmt.setString(3, role);
	pstmt.setString(4, id);
	rs = pstmt.executeUpdate(); // 성공 : 1
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt != null){ pstmt.close(); }
	if(conn != null){ conn.close(); }
}
%>
<%if(rs == 0){ %>
<script>
alert('Modify Fail!!');
history.back();
</script>
<%}else{ 
	session.setAttribute("name", name);
%>
<script>
alert('정보수정 완료');
location.href='modify.jsp';
</script>

<%} %>



