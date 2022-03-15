<%@page import="com.mysql.cj.Session"%>
<%@page import="java.util.Date"%>
<%@page import="com.spring.web.vo.PagingVO"%>
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

#logout{
align-content : right;
}
</style>
</head>
<body>
	<h1>게시판</h1>
	
	<%=nowTime %>
	<h3>
		 	환영합니다
		 	<br>
		 	</h3>
		 	
	<div class ="logout">
	
	<a href="logout.do">로그아웃</a>
	</div>
	
	<hr>
	<br>
	<form action="getBoardList.do" method="get">
		<select name="searchType">
			<option value="TITLE">Title</option>
			<option value="CONTENT">Content</option>
		</select> 
		<input type="text" name="searchKeyword"> 
		<input type="submit"value="글검색"> 
	</form>
	
	<table width="700">
		<tr>
			<th>글번호</th>
			<th class="title">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
		for (BoardVO vo : boardList) {%>
		<tr>
			<td><%=vo.getSeq()%></td>
			<td><a href="getBoard.do?seq=<%=vo.getSeq()%>"><%=vo.getTitle()%></a></img></td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getRegDate()%></td>
			<td><%=vo.getCnt()%></td>
		</tr>
		<%}%>
	</table>
	<hr>
	<a href="insertBoard.jsp">[Write]</a> 
	<%
PagingVO paging = (PagingVO)request.getAttribute("pagingVO");

int listCnt = paging.getListCnt();
int curPage = paging.getPage(); // 현재 페이지
int listSize = paging.getListCnt(); // 1page 목록 갯수
int rangeSize = paging.getRangeSize();
int range = paging.getRange();
int startPage = paging.getStartPage(); //2
int endPage = paging.getEndPage(); // 6
boolean prev = paging.isPrev();
boolean next = paging.isNext();
%>

<%if(prev) {%>
<a href="getBoardList.do?curPage=<%=startPage-rangeSize%>&range=<%=range-1%>">[이전<%=rangeSize %>개]</a>
<%} %>
<%for(int i=startPage;i<=endPage;i++){ %>
<a href="getBoardList.do?curPage=<%=i%>&range=<%=range%>">[<%=i%>]</a>
<%} %>
<%if(next){ %>
<a href="getBoardList.do?curPage=<%=startPage+rangeSize%>&range=<%=range+1%>">[이후<%=rangeSize %>개]</a>
<%} %>
</center>
<br><br><br><br><br>
</center>
<br><br><br><br><br>
</body>
</html>

</body>
</html>