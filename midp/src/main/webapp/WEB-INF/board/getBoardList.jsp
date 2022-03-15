<%@page import="com.spring.web.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardList.jsp</title>
<style type="text/css">
th {
	width: 100px;
	background-color: rgb(200, 150, 200);
	align: center;
}

.title {
	width: 300px
}
</style>
</head>
<body>
	<h1>Board List</h1>
	<h3>
		Login : Hong | <a href="logout.do">LogOut</a>
	</h3>
	<hr>
	<form action="search.do" method="get">
		<select name="searchType">
			<option value="TITLE">Title</option>
			<option value="CONTENT">Content</option>
		</select> 
		<input type="text" name="ti"> 
		<input type="submit"value="글삭제"> 
	</form>
	<table width="700">
		<tr>
			<th>Seq</th>
			<th class="title">Title</th>
			<th>Writer</th>
			<th>RegDate</th>
			<th>Cnt</th>
		</tr>
<%List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
		for (BoardVO vo : boardList) {%>
		<tr>
			<td><%=vo.getSeq()%></td>
			<td><a href="getBoard.do?seq=<%=vo.getSeq()%>"><%=vo.getTitle()%></a></td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getRegDate()%></td>
			<td><%=vo.getCnt()%></td>
		</tr>
		<%}%>
	</table>
	<hr>
	<a href="insertBoard.jsp">[Write]</a> |[1][2][3] |
</body>
</html>