<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");	
String pw = request.getParameter("password");	
String name = request.getParameter("name");	
String role = request.getParameter("role");	
%>

<%
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
	String sql = "insert into Users(id, password, name, role)values(?,?,?,?) ";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	pstmt.setString(4, role);
	rs = pstmt.executeUpdate(); // 성공 : 1
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt != null){ pstmt.close(); }
	if(conn != null){ conn.close(); }
}
%>

<%if(rs == 0){ %>
<script>ㅋ	
alert('중복된 아이디입니다.');
location.href='index.jsp';
</script>

<%}else{ %>
<script>
alert('회원가입이 완료되었습니다');
location.href= "getBoardList.do";
</script>
<%} %>



