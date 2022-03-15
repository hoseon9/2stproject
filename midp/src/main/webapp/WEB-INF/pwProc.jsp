<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// pwProc.jsp

request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");	
String pw = request.getParameter("password");	
String param = request.getParameter("param");	

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


boolean isCheck = false;

try{
	// driver
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	String sql = "select id from users where id=? and password=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	rs = pstmt.executeQuery(); // 성공 : ResultSet
	if(rs.next()){
		isCheck = true;
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs != null){ rs.close(); }
	if(pstmt != null){ pstmt.close(); }
	if(conn != null){ conn.close(); }
}
%>

<%if(!isCheck){ %>
<script>
alert('Password Fail!!');
history.back();
</script>
<%}else{ 
// send
	if(param.equals("d")){
		response.sendRedirect("deleteProc.jsp");
	}else if(param.equals("u")){
		response.sendRedirect("modify.jsp");
	}else{
		response.sendRedirect("main.jsp");		
	}

} 
%>

