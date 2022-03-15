<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
//String id = request.getParameter("id");
%>

<%
// db - delete
Connection conn = null;
PreparedStatement pstmt = null;
int rs = 0;

String driver = "org.h2.Driver";
String url = "jdbc:h2:tcp://localhost/~/test";
String user = "sa";
String password = "";

try{
	// driver
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	String sql = "delete from users where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
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
alert('Delete Fail!!');
history.back();
</script>
<%}else{ 
	session.invalidate();
%>
<script>
alert('Delete OK!!');
location.href='index.jsp';
</script>

<%} %>



