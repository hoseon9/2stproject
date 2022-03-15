<%@page import="java.util.Date"%>
<%@page import="com.spring.web.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ page import="java.text.SimpleDateFormat" %>
	<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
    <script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title> 게시글 작성</title>


</style>
</head>
<body>
<h3>
<%=session.getAttribute("userId")%> 님 
	<%= nowTime %>
<a href="logout.do">LogOut</a></h3>
<hr>
<form action="insertBoard.do" method="post" enctype="multipart/form-data">

	<table>
	<tr>
	<th class="title">제목</th>
	<td><input type="text" name="title"></td>
	</tr>
	<tr>
	<th>작성자</th>
	<td><input type="text" name="writer"></td></tr>
	<tr>
	<th>내용</th>
	<td><textarea name="content" cols="30" rows="10"></textarea></td>
	</tr>
	<tr>
	<th>파일첨부</th>
	<td><input type="file" name="uploadFile"></td>
	</tr>
	<tr><td colspan="2" align="center"><input type="submit" value="입력하기"></td></tr>
	</table>
</form>
<hr>
<a href="getBoardList.do">[List]</a>
</body>
</html>




