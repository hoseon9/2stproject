<%@page import="com.spring.web.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoard.jsp</title>
<style type="text/css">
th{width:100px; background-color: rgb(200,150,200); align:center;}

</style>
</head>
<body>
<h1>Board List</h1>
<h3>Login : ${userId }(${userName }) | <a href="logout.do">LogOut</a></h3>
<hr>
<%
BoardVO board = (BoardVO)request.getAttribute("board");
%>
<form action="updateBoard.do" method="post">
<input type="hidden" name="seq" value="<%=board.getSeq() %>">
	<table>
	<tr><th>Seq</th><td><%=board.getSeq() %></td></tr>
	<tr>
	<th class="title">Title</th>
	<td><input type="text" name="title" value="<%=board.getTitle() %>"></td>
	</tr>
	<tr>
	<th>Writer</th>
	<td><input type="text" name="writer" value="<%=board.getWriter() %>"></td></tr>
	<tr><th>RegDate</th><td><%=board.getRegDate() %></td></tr>
	<tr><th>Cnt</th><td><%=board.getCnt() %></td></tr>
	<tr>
	<th>Content</th>
	<td><textarea name="content" cols="30" rows="10"><%=board.getContent() %></textarea></td>
	</tr>
	<th>File</th>
	<td>
		<%if(board.getFileName() != null) {%>
		<a href="<%=request.getContextPath() %>/images/<%=board.getFileName() %>">Down</a>
	<%} %>
	</td>
	</tr>
	<tr><td colspan="2" align="center"><input type="submit" value="수정하기"></td></tr>
	</table>
</form>
<hr>
<a href="insertBoard.jsp">[Write]</a> |
<a href="deleteBoard.do?seq=<%=board.getSeq()%>">[Delete]</a> |
<a href="getBoardList.do">[List]</a>
</body>
</html>




